//
//  BannerView.swift
//  testPizza
//
//  Created by Павел Заруцков on 11.05.2021.
//

import UIKit
import SnapKit

class BannerView: UIView {
    
    private let identifier = "bannerCell"
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(BannerViewCell.self, forCellWithReuseIdentifier: identifier)
        cv.backgroundColor = .clear
        return cv
    }()
    
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

extension BannerView: UICollectionViewDelegate,
                      UICollectionViewDataSource,
                      UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! BannerViewCell
        cell.backgroundColor = .white
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 112)
    }
}
