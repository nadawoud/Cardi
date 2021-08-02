//
//  CardDeck.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 24/03/2021.
//

import Foundation

struct CardDeck {
    var title: String
    var cards: [Card]
    var filteredCards: [Card] = []
    var coverEmoji: String?
    
    mutating func shuffle() {
      filteredCards = cards.shuffled()
      filteredCards.forEach { $0.correctlyAnswered = nil }
    }
}
