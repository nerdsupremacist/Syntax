
import Foundation

public struct IfElseConditionalParser<A : Parser, B : Parser>: Parser where A.Parsed == B.Parsed {
    let internalParser: InternalParser

    init(_ a: A) {
        internalParser = a.internalParser()
    }

    init(_ b: B) {
        internalParser = b.internalParser()
    }

    public var body: any Parser<A.Parsed> {
        return neverBody()
    }
}

extension IfElseConditionalParser: InternalParser {
    var id: UUID {
        return internalParser.id
    }

    func prefixes() -> Set<String> {
        return internalParser.prefixes()
    }

    func parse(using scanner: Scanner) throws {
        try internalParser.parse(using: scanner)
    }
}
