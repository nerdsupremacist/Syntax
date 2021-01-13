
import Foundation

protocol PartialResult {
    var parsers: [InternalParser] { get }
    var outputTypes: [Any.Type] { get }
}

extension TupleParser {

    init(partials: PartialResult...) {
        self.parsers = partials.flatMap { $0.parsers }
        self.outputTypes = partials.flatMap { $0.outputTypes }
    }

}
