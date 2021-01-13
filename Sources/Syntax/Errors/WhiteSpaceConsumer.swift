
import Foundation

struct WhitespaceConsumer: ScannerErrorHandler {
    func scannerIsNotAtTheEnd(_ scanner: Scanner) throws {
        _ = try scanner.take(pattern: "\\s+")
    }

    func scannerFailedToMatch(_ scanner: Scanner, expression: NSRegularExpression) throws {
        _ = try scanner.take(pattern: "\\s+")
    }
}
