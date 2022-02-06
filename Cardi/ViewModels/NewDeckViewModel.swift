//
//  NewDeckViewModel.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 20/10/2021.
//

import Foundation
import Defaults
import Combine

class NewDeckViewModel {
    
    @Published var deck: CardDeck
    
    init(deck: CardDeck) {
        self.deck = deck
    }
    
    func addCard(_ card: Card) {
        deck.cards.append(card)
    }
    
    func saveDeck() {
        var deckList = Defaults[.decksList]
        
        if let storedDeckIndex = deckList.firstIndex(where: { $0.id == deck.id }) {
            deckList[storedDeckIndex] = deck
        } else {
            deckList.append(deck)
        }
        
        Defaults[.decksList] = deckList
    }
}
