//
//  BannerViewCell.swift
//  testPizza
//
//  Created by Павел Заруцков on 11.05.2021.
//

import UIKit

class BannerViewCell: UICollectionViewCell {
    
    private let bannerImage: UIImageView = {
        let image = UIImageView(image:#imageLiteral(resourceName: "banner2"))
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.sizeToFit()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(contentView)
        contentView.addSubview(bannerImage)
        
        bannerImage.snp.makeConstraints() {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.right.equalToSuperview()
            $0.height.equalTo(112)
            $0.width.equalTo(300)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
