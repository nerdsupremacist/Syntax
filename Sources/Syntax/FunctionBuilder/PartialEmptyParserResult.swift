
import Foundation

public struct PartialEmptyParserResult: PartialResult {
    let parser: InternalParser

    var outputType: Any.Type? {
        return nil
    }
}
