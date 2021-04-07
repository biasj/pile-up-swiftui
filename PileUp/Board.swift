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
        
        // TODO: gerador de imagem
        // imagem do bloco deve ser gerado de forma aleatória dentro do laço, mas deve ter 4 blocos com cada cor
        blocks = generateBlocks()
        blocks.shuffle()
        
        
        // TODO: gerador de id
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
    
    func shouldPlaceGoal(id: Int) -> Bool {
        for goal in goals {
            if id == goal.id {
                return true
            }
        }
        return false
    }
    
    func getGoalIndex(of id: Int) -> Int {
        for i in 0..<goals.count {
            if id == goals[i].id {
                return i
            }
        }
        return -1
    }
    
    
    // MARK: initialization methods
    
    // generates 4 blocks of each color (red, blue, yellow, green)
    func generateBlocks() -> [Block] {
        var blocks = [Block]()
        blocks += generateColor(imageName: "redBlock", from: 0, until: 4)
        blocks += generateColor(imageName: "blueBlock", from: 4, until: 8)
        blocks += generateColor(imageName: "yellowBlock", from: 8, until: 12)
        blocks += generateColor(imageName: "greenBlock", from: 12, until: 16)
        
        return blocks
    }
    
    // generates 4 blocks with the specified color
    func generateColor(imageName: String, from initial: Int, until end: Int) -> [Block] {
        var blocks = [Block]()
        for i in initial..<end {
            let block = Block(id: i, imageName: imageName, pile: 1, isSelected: false)
            blocks.append(block)
        }
        
        return blocks
    }

}


// MARK: - Goal and Block model
// qual seria a diferença de colocar as structs aqui dentro ou do lado de fora?
struct Goal {
    let id: Int
//    let index: Int
    let imageName: String
    var pile: Int
    var isCompleted: Bool
}

struct Block {
    let id: Int
    let imageName: String
    var pile: Int // começa com 1
    var isSelected: Bool
}


enum BlockColors {
    case red
    case blue
    case green
    case yellow
}
