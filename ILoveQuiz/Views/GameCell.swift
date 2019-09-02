//
//  GameCell.swift
//  ILoveQuiz
//
//  Created by Dmitriy S. Kuznetsov on 02/09/2019.
//  Copyright © 2019 Dmitriy S. Kuznetsov. All rights reserved.
//

import UIKit

class GameCell: UICollectionViewCell {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Time"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Регистрация", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        button.layer.cornerRadius = 5
        return button
    }()
    
    let divider: UILabel = {
        let view = UILabel()
        view.frame = CGRect(x: 20, y: 130, width: 200, height: 1)
        view.layer.backgroundColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1).cgColor
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(titleLabel)
        addSubview(timeLabel)
        addSubview(registerButton)
        addSubview(divider)
        
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1).cgColor
        
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        registerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        registerButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented ")
    }
}
