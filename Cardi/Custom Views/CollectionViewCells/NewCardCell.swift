//
//  NewCardCell.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 24/10/2021.
//

import UIKit
import Reusable

class NewCardCell: UICollectionViewCell, Reusable {

    static let reuseID = "NewCardCell"
    
    @IBOutlet private var cardFrontView: CardFrontView!
    
    private var card: Card?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(card: Card) {
        self.card = card
        cardFrontView.setup(card: card)
    }
}
