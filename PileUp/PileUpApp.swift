//
//  PileUpApp.swift
//  PileUp
//
//  Created by Beatriz Sato on 04/04/21.
//

import SwiftUI

@main
struct PileUpApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(PuzzleGame())
        }
    }
}
