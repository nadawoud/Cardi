//
//  CardFrontView.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 27/03/2021.
//

import UIKit

@IBDesignable
class CardFrontView: UIView {
    
    let nibName = "CardFrontView"
    var contentView: UIView?
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var emojiLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
        configure()
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

    func configure() {
        layer.borderWidth = 3
        layer.borderColor = UIColor.systemGray3.cgColor
        layer.cornerRadius = 25
    }

    func setup(card: Card) {
        titleLabel.text = card.title
        descriptionLabel.text = card.description
        emojiLabel.text = card.emoji
    }
}


