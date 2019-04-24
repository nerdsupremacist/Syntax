//
//  GeneratedToken.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

public struct Generated<Token: TokenProtocol> {
    let token: Token?
    let remainingString: String?

    public init(token: Token?, remainingString: String?) {
        self.token = token
        self.remainingString = remainingString
    }
}


extension Generated {

    public func map<T: TokenProtocol>(_ transform: (Token) throws -> T) rethrows -> Generated<T> {
        return Generated<T>(token: try token.map(transform), remainingString: remainingString)
    }

}
