
import Foundation
import SyntaxTree

public struct BinaryOperationParser<Content : Parser, Operator: BinaryOperator>: Parser {
    public static var kind: Kind? {
        return nil
    }

    let id = UUID()
    private let content: InternalParser
    private let wrapper: (BinaryOperation<Content.Output, Operator>) -> Content.Output
    private let operators: [CachedOperator]

    public init(operators: [Operator],
                @ParserBuilder content: () -> Content,
                by wrapper: @escaping (BinaryOperation<Content.Output, Operator>) -> Content.Output) {

        self.content = content().internalParser()
        self.wrapper = wrapper
        self.operators = operators.sorted { !$0.precedes($1) }.map { CachedOperator(value: $0, parser: $0.parser) }
    }

    public var body: AnyParser<BinaryOperation<Content.Output, Operator>> {
        return neverBody()
    }
}

extension BinaryOperationParser: InternalParser {
    func prefixes() -> Set<String> {
        return []
    }

    func parse(using scanner: Scanner) throws {
        guard let first = operators.first else { fatalError() }
        switch try parse(operator: first, using: scanner, rest: operators.dropFirst()) {
        case .member(let member):
            throw BinaryOperationParserError.failedToParseABinaryOperation(member: member)
        case .operation(let operation):
            scanner.store(value: operation)
        }
    }
}

extension BinaryOperationParser {

    private func parse<C : Collection>(operator current: CachedOperator, using scanner: Scanner, rest: C) throws -> IntermediateRepresentation where C.Element == CachedOperator {
        guard let next = rest.first else { return try parse(operator: current, using: scanner, member: parseMember(using:)) }
        return try parse(operator: current, using: scanner) { scanner in
            return try parse(operator: next, using: scanner, rest: rest.dropFirst())
        }
    }

    private func parse(operator current: CachedOperator, using scanner: Scanner, member: (Scanner) throws -> IntermediateRepresentation) throws -> IntermediateRepresentation {
        scanner.enterNode()
        let leftMost = try member(scanner)
        var representations = [IntermediateRepresentation]()
        while true {
            scanner.begin()
            do {
                scanner.enterNode()
                try scanner.parse(using: current.parser)
                scanner.exitNode()
                scanner.configureNode(kind: .binaryOperator)
                scanner.pruneNode(strategy: .separate)
                try scanner.commit()
                let value = try member(scanner)
                representations.append(value)
            } catch {
                try scanner.rollback()
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
                .operation(BinaryOperation(lhs: lhs.member(using: self.wrapper),
                                           operation: current.value,
                                           rhs: rhs.member(using: self.wrapper)))
            }
            return final

        case .right:
            let reversed = ([leftMost] + representations).reversed()
            let rightMost = reversed.first!
            let final = reversed.dropFirst().reduce(rightMost) { rhs, lhs in
                return .operation(BinaryOperation(lhs: lhs.member(using: wrapper),
                                                  operation: current.value,
                                                  rhs: rhs.member(using: wrapper)))
            }
            return final

        }
    }

    private func parseMember(using scanner: Scanner) throws -> IntermediateRepresentation {
        try scanner.preventRecursion(id: content.id)
        try scanner.parse(using: content)
        let member: Content.Output
        if Content.Output.self != Void.self {
            member = try scanner.pop(of: Content.Output.self)
        } else {
            member = () as! Content.Output
        }
        return .member(member)
    }

}

extension BinaryOperationParser where Operator: CaseIterable {

    public init(@ParserBuilder content: () -> Content,
                by wrapper: @escaping (BinaryOperation<Content.Output, Operator>) -> Content.Output) {

        self.init(operators: Array(Operator.allCases), content: content, by: wrapper)
    }

}

extension BinaryOperationParser where Content.Output: MemberOfBinaryOperation, Content.Output.Operator == Operator {

    public init(operators: [Operator],
                @ParserBuilder content: () -> Content) {

        self.init(operators: operators, content: content, by: { .binaryOperation($0) })
    }

}

extension BinaryOperationParser where Content.Output: MemberOfBinaryOperation, Content.Output.Operator == Operator, Operator: CaseIterable {

    public init(@ParserBuilder content: () -> Content) {

        self.init(operators: Array(Operator.allCases), content: content, by: { .binaryOperation($0) })
    }

}


extension BinaryOperationParser {

    private struct CachedOperator {
        let value: Operator
        let parser: AnyParser<Void>
    }

    private enum IntermediateRepresentation {
        case member(Content.Output)
        case operation(BinaryOperation<Content.Output, Operator>)

        func member(using wrapper: (BinaryOperation<Content.Output, Operator>) -> Content.Output) -> Content.Output {
            switch self {
            case .member(let member):
                return member
            case .operation(let operation):
                return wrapper(operation)
            }
        }
    }
}

extension Kind {

    public static let binaryOperation: Kind = "binary.operation"
    public static let binaryOperator: Kind = "binary.operator"

}
