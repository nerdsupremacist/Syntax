
import Foundation

struct WhitespaceConsumer: ScannerErrorHandler {
    func scannerFailedToMatch(_ scanner: Scanner, expression: NSRegularExpression) throws {
        _ = try scanner.take(pattern: "\\s+")
    }
}
