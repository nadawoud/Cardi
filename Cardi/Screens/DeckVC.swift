//
//  ViewController.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 23/03/2021.
//

import UIKit
import Reusable

class DeckVC: UIViewController, Reusable, StoryboardSceneBased {
    static let sceneStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    var deck: CardDeck?
    
    @IBOutlet private var collectionView: UICollectionView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
//        deck?.shuffle()
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
    
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}

extension DeckVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return deck?.cards.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: CardCell.self)
        cell.setup(card: deck?.cards[indexPath.item] ?? Card(title: "Falsch"))
        return cell
    }
}
