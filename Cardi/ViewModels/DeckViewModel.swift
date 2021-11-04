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
    var deck: CardDeck
    var filteredCards: [Card] {
        return deck.cards.filter { $0.correctlyAnswered != true }
    }
    
    var currentCardIndex = 0 {
        didSet {
            print("currentCardIndex: \(currentCardIndex)")
        }
    }
    
    @Published var currentProgress: Float = 0.0
    
    init(deck: CardDeck) {
        self.deck = deck
        self.deck.cards.shuffle()
        self.deck.cards.forEach { $0.correctlyAnswered = nil }
    }
    
    private func updateProgressBar() {
        currentProgress = Float(deck.cards.filter { $0.correctlyAnswered == true }.count) / Float(deck.cards.count)
    }
    
    func answer(correctly: Bool) {
        let card = filteredCards[currentCardIndex]
        card.correctlyAnswered = correctly
        updateProgressBar()
    }
    
    func calculateCurrentCardIndex(x: CGFloat, width: CGFloat) {
        print("x: \(x), width: \(width)")
        currentCardIndex = Int((x / width).rounded())
    }
}
