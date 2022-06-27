
import Foundation

public struct JavaScriptEscapeStrategy: StringEscapeStrategy {
    public var escaped: AnyParser<String> {
        Either<String> {
            "\\\\".map(to: "\\")
            "\\/".map(to: "/")
            "\\n".map(to: "\n")
            "\\r".map(to: "\r")
            "\\t".map(to: "\t")

            RegularExpression("\\u([0-9a-fA-F]{4})")
                .map { match -> String in
                    guard let number = UInt32(match[1]!.text, radix: 16) else { fatalError() }

                    guard let unicodeScalar = UnicodeScalar(number) else {
                        fatalError()
                    }

                    return String(unicodeScalar)
                }
        }
    }

    public init() { }

    public func escaped(endDelimiter: String) -> String {
        return "\\\(endDelimiter)"
    }

}
