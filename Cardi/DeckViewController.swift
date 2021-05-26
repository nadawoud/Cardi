//
//  ViewController.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 23/03/2021.
//

import UIKit

class DeckViewController: UIViewController {
    
    private var deck = CardDeck(
        title: "Essen",
        cards: [
            Card(title: "Der Apfel", description: "Masculine Nomen", backTitle: "The Apple", emoji: "🍎"),
            Card(title: "Die Banana", description: "Feminin Nomen", backTitle: "The Banana", emoji: "🍌"),
            Card(title: "Das Ei", description: "Neutral Nomen", backTitle: "The Egg", emoji: "🥚"),
            Card(title: "Die Pizza", description: "Feminin Nomen", backTitle: "The Pizza", emoji: "🍕"),
            Card(title: "Der Pfeffer", description: "Masculine Nomen", backTitle: "The Pepper", emoji: "🫑"),
            Card(title: "Das Brot", description: "Neutral Nomen", backTitle: "The Bread", emoji: "🍞"),
        ],
        coverEmoji: "🍔"
    )
    
    @IBOutlet private var cardView: CardFrontView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardView.setup(card: Card(title: "Das Wasser", description: "Neutral Nomen", backTitle: "The Water", emoji: "💧"))
    }
}

