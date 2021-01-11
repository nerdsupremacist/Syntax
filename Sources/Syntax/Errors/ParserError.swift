
import Foundation

public enum ParserError: Error {
    case failedToParseAnyCase(dueTo: [Error])
    case failedDueToLeftHandSideRecursionDetected(id: UUID)
}
