//
//  NewCard.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 08/09/2021.
//

import UIKit
import Reusable
import FittedSheets

protocol NewCardVCDelegate: AnyObject {
    func cardCreated(card: Card)
    func cardEdited(card: Card)
}

class NewCardVC: UIViewController, StoryboardBased {
    
    weak var delegate: NewCardVCDelegate?
    var card: Card?
    
    @IBOutlet weak var emojiLabel: UILabel! {
        didSet {
            let tap = UITapGestureRecognizer(target: self, action: #selector(emojiLabelTapped))
            emojiLabel.addGestureRecognizer(tap)
        }
    }
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
        emojiLabel.text = card?.emoji ?? "😀"
        cardTitleTextField.text = card?.title
        cardBackTitleTextField.text = card?.backTitle
        cardDescriptionTextField.text = card?.description
        cardBackDescriptionTextField.text = card?.backDescription
    }
    
    @IBAction func doneButtonTapped() {
        let title = cardTitleTextField.text ?? "Test Card"
        let backTitle = cardBackTitleTextField.text
        let description = cardDescriptionTextField.text
        let backDescription = cardBackDescriptionTextField.text
        let emoji = emojiLabel.text
        
        if let card = card {
            card.title = title
            card.backTitle = backTitle
            card.description = description
            card.backDescription = backDescription
            card.emoji = emoji
            delegate?.cardEdited(card: card)
        } else {
            let card = Card(title: title,
                            description: description,
                            backTitle: backTitle,
                            backDescription: backDescription,
                            emoji: emoji)
            
            delegate?.cardCreated(card: card)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @objc func closeButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc private func emojiLabelTapped() {
        let emojiPicker = EmojiPickerVC.instantiate()
        emojiPicker.delegate = self
        let sheetSizes: [SheetSize] = [.percent(0.4), .percent(0.95)]
        let sheetVC = SheetViewController(controller: emojiPicker, sizes: sheetSizes)
        present(sheetVC, animated: true)
    }
}

extension NewCardVC: EmojiPickerDelegate {
    func didPickEmoji(_ emoji: String) {
        emojiLabel.text = emoji
    }
}
