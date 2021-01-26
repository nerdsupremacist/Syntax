
import Foundation
import SyntaxTree

public struct Word: Parser, Hashable {
    private let word: String

    public init(_ word: String) {
        self.word = word
    }

    public var body: AnyParser<String> {
        return neverBody()
    }
}

extension Word: InternalParser {

    func prefixes() -> Set<String> {
        return [word]
    }

    func parse(using scanner: Scanner) throws {
        scanner.enterNode()
        let match = try scanner.take(word: word)
        scanner.store(value: match)
        scanner.exitNode()
        scanner.configureNode(kind: .wordMatch)
        scanner.configureNode(annotations: ["match" : match])
    }

}


extension Kind {

    public static let wordMatch: Kind = "word.match"

}
