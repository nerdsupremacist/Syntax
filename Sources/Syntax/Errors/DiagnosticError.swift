
import Foundation
import SyntaxTree

public protocol DiagnosticError: Error {
    var location: Location { get }
}
