//
//  YAML.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 8/10/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Ogma

enum Markdown: TokenProtocol {
    struct Header: TokenProtocol {
        let level: Int
        let text: String
    }

    struct Link: TokenProtocol {
        let name: String
        let url: URL
    }

    struct Image: TokenProtocol {
        let name: String
        let identifier: String
    }

    case header(Header)

    case bold(String)
    case italic(String)
    case scratch(String)
    case snippet(String)
    
    case link(Link)
    case image(Image)
}
