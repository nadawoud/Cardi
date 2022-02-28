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
    
    @IBOutlet private var circleView: UIView!
    
    var deck: CardDeck?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        circleView.makeCircle()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleView.makeCircle()
    }
    
    func setup(deck: CardDeck) {
        self.deck = deck
        titleLabel.text = deck.title
        emojiLabel.text = deck.coverEmoji
    }
}

