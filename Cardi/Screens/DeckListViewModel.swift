//
//  DeckListViewModel.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 29/09/2021.
//

import Foundation
import Defaults
import Combine

class DeckListViewModel {
    @Published private(set) var decks = Defaults[.decksList]
    
    private var observer: Defaults.Observation?
    
    
    init() {
        observer = Defaults.observe(.decksList) { [weak self] change in
            self?.decks = change.newValue
        }
    }
    
}
