//
//  Extension+Style.swift
//  PileUp
//
//  Created by Beatriz Sato on 11/04/21.
//

import SwiftUI


extension View {
    func textStyle() -> some View {
        self
            .font(.system(size: 24, weight: .bold, design: .rounded))
            .frame(width: 300, height: 80, alignment: .center).foregroundColor(.white)
            .background(Color.gray)
            .cornerRadius(10)
    }
}
