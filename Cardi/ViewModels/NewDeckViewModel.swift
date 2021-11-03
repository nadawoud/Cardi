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
    
    @Published var cards = [Card]()
    
    func addCard(_ card: Card) {
        cards.append(card)
    }
    
    func saveDeck(title: String) {
        let deck = CardDeck(title: title,
                            cards: cards,
                            coverEmoji: "🍕")
        var deckList = Defaults[.decksList]
        deckList.append(deck)
        Defaults[.decksList] = deckList
    }
}
