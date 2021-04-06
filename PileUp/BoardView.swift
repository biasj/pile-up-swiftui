//
//  BoardView.swift
//  PileUp
//
//  Created by Beatriz Sato on 06/04/21.
//

import SwiftUI

struct BoardView: View {
    
    @ObservedObject var puzzle : PuzzleGame
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(puzzle.board.blocks) { block in
                ZStack {
                    Image("shadow").resizable().scaledToFit()
                    
                    BlockView(block: block).onTapGesture {
                        puzzle.selectBlock(block: block)
                    }
                }
            }
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(puzzle: PuzzleGame())           
    }
}
