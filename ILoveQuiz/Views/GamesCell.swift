//
//  GamesCell.swift
//  ILoveQuiz
//
//  Created by Dmitriy S. Kuznetsov on 02/09/2019.
//  Copyright © 2019 Dmitriy S. Kuznetsov. All rights reserved.
//

import UIKit

let gamesModel = GameModel(client: ILoveQuizClient())

class GamesCell: UICollectionViewCell, UICollectionViewDelegate {
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //        gamesModel.showLoading = {
        //            if gamesModel.isLoading {
        //                //self.activityIndicator.startAnimating()
        //                self.collectionView.alpha = 0.0
        //            } else {
        //                //self.activityIndicator.stopAnimating()
        //                self.collectionView.alpha = 1.0
        //            }
        //        }
        gamesModel.showError = { error in
            print(error)
        }
        
        gamesModel.reloadData = {
            self.collectionView.reloadData()
        }
        gamesModel.fetchGames()
        setup()
    }
    
    func setup() {
        backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 0.88)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        collectionView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(GameCell.self, forCellWithReuseIdentifier: "gameCellId")
        collectionView.showsHorizontalScrollIndicator = false
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented ")
    }
    
}

extension GamesCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(gamesModel.games.count)
        return gamesModel.games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gameCellId", for: indexPath) as! GameCell
        cell.titleLabel.text = gamesModel.games[indexPath.row].title!
        cell.timeLabel.text = taskDateFormat(gamesModel.games[indexPath.row].date!)
        if (gamesModel.games[indexPath.row].is_registration_available) {
            cell.registerButton.backgroundColor = .red
            cell.registerButton.setTitleColor(.white, for: .normal)
        } else {
            cell.registerButton.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 0.88)
            cell.registerButton.setTitleColor(.red, for: .normal)
            cell.registerButton.isEnabled = false
        }
        
        return cell
    }
}

extension GamesCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 240, height: frame.height - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
}
