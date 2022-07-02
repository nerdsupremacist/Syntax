
import Foundation
#if canImport(RegexBuilder)
import RegexBuilder
#endif

struct WhitespaceConsumer: ScannerErrorHandler {
    func scannerIsNotAtTheEnd(_ scanner: Scanner) throws {
        _ = try scanner.take(pattern: "\\s+")
    }

    func scannerFailedToMatch(_ scanner: Scanner, expression: NSRegularExpression) throws {
        _ = try scanner.take(pattern: "\\s+")
    }

#if canImport(RegexBuilder)
    @available(macOS 13.0, iOS 16, tvOS 16, watchOS 9, *)
    func scannerFailedToMatch<Parsed>(_ scanner: Scanner, regex: Regex<Parsed>) throws {
        _ = try scanner.take(pattern: "\\s+")
    }
#endif
}
