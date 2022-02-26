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
        setupNavigationBarButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        collectionView.reloadData()
    }
    
    private func setupBindings() {
        viewModel.$decks.sink { [weak self] _ in
            self?.collectionView.reloadData()
        }.store(in: &subscriptions)
    }
    
    private func configureLayout() {
        collectionView.collectionViewLayout = {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.35))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            
          return UICollectionViewCompositionalLayout(section: section)
        }()
    }
    
    private func setupNavigationBarButtons() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewDeck))
        navigationItem.rightBarButtonItems = [addButton, editButtonItem]
    }
    
    @IBAction func addNewDeck(_ sender: UIBarButtonItem) {
        let destination = NewDeckVC.instantiate()
        destination.viewModel = .init(deck: .init())
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
        if isEditing {
            let destination = NewDeckVC.instantiate()
            destination.viewModel = NewDeckViewModel(deck: deck)
            self.navigationController?.pushViewController(destination, animated: true)
        } else {
            let destination = DeckVC.instantiate()
            destination.viewModel = DeckViewModel(deck: deck)
            let navController = UINavigationController(rootViewController: destination)
            navController.modalPresentationStyle = .fullScreen
            self.present(navController, animated: true)
        }
    }
}
