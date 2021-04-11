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
        
        self.blocks = generateBlocks()
        self.goals = generateGoals()
        
        blocks.shuffle()
        setBlockIndexes()
    }
    
    // MARK: - Logic
    mutating func disableBlock(at index: Int) {
        blocks[index].isDisabled = true
    }
    
    mutating func pileBlock(at index: Int,from block: Block) {
        blocks[index].pile += block.pile
        print("pile: \(blocks[index].pile)")
    }
    
    // checks if block isn't being dropped on itself or on a disabled block
    func shouldDropBlock(at index: Int, block: Block) -> Bool {
        return index != block.index && !blocks[index].isDisabled
    }
    
    func haveSameImages(at index: Int, block: Block) -> Bool {
        return blocks[index].imageName == block.imageName
    }
    
    func isDisabled(index: Int) -> Bool {
        return blocks[index].isDisabled
    }
    
    // checks if block can be dropped at the specified
    func isNeighbor(block: Block,to index: Int) -> Bool {
        switch block.index {
        // middle blocks
        case 5, 6, 9, 10, 1, 2, 13, 14:
            return abs(index - block.index) == 1 || abs(index - block.index) == 4
        // right column
        case 3, 7, 11, 15:
            return block.index - index == 1 || abs(index - block.index) == 4
        // left column
        case 0, 4, 8, 12:
            return index - block.index == 1 || abs(index - block.index) == 4
        default:
            return false
        }
    }
    
    mutating func swapBlocks(from block: Block, to index: Int) {
        // find block at array
        let firstIndex = findBlockIndex(block: block)
        
        blocks.swapAt(firstIndex, index)
        
        // update indexes
        blocks[firstIndex].index = firstIndex
        blocks[index].index = index
    }
    
    // NÃO DEVERIA CHECAR "VITÓRIA", DEVERIA SOMAR PONTOS
//    func checkVictory() -> Bool {
//        var completedBlocks = 0
//        
//        for block in blocks {
//            if !block.isDisabled && block.pile == 4 && block.color == goals[getGoalIndex(of: block.index)].blockColor {
//                completedBlocks += 1
//                // impedir de mexer bloco depois de fechar????? porque tá dando erro de index
//            }
//        }
//        
//        return completedBlocks == 4
//    }
    
    // MARK: - Access
    func getGoals() -> [Goal] {
        return goals
    }
    
    func getBlocks() -> [Block] {
        return blocks
    }
    
    func getBlock(of index: Int) -> Block {
        return blocks[index]
    }

    
    func findBlockIndex(block: Block) -> Int {
        return blocks.firstIndex(where: { $0.id == block.id } ) ?? -1
    }

    
    func getGoalIndex(of index: Int) -> Int {
        return goals.firstIndex(where: { $0.index == index} ) ?? -1
    }
    
    // MARK: initialization methods -> deveriam estar no puzzle game?
    // generates 4 blocks of each color (red, blue, yellow, green)
    func generateBlocks() -> [Block] {
        var blocks = [Block]()
        blocks += generateColor(imageName: "redBlock", blockColor: BlockColor.red, from: 0, until: 4)
        blocks += generateColor(imageName: "blueBlock", blockColor: BlockColor.blue, from: 4, until: 8)
        blocks += generateColor(imageName: "yellowBlock", blockColor: BlockColor.yellow, from: 8, until: 12)
        blocks += generateColor(imageName: "greenBlock", blockColor: BlockColor.green, from: 12, until: 16)
        
        return blocks
    }
    
    // generates 4 blocks with the specified color
    func generateColor(imageName: String, blockColor: BlockColor, from initial: Int, until end: Int) -> [Block] {
        var blocks = [Block]()
        for i in initial..<end {
            let block = Block(id: i, imageName: imageName, index: i, color: blockColor)
            blocks.append(block)
        }
        
        return blocks
    }
    
    // generate 1 goal of each color, at with random indexes
    func generateGoals() -> [Goal] {
        var goals = [Goal]()
        let indexes:[Int] = generateRandomIndexes()
        
        // the id of each goal is the same as the first id of each block color
        goals.append(Goal(id: 0, index: indexes[0], imageName: "redGoal", blockColor: BlockColor.red))
        goals.append(Goal(id: 4, index: indexes[1], imageName: "blueGoal", blockColor: BlockColor.blue))
        goals.append(Goal(id: 8, index: indexes[2], imageName: "yellowGoal", blockColor: BlockColor.yellow))
        goals.append(Goal(id: 12, index: indexes[3], imageName: "greenGoal", blockColor: BlockColor.green))
        
        return goals
    }
    
    // generates 4 numbers from 0..<16 that don't repeat to be the indexes of the goals to be placed at the board game
    func generateRandomIndexes() -> [Int] {
        var indexes = [Int]()
        
        for _ in 0..<4 {
            var index = Int.random(in: 0..<16)
            
            // to make sure that the indexes won't repeat
            while indexes.contains(index) {
                index = Int.random(in: 0..<16)
            }
            
            indexes.append(index)
        }
    
        return indexes
    }

    mutating func setBlockIndexes() {
        for i in 0..<blocks.count {
            blocks[i].index = i
        }
    }
    
    
    // goal view initialization
    func shouldPlaceGoal(index: Int) -> Bool {
        for goal in goals {
            if index == goal.index {
                return true
            }
        }
        return false
    }
}



