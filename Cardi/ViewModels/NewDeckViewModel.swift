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
    
    @Published var deck: CardDeck?
    
    init(deck: CardDeck? = nil) {
        self.deck = deck
    }
    
    func addCard(_ card: Card) {
        if deck == nil {
            deck = CardDeck(title: "", cards: [Card](), coverEmoji: "😀")
        }
        deck!.cards.append(card)
    }
    
    func saveDeck(title: String, coverEmoji: String?) {
        if deck == nil {
            deck = CardDeck(title: title, cards: [Card](), coverEmoji: coverEmoji)
        }
        deck!.title = title
        deck!.coverEmoji = coverEmoji
        var deckList = Defaults[.decksList]
        deckList.append(deck!)
        Defaults[.decksList] = deckList
    }
}
