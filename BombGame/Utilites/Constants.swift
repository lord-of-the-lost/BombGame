//
//  Constants.swift
//  BombGame
//
//  Created by Anna Melekhina on 09.02.2025.
//

import UIKit

struct GameModel {
    let rules: [String]
    var categories: [CategoryModel]
    let punishments: [String]
    let settings: Settings
    
    struct CategoryModel {
        var isSelected: Bool
        let category: Category
        let questions: [String]
        
        
        enum Category: String, CaseIterable {
            case sports = "Спорт и хобби"
            case other = "О разном"
            case life = "Про жизнь"
            case celebs = "Знаменитости"
            case art = "Искусство и кино"
            case nature = "Природа"
            
            var image: UIImage {
                switch self {
                case .sports: UIImage(resource: ImageResource.sportsAndHobbies)
                case .other: UIImage(resource: ImageResource.others)
                case .life:  UIImage(resource: ImageResource.life)
                case .celebs: UIImage(resource: ImageResource.celebrities)
                case .art: UIImage(resource: ImageResource.artAndCinema)
                case .nature: UIImage(resource: ImageResource.nature)
                }
            }
        }
    }
    
    struct Settings {
        var gameTime: UInt
        var themeSound: Sounds.Theme
        var counterSound: Sounds.Counter
        var boomSound: Sounds.Boom
        var vibrationIsOn: Bool
        var withPunishments: Bool
        
        enum Sounds {
            enum Theme: String {
                case one = "themeOne"
                case two = "theme2"
                case three = "theme3"
            }
            
            enum Counter: String {
                case one = "counterOne"
                case two = "counterTwo"
                case three = "counterThree"
            }
            
            enum Boom: String {
                case one = "boomOne"
                case two = "boom2"
                case three = "boom3"
            }
        }
    }
}

let questionsByCategory: [GameModel.CategoryModel] = [
    GameModel.CategoryModel(
        isSelected: false,
        category: .sports,
        questions: [
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
        ]
    ),
    GameModel.CategoryModel(
        isSelected: false,
        category: .life,
        questions: [
            "Какие привычки полезны для здоровья?",
            "Какие бывают профессии?",
            "Назови бренд шоколадок"
        ]
    )
]

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

let rules: [String] = [
    "Все игроки становятся в круг.",
    "Первый игрок берет телефон и нажимает кнопку:",
    "На экране появляется вопрос \"Назовите Фрукт\".",
    "Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игроку.",
    "Игроки по кругу отвечают на один и тот же вопрос до тех пор, пока не взорвется бомба.",
    "Проигравшим считается тот, в чьих руках взорвалась бомба.",
    "Если выбран режим игры \"С Заданиями\", то проигравший выполняет задание."
]
