
import Foundation

public struct StringLiteral: Parser {
    private let start: String
    private let end: String
    private let escapeStrategy: StringEscapeStrategy

    public var body: AnyParser<String> {
        Leaf {
            start

            Repeat {
                Either {
                    escapeStrategy.escaped
                    RegularExpression("[^\\n\(end)]").map { String($0.text) }
                }
            }
            .map { sections in
                return sections.joined(separator: "")
            }

            end
        }
        .kind(.stringLiteral)
        .annotate { value in
            return ["value" : value]
        }
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

}
