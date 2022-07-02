
import Foundation

private let emptyId = UUID()

public struct EmptyParser: Parser {
    public var body: any Parser<Void> {
        return neverBody()
    }
}

extension EmptyParser: InternalParser, Hashable {

    var id: UUID {
        return emptyId
    }

    func parse(using scanner: Scanner) throws {
        // No-op
    }

    func prefixes() -> Set<String> {
        return []
    }

}
