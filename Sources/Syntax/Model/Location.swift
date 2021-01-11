import Foundation

public struct Location: Comparable, Encodable {
    public let line: Int
    public let column: Int

    public static func < (lhs: Location, rhs: Location) -> Bool {
        switch rhs.line - lhs.line {
        case ..<0:
            return false
        case 1...:
            return true
        default:
            return lhs.column < rhs.column
        }
    }
}
