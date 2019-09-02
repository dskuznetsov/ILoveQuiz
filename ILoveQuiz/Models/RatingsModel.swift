//
//  RatingsModel.swift
//  ILoveQuiz
//
//  Created by Dmitriy S. Kuznetsov on 02/09/2019.
//  Copyright © 2019 Dmitriy S. Kuznetsov. All rights reserved.
//

import UIKit

class RatingModel {
    // MARK: Properties
    private let client: APIClient
    var ratings: Ratings = []
    
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
    
    func fetchRatings() {
        if let client = client as? ILoveQuizClient {
            self.isLoading = true
            let endpoint = ILoveQuizEndpoint.rating
            client.fetchRating(with: endpoint) { (either) in
                switch either {
                case .success(let ratings):
                    self.ratings = ratings
                    self.isLoading = false
                    self.reloadData?()
                case .error(let error):
                    self.showError?(error)
                }
            }
        }
    }
}

