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
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    private var searchController = UISearchController(searchResultsController: nil)
    private lazy var dataSource = createDataSource()
    private var emojiCategories = [EmojiCategory]()
    private var filteredEmojiCategories = [EmojiCategory]()
    private var isSearching = false
    
    weak var delegate: EmojiPickerDelegate?
    
    // MARK: - Value Types
    typealias DataSource = UICollectionViewDiffableDataSource<EmojiCategory, Emoji>
    typealias Snapshot = NSDiffableDataSourceSnapshot<EmojiCategory, Emoji>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let emojiCategories = getEmojisFromJSONFile(withName: "emoji") else { return }
        self.emojiCategories = emojiCategories
        configureSearchController()
        updateData(on: self.emojiCategories)
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
    
    func createDataSource() -> DataSource {
        let dataSource = DataSource(
            collectionView: collectionView,
            cellProvider: { (collectionView, indexPath, emoji) -> UICollectionViewCell? in
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmojiCell.reuseID, for: indexPath) as? EmojiCell
                cell?.emojiLabel.text = emoji.emoji
                return cell
            })
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            guard kind == UICollectionView.elementKindSectionHeader else {
                return nil
            }
            let section = self.dataSource.snapshot().sectionIdentifiers[indexPath.section]
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: EmojiSectionHeaderView.reuseID, for: indexPath) as? EmojiSectionHeaderView
            view?.headerLabel.text = section.title
            return view
        }
        return dataSource
    }
    
    func updateData(on emojiCategories: [EmojiCategory]) {
        var snapshot = Snapshot()
        snapshot.appendSections(emojiCategories)
        for category in emojiCategories {
            snapshot.appendItems(category.emojis, toSection: category)
        }
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}


extension EmojiPickerVC:  UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchPhrase = searchController.searchBar.text, !searchPhrase.isEmpty else { return }
        isSearching = true
        
        filteredEmojiCategories = emojiCategories.filter { category in
            var matches = category.title.lowercased().contains(searchPhrase.lowercased())
            for emoji in category.emojis {
                if emoji.keywords.contains(searchPhrase.lowercased()) {
                matches = true
                break
              }
            }
            return matches
          }
        updateData(on: filteredEmojiCategories)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        updateData(on: emojiCategories)
    }
    
    func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search emojis"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationController?.navigationBar.isHidden = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
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
        let activeArray = isSearching ? filteredEmojiCategories : emojiCategories
        let emoji = activeArray[indexPath.section].emojis[indexPath.item]
        delegate?.didPickEmoji(emoji.emoji)
        dismiss(animated: true)
    }
}
