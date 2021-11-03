//
//  NewDeckVC.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 16/06/2021.
//

import UIKit
import Reusable
import Defaults
import Combine

class NewDeckVC: UIViewController, StoryboardBased {
    
    let viewModel = NewDeckViewModel()
    private var subscriptions = Set<AnyCancellable>()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var deckTitleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        configureLayout()
        
        viewModel.$cards.sink { [weak self] _ in
            self?.collectionView.reloadData()
        }.store(in: &subscriptions)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    private func configureNavigation() {
        navigationController?.title = "Create Deck"
        let closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeButtonTapped))
        navigationItem.leftBarButtonItem = closeButton
    }
    
    private func configureLayout() {
        collectionView.collectionViewLayout = {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6), heightDimension: .fractionalHeight(1))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .groupPaging
            
            return UICollectionViewCompositionalLayout(section: section)
        }()
    }
    
    @IBAction func addCardsButtonTapped(_ sender: UIButton) {
        let destination = NewCardVC.instantiate()
        destination.delegate = self
        self.navigationController?.pushViewController(destination, animated: true)
    }
    
    @IBAction func doneButtonTapped() {
        let title = deckTitleTextField.text ?? "Test Deck"
        viewModel.saveDeck(title: title)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func closeButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension NewDeckVC: NewCardVCDelegate {
    func cardCreated(card: Card) {
        viewModel.addCard(card)
    }
    
}

extension NewDeckVC: AddCardCellDelegate {
    func didTapAddButton() {
        let destination = NewCardVC.instantiate()
        destination.delegate = self
        self.navigationController?.pushViewController(destination, animated: true)
    }
    
}

extension NewDeckVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cards.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == viewModel.cards.count {
            let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: AddCardCell.self)
            cell.delegate = self
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: NewCardCell.self)
            cell.setup(card: viewModel.cards[indexPath.item])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO: Open EditCardVC
        let destination = NewCardVC.instantiate()
        destination.delegate = self
        self.navigationController?.pushViewController(destination, animated: true)
    }
    
}
