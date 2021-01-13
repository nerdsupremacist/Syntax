
import Foundation

protocol ScannerErrorHandler {
    func scannerIsNotAtTheEnd(_ scanner: Scanner) throws
    func scannerFailedToMatch(_ scanner: Scanner, expression: NSRegularExpression) throws
}
