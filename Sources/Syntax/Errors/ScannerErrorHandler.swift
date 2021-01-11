
import Foundation

protocol ScannerErrorHandler {
    func scannerFailedToMatch(_ scanner: Scanner, expression: NSRegularExpression) throws
}
