//
//  ContentView.swift
//  Memorize
//
//  Created by Tao Xu on 1/15/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    var body: some View {
        if isFaceUp {
            ZStack {
                RoundedRectangle(cornerRadius: 12.0)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12.0)
                    .strokeBorder(lineWidth: 2)
                Text("Hello").font(.largeTitle)
            }
        } else {
            RoundedRectangle(cornerRadius: 12.0)
        }
    }
}

#Preview {
    ContentView()
}
