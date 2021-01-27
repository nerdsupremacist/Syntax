
import Foundation

protocol InternalParser {
    var id: UUID { get }
    func parse(using scanner: Scanner) throws
    func prefixes() -> Set<String>
}

extension InternalParser where Self: Hashable {

    var hashable: AnyHashable {
        return AnyHashable(self)
    }

}
