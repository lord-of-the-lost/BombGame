//
//  Constants.swift
//  BombGame
//
//  Created by Anna Melekhina on 09.02.2025.
//

import UIKit

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
    
    var image: UIImage {
        switch self {
        case .sports:
            return UIImage(resource: ImageResource.sportsAndHobbies)
        case .other:
            return UIImage(resource: ImageResource.others)
        case .life:
            return UIImage(resource: ImageResource.life)
        case .celebs:
            return UIImage(resource: ImageResource.celebrities)
        case .art:
            return UIImage(resource: ImageResource.artAndCinema)
        case .nature:
            return UIImage(resource: ImageResource.nature)
       
        }
    }
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

let punishments = [
    "В следующем раунде после каждого ответа хлопать в ладоши.",
    "В следующем раунде говорить шёпотом.",
    "В следующем раунде играть только одной рукой.",
    "В следующем раунде каждый раз перед ответом говорить 'О великий рандом…'.",
    "В следующем раунде после каждого ответа делать победный жест (например, поднимать руки вверх).",
    "В следующем раунде говорить только в вопросительной форме.",
    "В следующем раунде сидеть с закрытыми глазами.",
    "В следующем раунде каждый раз перед ответом вставать и приседать один раз.",
    "В следующем раунде разговаривать голосом робота.",
    "В следующем раунде после каждого ответа дотрагиваться до носа.",
    "В следующем раунде отвечать, глядя только в потолок.",
    "В следующем раунде все ответы говорить с серьёзным лицом, даже если это шутка."
    
]
