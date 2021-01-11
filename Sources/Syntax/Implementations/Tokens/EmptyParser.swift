
import Foundation

struct EmptyParser: Parser {
    typealias Output = Void

    var body: AnyParser<Output> {
        return neverBody()
    }
}

extension EmptyParser: InternalParser {

    func parse(using scanner: Scanner) throws {
        // No-op
    }

    func prefixes() -> Set<String> {
        return []
    }

}
