//
//  GameModel.swift
//  ILoveQuiz
//
//  Created by Dmitriy S. Kuznetsov on 02/09/2019.
//  Copyright © 2019 Dmitriy S. Kuznetsov. All rights reserved.
//

import UIKit

class GameModel {
    // MARK: Properties
    private let client: APIClient
    var games: Games = []
    
    // MARK: UI
    var isLoading: Bool = false {
        didSet {
            showLoading?()
        }
    }
    var showLoading: (() -> Void)?
    var reloadData: (() -> Void)?
    var showError: ((Error) -> Void)?
    
    init(client: APIClient) {
        self.client = client
    }
    
    func fetchGames() {
        if let client = client as? ILoveQuizClient {
            self.isLoading = true
            let endpoint = ILoveQuizEndpoint.games
            client.fetchGames(with: endpoint) { (either) in
                switch either {
                case .success(let games):
                    self.games = games
                    self.isLoading = false
                    self.reloadData?()
                case .error(let error):
                    self.showError?(error)
                }
            }
        }
    }
}

