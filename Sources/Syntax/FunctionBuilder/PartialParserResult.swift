
import Foundation

public struct PartialParserResult<Output>: PartialResult {
    let parsers: [InternalParser]
    let outputTypes: [Any.Type]
}
