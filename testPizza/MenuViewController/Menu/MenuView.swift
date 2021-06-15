//
//  MenuView.swift
//  testPizza
//
//  Created by Павел Заруцков on 13.05.2021.
//

import UIKit

class MenuView: UIView {
    
    // MARK: - Properties

    lazy var bannerView: BannerView = {
        let bv = BannerView()
        bv.translatesAutoresizingMaskIntoConstraints = false
        return bv
    }()
    
    lazy var categoriesView: CategoriesView = {
        let cv = CategoriesView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    lazy var productsView: FoodView = {
        let pv = FoodView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        return pv
    }()
    
    // MARK: - Constraints

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGrayColor
        
        addSubview(bannerView)
        addSubview(categoriesView)
        addSubview(productsView)
        
        bannerView.snp.makeConstraints() {
            $0.top.equalTo(76)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(112)
        }
        
        categoriesView.snp.makeConstraints() {
            $0.top.equalTo(bannerView.snp.bottom).offset(24)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.width.equalTo(88)
            $0.height.equalTo(32)
        }
        
        productsView.snp.makeConstraints() {
            $0.top.equalTo(categoriesView.snp.bottom).offset(24)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
