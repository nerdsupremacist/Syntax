
import Foundation
@_exported import SyntaxTree

public protocol DiagnosticError: Error {
    var location: Location { get }
}

public enum DiagnosticMessageMode {
    case localized
    case debugDescription
    case description
}

extension DiagnosticError {
    public var message: String {
        return message(file: nil)
    }

    public func message(file: URL?, mode: DiagnosticMessageMode = .localized) -> String {
        return "\(location.description(file: file)): error: \(errorDescription(mode: mode))"
    }
}

extension Error {
    fileprivate func errorDescription(mode: DiagnosticMessageMode) -> String {
        switch mode {
        case .localized:
            return localizedDescription
        case .debugDescription:
            let error = self as CustomDebugStringConvertible
            return error.debugDescription
        case .description:
            let error = self as CustomStringConvertible
            return error.description
        }
    }
}

extension Location {

    fileprivate func description(file: URL?) -> String {
        let components: [String?] = [file?.path, String(line + 1), String(column + 1)]
        return components.compactMap { $0 }.joined(separator: ":")
    }

}
