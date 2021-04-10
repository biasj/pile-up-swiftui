//
//  Block.swift
//  PileUp
//
//  Created by Beatriz Sato on 08/04/21.
//

import Foundation

struct Block {
    let id: Int
    let imageName: String
    // all blocks start with 1 pile (itself) and are not disabled
    var index: Int
    var pile: Int = 1
    var isDisabled: Bool = false
    
    var color: BlockColor
}

enum BlockColor {
    case red
    case blue
    case green
    case yellow
}
