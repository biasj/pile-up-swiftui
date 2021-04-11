//
//  PuzzleView.swift
//  PileUp
//
//  Created by Beatriz Sato on 11/04/21.
//

import SwiftUI

struct PuzzleView: View {
    @EnvironmentObject var puzzle: PuzzleGame
    
    var body: some View {
        VStack(spacing: 20) {
            BoardHeaderView(puzzle: _puzzle)
            BoardView(puzzle: _puzzle)
        }
        
        
    }
}

struct PuzzleView_Previews: PreviewProvider {
    static var previews: some View {
        PuzzleView()
    }
}
