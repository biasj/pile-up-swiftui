//
//  ContentView.swift
//  PileUp
//
//  Created by Beatriz Sato on 04/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var puzzle: PuzzleGame
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Pile Up!")
                ZStack {
//                    GoalView(goal: Goal(id: 1, index: 0, imageName: "redGoal", pile: 1, isCompleted: false))
//                    BlockView(block: Block(id: 1, imageName: "redBlock", index: 1, pile: 1, isDisabled: false))
                }

                NavigationLink(destination: BoardView(puzzle: _puzzle)){
                    Text("play!")
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(PuzzleGame())
            .previewDisplayName("iPad Pro")
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
