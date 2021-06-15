//
//  Extentions.swift
//  testPizza
//
//  Created by Павел Заруцков on 11.05.2021.
//

import UIKit

// MARK: - extension UIImageView

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

// MARK: - extension UIView

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

// MARK: - extension UIColor

extension UIColor {
    static func color(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1 ) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    
    static let redColor = UIColor.color(red: 253, green: 58, blue: 105)
    static let grayColor = UIColor.color(red: 195, green: 196, blue: 201)
    static let lightGrayColor = UIColor.color(red: 243, green: 245, blue: 249)
}

// MARK: - extension setSelected

func setSelected(_ isSelected: Bool, label: UILabel) {
    if isSelected {
        label.layer.borderColor = UIColor.color(red: 253, green: 58, blue: 105, alpha: 0.1).cgColor
        label.backgroundColor = UIColor.color(red: 253, green: 58, blue: 105, alpha: 0.2)
    } else {
        label.layer.borderColor = UIColor.red.cgColor
        label.backgroundColor = .clear
    }
}

