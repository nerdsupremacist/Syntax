
import Foundation
@_exported import SyntaxTree

public struct AnnotatedError: Error, DiagnosticError, LocalizedError, CustomStringConvertible, CustomDebugStringConvertible {
    public let range: Range<Location>
    public let error: Error

    public var location: Location {
        return range.upperBound
    }

    fileprivate var localizedError: LocalizedError? {
        return error as? LocalizedError
    }

    public var errorDescription: String? {
        return localizedError?.errorDescription ?? "\(error)"
    }

    public var failureReason: String? {
        return localizedError?.failureReason
    }

    public var helpAnchor: String? {
        return localizedError?.helpAnchor
    }

    public var recoverySuggestion: String? {
        return localizedError?.recoverySuggestion
    }

    public var debugDescription: String {
        let error = error as CustomDebugStringConvertible
        return error.debugDescription
    }

    public var description: String {
        let error = error as CustomStringConvertible
        return error.description
    }
}
