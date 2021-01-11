
import Foundation

public enum ScannerError: Error {
    case failedToMatch(NSRegularExpression, at: Substring)
    case attemptedToPopValueFromEmptyList(Any.Type)
    case poppedValueDidNotMatchExpectedValue(Any, expected: Any.Type)
}
