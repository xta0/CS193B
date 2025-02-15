//
//  CardView.swift
//  Memorize
//
//  Created by Tao Xu on 2/4/25.
//

import SwiftUI

struct CardView: View {
    // props
    let card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12.0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 100))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
                
            }.opacity(card.isFaceUp  ? 1 : 0)
            
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}
