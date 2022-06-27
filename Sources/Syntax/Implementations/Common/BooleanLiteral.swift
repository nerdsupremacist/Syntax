
import Foundation
@_exported import SyntaxTree

public struct BooleanLiteral: Parser {
    public static var kind: Kind = .booleanLiteral

    let trueValues: Set<String>
    let falseValues: Set<String>

    public init(true trueValues: Set<String> = ["true"],
                false falseValues: Set<String> = ["false"]) {

        self.trueValues = trueValues
        self.falseValues = falseValues
    }

    public var body: AnyParser<Bool> {
        Leaf {
            Either {
                Either(trueValues) { token in
                    Word(token).map(to: true)
                }

                Either(falseValues) { token in
                    Word(token).map(to: false)
                }
            }
        }
    }
}

extension Kind {

    public static let booleanLiteral: Kind = "boolean.literal"

}
