//
//  ILoveQuizClient.swift
//  ILoveQuiz
//
//  Created by Dmitriy S. Kuznetsov on 02/09/2019.
//  Copyright © 2019 Dmitriy S. Kuznetsov. All rights reserved.
//

import Foundation

class ILoveQuizClient: APIClient {
    static let baseUrl = "https://ilovequiz.ru"
    
    func fetchGames(with endpoint: ILoveQuizEndpoint, completion: @escaping (Either<Games>) -> Void) {
        let request = endpoint.request
        get(with: request, completion: completion)
    }
    
    func fetchRating(with endpoint: ILoveQuizEndpoint, completion: @escaping (Either<Ratings>) -> Void) {
        let request = endpoint.request
        get(with: request, completion: completion)
    }
}
