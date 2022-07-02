
import Foundation

public protocol StringEscapeStrategy {
    @ParserBuilder
    var escaped: any Parser<String> { get }

    func escaped(endDelimiter: String) -> String
}
