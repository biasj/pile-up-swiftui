//
//  BoardView.swift
//  PileUp
//
//  Created by Beatriz Sato on 06/04/21.
//

import SwiftUI


struct BoardView: View {
    
    @ObservedObject var puzzle : PuzzleGame
        
    private let columns: [GridItem] = Array(repeating: .init(.fixed(160), spacing: 12), count: 4)
    
    var body: some View {
        ZStack {
            // grid background
//            RoundedRectangle(cornerRadius: 10).frame(width: 750, height: 450, alignment: .center).foregroundColor(.gray)

//            LazyVGrid(columns: columns, spacing: 22) {
//                ForEach(0..<puzzle.board.blocks.count) { i in
//                    ZStack {
//                        Image("shadow").resizable().frame(width: 150, height: 75, alignment: .center)
//                        if puzzle.board.shouldPlaceGoal(index: i) {
//                            GoalView(goal: puzzle.board.goals[puzzle.board.getGoalIndex(of: i)])
//                        }
//                    }
//                }
//
//            }

            // board grid 4x4
            LazyVGrid(columns: columns, spacing: 22) {
                    ForEach(0..<puzzle.board.blocks.count) { i in
                            BlockView(block: puzzle.board.blocks[i])
                    } // block padding
            }
            
            
        }.padding() // whole board padding
        
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(puzzle: PuzzleGame())           
    }
}
