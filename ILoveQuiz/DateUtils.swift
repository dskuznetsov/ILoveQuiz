//
//  DateUtils.swift
//  ILoveQuiz
//
//  Created by Dmitriy S. Kuznetsov on 02/09/2019.
//  Copyright © 2019 Dmitriy S. Kuznetsov. All rights reserved.
//

import Foundation

func taskDateFormat(_ string: String) -> String {
    
    let dateFormatter = ISO8601DateFormatter()
    let stringDate = dateFormatter.date(from: string)
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm dd MMMM"
    formatter.locale = Locale(identifier: "ru_RU")
    
    return formatter.string(from: stringDate!)
}
