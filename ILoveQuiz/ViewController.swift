//
//  ViewController.swift
//  ILoveQuiz
//
//  Created by Dmitriy S. Kuznetsov on 02/09/2019.
//  Copyright © 2019 Dmitriy S. Kuznetsov. All rights reserved.
//

import UIKit

let ratingsModel = RatingModel(client: ILoveQuizClient())

var refreshControl: UIRefreshControl!

class ViewController: UIViewController {
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        collectionView.register(GamesCell.self, forCellWithReuseIdentifier: "gamesCellId")
        collectionView.register(RatingCell.self, forCellWithReuseIdentifier: "ratingCellId")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        ratingsModel.showError = { error in
            print(error)
        }
        
        ratingsModel.reloadData = {
            self.collectionView.reloadData()
            //self.activityIndicatorView.stopAnimating()
            //self.collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        }
        
        ratingsModel.fetchRatings()
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        
        navigationItem.title = "I ❤️ QZ!"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = UIColor(red: 63/255, green: 81/255, blue: 181/255, alpha: 0)
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        if section == 1 { return ratingsModel.ratings.count }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ratingCellId", for: indexPath) as! RatingCell
            cell.titleLabel.text = ratingsModel.ratings[indexPath.row].team
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gamesCellId", for: indexPath) as! GamesCell
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: (view.frame.width) - 16, height: 50)
        }
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 1 {
            return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
        }
        return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
    }
    
}

