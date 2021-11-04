//
//  NewCard.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 08/09/2021.
//

import UIKit
import Reusable

protocol NewCardVCDelegate: AnyObject {
    func cardCreated(card: Card)
    func cardEdited(card: Card)
}

class NewCardVC: UIViewController, StoryboardBased {
    
    weak var delegate: NewCardVCDelegate?
    var card: Card?
    
    @IBOutlet weak var cardTitleTextField: UITextField!
    @IBOutlet weak var cardBackTitleTextField: UITextField!
    @IBOutlet weak var cardDescriptionTextField: UITextField!
    @IBOutlet weak var cardBackDescriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureNavigation()
    }
    
    private func configureNavigation() {
        navigationItem.title = card == nil ? "Create Card" : "Edit Card"
        let closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeButtonTapped))
        navigationItem.leftBarButtonItem = closeButton
    }
    
    private func configure() {
        cardTitleTextField.text = card?.title
        cardBackTitleTextField.text = card?.backTitle
        cardDescriptionTextField.text = card?.description
        cardBackDescriptionTextField.text = card?.backDescription
    }
    
    @IBAction func doneButtonTapped() {
        if let card = card {
            card.title = cardTitleTextField.text ?? "Test Card"
            card.backTitle = cardBackTitleTextField.text
            card.description = cardDescriptionTextField.text
            card.backDescription = cardBackDescriptionTextField.text
            delegate?.cardEdited(card: card)
        } else {
            let card = Card(title: cardTitleTextField.text ?? "Test Card",
                            description: cardDescriptionTextField.text,
                            backTitle: cardBackTitleTextField.text,
                            backDescription: cardBackDescriptionTextField.text,
                            emoji: "🍋")
            
            delegate?.cardCreated(card: card)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @objc func closeButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
