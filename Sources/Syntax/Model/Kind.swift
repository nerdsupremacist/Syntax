
import Foundation

public struct Kind: RawRepresentable, Encodable, Equatable {
    public enum CombinationStrategy {
        case higher
        case lower
        case separate
    }

    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension Kind: ExpressibleByStringLiteral {

    public init(stringLiteral value: String) {
        self.init(rawValue: value)
    }

}
