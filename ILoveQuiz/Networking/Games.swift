//
//  Games.swift
//  ILoveQuiz
//
//  Created by Dmitriy S. Kuznetsov on 02/09/2019.
//  Copyright © 2019 Dmitriy S. Kuznetsov. All rights reserved.
//

import Foundation

typealias Seasons = [Season]

struct Season: Codable {
    let season: String?
    let games: Games
}

typealias Games = [Game]

struct Game: Codable {
    let is_registration_available: Bool
    let title, description, date: String?
}

