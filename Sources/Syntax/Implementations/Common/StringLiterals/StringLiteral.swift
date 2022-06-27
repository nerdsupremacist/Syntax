
import Foundation
@_exported import SyntaxTree

public struct StringLiteral: Parser {
    public static let kind: Kind = .stringLiteral

    private let start: String
    private let end: String
    private let escapeStrategy: StringEscapeStrategy

    public var body: AnyParser<String> {
        start.kind(.stringStartDelimiter)

        Annotated(pattern: "((\(NSRegularExpression.escapedPattern(for: escapeStrategy.escaped(endDelimiter: end))))|[^\(NSRegularExpression.escapedPattern(for: end))\\n])*") {
            Either<String> {
                escapeStrategy.escaped(endDelimiter: end).map(to: end).kind(.stringEscapedDelimiter)

                escapeStrategy.escaped.kind(.stringEscapedCharacter)
            }
        }
        .map { annotated in
            annotated.string { $0 }
        }
        .kind(.stringContent)

        end.kind(.stringEndDelimiter)
    }

    public init(start: String = "\"", end: String = "\"", escapeStrategy: StringEscapeStrategy = SwiftEscapeStrategy()) {
        self.start = start
        self.end = end
        self.escapeStrategy = escapeStrategy
    }
}

extension StringLiteral {

    public func escapeStrategy(_ strategy: StringEscapeStrategy) -> StringLiteral {
        return StringLiteral(start: start, end: end, escapeStrategy: strategy)
    }

}

extension Kind {

    public static let stringLiteral: Kind = "string.literal"
    public static let stringContent: Kind = "string.content"
    public static let stringStartDelimiter: Kind = "string.delimiter.start"
    public static let stringEndDelimiter: Kind = "string.delimiter.end"
    public static let stringEscapedCharacter: Kind = "string.escaped.character"
    public static let stringEscapedDelimiter: Kind = "string.escaped.delimiter"

}
