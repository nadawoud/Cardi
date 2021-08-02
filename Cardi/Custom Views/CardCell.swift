//
//  CardCell.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 07/04/2021.
//

import UIKit
import Reusable

class CardCell: UICollectionViewCell, Reusable {
    
    static let reuseID = "CardCell"
    
    @IBOutlet private var cardView: UIView!
    @IBOutlet private var cardFrontView: CardFrontView!
    @IBOutlet private var cardBackView: CardBackView!
    
    private var card: Card?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        createFlipTapGesture()
    }
    
    func setup(card: Card) {
        self.card = card
        cardFrontView.isHidden = false
        cardBackView.isHidden = true
        cardFrontView.setup(card: card)
        cardBackView.setup(card: card)
    }
    
    func createFlipTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(flip))
        tap.numberOfTapsRequired = 1
        cardView.addGestureRecognizer(tap)
    }
    
    @objc func flip() {
        if cardFrontView.isHidden {
            flipToFront()
        } else {
            flipToBack()
        }
    }
    
    private func flipToBack() {
        UIView.transition(from: cardFrontView, to: cardBackView, duration: 1.0, options: [.transitionFlipFromRight, .showHideTransitionViews])
    }
    
    private func flipToFront() {
        UIView.transition(from: cardBackView, to: cardFrontView, duration: 1.0, options: [.transitionFlipFromLeft, .showHideTransitionViews])
    }
    
    func flipToFrontAndSwipe(completion: ((Bool) -> Void)? = nil) {
        if cardFrontView.isHidden {
            flipToFront()
        } else {
            completion?(true)
        }
    }
    
}
