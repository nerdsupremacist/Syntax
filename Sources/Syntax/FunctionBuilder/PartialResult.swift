
import Foundation

protocol PartialResult {
    var parser: InternalParser { get }
    var outputType: Any.Type? { get }
}

extension TupleParser {

    init(partials: PartialResult...) {
        self.parsers = partials.map { $0.parser }
        self.outputTypes = partials.compactMap { $0.outputType }
    }

}
