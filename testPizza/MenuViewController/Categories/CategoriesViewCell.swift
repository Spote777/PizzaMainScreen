//
//  CategoriesViewCell.swift
//  testPizza
//
//  Created by Павел Заруцков on 13.05.2021.
//

import UIKit

class CategoriesViewCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            setSelected(isSelected)
        }
    }
    
    private let сategoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Пицца"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .redColor
        label.textAlignment = .center
        label.layer.borderWidth = 0.5
        label.layer.cornerRadius = 15
        label.layer.borderColor = UIColor.redColor.cgColor
        label.clipsToBounds = true
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(contentView)
        contentView.addSubview(сategoryLabel)
        сategoryLabel.snp.makeConstraints() {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(33)
            $0.width.equalTo(10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSelected(_ isSelected: Bool) {
        if isSelected {
            сategoryLabel.layer.borderColor = UIColor.color(red: 253, green: 58, blue: 105, alpha: 0.1).cgColor
            сategoryLabel.backgroundColor = UIColor.color(red: 253, green: 58, blue: 105, alpha: 0.2)
        } else {
            сategoryLabel.layer.borderColor = UIColor.red.cgColor
            сategoryLabel.backgroundColor = .clear
        }
    }
    
}
