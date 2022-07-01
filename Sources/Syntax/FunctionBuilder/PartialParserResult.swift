
import Foundation

public struct PartialParserResult<Parsed>: PartialResult {
    let parser: InternalParser
    let outputType: Any.Type?
}
