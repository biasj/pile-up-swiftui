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
         
            // Button group
            VStack(spacing: 20) {
                // top row
                HStack(spacing: 20) {
                    // Best Score View
                    VStack(spacing: 0) {
                        Text("High Score:")
                        Text("\(puzzle.getHighScore())")
                        
                    }
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .frame(width: 300, height: 80, alignment: .center).foregroundColor(.white)
                    .background(Color.gray)
                    .cornerRadius(10)
                    
                    Button("Help") {
                        print("HELP")
                    }
                    
                    Button("New Game"){
                        puzzle.newGame()
                    }
                }
                
                // bottom row
                HStack(spacing: 20) {
        
                    // Score View
                    VStack(spacing: 0) {
                        Text("Score:")
                        Text("\(puzzle.getPoints())")
                        
                    }
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .frame(width: 300, height: 80, alignment: .center).foregroundColor(.white)
                    .background(Color.gray)
                    .cornerRadius(10)
                
                    // butons
                    Button("Restart") {
                        puzzle.resetGame()
                    }

                    Button("End Game"){
                        puzzle.endGame()
                    }
                }
            }.buttonStyle(GameButtonStyle())
            
            
            
        }.scaledToFill()
        .font(.system(size: 30, weight: .bold, design: .rounded))
        
    }
}

struct GameButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
             .frame(width: 200, height: 80, alignment: .center)
            .background(configuration.isPressed ? Color(red: 0.7, green: 0, blue: 0).opacity(0.5) : Color(red: 0.7, green: 0, blue: 0))
            .foregroundColor(.white)
            .cornerRadius(10)
    }
    
}

struct BoardHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        BoardHeaderView().environmentObject(PuzzleGame())
    }
}
