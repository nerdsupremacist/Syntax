
import Foundation
import SyntaxTree

public struct StringLiteral: Parser {
    public static let kind: Kind = .stringLiteral

    private let start: String
    private let end: String
    private let escapeStrategy: StringEscapeStrategy

    private var content: AnyParser<String> {
        Annotated(pattern: "((\(NSRegularExpression.escapedPattern(for: escapeStrategy.escaped(endDelimiter: end))))|[^\(NSRegularExpression.escapedPattern(for: end))\\n])*") {
            Either<String> {
                escapeStrategy.escaped(endDelimiter: end).map(to: end).kind(.stringEscapedDelimiter)

                escapeStrategy.escaped.kind(.stringEscapedCharacter)
            }
        }
        .map { annotated in
            annotated.string { $0 }
        }
    }

    public var body: AnyParser<String> {
        start

        content

        end
    }
}

extension StringLiteral {

    public init(start: String = "\"", end: String = "\"") {
        self.init(start: start, end: end, escapeStrategy: SwiftEscapeStrategy())
    }

}

extension StringLiteral {

    public func escapeStrategy(_ strategy: StringEscapeStrategy) -> StringLiteral {
        return StringLiteral(start: start, end: end, escapeStrategy: strategy)
    }

}

extension Kind {

    public static let stringLiteral: Kind = "string.literal"
    public static let stringEscapedCharacter: Kind = "string.escaped.character"
    public static let stringEscapedDelimiter: Kind = "string.escaped.delimiter"

}
