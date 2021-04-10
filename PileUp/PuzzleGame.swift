//
//  PuzzleGame.swift
//  PileUp
//
//  Created by Beatriz Sato on 05/04/21.
//

import Foundation

class PuzzleGame: ObservableObject {
    @Published var board: Board = Board()
    
    // MARK: - User intents
    func disable(at index: Int) {
        board.disableBlock(at: index)
    }
    
    func pile(at index: Int, from block: Block) {
        board.pileBlock(at: index, from: block)
    }
    
    func swap(from block: Block, to index: Int) {
        board.swapBlocks(from: block, to: index)
    }
    
    // MARK: - Model access
    func getGoals() -> [Goal] {
        return board.getGoals()
    }
    
    func getBlocks() -> [Block] {
        return board.getBlocks()
    }
    
    func getBlock(of index: Int) -> Block {
        return board.getBlock(of: index)
    }
    
    func shouldPlaceGoal(index: Int) -> Bool {
        return board.shouldPlaceGoal(index: index)
    }
    
    func shouldDropBlock(at index: Int, block: Block) -> Bool {
        return board.shouldDropBlock(at: index, block: block)
    }
    
    func haveSameImages(at index: Int, block: Block) -> Bool {
        return board.haveSameImages(at: index, block: block)
    }
    
    func getGoalIndex(index: Int) -> Int {
        return board.getGoalIndex(of: index)
    }
    
    func isBlockDisabled(at index: Int) -> Bool{
        return board.isDisabled(index: index)
    }
    
    func isNeighbor(block: Block, index: Int) -> Bool {
        return board.isNeighbor(block: block, to: index)
    }
}
