//
//  Goal.swift
//  PileUp
//
//  Created by Beatriz Sato on 08/04/21.
//

import Foundation

// MARK: - Goal and Block model
struct Goal {
    let id: Int
    let index: Int
    let imageName: String
    var blockColor: BlockColor
    var isCompleted: Bool = false
}
