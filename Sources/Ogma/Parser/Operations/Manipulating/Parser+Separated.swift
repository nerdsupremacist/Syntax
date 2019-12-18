//
//  RecusriveParser.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension Parser {

    /// Find n occurrences of the parsers value separated by a specific Token.
    public func separated(by separator: Token,
                          allowsTrailingSeparator: Bool = false,
                          allowsEmpty: Bool = false) -> AnyParser<Token, [Output]> {

        if allowsTrailingSeparator {
            return separated(by: separator,
                             allowsTrailingSeparator: false,
                             allowsEmpty: allowsEmpty) && separator.optional()
        }

        if allowsEmpty {
            return separated(by: separator, allowsEmpty: false) || []
        }

        return .recursive { separated in
            return self.and(separator).and(separated).map { [$0] + $1 } ||
                self.map { [$0] }
        }
    }
    
}
