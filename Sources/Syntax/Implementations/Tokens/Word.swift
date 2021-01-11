
import Foundation

public struct Word: Parser {
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
        scanner.configureNode(kind: "word.match")
        scanner.configureNode(annotations: ["match" : match])
    }

}
