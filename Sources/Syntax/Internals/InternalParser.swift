
import Foundation

protocol InternalParser {
    func parse(using scanner: Scanner) throws
    func prefixes() -> Set<String>
}
