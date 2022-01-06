//
//  EmojiPickerVC.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 01/12/2021.
//

import UIKit
import Reusable

protocol EmojiPickerDelegate: AnyObject {
    func didPickEmoji(_ emoji: String)
}


class EmojiPickerVC: UIViewController, StoryboardBased {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var emojiCategories = [EmojiCategory]()
    weak var delegate: EmojiPickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let emojiCategories = getEmojisFromJSONFile(withName: "emoji") else { return }
        self.emojiCategories = emojiCategories
    }
    
    private func getEmojisFromJSONFile(withName fileName: String) -> [EmojiCategory]? {
        let decoder = JSONDecoder()
        guard
            let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let emojiCategories = try? decoder.decode([EmojiCategory].self, from: data)
        else {
            return nil
        }
        return emojiCategories
    }
}


extension EmojiPickerVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        emojiCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let category = emojiCategories[section]
        let emojis = category.emojis
        
        return emojis.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let emojiCell = collectionView.dequeueReusableCell(withReuseIdentifier: "EmojiCell", for: indexPath) as! EmojiCell
        let category = emojiCategories[indexPath.section]
        let emoji = category.emojis[indexPath.item]
        
        emojiCell.emojiLabel.text = emoji.emoji
        
        return emojiCell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let emojiHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: EmojiSectionHeaderView.reuseID, for: indexPath) as! EmojiSectionHeaderView
        let category = emojiCategories[indexPath.section]
        emojiHeaderView.headerLabel.text = category.title
        return emojiHeaderView
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
        let emoji = emojiCategories[indexPath.section].emojis[indexPath.item].emoji
        delegate?.didPickEmoji(emoji)
        dismiss(animated: true)
    }
}
