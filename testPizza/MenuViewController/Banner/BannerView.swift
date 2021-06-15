//
//  BannerView.swift
//  testPizza
//
//  Created by Павел Заруцков on 11.05.2021.
//

import UIKit
import SnapKit

class BannerView: UIView {
    
    // MARK: - Properties

    let identifier = "bannerCell"
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.register(BannerViewCell.self, forCellWithReuseIdentifier: identifier)
        cv.backgroundColor = .clear
        return cv
    }()
    
    // MARK: - Constraints

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints() {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
