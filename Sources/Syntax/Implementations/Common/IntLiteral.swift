
import Foundation
@_exported import SyntaxTree

private let numberFormatter = NumberFormatter()
private let integerPrefixes: Set<String> = Set((0...9).map { String($0) } + (1...9).map { String(-$0) })

public struct IntLiteral: Parser {
    public static let kind: Kind = .intLiteral

    public init() { }

    public var body: any Parser<Int> {
        Leaf {
            RegularExpression("-?\\d+(e\\d+)?\\b").map { match -> Int in
                guard let number = numberFormatter.number(from: String(match.text)) else { fatalError() }
                return number.intValue
            }
        }
        .optimize(using: integerPrefixes)
    }
}


extension Kind {

    public static let intLiteral: Kind = "int.literal"

}
