//
//  AddCardCell.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 24/10/2021.
//

import UIKit
import Reusable

protocol AddCardCellDelegate: AnyObject {
    func didTapAddButton()
}

class AddCardCell: UICollectionViewCell, Reusable {
    
    weak var delegate: AddCardCellDelegate?
    
    @IBOutlet private var addButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    @IBAction func addCardButtonTapped(_ sender: UIButton) {
        delegate?.didTapAddButton()
    }
    
    func configure() {
        layer.borderWidth = 3
        layer.borderColor = UIColor.systemGray3.cgColor
        layer.cornerRadius = 25
    }
    
}
