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
            .frame(width: 300, height: 80, alignment: .center).foregroundColor(.pink)
            .background(Color.lightGray)
            .cornerRadius(10)
    }
}

extension Color {
    static let lightGray = Color(red: 235/255, green: 234/255, blue: 234/255)
    static let pink = Color(red: 240/255, green: 115/255, blue: 123/255)
}

extension UIColor {
    static let customGray = UIColor(red: 235/255, green: 234/255, blue: 234/255, alpha: 1)
    static let pink = UIColor(red: 240/255, green: 115/255, blue: 123/255, alpha: 1)
}
