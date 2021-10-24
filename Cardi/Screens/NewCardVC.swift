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
}

class NewCardVC: UIViewController, StoryboardBased {
    
    weak var delegate: NewCardVCDelegate?
    
    @IBOutlet weak var cardTitleTextField: UITextField!
    @IBOutlet weak var cardBackTitleTextField: UITextField!
    @IBOutlet weak var cardDescriptionTextField: UITextField!
    @IBOutlet weak var cardBackDescriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
    }
    
    private func configureNavigation() {
        navigationController?.title = "Create Card"
        let closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeButtonTapped))
        navigationItem.leftBarButtonItem = closeButton
    }
    
    @IBAction func doneButtonTapped() {
        let card = Card(title: cardTitleTextField.text ?? "Test Card",
                        description: cardDescriptionTextField.text,
                        backTitle: cardBackTitleTextField.text,
                        backDescription: cardBackDescriptionTextField.text,
                        emoji: "🍋")
        
        delegate?.cardCreated(card: card)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func closeButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
