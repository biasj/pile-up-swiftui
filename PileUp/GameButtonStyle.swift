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
            .background(configuration.isPressed ? Color(.customGray).opacity(0.5) : Color(.customGray))
            .foregroundColor(.pink)
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.pink, lineWidth: 1))
    }
}
