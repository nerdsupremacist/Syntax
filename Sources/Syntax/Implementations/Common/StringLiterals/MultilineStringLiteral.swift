
import Foundation

public struct MultilineStringLiteral: Parser {
    private let start: String
    private let end: String
    private let escapeStrategy: StringEscapeStrategy

    public var body: AnyParser<String> {
        start.ignoreOutput()

        Repeat {
            Either {
                escapeStrategy.escaped(with: end)
                RegularExpression("[^\(end)]").map { String($0.text) }
            }
        }
        .map { sections in
            return sections.joined(separator: "")
        }

        end.ignoreOutput()
    }
}

extension MultilineStringLiteral {

    public init(start: String = "\"", end: String = "\"") {
        self.init(start: start, end: end, escapeStrategy: SwiftEscapeStrategy())
    }

}

extension MultilineStringLiteral {

    public func escapeStrategy(_ strategy: StringEscapeStrategy) -> MultilineStringLiteral {
        return MultilineStringLiteral(start: start, end: end, escapeStrategy: strategy)
    }

}
