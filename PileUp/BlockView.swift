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


public struct BlockView: View {
    var block: Block // não deveria acessar o modelo, e sim o view model? o puzzle game?
    
    @EnvironmentObject var puzzle: PuzzleGame
    
    @State var dragAmount = CGSize.zero
    @State var dragState = DragState.unknown
    
    let columns: [GridItem] = Array(repeating: .init(.fixed(10), spacing: 5), count: 2)
    
    var onChanged: ((CGPoint, Block) -> DragState)?
    var onEnded: ((CGPoint, Int, Block) -> Void)?
    
    init(block: Block, onChanged: @escaping ((CGPoint, Block) -> DragState), onEnded: @escaping ((CGPoint, Int, Block) -> Void)) {
        self.block = block
        self.onEnded = onEnded
        self.onChanged = onChanged
    }
    
    public var body: some View {
        ZStack {
            // placeholder to assure the grids are going to be the same size
            RoundedRectangle(cornerRadius: 10).frame(width: 164, height: 88, alignment: .center).foregroundColor(Color.clear)
            
            // mudar só essa imagem?
            if(!puzzle.getBlocks()[block.index].isDisabled){
                Image(puzzle.getBlocks()[block.index].imageName)
                    .resizable().frame(width: 150, height: 75, alignment: .center)
                PileView(block: puzzle.getBlocks()[block.index])
            }
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
                    self.dragState = onChanged?($0.location, block) ?? .unknown
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
    
    // usar a mesma lógica do BoardView no onChanged e onEnded
    
    // função de mudar a trasn
}


