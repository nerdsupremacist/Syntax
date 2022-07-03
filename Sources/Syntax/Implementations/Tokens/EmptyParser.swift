
import Foundation

public struct EmptyParser: Parser {
    public var body: any Parser<Void> {
        return neverBody()
    }
}

extension EmptyParser: InternalParserBuilder, Hashable {
    private class _Parser: InternalParser {
        var id: UUID? {
            return nil
        }
        
        var preferredKindOverrideForDerived: Kind.CombinationStrategy {
            return .higher
        }

        func parse(using scanner: Scanner) throws {
            // No-op
        }

        func prefixes() -> Set<String> {
            return []
        }
    }

    func buildParser<Context : InternalParserBuilderContext>(context: inout Context) -> InternalParser {
        return _Parser()
    }
}
