//
//  Goal.swift
//  PileUp
//
//  Created by Beatriz Sato on 08/04/21.
//

import Foundation

// MARK: - Goal and Block model
// qual seria a diferença de colocar as structs aqui dentro ou do lado de fora?
struct Goal {
    let id: Int
    let index: Int
    let imageName: String
    // all goals start with 0 or 1 and are not selected, but that only matters at the end
    var pile: Int = 0
    var isCompleted: Bool = false
}
