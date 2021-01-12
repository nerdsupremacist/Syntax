
import Foundation

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
        let scanner = StandardScanner(text: text, errorHandlers: options.compactMap(\.errorHandler))
        try internalParser().parse(using: scanner)
        return scanner.syntaxTree()
    }

    public func parse(_ text: String, options: ParserOption...) throws -> Output {
        return try parse(text, options: options)
    }

    public func parse(_ text: String, options: [ParserOption] = [.allowWhiteSpaces]) throws -> Output {
        let scanner = StandardScanner(text: text, errorHandlers: options.compactMap(\.errorHandler))
        try internalParser().parse(using: scanner)
        let output = try scanner.pop(of: Output.self)
        return output
    }

}
