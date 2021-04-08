//
//  BoardView.swift
//  PileUp
//
//  Created by Beatriz Sato on 06/04/21.
//

import SwiftUI

struct BoardView: View {
    
    @ObservedObject var puzzle : PuzzleGame
    
    private let columns: [GridItem] = Array(repeating: .init(.fixed(160), spacing: 10), count: 4)
    
    var body: some View {
        ZStack {
            // grid background
            RoundedRectangle(cornerRadius: 10).frame(width: 700, height: 450, alignment: .center).foregroundColor(.gray)
            
            
            // board grid 4x4
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(0..<puzzle.board.blocks.count) { i in
                    ZStack {
                        Image("shadow").resizable().frame(width: 150, height: 75, alignment: .center)
                        
                        // check if any GoalView should be placed at the current index
                        if puzzle.board.shouldPlaceGoal(index: i) {
                            GoalView(goal: puzzle.board.goals[puzzle.board.getGoalIndex(of: i)])
                        }
                        
                        // diminuir essa view para caber
                        BlockView(block: puzzle.board.blocks[i]).onTapGesture {
                            puzzle.selectBlock(block: puzzle.board.blocks[i])
                        }
                    }
                }.padding(5)
                
            }.padding()
            
        }.padding()
        
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(puzzle: PuzzleGame())           
    }
}
