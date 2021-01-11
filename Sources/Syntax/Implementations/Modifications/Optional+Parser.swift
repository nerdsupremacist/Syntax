
import Foundation

extension Optional: Parser, InternalParser where Wrapped: Parser {
    func prefixes() -> Set<String> {
        return self?.internalParser().prefixes() ?? [""]
    }

    public var body: AnyParser<Wrapped.Output?> {
        return neverBody()
    }

    func parse(using scanner: Scanner) throws {
        if let wrapped = self {
            let final = wrapped.map { Optional.some($0) }
            try scanner.parse(using: final)
        } else {
            scanner.store(value: nil as Output)
        }
    }
}
