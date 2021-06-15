//
//  ContentView.swift
//  PileUp
//
//  Created by Beatriz Sato on 04/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var puzzle: PuzzleGame
    
    public init() { }
    
    public var body: some View {
        PuzzleView().environmentObject(puzzle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(PuzzleGame())
            .previewDisplayName("iPad Pro")
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
