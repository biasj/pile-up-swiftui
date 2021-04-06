//
//  Board.swift
//  PileUp
//
//  Created by Beatriz Sato on 05/04/21.
//

import Foundation

struct Board {
    var blocks: [Block]
    var goals: [Goal]
    
    init() {
        blocks = [Block]()
        goals = [Goal]()
        
        for i in 0..<16 {
//            for j in 0..<4 {
                blocks.append(Block(id: i, imageName: "redBlock", pile: 1, isSelected: false))
//            }
        }
        
        for k in 0..<4 {
            goals.append(Goal(id: k, imageName: "blueGoal", pile: 0, isCompleted: false))
        }
    }
    
    // MARK: - Logic
    func moveBlock(block: Block) {
        print("\(block.imageName)")
        
        // check if the blocks are same color and pile them if they are
            pileBlock()
        // or swap them if they aren't
           swapBlocks()
        
        // check if there's possible moves or if the game has ended
            checkEnd()
    }
    
    mutating func selectBlock(block: Block) {
        // acha a cópia desse block passado no parametro no array de blocks
        let chosenIndex = findBlockIndex(block: block)
        blocks[chosenIndex].isSelected = true
        
    }
    
    func pileBlock() {
        
    }
    
    func swapBlocks() {
        
    }
    
    func checkEnd() {
        
    }
    
    func findBlockIndex(block: Block) -> Int {
        for i in 0..<blocks.count {
            if blocks[i].id == block.id {
                return i
            }
        }
        return -1
    }

}


// MARK: - Goal and Block model
// qual seria a diferença de colocar as structs aqui dentro ou do lado de fora?
struct Goal: Identifiable {
    let id: Int // index
    let imageName: String
    var pile: Int
    var isCompleted: Bool
}

struct Block: Identifiable {
    let id: Int // index
    let imageName: String
    var pile: Int // começa com 1
    var isSelected: Bool
}
