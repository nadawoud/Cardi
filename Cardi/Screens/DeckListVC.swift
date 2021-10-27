//
//  DeckListVC.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 31/05/2021.
//

import UIKit
import Defaults
import Combine

class DeckListVC: UIViewController {
    
    let viewModel = DeckListViewModel()
    private var subscriptions = Set<AnyCancellable>()
    
    @IBOutlet private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        setupBindings()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    private func setupBindings() {
        viewModel.$decks.sink { [weak self] decks in
            self?.collectionView.reloadData()
        }.store(in: &subscriptions)
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
    
    @IBAction func addNewDeck(_ sender: UIBarButtonItem) {
        let destination = NewDeckVC.instantiate()
        self.navigationController?.pushViewController(destination, animated: true)
    }
}


extension DeckListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.decks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: DeckCell.self)
        cell.setup(deck: viewModel.decks[indexPath.item])
        return cell
    }
}


extension DeckListVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let deck = viewModel.decks[indexPath.item]
        let destination = DeckVC.instantiate()
        destination.deck = deck
        let navController = UINavigationController(rootViewController: destination)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true)
    }
}
