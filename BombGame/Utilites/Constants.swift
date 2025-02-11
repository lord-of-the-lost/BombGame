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

let questionsByCategory: [Category: [String]] = [
    .sports: [
        "Назови зимний вид спорта?",
        "Какие бывают командные виды спорта?",
        "Какие спортивные игры проводят с мячом?",
        "Какие существуют лёгкоатлетические дисциплины?",
        "Какие виды борьбы ты знаешь?",
        "Какие есть ракеточные виды спорта?",
        "Какие водные виды спорта ты можешь назвать?",
        "Какие существуют экстремальные виды спорта?",
        "Какие олимпийские виды спорта ты знаешь?",
        "Какие существуют игровые виды спорта?",
        "Какие виды спорта включают бег?",
        "Какие виды спорта проводят на льду?",
        "Какие бывают единоборства?",
        "Какие виды спорта можно назвать летними?",
        "Какие моторные виды спорта ты знаешь?"
    ],
    .life: [
        "Какие привычки полезны для здоровья?",
        "Какие бывают профессии?",
        "Назови бренд шоколадок"
    ]
 ]

enum Sounds {
    enum Theme: String {
        case one = "themeOne"
    }
    
    enum Counter: String {
        case one = "counterOne"
    }
    
    enum Boom: String {
        case one = "boomOne"
    }
}
