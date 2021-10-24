//
//  NewDeckVC.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 16/06/2021.
//

import UIKit
import Reusable
import Defaults

class NewDeckVC: UIViewController, StoryboardBased {

    @IBOutlet weak var deckTitleTextField: UITextField!
    @IBOutlet weak var cardLabel: UILabel!
    
    var cards = [Card]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
    }
    
    private func configureNavigation() {
        navigationController?.title = "Create Deck"
        let closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeButtonTapped))
        navigationItem.leftBarButtonItem = closeButton
    }
    
    @IBAction func addCardsButtonTapped(_ sender: UIButton) {
        let destination = NewCardVC.instantiate()
        destination.delegate = self
        self.navigationController?.pushViewController(destination, animated: true)
    }
    
    @IBAction func doneButtonTapped() {
        let deck = CardDeck(title: deckTitleTextField.text ?? "Test Deck",
                            cards: cards,
                            coverEmoji: "🍕")
        var deckList = Defaults[.decksList]
        deckList.append(deck)
        Defaults[.decksList] = deckList
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func closeButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension NewDeckVC: NewCardVCDelegate {
    func cardCreated(card: Card) {
        cards.append(card)
        cardLabel.text = "\(card.emoji ?? "")" + " " + card.title
    }
    
}
