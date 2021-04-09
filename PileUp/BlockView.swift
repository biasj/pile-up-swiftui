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
    
    
    var onChanged: ((CGPoint, Block) -> DragState)?
    var onEnded: ((CGPoint, Int, Block) -> Void)?
    
    var body: some View {
        ZStack {
            // placeholder to assure the grids are going to be the same size
            RoundedRectangle(cornerRadius: 10).frame(width: 164, height: 88, alignment: .center).foregroundColor(Color.clear)
            
            // mudar só essa imagem?
            if(!block.isDisabled){
                Image(block.imageName)
                    .resizable().frame(width: 150, height: 75, alignment: .center)
            }
            
            // TODO: adicionar pileView
            
        }
        .offset(dragAmount)
        .zIndex(dragAmount == .zero ? 0 : 1)
        .shadow(color: dragColor, radius: dragAmount == .zero ? 0 : 10)
        .shadow(color: dragColor, radius: dragAmount == .zero ? 0 : 10)
        // allows to drag the block around
        .gesture(DragGesture(coordinateSpace: .global)
                .onChanged {
                    // as the drag around the screen happens, it updates it
                    self.dragAmount = CGSize(width: $0.translation.width, height: $0.translation.height)
                    self.dragState = onChanged?($0.location, self.block) ?? .unknown
                }
             
                // when the view is released
                .onEnded { 
                    if self.dragState == .good {
                        self.onEnded?($0.location, self.block.index, self.block)
                    }
                    
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
