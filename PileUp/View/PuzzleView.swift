//
//  PuzzleView.swift
//  PileUp
//
//  Created by Beatriz Sato on 11/04/21.
//

import SwiftUI

struct PuzzleView: View {
    @EnvironmentObject var puzzle: PuzzleGame
    
    public init() {}
    
    public var body: some View {
        VStack(spacing: 20) {
                BoardHeaderView()
                BoardView()
                    .coordinateSpace(name: "Board")
            }
    }
}


