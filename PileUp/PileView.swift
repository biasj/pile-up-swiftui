//
//  PileView.swift
//  PileUp
//
//  Created by Beatriz Sato on 09/04/21.
//

import SwiftUI

// little dots on the blocks that indicates how many blocks are piled up
struct PileView: View {
    var block: Block
    @EnvironmentObject var puzzle: PuzzleGame
    
    let columns: [GridItem] = Array(repeating: .init(.fixed(10), spacing: 5), count: 2)
        
    var body: some View {
        
        LazyVGrid(columns: columns) {
            ForEach(0..<(puzzle.getBlocks()[block.index].pile), id: \.self) { _ in
                Circle().frame(width: 10, height: 10, alignment: .center)
            }.foregroundColor(.white)
        }
    }
}
