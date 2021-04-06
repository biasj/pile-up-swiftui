//
//  BlockView.swift
//  PileUp
//
//  Created by Beatriz Sato on 06/04/21.
//

import SwiftUI

struct BlockView: View {
    var block: Block
    
    var body: some View {
        ZStack {
//            Image("shadow")
//                .resizable().scaledToFit()
//            
            // mudar só essa imagem?
            if(!block.isSelected){
                Image(block.imageName)
//                    .resizable().scaledToFit()
            }
            
            // adicionar pileView
            
        }
    }
}

struct GoalView: View {
    var goal: Goal
    
    var body: some View {
        Image(goal.imageName)
//            .resizable().scaledToFit()
    }
}



struct BlockView_Previews: PreviewProvider {
    static var previews: some View {
        BlockView(block: Block(id: 1, imageName: "redBlock", pile: 1, isSelected: false))
            .previewDisplayName("iPad Pro")
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}


struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView(goal: Goal(id: 1, imageName: "redGoal", pile: 1, isCompleted: false))
            .previewDisplayName("iPad Pro")
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
