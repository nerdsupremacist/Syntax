
import Foundation
@_exported import SyntaxTree

private var computedKinds = [Int : Kind]()

public protocol Parser {
    associatedtype Output

    static var kind: Kind? { get }
    
    @ParserBuilder
    var body: AnyParser<Output> { get }
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
        let scanner = StandardScanner(text: text, errorHandlers: options.compactMap(\.errorHandler), memoizationStorage: MemoizationStorage())
        try scanner.parseWithAnnotatedErrors(parser: internalParser())
        try scanner.checkIsEmpty()
        return scanner.syntaxTree()
    }

    public func parse(_ text: String, options: ParserOption...) throws -> Output {
        return try parse(text, options: options)
    }

    public func parse(_ text: String, options: [ParserOption] = [.allowWhiteSpaces]) throws -> Output {
        let scanner = StandardScanner(text: text, errorHandlers: options.compactMap(\.errorHandler), memoizationStorage: MemoizationStorage())
        try scanner.parseWithAnnotatedErrors(parser: internalParser())
        try scanner.checkIsEmpty()
        let output = try scanner.pop(of: Output.self)
        return output
    }

    public func annotated(_ text: String, options: ParserOption...) throws -> AnnotatedString<Output> {
        return try annotated(text, options: options)
    }

    public func annotated(_ text: String, options: [ParserOption] = [.allowWhiteSpaces]) throws -> AnnotatedString<Output> {
        let parser = Annotated { self }
        return try parser.parse(text, options: options)
    }

}

extension Parser {


    public func syntaxTree(_ text: String, options: ParserOption..., cache: Cache<Output>) throws -> SyntaxTree {
        return try syntaxTree(text, options: options, cache: cache)
    }

    public func syntaxTree(_ text: String, options: [ParserOption] = [.allowWhiteSpaces], cache: Cache<Output>) throws -> SyntaxTree {
        return try _parse(text, options: options, cache: cache).tree
    }

    public func parse(_ text: String, options: ParserOption..., cache: Cache<Output>) throws -> Output {
        return try parse(text, options: options, cache: cache)
    }

    public func parse(_ text: String, options: [ParserOption] = [.allowWhiteSpaces], cache: Cache<Output>) throws -> Output {
        return try _parse(text, options: options, cache: cache).value
    }

    public func annotated(_ text: String, options: ParserOption..., cache: Cache<AnnotatedString<Output>>) throws -> AnnotatedString<Output> {
        return try annotated(text, options: options, cache: cache)
    }

    public func annotated(_ text: String, options: [ParserOption] = [.allowWhiteSpaces], cache: Cache<AnnotatedString<Output>>) throws -> AnnotatedString<Output> {
        let parser = Annotated { self }
        return try parser.parse(text, options: options, cache: cache)
    }

    private func _parse(_ text: String, options: [ParserOption], cache: Cache<Output>) throws -> Cache<Output>.CacheEntry {
        if let cached = cache.memory(for: text) {
            return cached
        }

        let parser: InternalParser
        if let cached = cache.internalParser {
            parser = cached
        } else {
            parser = internalParser()
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

        let output: Output
        if Output.self != Void.self {
            output = try scanner.pop(of: Output.self)
        } else {
            output = () as! Output
        }

        let tree = scanner.syntaxTree()
        let entry = Cache<Output>.CacheEntry(text: text, value: output, tree: tree, storage: storage)
        cache.store(entry: entry)
        return entry
    }
    
}

extension Scanner {

    fileprivate func parseWithAnnotatedErrors(parser: InternalParser) throws {
        begin()
        do {
            try parser.parse(using: self)
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
