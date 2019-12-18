//
//  RepeatingParser.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

postfix operator *
postfix operator +

/// Attempt to read the value of the parser as many times as possible
public postfix func * <P: Parser>(_ p: P) -> AnyParser<P.Token, [P.Output]> {
    return .recursive { p.and($0).map { [$0] + $1 } || [] }
}

/// Atempt to read the value of the parser at least once
public postfix func + <P: Parser>(_ p: P) -> AnyParser<P.Token, [P.Output]> {
    return p.and(p*).map { [$0] + $1 }
}

/// Attempt to read the value of the parser as many times as possible
public postfix func * <P: Parsable>(_ p: P.Type) -> AnyParser<P.Token, [P]> {
    return p.indirect*
}

/// Atempt to read the value of the parser at least once
public postfix func + <P: Parsable>(_ p: P.Type) -> AnyParser<P.Token, [P]> {
    return p.indirect+
}
