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
      // Take cards we don't know yet, and shuffle them
      filteredCards = cards.filter { $0.correctlyAnswered != true }.shuffled()

      // Mark the cards as needing to be answered
      filteredCards.forEach { $0.correctlyAnswered = nil }
    }
}
