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
    var index: Int
    var color: BlockColor
    // all blocks start with 1 pile (itself) and are not disabled

    var pile: Int = 1
    var isDisabled: Bool = false
}

enum BlockColor {
    case red
    case blue
    case green
    case yellow
}
