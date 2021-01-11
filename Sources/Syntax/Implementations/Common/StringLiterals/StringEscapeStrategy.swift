
import Foundation

public protocol StringEscapeStrategy {
    @ParserBuilder
    func escaped(with endDelimiter: String) -> AnyParser<String>
}
