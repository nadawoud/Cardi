//
//  ViewController.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 23/03/2021.
//

import UIKit
import Reusable

class DeckVC: UIViewController, Reusable, StoryboardBased {
    
    var deck: CardDeck?
    var numberOfCardsAnsweredCorrectly = 0
    var currentCardIndex = 0
    
    @IBOutlet private var collectionView: UICollectionView!
    @IBOutlet private var endOfDeckView: UIView!
    @IBOutlet private var scoreLabel: UILabel!
    @IBOutlet private var progressBar: UIProgressView!
    @IBOutlet private var gotItButton: UIButton!
    @IBOutlet private var notQuiteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deck?.shuffle()
        configureLayout()
    }
    
    private func configureLayout() {
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, environment) -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
            
            let collectionViewWidth = environment.container.contentSize.width
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(collectionViewWidth * 0.93), heightDimension: .fractionalHeight(1))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            
            // Add leading and trailing insets to the section so groups are aligned to the center
            let sectionSideInset = (collectionViewWidth - groupSize.widthDimension.dimension) / 2
            section.contentInsets = .init(top: 0, leading: sectionSideInset, bottom: 0, trailing: sectionSideInset)
            section.orthogonalScrollingBehavior = .groupPaging
            
            
            //TODO: Does this belong here?
            
            // Detect horizontal scrolling and find out current Card's index
            section.visibleItemsInvalidationHandler = { visibleItems, point, environment in
                self?.currentCardIndex = Int((point.x / environment.container.contentSize.width).rounded())
            }
            
            return section
        }
    }
    
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}

extension DeckVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return deck?.filteredCards.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: CardCell.self)
        cell.setup(card: deck?.filteredCards[indexPath.item] ?? Card(title: "???"))
        return cell
    }
}
