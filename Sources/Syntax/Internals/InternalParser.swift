
import Foundation

protocol InternalParser: AnyObject {
    var id: UUID? { get }
    var preferredKindOverrideForDerived: Kind.CombinationStrategy { get }

    func parse(using scanner: Scanner) throws
    func prefixes() -> Set<String>
}
