
import Foundation

public protocol DiagnosticError: Error {
    var location: Location { get }
}
