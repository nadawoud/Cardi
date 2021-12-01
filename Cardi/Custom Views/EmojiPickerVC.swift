//
//  EmojiPickerVC.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 01/12/2021.
//

import UIKit

protocol EmojiPickerDelegate: AnyObject {
    func didPickEmoji(_ emoji: String)
}


class EmojiPickerVC: UIViewController {
    let emoji = Emoji.shared
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var toolbar: UIToolbar!
    
    weak var delegate: EmojiPickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureToolbar()
    }
    
    private func configureToolbar() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        toolbar.setItems([doneButton], animated: true)
    }
    
    @objc func doneButtonTapped() {
        dismiss(animated: true)
    }
}


extension EmojiPickerVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        emoji.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let category = emoji.sections[section]
        let emoji = self.emoji.data[category]
        
        return emoji?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let emojiCell = collectionView.dequeueReusableCell(withReuseIdentifier: "EmojiCell", for: indexPath) as! EmojiCell
        let category = emoji.sections[indexPath.section]
        let emoji = self.emoji.data[category]?[indexPath.item] ?? ""
        
        emojiCell.emojiLabel.text = emoji
        
        return emojiCell
    }
}


extension EmojiPickerVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxWidth = UIScreen.main.bounds.width
        let totalSpacing = 6.0 * 8.0
        
        let itemWidth = (maxWidth - totalSpacing) / 6.0
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
      if section == 0 {
        return UIEdgeInsets(top: 0, left: 0, bottom: 8 / 2, right: 0)
      } else {
        return UIEdgeInsets(top: 8 / 2, left: 0, bottom: 8 / 2, right: 0)
      }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let emoji = emoji.emoji(at: indexPath) else { return }
        delegate?.didPickEmoji(emoji)
        dismiss(animated: true)
    }
}
