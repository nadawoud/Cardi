//
//  EmojiCell.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 01/12/2021.
//

import UIKit

class EmojiCell: UICollectionViewCell {
    static let reuseID = String(describing: EmojiCell.self)
      
    @IBOutlet weak var emojiLabel: UILabel!
    
    var isEditing: Bool = false
    
//    override var isSelected: Bool {
//      didSet {
//        if isEditing {
//          contentView.backgroundColor = isSelected ? UIColor.systemRed.withAlphaComponent(0.5) : UIColor.systemGroupedBackground
//        } else {
//          contentView.backgroundColor = UIColor.systemGroupedBackground
//        }
//      }
//    }
}
