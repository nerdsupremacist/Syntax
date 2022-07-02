
import Foundation
@_exported import SyntaxTree

public struct ScannerError: DiagnosticError {
    public enum Reason {
        case unexpectedToken(String)
        case expected(String)
        case failedToMatch(NSRegularExpression)

        case failedToMatchRegex

        case annotatedValueDoeNotMatchExpectedType(Any, expected: Any.Type)
        case annotatedValueDoesNotHaveAStartingIndex(Any)
        case attemptedToPopValueFromEmptyList(Any.Type)
        case poppedValueDidNotMatchExpectedValue(Any, expected: Any.Type)
    }

    public let index: String.Index
    public let location: Location
    public let reason: Reason
}
