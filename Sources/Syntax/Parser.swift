
import Foundation

public protocol Parser {
    associatedtype Output
    
    @ParserBuilder
    var body: AnyParser<Output> { get }
}

extension Parser {

    public func syntaxTree(_ text: String, options: ParserOption...) throws -> SyntaxTree {
        return try syntaxTree(text, options: options)
    }

    public func syntaxTree(_ text: String, options: [ParserOption] = [.allowWhiteSpaces]) throws -> SyntaxTree {
        let scanner = StandardScanner(text: text, errorHandlers: options.compactMap(\.errorHandler))
        try scanner.parse(using: self)
        return scanner.syntaxTree()
    }

    public func parse(_ text: String, options: ParserOption...) throws -> Output {
        return try parse(text, options: options)
    }

    public func parse(_ text: String, options: [ParserOption] = [.allowWhiteSpaces]) throws -> Output {
        let scanner = StandardScanner(text: text, errorHandlers: options.compactMap(\.errorHandler))
        try scanner.parse(using: self)
        let output = try scanner.pop(of: Output.self)
        return output
    }

}
