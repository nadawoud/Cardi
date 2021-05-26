//
//  CardCell.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 07/04/2021.
//

import UIKit

//class CardCell: UICollectionViewCell, Reusable {
//  @IBOutlet private var cardView: UIView!
//  @IBOutlet private var cardFrontView: CardFrontView!
//  @IBOutlet private var cardBackView: CardBackView!
//  @IBOutlet private var knownButton: UIButton!
//  @IBOutlet private var nowKnownButton: UIButton!
//
//  private var card: Card?
//  private var choiceMade: (() -> Void)?
//
//  override func awakeFromNib() {
//    super.awakeFromNib()
//
//    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(flip))
//    tapGestureRecognizer.numberOfTapsRequired = 1
//    cardView.addGestureRecognizer(tapGestureRecognizer)
//  }
//
//  func config(card: Card, choiceMade: @escaping () -> Void) {
//    self.card = card
//    self.choiceMade = choiceMade
//    cardFrontView.config(card: card)
//    cardBackView.config(card: card)
//
//    knownButton.isSelected = card.known == true
//    nowKnownButton.isSelected = card.known == false
//  }
//
//  @objc func flip() {
//    if cardFrontView.isHidden {
//      flipToFront()
//    } else {
//      flipToBack()
//    }
//  }
//
//  private func flipToBack() {
//    UIView.transition(from: cardFrontView, to: cardBackView, duration: 1.0, options: [.transitionFlipFromRight, .showHideTransitionViews])
//  }
//
//  private func flipToFront() {
//    UIView.transition(from: cardBackView, to: cardFrontView, duration: 1.0, options: [.transitionFlipFromLeft, .showHideTransitionViews])
//  }
//
//  @IBAction private func gotIt() {
//    card?.known = true
//    knownButton.isSelected = true
//    nowKnownButton.isSelected = false
//    choiceMade?()
//  }
//
//  @IBAction private func notYet() {
//    card?.known = false
//    knownButton.isSelected = false
//    nowKnownButton.isSelected = true
//    choiceMade?()
//  }
//
