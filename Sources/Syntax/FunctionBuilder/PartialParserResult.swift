
import Foundation

public struct PartialParserResult<Output>: PartialResult {
    let parser: InternalParser
    let outputType: Any.Type?
}
