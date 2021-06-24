//
//  ViewController.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 23/03/2021.
//

import UIKit

class DeckVC: UIViewController {
    
    private var deck = CardDeck(
        title: "Essen",
        cards: [
            Card(title: "Der Apfel", description: "Masculine Nomen", backTitle: "The Apple", emoji: "🍎"),
            Card(title: "Die Banana", description: "Feminin Nomen", backTitle: "The Banana", emoji: "🍌"),
            Card(title: "Das Ei", description: "Neutral Nomen", backTitle: "The Egg", emoji: "🥚"),
            Card(title: "Die Pizza", description: "Feminin Nomen", backTitle: "The Pizza", emoji: "🍕"),
            Card(title: "Der Pfeffer", description: "Masculine Nomen", backTitle: "The Pepper", emoji: "🫑"),
            Card(title: "Das Brot", description: "Neutral Nomen", backTitle: "The Bread", emoji: "🍞"),
        ],
        coverEmoji: "🍔"
    )
    
    @IBOutlet private var collectionView: UICollectionView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        deck.shuffle()
        configureLayout()
    }
    
    private func configureLayout() {
        collectionView.collectionViewLayout = {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .paging
            
          return UICollectionViewCompositionalLayout(section: section)
        }()
    }
    
}

extension DeckVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return deck.cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: CardCell.self)
        cell.setup(card: deck.cards[indexPath.item])
        return cell
    }
}
