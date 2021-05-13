//
//  MenuView.swift
//  testPizza
//
//  Created by Павел Заруцков on 13.05.2021.
//

import UIKit

class MenuView: UIView {
    
    lazy var bannerView: BannerView = {
        let bn = BannerView()
        bn.translatesAutoresizingMaskIntoConstraints = false
        return bn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bannerView)
        
        bannerView.snp.makeConstraints() {
            $0.top.equalTo(76)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(112)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
