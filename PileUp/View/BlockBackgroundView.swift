//
//  BlockBackgroundView.swift
//  PileUp
//
//  Created by Beatriz Sato on 12/04/21.
//

import SwiftUI

// shadow image behind block and block border (goal) to indicate where to pile
public struct BlockBackgroundView: View {
    @EnvironmentObject var puzzle: PuzzleGame
    var i: Int
    
    init(i: Int) {
        self.i = i
    }
    
    public var body: some View {
        ZStack {
            // placeholder to assure the grids are going to be the same size
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 164, height: 88, alignment: .center)
                .foregroundColor(Color.clear)
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 150, height: 75, alignment: .center)
                .foregroundColor(Color.gray)
            
            if puzzle.shouldPlaceGoal(index: i) {
                let goalIndex = puzzle.getGoalIndex(index: i)
                GoalView(goal: puzzle.getGoals()[goalIndex])
            }
        }
    }
}
