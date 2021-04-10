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
        
        LazyVGrid(columns: columns, spacing: 5) {
            ForEach(0..<(puzzle.getBlocks()[block.index].pile), id: \.self) { _ in
                
                switch block.color {
                case .red:
                    Circle().frame(width: 10, height: 10, alignment: .center).position(x: -50, y: -10)
                case .blue:
                    Circle().frame(width: 10, height: 10, alignment: .center).position(x: 60, y: -10)
                case .yellow:
                    Circle().frame(width: 10, height: 10, alignment: .center).position(x: -50, y: 20)
                case .green:
                    Circle().frame(width: 10, height: 10, alignment: .center).position(x: 60, y: 20)
                }
                
                
            }.foregroundColor(.white)
        }
    }
}
