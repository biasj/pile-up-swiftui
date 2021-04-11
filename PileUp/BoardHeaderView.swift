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
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.gray)
                .frame(width: 300, height: 180, alignment: .center)
            
    
            // board header (score, buttons help, new game, end game, reset game
            VStack(spacing: 20) {
                HStack(spacing: 20) {
                    Button("Help") {
                        print("HELP")
                    }.buttonStyle(GameButtonStyle())
                    
                    Button("New Game"){
                        puzzle.newGame()
                    }.buttonStyle(GameButtonStyle())
                }.scaledToFill()
                
                HStack(spacing: 20) {
                    Button("Restart") {
                        puzzle.resetGame()
                    }.buttonStyle(GameButtonStyle())

                    
                    Button("End Game"){
                        puzzle.endGame()
                    }.buttonStyle(GameButtonStyle())
                }.scaledToFill()
            }
            
        }.scaledToFill()
        .background(Color.blue)
    }
}

struct GameButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
             .frame(width: 200, height: 80, alignment: .center)
            
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundColor(.white)
            .cornerRadius(10)
    }
    
}

struct BoardHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        BoardHeaderView()
    }
}
