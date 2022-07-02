
import Foundation
#if canImport(RegexBuilder)
import RegexBuilder
#endif

protocol ScannerErrorHandler {
    func scannerIsNotAtTheEnd(_ scanner: Scanner) throws
    func scannerFailedToMatch(_ scanner: Scanner, expression: NSRegularExpression) throws

#if canImport(RegexBuilder)
    @available(macOS 13.0, iOS 16, tvOS 16, watchOS 9, *)
    func scannerFailedToMatch<Parsed>(_ scanner: Scanner, regex: Regex<Parsed>) throws
#endif
}
