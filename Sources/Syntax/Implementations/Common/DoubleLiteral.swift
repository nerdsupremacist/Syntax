
import Foundation

private let numberFormatter = NumberFormatter()
private let doublePrefixes: Set<String> = Set((0...9).map { String($0) } + (0...9).map { String(-$0) })

public struct DoubleLiteral: Parser {
    public static let kind: Kind = .doubleLiteral

    public init() { }

    public var body: AnyParser<Double> {
        Leaf {
            RegularExpression("-?\\d+(,\\d+)*\\.\\d+(e((-|\\+)?)\\d+)?\\b").map { match -> Double in
                guard let number = numberFormatter.number(from: String(match.text)) else { fatalError() }
                return number.doubleValue
            }
        }
        .optimize(using: doublePrefixes)
    }
}

extension Kind {

    public static let doubleLiteral: Kind = "double.literal"

}
