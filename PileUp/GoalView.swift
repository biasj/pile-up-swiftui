//
//  GoalView.swift
//  PileUp
//
//  Created by Beatriz Sato on 08/04/21.
//

import SwiftUI

struct GoalView: View {
    var goal: Goal
    
    var body: some View {
        Image(goal.imageName)
            .resizable().frame(width: 164, height: 88, alignment: .center)
    }
}
