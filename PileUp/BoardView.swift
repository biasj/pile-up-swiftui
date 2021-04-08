//
//  BoardView.swift
//  PileUp
//
//  Created by Beatriz Sato on 06/04/21.
//

import SwiftUI


struct BoardView: View {
    
    @ObservedObject var puzzle : PuzzleGame
    @State var blockFrames = [CGRect](repeating: .zero, count: 16)
        
    private let columns: [GridItem] = Array(repeating: .init(.fixed(160), spacing: 12), count: 4)
    
    var body: some View {
        ZStack {
            // grid background
            RoundedRectangle(cornerRadius: 10).frame(width: 750, height: 450, alignment: .center).foregroundColor(.gray)

            // grid background (shadow and goals)
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(0..<puzzle.board.blocks.count) { i in
                    ZStack {
                        // placeholder to assure the grids are going to be the same size
                        RoundedRectangle(cornerRadius: 10).frame(width: 164, height: 88, alignment: .center).foregroundColor(Color.clear)
                        
                        Image("shadow").resizable().frame(width: 150, height: 75, alignment: .center)
                        
                        if puzzle.board.shouldPlaceGoal(index: i) {
                            GoalView(goal: puzzle.board.goals[puzzle.board.getGoalIndex(of: i)])
                        }
                        
                    }.overlay(
                        // to know where the block has been dropped
                        GeometryReader { geo in
                            Color.clear
                                .onAppear {
                                    self.blockFrames[i] = geo.frame(in: .global)
                                }
                        }
                    )
                }
            }
            

            // block grid 4x4
            LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(0..<puzzle.board.blocks.count) { i in
                        BlockView(block: puzzle.board.blocks[i], onChanged: self.blocksMoved)
                    } // block padding
            }
            
            
        }.padding() // whole board padding
        
    }
    
    // shows where it's possible to drop a block
    func blocksMoved(location: CGPoint, block: Block) -> DragState {
        if let match = blockFrames.firstIndex(where: { $0.contains(location)}) {
            // check if the drop zone is the neighbor 
            if puzzle.board.blocks[match].imageName == block.imageName {
                return .good
            } else {
                return .bad
            }
            
            // if it's anything else
           
        } else {
            return .unknown
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(puzzle: PuzzleGame())           
    }
}
