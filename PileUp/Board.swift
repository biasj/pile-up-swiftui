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
        
        // imagem do bloco deve ser gerado de forma aleatória dentro do laço, mas deve ter 4 blocos com cada cor
        blocks = generateBlocks()
        blocks.shuffle()
        setBlockIndexes()
        
        goals = generateGoals()
    }
    
    // MARK: - Logic
    mutating func disableBlock(at index: Int) {
        blocks[index].isDisabled = true
    }
    
    mutating func pileBlock(at index: Int,from block: Block) {
        if index != block.index && !block.isDisabled {
            blocks[index].pile += block.pile
        }
        print(blocks[index].pile)
    }
    
    func shouldDropBlock(at index: Int, block: Block) -> Bool {
        return index != block.index && !blocks[index].isDisabled
    }
    
    func haveSameImages(at index: Int, block: Block) -> Bool {
        return blocks[index].imageName == block.imageName
    }
    
    func isDisabled(index: Int) -> Bool {
        return blocks[index].isDisabled
    }

    
    func swapBlocks() {
        
    }
    
    func checkEnd() {
        
    }
    
    
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
        for i in 0..<blocks.count {
            if blocks[i].id == block.id {
                return i
            }
        }
        return -1
    }

    
    func getGoalIndex(of index: Int) -> Int {
        for i in 0..<goals.count {
            if index == goals[i].index {
                return i
            }
        }
        return -1
    }
    
    // MARK: initialization methods -> deveriam estar no puzzle game?
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
            let block = Block(id: i, imageName: imageName, index: i)
            blocks.append(block)
        }
        
        return blocks
    }
    
    // generate 1 goal of each color, at with random indexes 
    func generateGoals() -> [Goal] {
        var goals = [Goal]()
        let indexes:[Int] = generateRandomIndexes()
        
        // the id of each goal is the same as the first id of each block color
        goals.append(Goal(id: 0, index: indexes[0], imageName: "redGoal"))
        goals.append(Goal(id: 4, index: indexes[1], imageName: "blueGoal"))
        goals.append(Goal(id: 8, index: indexes[2], imageName: "yellowGoal"))
        goals.append(Goal(id: 12, index: indexes[3], imageName: "greenGoal"))
        
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



