//
//  BlockView.swift
//  PileUp
//
//  Created by Beatriz Sato on 06/04/21.
//

import SwiftUI

enum DragState {
    case unknown
    case good
    case bad
}


struct BlockView: View {
    var block: Block
    
    @State var dragAmount = CGSize.zero
    @State var dragState = DragState.unknown
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).frame(width: 164, height: 88, alignment: .center).foregroundColor(Color.clear)
            
            // mudar só essa imagem?
            if(!block.isSelected){
                Image(block.imageName)
                    .resizable().frame(width: 150, height: 75, alignment: .center)
            }
            
            // adicionar pileView
            
        }
        .offset(dragAmount)
        .zIndex(dragAmount == .zero ? 0 : 1)
        .shadow(color: dragColor, radius: dragAmount == .zero ? 0 : 10)
        // allows to drag the block aroung
        .gesture(DragGesture(coordinateSpace: .global)
                .onChanged {
                    // as the drag around the screen happens, it updates it
                    self.dragAmount = CGSize(width: $0.translation.width, height: $0.translation.height)
                }
             
                // when the view is released
                .onEnded { _ in
                    self.dragAmount = .zero
                }
        )
    }
    
    // define color based on DragState
    var dragColor: Color {
        switch dragState {
        case .unknown:
            return .black
            
        case .good:
            return .green
            
        case .bad:
            return .red
        }
    }
}

struct GoalView: View {
    var goal: Goal
    
    var body: some View {
        Image(goal.imageName)
            .resizable().frame(width: 164, height: 88, alignment: .center)
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
        GoalView(goal: Goal(id: 1, index: 0, imageName: "redGoal", pile: 1, isCompleted: false))
            .previewDisplayName("iPad Pro")
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
