//
//  Swift+Range.swift
//  Ogma
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import Foundation

extension String {
    
    var range: NSRange {
        return NSRange(startIndex..<endIndex, in: self)
    }
    
}
