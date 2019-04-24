//
//  StringTokenizer.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/23/19.
//

import Foundation

extension String {

    /// Generator that returns a String surrounded by a specific delimiter
    public static func generator(delimiter: String) -> AnyTokenGenerator<String> {
        return StringTokenGenerator(delimiter: delimiter).any()
    }

}

private struct StringTokenGenerator: RegexTokenGenerator {
    typealias Token = String

    let delimiter: String

    var pattern: String {
        return "\(delimiter)([^\(delimiter)]|\\.)*\(delimiter)"
    }

    func token(from matched: String) throws -> Token? {
        guard matched.count > 1 else { fatalError("String Literal is somehow smaller than the quotation marks") }
        let range = matched.index(after: matched.startIndex)..<matched.index(before: matched.endIndex)
        return String(matched[range])
    }
}
