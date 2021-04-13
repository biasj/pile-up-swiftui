//
//  BoardHeaderView.swift
//  PileUp
//
//  Created by Beatriz Sato on 11/04/21.
//

import SwiftUI


struct BoardHeaderView: View {
    @EnvironmentObject var puzzle: PuzzleGame
    
    var body: some View {
        // MARK: HEADER
        HStack(spacing: 25) {
         
            VStack(spacing: 20) {
                // top row
                HStack(spacing: 20) {
                    // Best Score View
                    VStack(spacing: 0) {
                        Text("Low Score:")
                        Text("\(puzzle.getHighScore())")
                    }.textStyle()
    
                    Button("Help", action: showHelp)
                    Button("New Game", action: newGame)
                }
                
                // bottom row
                HStack(spacing: 20) {
                    // Score View
                    VStack(spacing: 0) {
                        Text("Score:")
                        Text("\(puzzle.getPoints())")
                    }.textStyle()
                
                    Button("Restart", action: resetGame)
                    Button("End Game", action: endGame)
                }
                
            }.buttonStyle(GameButtonStyle())
            
        }.scaledToFill()
        .font(.system(size: 30, weight: .bold, design: .rounded))
        
    }
    
    func resetGame() {
        puzzle.resetGame()
    }
    
    func endGame() {
        puzzle.endGame()
    }
    
    func newGame() {
        puzzle.newGame()
    }
    
    func showHelp() {
        print("help")
    }
    
}



struct BoardHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        BoardHeaderView().environmentObject(PuzzleGame())
    }
}
