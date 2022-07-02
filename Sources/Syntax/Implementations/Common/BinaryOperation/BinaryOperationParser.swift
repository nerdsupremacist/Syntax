
import Foundation
@_exported import SyntaxTree

public struct BinaryOperationParser<Content : Parser, Operator: BinaryOperator>: Parser {
    public static var kind: Kind? {
        return nil
    }

    private let content: Content
    private let wrapper: (BinaryOperation<Content.Parsed, Operator>) -> Content.Parsed
    private let operators: [Operator]

    public init(operators: [Operator],
                @ParserBuilder content: () -> Content,
                by wrapper: @escaping (BinaryOperation<Content.Parsed, Operator>) -> Content.Parsed) {

        self.content = content()
        self.wrapper = wrapper
        self.operators = operators
    }

    public var body: any Parser<BinaryOperation<Content.Parsed, Operator>> {
        return neverBody()
    }
}

extension BinaryOperationParser {

    public init(operators: Operator...,
                @ParserBuilder content: () -> Content,
                by wrapper: @escaping (BinaryOperation<Content.Parsed, Operator>) -> Content.Parsed) {

        self.init(operators: operators, content: content, by: wrapper)
    }

}

extension BinaryOperationParser where Operator: CaseIterable {

    public init(@ParserBuilder content: () -> Content,
                by wrapper: @escaping (BinaryOperation<Content.Parsed, Operator>) -> Content.Parsed) {

        self.init(operators: Array(Operator.allCases), content: content, by: wrapper)
    }

}

extension BinaryOperationParser where Content.Parsed: MemberOfBinaryOperation, Content.Parsed.Operator == Operator {

    public init(operators: Operator...,
                @ParserBuilder content: () -> Content) {

        self.init(operators: operators, content: content)
    }

    public init(operators: [Operator],
                @ParserBuilder content: () -> Content) {

        self.init(operators: operators, content: content, by: { .binaryOperation($0) })
    }

}

extension BinaryOperationParser where Content.Parsed: MemberOfBinaryOperation, Content.Parsed.Operator == Operator, Operator: CaseIterable {

    public init(@ParserBuilder content: () -> Content) {
        self.init(operators: Array(Operator.allCases), content: content, by: { .binaryOperation($0) })
    }

}

extension BinaryOperationParser: InternalParserBuilder {
    fileprivate class _Parser: InternalParser {
        let id = UUID()
        private let content: InternalParser
        private let wrapper: (BinaryOperation<Content.Parsed, Operator>) -> Content.Parsed
        private let operators: [CachedOperator]

        init(content: InternalParser, wrapper: @escaping (BinaryOperation<Content.Parsed, Operator>) -> Content.Parsed, operators: [CachedOperator]) {
            self.content = content
            self.wrapper = wrapper
            self.operators = operators
        }

        func prefixes() -> Set<String> {
            return content.prefixes()
        }

        func parse(using scanner: Scanner) throws {
            guard let first = operators.first else { fatalError() }
            switch try parse(operator: first, using: scanner, rest: operators.dropFirst()) {
            case .member(let member):
                throw BinaryOperationParserError.failedToParseABinaryOperation(member: member)
            case .operation(let operation):
                scanner.store(value: operation.wrappedValue)
            }
        }
    }


    func buildParser<Context : InternalParserBuilderContext>(context: inout Context) -> InternalParser {
        return _Parser(content: context.build(content.located()),
                       wrapper: wrapper,
                       operators: operators.sorted { !$0.precedes($1) }.map { _Parser.CachedOperator(value: $0, parser: context.build($0.parser)) })
    }
}

extension BinaryOperationParser._Parser {

    private func parse<C : Collection>(operator current: CachedOperator, using scanner: Scanner, rest: C) throws -> IntermediateRepresentation where C.Element == CachedOperator {
        guard let next = rest.first else { return try parse(operator: current, using: scanner, member: parseMember(using:)) }
        return try parse(operator: current, using: scanner) { scanner in
            return try parse(operator: next, using: scanner, rest: rest.dropFirst())
        }
    }

    private struct OperationUsageIntermediateRepresentation {
        let operatorRange: Range<Location>
        let representation: IntermediateRepresentation
    }

    private func parse(operator current: CachedOperator, using scanner: Scanner, member: (Scanner) throws -> IntermediateRepresentation) throws -> IntermediateRepresentation {
        scanner.enterNode()
        let leftMost = try member(scanner)
        var representations = [OperationUsageIntermediateRepresentation]()
        while true {
            var location: Range<Location>!
            let added: Bool = scanner.attempt { scanner in
                scanner.enterNode()
                try scanner.parse(using: current.parser)
                scanner.exitNode()
                location = scanner.locationOfNode()
                scanner.configureNode(kind: .binaryOperator)
                scanner.pruneNode(strategy: .separate)
            }

            if added {
                let value = try member(scanner)
                representations.append(OperationUsageIntermediateRepresentation(operatorRange: location, representation: value))
            } else {
                break
            }
        }

        scanner.exitNode()

        guard !representations.isEmpty else {
            scanner.pruneNode(strategy: .lower)
            return leftMost
        }

        scanner.configureNode(kind: .binaryOperation)
        scanner.configureNode(annotations: ["associativity" : current.value.associativity])
        scanner.pruneNode(strategy: .separate)

        switch current.value.associativity {
        case .left:
            let final = representations.reduce(leftMost) { lhs, rhs in
                let lhsMember = lhs.member(using: self.wrapper)
                let rhsMember = rhs.representation.member(using: self.wrapper)
                let operation = BinaryOperation(lhs: lhsMember,
                                                operation: Located(wrappedValue: current.value, location: rhs.operatorRange),
                                                rhs: rhsMember)

                return .operation(Located(wrappedValue: operation, location: lhsMember.location.lowerBound..<rhsMember.location.upperBound))
            }

            return final

        case .right:
            guard let rightMost = representations.last?.representation, let firstOperationRange = representations.first?.operatorRange else { return leftMost }
            let newLeftMost = OperationUsageIntermediateRepresentation(operatorRange: firstOperationRange, representation: leftMost)
            let shiftedRepresentations = representations.pairs().map { OperationUsageIntermediateRepresentation(operatorRange: $1.operatorRange,
                                                                                                                representation: $0.representation) }
            let reversed = ([newLeftMost] + shiftedRepresentations).reversed()
            let final = reversed.reduce(rightMost) { rhs, lhs in
                let lhsMember = lhs.representation.member(using: wrapper)
                let rhsMember = rhs.member(using: wrapper)
                let operation = BinaryOperation(lhs: lhsMember,
                                                operation: Located(wrappedValue: current.value, location: lhs.operatorRange),
                                                rhs: rhsMember)

                return .operation(Located(wrappedValue: operation, location: lhsMember.location.lowerBound..<rhsMember.location.upperBound))
            }

            return final
        }
    }

    private func parseMember(using scanner: Scanner) throws -> IntermediateRepresentation {
        try scanner.preventRecursion(id: content.id)
        try scanner.parse(using: content)
        let member = try scanner.pop(of: Located<Content.Parsed>.self)
        return .member(member)
    }

}

extension Collection {
    fileprivate func pairs() -> AnySequence<(Element, Element)> {
        return AnySequence(zip(self, self.dropFirst()))
    }
}

extension BinaryOperationParser._Parser {

    fileprivate struct CachedOperator {
        let value: Operator
        let parser: InternalParser
    }

    fileprivate enum IntermediateRepresentation {
        case member(Located<Content.Parsed>)
        case operation(Located<BinaryOperation<Content.Parsed, Operator>>)

        func member(using wrapper: (BinaryOperation<Content.Parsed, Operator>) -> Content.Parsed) -> Located<Content.Parsed> {
            switch self {
            case .member(let member):
                return member
            case .operation(let operation):
                return operation.map(wrapper)
            }
        }
    }
}

extension Kind {

    public static let binaryOperation: Kind = "binary.operation"
    public static let binaryOperator: Kind = "binary.operator"

}
