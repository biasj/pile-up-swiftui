//
//  ContentView.swift
//  PileUp
//
//  Created by Beatriz Sato on 04/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            GoalView(goal: Goal(id: 1, imageName: "redGoal", pile: 1, isCompleted: false))
            BlockView(block: Block(id: 1, imageName: "redBlock", pile: 1, isSelected: false))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDisplayName("iPad Pro")
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
