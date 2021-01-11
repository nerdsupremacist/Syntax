
import Foundation

public protocol StringEscapeStrategy {
    @ParserBuilder
    var escaped: AnyParser<String> { get }
}
