//
//  ContentView.swift
//  Memorize
//
//  Created by Tao Xu on 1/15/25.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    private let aspectRatio: CGFloat =  2/3
    var body: some View {
        VStack {
            cards
                .animation(.default, value: viewModel.cards)
                .padding()
                .background(.gray)
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }.background(Color.red)
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio){ card in
            CardView(card: card)
                .padding(4)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
        .foregroundColor(viewModel.color)
    }
}


#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
