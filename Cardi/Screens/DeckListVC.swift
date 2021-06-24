//
//  DeckListVC.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 31/05/2021.
//

import UIKit

class DeckListVC: UIViewController {
    
    private var decks = CardDeck.mockDeckList

    @IBOutlet private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }
    
    private func configureLayout() {
        collectionView.collectionViewLayout = {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 2.5, leading: 2.5, bottom: 2.5, trailing: 2.5)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.35))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            
          return UICollectionViewCompositionalLayout(section: section)
        }()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      guard
        segue.identifier == "showCards",
        let deckCell = sender as? DeckCell,
        let deckVC = segue.destination as? DeckVC,
        let deck = deckCell.deck
      else {
        return
      }

        deckVC.deck = deck
    }
    
    @IBAction func addNewDeck(_ sender: UIBarButtonItem) {
        let destination = NewDeckVC.instantiate()
        let navController = UINavigationController(rootViewController: destination)
//        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true)
    }
}


extension DeckListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return decks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: DeckCell.self)
        cell.setup(deck: decks[indexPath.item])
        return cell
    }
}


extension DeckListVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let deck = decks[indexPath.item]
        let destination = DeckVC.instantiate()
        destination.deck = deck
        let navController = UINavigationController(rootViewController: destination)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true)
    }
}
