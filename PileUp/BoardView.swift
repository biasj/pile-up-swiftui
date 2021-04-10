//
//  BoardView.swift
//  PileUp
//
//  Created by Beatriz Sato on 06/04/21.
//

import SwiftUI


struct BoardView: View {
    
    @EnvironmentObject var puzzle : PuzzleGame
    @State var blockFrames = [CGRect](repeating: .zero, count: 16)
    
    private let columns: [GridItem] = Array(repeating: .init(.fixed(160), spacing: 12), count: 4)
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { puzzle.newGame() }, label: {
                    Text("New Game")
                })
                
                Button(action: { puzzle.resetGame() }, label: {
                    Text("Restart")
                })
            }
            
            
            // board
            ZStack {
                // grid background
                RoundedRectangle(cornerRadius: 10).frame(width: 750, height: 450, alignment: .center).foregroundColor(.gray)

                // grid background (shadow and goals)
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(0..<puzzle.getBlocks().count) { i in
                        ZStack {
                            // placeholder to assure the grids are going to be the same size
                            RoundedRectangle(cornerRadius: 10).frame(width: 164, height: 88, alignment: .center).foregroundColor(Color.clear)
                            
                            Image("shadow").resizable().frame(width: 150, height: 75, alignment: .center)
                            
                            if puzzle.shouldPlaceGoal(index: i) {
                                let goalIndex = puzzle.getGoalIndex(index: i)
                                GoalView(goal: puzzle.getGoals()[goalIndex])
                            }
                            
                        }.overlay(
                            // tracks where the block has been dropped
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
                    ForEach(0..<puzzle.getBlocks().count) { i in
                        BlockView(block: puzzle.getBlock(of: i), onChanged: self.blockMoved, onEnded: self.blockDropped)
                    }
                }
                
            }.padding()
        }
        
        
        
        

    }
    
    
    // MARK: Gesture methods
    
    // shows where it's possible to drop a block
    func blockMoved(location: CGPoint, block: Block) -> DragState {
        if let match = blockFrames.firstIndex(where: { $0.contains(location)}) {
            // check if the drop zone is the neighbor
            if match == block.index {
                return .unknown
            } else if puzzle.isNeighbor(block: block, index: match) && !puzzle.isBlockDisabled(at: match) {
                return .good
            } else {
                return .bad
            }
            
            // if it's anything else
           
        } else {
            return .unknown
        }
    }
    
    
    func blockDropped(location: CGPoint,from blockIndex: Int, block: Block) {
        // the position of where it was dropped on
        if let dropIndex = blockFrames.firstIndex(where: {$0.contains(location)} ) {
    
            if puzzle.shouldDropBlock(at: dropIndex, block: block){
                // if they have the same images, pile
                if puzzle.haveSameImages(at: dropIndex, block: block) {
                    // disables block that was dragged
                    puzzle.disable(at: blockIndex)
                    puzzle.pile(at: dropIndex, from: block)                    
                    
                } else {
                    // swap block and puzzle.dropIndex
                    puzzle.swap(from: block, to: dropIndex)
                    print("block index: \(puzzle.getBlocks()[dropIndex].index)")
                    print("should be index: \(dropIndex)")
                    print("should be index: \(block.index)")
                }
            }
        }
        
        print("fim de jogo \(puzzle.checkVictory())")
    }
}
