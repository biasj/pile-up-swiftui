//
//  ContentView.swift
//  PileUp
//
//  Created by Beatriz Sato on 04/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Pile Up!")
                ZStack {
                    GoalView(goal: Goal(id: 1, imageName: "redGoal", pile: 1, isCompleted: false))
                    BlockView(block: Block(id: 1, imageName: "redBlock", pile: 1, isSelected: false))
                }

                NavigationLink(destination: BoardView(puzzle: PuzzleGame())){
                    Text("play!")
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())


//        
//        let columns: [GridItem] =
//                Array(repeating: .init(.flexible()), count: 2)
//        ScrollView {
//            LazyVGrid(columns: columns) {
//                ForEach((0...79), id: \.self) {
//                    let codepoint = $0 + 0x1f600
//                    let codepointString = String(format: "%02X", codepoint)
//                    Text("\(codepointString)")
//                    let emoji = String(Character(UnicodeScalar(codepoint)!))
//                    Text("\(emoji)")
//                }
//            }.font(.largeTitle)
//        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDisplayName("iPad Pro")
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
