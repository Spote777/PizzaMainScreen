//
//  MenuViewController.swift
//  testPizza
//
//  Created by Павел Заруцков on 11.05.2021.
//

import UIKit

class MenuViewController: UIViewController {
    
    // MARK: - Properties
    
    let menuView = MenuView()
    var items: PizzaResponse? = nil
    lazy var networkDataFetcher = NetworkDataFetcher()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        menuView.bannerView.collectionView.dataSource = self
        menuView.bannerView.collectionView.delegate = self
        menuView.categoriesView.collectionView.dataSource = self
        menuView.categoriesView.collectionView.delegate = self
        menuView.productsView.tableView.dataSource = self
        menuView.productsView.tableView.delegate = self
        
        networkDataFetcher.fetchData { [weak self] (result) in
            guard let result = result else { return }
            self?.items = result
            DispatchQueue.main.async {
                self?.menuView.bannerView.collectionView.reloadData()
                self?.menuView.categoriesView.collectionView.reloadData()
                self?.menuView.productsView.tableView.reloadData()
            }
        }
    }
    
    override func loadView() {
        super.loadView()
        view = menuView
    }
    
    // MARK: - Methods
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .lightGrayColor
        navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        navigationItem.leftBarButtonItem = .init(title: "Москва ∨", style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == menuView.bannerView.collectionView {
            return items?.banners?.count ?? 0
        } else {
            return items?.categories?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView ==  menuView.bannerView.collectionView {
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: menuView.bannerView.identifier, for: indexPath) as! BannerViewCell
            cellB.backgroundColor = .white
            let banners = items?.banners?[indexPath.row].image ?? ""
            if let imgUrl = URL(string: banners) {
                cellB.bannerImage.load(url: imgUrl)
            }
            return cellB
        } else {
            let cellC = collectionView.dequeueReusableCell(withReuseIdentifier: menuView.categoriesView.identifier, for: indexPath) as! CategoriesViewCell
            let categoris = items?.categories?[indexPath.row].name
            cellC.сategoryLabel.text = categoris
            return cellC
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == menuView.bannerView.collectionView {
            return CGSize(width: 300, height: 112)
        } else {
            return CGSize(width: 88, height: 32)
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items?.menu?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: menuView.productsView.identifier, for: indexPath) as! FoodViewCell
        cell.backgroundColor = .white
        
        let product = items?.menu?[indexPath.row]
        if let imageUrl = URL(string: product?.image ?? "") {
            cell.productImage.load(url: imageUrl)
        }
        cell.productName.text = product?.name
        cell.productDescription.text = product?.description
        cell.productPriceLabel.text = "от \(String(product?.priceFrom ?? 0)) ₽" 
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layoutIfNeeded()
    }
}

