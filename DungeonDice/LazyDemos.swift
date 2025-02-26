//
//  LazyDemos.swift
//  DungeonDice
//
//  Created by Chris Wheeler on 2/26/25.
//

import SwiftUI

struct LazyDemos: View {
    @State private var columns = [
        GridItem(.fixed(110)),
        GridItem(.fixed(110)),
        GridItem(.fixed(110)),
//        GridItem(.flexible(maximum: 110)),
//        GridItem(.flexible(maximum: 110))
    ]
    var body: some View {
        ScrollView() {
            LazyVGrid(columns: columns) {
                ForEach(0..<1000) { i in
                    RedAndCyanView()
                        .onAppear {
                            let _ = print("View \(i)")
                        }
                }
            }
        }
        .padding()
    }
}

struct RedAndCyanView: View {
    var body: some View {
        ZStack {
            Color(.red)
            Rectangle()
                .fill(Color(.cyan))
                .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    LazyDemos()
}
