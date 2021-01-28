
import Foundation

public struct SwiftEscapeStrategy: StringEscapeStrategy {
    public init() { }

    public func escaped(with endDelimiter: String) -> AnyParser<String> {
        Either<String> {
            "\\\\".map(to: "\\")
            "\\\(endDelimiter)".map(to: "\(endDelimiter)")
            "\\n".map(to: "\n")
            "\\t".map(to: "\t")
            "\\0".map(to: "\0")
            "\\r".map(to: "\r")

            RegularExpression("u\\{([0-9a-fA-F]{1,8})\\}")
                .map { match -> String in
                    guard let number = UInt32(match[1]!.text, radix: 16) else { fatalError() }

                    guard let unicodeScalar = UnicodeScalar(number) else {
                        fatalError()
                    }

                    return String(unicodeScalar)
                }
        }
    }
}
