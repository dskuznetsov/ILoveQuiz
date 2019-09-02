//
//  Endpoint.swift
//  ILoveQuiz
//
//  Created by Dmitriy S. Kuznetsov on 02/09/2019.
//  Copyright © 2019 Dmitriy S. Kuznetsov. All rights reserved.
//

import Foundation

protocol Endpoint {
    var baseUrl: String { get }
    var path: String { get }
}

extension Endpoint {
    var urlComponent: URLComponents {
        var urlComponent = URLComponents(string: baseUrl)
        urlComponent?.path = path
        
        return urlComponent!
    }
    
    var request: URLRequest {
        print(urlComponent.url!)
        return URLRequest(url: urlComponent.url!)
    }
}

enum ILoveQuizEndpoint: Endpoint {
    case games
    case rating
    
    var baseUrl: String {
        return ILoveQuizClient.baseUrl
    }
    
    var path: String {
        switch self {
        case .games:
            return "/api/games"
        case .rating:
            return "/api/rating"
        }
    }
    
}
