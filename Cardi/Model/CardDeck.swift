//
//  CardDeck.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 24/03/2021.
//

import Foundation
import Defaults

class CardDeck: Codable, Defaults.Serializable {
    var id: UUID
    var title: String
    var cards: [Card]
    var coverEmoji: String?
    
    init(title: String = "", cards: [Card] = [], coverEmoji: String? = nil) {
        self.id = UUID()
        self.title = title
        self.cards = cards
        self.coverEmoji = coverEmoji
    }
}

extension Defaults.Keys {
    static let decksList = Key<[CardDeck]>("decksList", default: CardDeck.mockDeckList)
}
