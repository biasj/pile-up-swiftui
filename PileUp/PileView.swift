//
//  PileView.swift
//  PileUp
//
//  Created by Beatriz Sato on 09/04/21.
//

import SwiftUI

struct PileView: View {
    @State var pile: Int
    
    let columns: [GridItem] = Array(repeating: .init(.fixed(10), spacing: 5), count: 2)
    
    var body: some View {
        
        LazyVGrid(columns: columns) {
            ForEach(1..<pile+2) { _ in
                Circle().frame(width: 10, height: 10, alignment: .center)
            }.foregroundColor(.white)
        }
    }
}
//
//struct PileView_Previews: PreviewProvider {
//    static var previews: some View {
//        PileView(pile: 4)
//    }
//}
