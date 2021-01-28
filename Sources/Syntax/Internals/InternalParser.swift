
import Foundation

protocol InternalParser {
    var id: UUID { get }
    func parse(using scanner: Scanner) throws
    func prefixes() -> Set<String>
    func wrapContent(with wrapper: @escaping (InternalParser) -> InternalParser) -> InternalParser
}

extension InternalParser {

    func wrapContent(with wrapper: @escaping (InternalParser) -> InternalParser) -> InternalParser {
        return wrapper(self)
    }

}

extension InternalParser where Self: Hashable {

    var hashable: AnyHashable {
        return AnyHashable(self)
    }

}
