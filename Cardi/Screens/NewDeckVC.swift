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
import FittedSheets

class NewDeckVC: UIViewController, StoryboardBased {
    
    var viewModel = NewDeckViewModel()
    private var subscriptions = Set<AnyCancellable>()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var deckTitleTextField: UITextField!
    @IBOutlet weak var emojiLabel: UILabel! {
        didSet {
            let tap = UITapGestureRecognizer(target: self, action: #selector(emojiLabelTapped))
            emojiLabel.addGestureRecognizer(tap)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDeck()
        configureNavigation()
        configureLayout()
        
        viewModel.$deck.sink { [weak self] _ in
            self?.collectionView.reloadData()
        }.store(in: &subscriptions)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    private func setupDeck() {
        emojiLabel.text = viewModel.deck?.coverEmoji ?? "😀"
        deckTitleTextField.text = viewModel.deck?.title
    }
    
    private func configureNavigation() {
        navigationItem.title = viewModel.deck == nil ? "Create Card" : "Edit Card"
        navigationController?.navigationBar.prefersLargeTitles = false
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
        let emoji = emojiLabel.text
        if let deck = viewModel.deck {
            deck.title = title
            deck.coverEmoji = emoji
        } else {
            viewModel.saveDeck(title: title, coverEmoji: emoji)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func closeButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func emojiLabelTapped() {
        let emojiPicker = EmojiPickerVC.instantiate()
        emojiPicker.delegate = self
        let sheetSizes: [SheetSize] = [.percent(0.4), .percent(0.95)]
        let sheetVC = SheetViewController(controller: emojiPicker, sizes: sheetSizes)
        present(sheetVC, animated: true)
    }
}

extension NewDeckVC: NewCardVCDelegate {
    func cardCreated(card: Card) {
        viewModel.addCard(card)
    }
    
    func cardEdited(card: Card) {
        collectionView.reloadData()
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
        let count = viewModel.deck?.cards.count ?? 0
        return count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == viewModel.deck?.cards.count {
            let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: AddCardCell.self)
            cell.delegate = self
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: NewCardCell.self)
            cell.setup(card: viewModel.deck?.cards[indexPath.item] ?? Card(title: ""))
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO: Open EditCardVC
        let destination = NewCardVC.instantiate()
        destination.delegate = self
        destination.card = viewModel.deck?.cards[indexPath.item]
        self.navigationController?.pushViewController(destination, animated: true)
    }
}


extension NewDeckVC: EmojiPickerDelegate {
    func didPickEmoji(_ emoji: String) {
        emojiLabel.text = emoji
    }
}
