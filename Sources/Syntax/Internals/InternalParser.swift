
import Foundation

public protocol Identified: Hashable {
    var id: UUID { get }
}

extension Identified {

    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        id.hash(into: &hasher)
    }

}

protocol InternalParser {
    var hashable: AnyHashable { get }
    func parse(using scanner: Scanner) throws
    func prefixes() -> Set<String>
}

extension InternalParser where Self: Hashable {

    var hashable: AnyHashable {
        return AnyHashable(self)
    }

}
