//
//  GameButtonStyle.swift
//  PileUp
//
//  Created by Beatriz Sato on 11/04/21.
//

import SwiftUI

struct GameButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
             .frame(width: 200, height: 80, alignment: .center)
            .background(configuration.isPressed ? Color(red: 0.7, green: 0, blue: 0).opacity(0.5) : Color(red: 0.7, green: 0, blue: 0))
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
