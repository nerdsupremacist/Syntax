
import Foundation
@_exported import SyntaxTree

public struct Word: Parser, Hashable {
    private let word: String

    public init(_ word: String) {
        self.word = word
    }

    public var body: any Parser<String> {
        return neverBody()
    }
}

extension Word: InternalParserBuilder {
    private class _Parser: InternalParser {
        let id: UUID? = UUID()
        let word: String

        init(word: String) {
            self.word = word
        }

        var preferredKindOverrideForDerived: Kind.CombinationStrategy {
            return .higher
        }

        func prefixes() -> Set<String> {
            return [word]
        }

        func parse(using scanner: Scanner) throws {
            let match = try scanner.withNewNode { scanner in
                let match = try scanner.take(word: word)
                scanner.store(value: match)
                return match
            }
            scanner.configureNode(kind: .wordMatch)
            scanner.configureNode(annotations: ["match" : match])
        }
    }

    func buildParser<Context : InternalParserBuilderContext >(context: inout Context) -> InternalParser {
        return _Parser(word: word)
    }
}


extension Kind {

    public static let wordMatch: Kind = "word.match"

}
