
import Foundation

extension Parser {

    func internalParserBuilder() -> InternalParserBuilder {
        if let parser = self as? AnyParser<Parsed> {
            return parser.builder
        }

        if let parser = self as? any RecursiveParser {
            return parser.derivedRecursiveInternalParserBuilder()
        }

        if let builder = self as? InternalParserBuilder {
            return builder
        }

        return derivedInternalParserBuilder()
    }

}

extension Parser {

    fileprivate func derivedInternalParserBuilder() -> InternalParserBuilder {
        return DerivedParserBuilder(content: self)
    }

}


extension RecursiveParser {

    fileprivate func derivedRecursiveInternalParserBuilder() -> InternalParserBuilder {
        return DerivedRecursiveParserBuilder(content: self)
    }

}

private class DerivedParserBuilder<T : Parser>: InternalParserBuilder {
    let content: T

    init(content: T) {
        self.content = content
    }

    func buildParser<Context : InternalParserBuilderContext>(context: inout Context) -> InternalParser {
        let parser = context.build(content.body)
        return InternalParserWrapper<T>(content: parser)
    }
}

private class DerivedRecursiveParserBuilder<T : RecursiveParser>: InternalParserBuilder {
    let content: T

    init(content: T) {
        self.content = content
    }

    func buildParser<Context : InternalParserBuilderContext>(context: inout Context) -> InternalParser {
        let reference = context.reference(content)
        if case .fresh = reference.state {
            reference.state = .initializing
            let parser = context.build(content.body)
            let wrapper = InternalParserWrapper<T>(content: parser)
            reference.internalParser = wrapper
            reference.state = .initialized
        }
        return reference
    }
}

private class InternalParserWrapper<T : Parser>: InternalParser {
    let id = UUID()
    let content: InternalParser

    init(content: InternalParser) {
        self.content = content
    }

    func prefixes() -> Set<String> {
        return content.prefixes()
    }

    func parse(using scanner: Scanner) throws {
        scanner.enterNode()
        do {
            try content.parse(using: scanner)
            scanner.exitNode()
        } catch {
            scanner.exitNode()
            throw error
        }
        if let kind = T.kind {
            scanner.configureNode(kind: kind)
            scanner.pruneNode(strategy: .lower)
        }

        if T.Parsed.self != Void.self {
            let value = try scanner.pop(of: T.Parsed.self)
            scanner.store(value: value)

            if let value = value as? Encodable {
                scanner.configureNode(annotations: ["value" : value])
            }
            scanner.pruneNode(strategy: .separate)
        }
    }
}
