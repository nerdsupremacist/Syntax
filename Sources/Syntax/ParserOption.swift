
import Foundation

public struct ParserOption {
    let errorHandler: ScannerErrorHandler?
}

extension ParserOption {

    public static let allowWhiteSpaces = ParserOption(errorHandler: WhitespaceConsumer())

}
