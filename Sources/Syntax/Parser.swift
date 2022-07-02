
import Foundation
@_exported import SyntaxTree

private var computedKinds = [Int : Kind]()

public protocol Parser<Parsed> {
    associatedtype Parsed

    static var kind: Kind? { get }
    
    @ParserBuilder
    var body: any Parser<Parsed> { get }
}

extension Parser {

    public static var kind: Kind? {
        let representation = unsafeBitCast(Self.self as Any.Type, to: Int.self)
        if let kind = computedKinds[representation] {
            return kind
        }

        let name = String(describing: Self.self)
            .nameComponents()
            .filter { !$0.isEmpty && $0 != "Parser" }
            .map { $0.lowercased() }
            .joined(separator: ".")

        let kind = Kind(rawValue: name)
        computedKinds[representation] = kind
        return kind
    }

}

extension Parser {

    public func syntaxTree(_ text: String, options: ParserOption...) throws -> SyntaxTree {
        return try syntaxTree(text, options: options)
    }

    public func syntaxTree(_ text: String, options: [ParserOption] = [.allowWhiteSpaces]) throws -> SyntaxTree {
        var context = StandardInternalParserBuilderContext()
        let scanner = StandardScanner(text: text, errorHandlers: options.compactMap(\.errorHandler), memoizationStorage: MemoizationStorage())
        let builder = internalParserBuilder()
        let parser = builder.buildParser(context: &context)
        try scanner.parseWithAnnotatedErrors(parser: parser)
        try scanner.checkIsEmpty()
        return scanner.syntaxTree()
    }

    public func parse(_ text: String, options: ParserOption...) throws -> Parsed {
        return try parse(text, options: options)
    }

    public func parse(_ text: String, options: [ParserOption] = [.allowWhiteSpaces]) throws -> Parsed {
        var context = StandardInternalParserBuilderContext()
        let scanner = StandardScanner(text: text, errorHandlers: options.compactMap(\.errorHandler), memoizationStorage: MemoizationStorage())
        let builder = internalParserBuilder()
        let parser = builder.buildParser(context: &context)
        try scanner.parseWithAnnotatedErrors(parser: parser)
        try scanner.checkIsEmpty()
        let output = try scanner.pop(of: Parsed.self)
        return output
    }

    public func annotated(_ text: String, options: ParserOption...) throws -> AnnotatedString<Parsed> {
        return try annotated(text, options: options)
    }

    public func annotated(_ text: String, options: [ParserOption] = [.allowWhiteSpaces]) throws -> AnnotatedString<Parsed> {
        let parser = Annotated { self }
        return try parser.parse(text, options: options)
    }

}

extension Parser {


    public func syntaxTree(_ text: String, options: ParserOption..., cache: Cache<Parsed>) throws -> SyntaxTree {
        return try syntaxTree(text, options: options, cache: cache)
    }

    public func syntaxTree(_ text: String, options: [ParserOption] = [.allowWhiteSpaces], cache: Cache<Parsed>) throws -> SyntaxTree {
        return try _parse(text, options: options, cache: cache).tree
    }

    public func parse(_ text: String, options: ParserOption..., cache: Cache<Parsed>) throws -> Parsed {
        return try parse(text, options: options, cache: cache)
    }

    public func parse(_ text: String, options: [ParserOption] = [.allowWhiteSpaces], cache: Cache<Parsed>) throws -> Parsed {
        return try _parse(text, options: options, cache: cache).value
    }

    public func annotated(_ text: String, options: ParserOption..., cache: Cache<AnnotatedString<Parsed>>) throws -> AnnotatedString<Parsed> {
        return try annotated(text, options: options, cache: cache)
    }

    public func annotated(_ text: String, options: [ParserOption] = [.allowWhiteSpaces], cache: Cache<AnnotatedString<Parsed>>) throws -> AnnotatedString<Parsed> {
        let parser = Annotated { self }
        return try parser.parse(text, options: options, cache: cache)
    }

    private func _parse(_ text: String, options: [ParserOption], cache: Cache<Parsed>) throws -> Cache<Parsed>.CacheEntry {
        if let cached = cache.memory(for: text) {
            return cached
        }

        let parser: InternalParser
        if let cached = cache.internalParser {
            parser = cached
        } else {
            var context = StandardInternalParserBuilderContext()
            let builder = internalParserBuilder()
            parser = builder.buildParser(context: &context)
            cache.internalParser = parser
        }

        let storage: MemoizationStorage
        
        if #available(OSX 10.15, iOS 13, tvOS 13, watchOS 6, *) {
            storage = cache.storage(for: text)
        } else {
            storage = MemoizationStorage()
        }

        let scanner = StandardScanner(text: text, errorHandlers: options.compactMap(\.errorHandler), memoizationStorage: storage)
        try scanner.parseWithAnnotatedErrors(parser: parser)
        try scanner.checkIsEmpty()

        let output: Parsed
        if Parsed.self != Void.self {
            output = try scanner.pop(of: Parsed.self)
        } else {
            output = () as! Parsed
        }

        let tree = scanner.syntaxTree()
        let entry = Cache<Parsed>.CacheEntry(text: text, value: output, tree: tree, storage: storage)
        cache.store(entry: entry)
        return entry
    }
    
}

extension Scanner {

    fileprivate func parseWithAnnotatedErrors(parser: InternalParser) throws {
        begin()
        do {
            try parse(using: parser)
            try commit()
        } catch let error as DiagnosticError {
            try rollback()
            throw error
        } catch {
            let end = location
            try rollback()
            let start = location
            throw AnnotatedError(range: start..<end, error: error)
        }
    }

}
