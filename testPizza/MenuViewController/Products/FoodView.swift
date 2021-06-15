//
//  FoodView.swift
//  testPizza
//
//  Created by Павел Заруцков on 13.05.2021.
//

import UIKit

class FoodView: UIView {
    
    // MARK: - Properties

    let identifier = "productsCell"
    
    lazy var tableView : UITableView = {
        let tb = UITableView(frame: CGRect.zero, style: .plain)
        tb.register(FoodViewCell.self, forCellReuseIdentifier: identifier)
        tb.backgroundColor = .clear
        tb.rowHeight = UITableView.automaticDimension
        tb.separatorColor = UIColor.clear
        tb.tableFooterView = UIView()
        return tb
    }()
    
    // MARK: - Constraints

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(tableView)
        
        tableView.snp.makeConstraints() {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        tableView.showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
