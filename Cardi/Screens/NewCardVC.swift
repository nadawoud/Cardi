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
//        addTapGesture()
    }
    
//    private func addTapGesture() {
//        let tap = UIGestureRecognizer(target: self, action: #selector(emojiLabelTapped))
//        emojiLabel.addGestureRecognizer(tap)
//    }
    
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

    @objc private func emojiLabelTapped() {
        print("emojiLabelTapped")
        guard let emojiPicker = storyboard?.instantiateViewController(withIdentifier: "EmojiPickerVC") as? EmojiPickerVC else { return }
        emojiPicker.delegate = self
        displayEmojiPicker(popController: emojiPicker, dismiss: true, sizes: [.fixed(280)])
    }
    
    func displayEmojiPicker(popController: UIViewController, dismiss: Bool, sizes: [SheetSize]) {
        let sheetVC = SheetViewController(controller: popController, sizes: sizes)
        sheetVC.hasBlurBackground = true
        sheetVC.dismissOnOverlayTap = dismiss
        sheetVC.treatPullBarAsClear = true
        present(sheetVC, animated: true)
    }
}

extension NewCardVC: EmojiPickerDelegate {
    func didPickEmoji(_ emoji: String) {
        emojiLabel.text = emoji
    }
}
