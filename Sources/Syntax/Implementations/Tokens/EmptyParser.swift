
import Foundation

private let emptyId = UUID()

struct EmptyParser: Parser {
    typealias Output = Void

    var body: AnyParser<Output> {
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
