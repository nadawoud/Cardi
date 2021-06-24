//
//  DeckCell.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 01/06/2021.
//

import UIKit
import Reusable

class DeckCell: UICollectionViewCell, Reusable {
    
    static let reuseID = "DeckCell"
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var emojiLabel: UILabel!
    
    var deck: CardDeck?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(deck: CardDeck) {
        self.deck = deck
        titleLabel.text = deck.title
        emojiLabel.text = deck.coverEmoji
    }
}

