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
    func selectBlock(block: Block) {
        board.selectBlock(block: block)
    }
    
    
    // MARK: - Model access
    
}
