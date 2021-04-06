//
//  BoardView.swift
//  PileUp
//
//  Created by Beatriz Sato on 06/04/21.
//

import SwiftUI

struct BoardView: View {
    var body: some View {
        ZStack {
            GoalView(goal: Goal(id: 1, imageName: "redGoal", pile: 1, isCompleted: false))
            BlockView(block: Block(id: 1, imageName: "redBlock", pile: 1, isSelected: false))
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
