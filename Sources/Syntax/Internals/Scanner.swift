
import Foundation
@_exported import SyntaxTree

protocol Scanner {
    var range: Range<String.Index> { get }
    var location: Location { get }

    func preventRecursion(id: UUID) throws

    func enterNode()
    func exitNode()
    func removeChildrenOfNode()
    func locationOfNode() -> Range<Location>

    func configureNode(kind: Kind)
    func configureNode(annotations: [String : Encodable])
    func pruneNode(strategy: Kind.CombinationStrategy)

    func prefix(_ length: Int) throws -> Substring?

    func begin()
    func beginScanning<T>(in range: Range<String.Index>, clipToLast: Bool, for type: T.Type)

    func commit() throws

    func rollback() throws

    func take(pattern: String) throws -> ExpressionMatch

    func pop<T>(of type: T.Type) throws -> T
    func store<T>(value: T)

    func parse(using parser: InternalParser) throws

    func store(error: DiagnosticError)
}

extension Scanner {

    func attempt(_ closure: (Scanner) throws -> Void) throws {
        begin()
        do {
            try closure(self)
            try commit()
        } catch {
            try rollback()
        }
    }

    func attempt(_ closure: (Scanner) throws -> Void) -> Bool {
        begin()
        do {
            try closure(self)
            try commit()
            return true
        } catch {
            try! rollback()
            return false
        }
    }

}

extension Scanner {
    func take(word: String) throws -> String {
        do {
            let match = try take(pattern: NSRegularExpression.escapedPattern(for: word) + "\\b")
            return String(match.text)
        } catch let error as ScannerError {
            if case .failedToMatch = error.reason {
                throw ScannerError(index: error.index, location: error.location, reason: .expected(word))
            } else {
                throw error
            }
        }
    }

    func take(substring: String) throws -> String {
        do {
            let match = try take(pattern: NSRegularExpression.escapedPattern(for: substring))
            return String(match.text)
        } catch let error as ScannerError {
            if case .failedToMatch = error.reason {
                throw ScannerError(index: error.index, location: error.location, reason: .expected(substring))
            } else {
                throw error
            }
        }
    }

    func parse<T : Parser>(using parser: T) throws {
        let internalParser = parser.internalParser()
        try internalParser.parse(using: self)
    }
}
