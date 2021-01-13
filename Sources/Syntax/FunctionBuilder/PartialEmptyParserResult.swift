
import Foundation

public struct PartialEmptyParserResult: PartialResult {
    let parsers: [InternalParser]

    var outputTypes: [Any.Type] {
        return []
    }
}
