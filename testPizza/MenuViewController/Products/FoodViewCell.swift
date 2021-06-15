//
//  ProductsCell.swift
//  testPizza
//
//  Created by Павел Заруцков on 13.05.2021.
//

import UIKit

class FoodViewCell: UITableViewCell {
    
    // MARK: - Properties

    let productImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        image.contentMode = .scaleToFill
        image.sizeToFit()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layoutIfNeeded()
        return image
    }()
    
    let productName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let productDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .grayColor
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let productPriceButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.redColor.cgColor
        button.clipsToBounds = true
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layoutIfNeeded()
        return button
    }()
    
    let productPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .redColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Constraints

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(contentView)
        contentView.addSubview(productName)
        contentView.addSubview(productImage)
        contentView.addSubview(productDescription)
        contentView.addSubview(productPriceButton)
        productPriceButton.addSubview(productPriceLabel)

        productName.snp.makeConstraints() {
            $0.top.equalTo(25)
            $0.right.equalTo(-10)
            $0.height.equalTo(20)
        }
                
        productImage.snp.makeConstraints() {
            $0.top.equalTo(25)
            $0.left.equalTo(10)
            $0.right.equalTo(productName.snp.left).offset(-10)
            $0.height.equalTo(120)
            $0.width.equalTo(120)
            $0.bottom.lessThanOrEqualTo(-25)
        }
                
        productDescription.snp.makeConstraints() {
            $0.top.equalTo(productName.snp.bottom).offset(5)
            $0.right.equalTo(-20)
            $0.left.equalTo(productImage.snp.right).offset(10)
            $0.bottom.equalTo(productPriceButton.snp.top).offset(-10)
        }
                
        productPriceButton.snp.makeConstraints() {
            $0.top.equalTo(productDescription.snp.bottom).offset(10)
            $0.right.equalTo(-20)
            $0.height.equalTo(30)
            $0.width.equalTo(65)
            $0.bottom.equalTo(-20)
        }
                
        productPriceLabel.snp.makeConstraints() {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
