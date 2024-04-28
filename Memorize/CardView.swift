//
//  CardView.swift
//  Memorize
//
//  Created by Felipe Prestes on 28/04/24.
//

import SwiftUI

typealias Card = CardView.Card

struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    let card: Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .multilineTextAlignment(.center)
                    .padding(5)
                    .aspectRatio(contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

#Preview {
    VStack {
        HStack {
            CardView(Card(id: "test1", isFaceUp: true, content: "X"))
                .aspectRatio(4/3, contentMode: .fit)
            CardView(Card(id: "test1", content: "X"))
        }
        HStack {
            CardView(Card(id: "test1", isFaceUp: true, content: "This is a very long string "))
            CardView(Card(id: "test1", content: "X"))
        }
    }
    .padding()
    .foregroundColor(.blue)
}
