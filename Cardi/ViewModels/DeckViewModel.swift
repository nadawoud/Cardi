//
//  DeckViewModel.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 29/09/2021.
//

import Foundation
import Combine
import UIKit

class DeckViewModel {
    let deck: CardDeck
    var filteredCards: [Card] {
        cards.filter { $0.correctlyAnswered != true }
    }
    
    let cards: [Card]
    
    @Published var currentProgress: Float = 0.0
    
    var currentCardIndex = 0
    
    init(deck: CardDeck) {
        cards = deck.cards.shuffled()
        cards.filter { $0.correctlyAnswered != true }.forEach { $0.correctlyAnswered = nil }
        
        self.deck = deck
    }
    
    private func updateProgressBar() {
        currentProgress = Float(deck.cards.filter { $0.correctlyAnswered ?? false }.count) / Float(deck.cards.count)
    }
    
    func answer(card: Card, correctly: Bool) {
        card.correctlyAnswered = correctly
        
        updateProgressBar()
    }
    
    func calculateCurrentCardIndex(x: CGFloat, width: CGFloat) {
        currentCardIndex = Int((x / width).rounded())
    }
}
