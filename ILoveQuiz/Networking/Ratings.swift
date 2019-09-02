//
//  Ratings.swift
//  ILoveQuiz
//
//  Created by Dmitriy S. Kuznetsov on 02/09/2019.
//  Copyright © 2019 Dmitriy S. Kuznetsov. All rights reserved.
//

import Foundation

typealias Ratings = [Rating]

struct Rating: Codable {
    let title: String
}
