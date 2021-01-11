
import Foundation

public struct BinaryOperationParser<Content : Parser, Operator: BinaryOperator>: Parser {
    private let content: Content
    private let wrapper: (BinaryOperation<Content.Output, Operator>) -> Content.Output
    private let operators: [Operator]

    public init(operators: [Operator],
                @ParserBuilder content: () -> Content,
                by wrapper: @escaping (BinaryOperation<Content.Output, Operator>) -> Content.Output) {

        self.content = content()
        self.wrapper = wrapper
        self.operators = operators.sorted { $0.precedes($1) }
    }

    public var body: AnyParser<BinaryOperation<Content.Output, Operator>> {
        let member = content.preventRecursion().map(IntermediateRepresentation.member)

        return operators
            .reduce(member) { parser, `operator` in
                return self.parser(using: parser, for: `operator`)
            }
            .map { ir in
                switch ir {
                case .member(let member):
                    throw BinaryOperationParserError.failedToParseABinaryOperation(member: member)
                case .operation(let operation):
                    return operation
                }
            }
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

    private func parser(using parser: AnyParser<IntermediateRepresentation>,
                               for operator: Operator) -> AnyParser<IntermediateRepresentation> {

        switch `operator`.associativity {
        case .left:
            return parserLeft(using: parser, for: `operator`)
        case .right:
            return parserRight(using: parser, for: `operator`)
        }
    }

    @ParserBuilder
    private func parserLeft(using parser: AnyParser<IntermediateRepresentation>,
                            for operator: Operator) -> AnyParser<IntermediateRepresentation> {

        Group {
            parser

            Group {
                `operator`
                    .parser
                    .kind("binary.operator")

                parser
            }
            .star()
        }
        .kind("binary.operation")
        .map { first, operations -> IntermediateRepresentation in
            return operations.reduce(first) { lhs, rhs in
                .operation(BinaryOperation(lhs: lhs.member(using: self.wrapper),
                                     operation: `operator`,
                                     rhs: rhs.member(using: self.wrapper)))
            }
        }
    }

    @ParserBuilder
    private func parserRight(using parser: AnyParser<IntermediateRepresentation>,
                             for operator: Operator) -> AnyParser<IntermediateRepresentation> {

        Group {
            parser

            Group {
                `operator`
                    .parser
                    .kind("binary.operator")

                parser
            }
            .star()
        }
        .kind("binary.operation")
        .map { first, operations -> IntermediateRepresentation in
            let reversed = ([first] + operations).reversed()
            let rightMost = reversed.first!
            return reversed.dropFirst().reduce(rightMost) { rhs, lhs in
                return .operation(BinaryOperation(lhs: lhs.member(using: wrapper),
                                            operation: `operator`,
                                            rhs: rhs.member(using: wrapper)))
            }
        }
    }

}
