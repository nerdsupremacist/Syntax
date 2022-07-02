
import Foundation

class InternalParserReference: InternalParser {
    enum State {
        case fresh
        case initializing
        case initialized
    }

    let id = UUID()
    var internalParser: InternalParser!
    var state: State = .fresh

    init() { }

    func parse(using scanner: Scanner) throws {
        try internalParser.parse(using: scanner)
    }

    func prefixes() -> Set<String> {
        // If we're calling on prefixes before being initilized, there's a recursion inside an Either
        // The safest thing to do is to default to no defined prefixes, and take the recursive edge as the last possible one
        guard case .initialized = state else { return [] }
        return internalParser.prefixes()
    }
}

protocol InternalParserBuilderContext {
    mutating func reference<T : Hashable>(_ value: T) -> InternalParserReference
}

extension InternalParserBuilderContext {
    mutating func build<T : Parser>(_ parser: T) -> InternalParser {
        return parser.internalParserBuilder().buildParser(context: &self)
    }

    mutating func build(using builder: InternalParserBuilder) -> InternalParser {
        return builder.buildParser(context: &self)
    }
}

protocol InternalParserBuilder {
    func buildParser<Context : InternalParserBuilderContext>(context: inout Context) -> InternalParser
}
