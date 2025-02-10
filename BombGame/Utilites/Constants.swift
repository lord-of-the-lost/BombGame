//
//  Constants.swift
//  BombGame
//
//  Created by Anna Melekhina on 09.02.2025.
//

import Foundation

struct GameModel {
    let categories: [CategoryModel]
}

struct CategoryModel {
    let category: Category
    let questions: [String]
}

enum Category: String, CaseIterable {
    case sports = "Спорт и хобби"
    case other = "О разном"
    case life = "Про жизнь"
    case celebs = "Знаменитости"
    case art = "Искусство и кино"
    case nature = "Природа"
}

let questions: [Category: [String]] = [
    .sports: [
        "Назовите вид зимнего спорта",
        "Назовите спортивную игру с мячом",
        "Назовите имя любого спортсмена"
    ]
    ]


