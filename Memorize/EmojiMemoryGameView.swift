//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Felipe Prestes on 24/04/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    private let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        VStack {
            cards
                .animation(.default, value: viewModel.cards )
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(4)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
        .foregroundColor(Color.orange)
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
