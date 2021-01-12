
import Foundation

extension Parser {

    func internalParser() -> InternalParser {
        if let parser = self as? AnyParser<Output> {
            return parser.parser
        }

        if let parser = self as? InternalParser {
            return parser
        }

        return body
            .kind(Self.kind, using: .lower)
            .annotate { value in
                guard let value = value as? Encodable else { return [:] }
                return ["value" : value]
            }
            .internalParser()
    }

}
