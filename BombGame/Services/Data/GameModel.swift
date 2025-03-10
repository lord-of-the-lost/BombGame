//
//  GameModel.swift
//  BombGame
//
//  Created by Anna Melekhina on 09.02.2025.
//

import UIKit

struct GameModel {
    let rules: [String]
    var categories: [CategoryModel]
    let punishments: [String]
    var settings: Settings
    
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
        var gameTime: GameTime
        var themeSound: Sounds.Theme
        var counterSound: Sounds.Counter
        var boomSound: Sounds.Boom
        var vibrationIsOn: Bool
        var punishmentsIsOn: Bool
        
        enum GameTime {
            case short, middle, long, random
            
            var value: Int {
                switch self {
                case .short: 10
                case .middle: 20
                case .long: 45
                case .random: Int.random(in: 10...45)
                }
            }
        }
        
        enum Sounds {
            enum Theme: String, CaseIterable {
                case one = "themeOne"
                case two = "themeTwo"
                case three = "themeThree"
                
                var description: String {
                    switch self {
                    case .one: "Мелодия 1"
                    case .two: "Мелодия 2"
                    case .three: "Мелодия 3"
                    }
                }
            }
            
            enum Counter: String, CaseIterable {
                case one = "counterOne"
                case two = "counterTwo"
                case three = "counterThree"
                
                var description: String {
                    switch self {
                    case .one: "Часы 1"
                    case .two: "Часы 2"
                    case .three: "Часы 3"
                    }
                }
            }
            
            enum Boom: String, CaseIterable {
                case one = "boomOne"
                case two = "boomTwo"
                case three = "boomThree"
                
                var description: String {
                    switch self {
                    case .one: "Взрыв 1"
                    case .two: "Взрыв 2"
                    case .three: "Взрыв 3"
                    }
                }
            }
        }
    }
}

let gameModelMock = GameModel(
    rules: [
        "Все игроки становятся в круг.",
        "Первый игрок берет телефон и нажимает кнопку:",
        "На экране появляется вопрос \"Назовите Фрукт\".",
        "Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игроку.",
        "Игроки по кругу отвечают на один и тот же вопрос до тех пор, пока не взорвется бомба.",
        "Проигравшим считается тот, в чьих руках взорвалась бомба.",
        "Если выбран режим игры \"С Заданиями\", то проигравший выполняет задание."
    ],
    categories: [
        GameModel.CategoryModel(
            isSelected: false,
            category: .sports,
            questions: [
                "Назови зимний вид спорта",
                "Какие бывают командные виды спорта?",
                "В какие игры можно играть с мячом?",
                "Какие бывают хобби?",
                "Назови игры, где используются ракетки",
                "Какие виды спорта связаны с водой?",
                "Какие существуют экстремальные виды спорта?",
                "Какие виды спорта есть на Олимпиаде?",
                "В какие спортивные игры можно играть с друзьями?",
                "Какие виды спорта включают бег?",
                "Какие виды спорта проводят на льду?",
                "Какие виды спорта можно назвать летними?",
            ]
        ),
        GameModel.CategoryModel(
            isSelected: false,
            category: .other,
            questions: [
                "Что можно найти под твоей кроватью?",
                "Придумай однокоренное слово к слову ЛЕС",
                "Придумай слово, в котором есть слог ЛУН",
                "Назови город, который находится на берегу моря",
                "Составь слово с буквами В, А, Р",
                "Назови столицу любой страны.",
            ]
        ),
        GameModel.CategoryModel(
            isSelected: false,
            category: .life,
            questions: [
                "Какие привычки полезны для здоровья?",
                "Какие бывают профессии?",
                "Назови бренд шоколадок",
                "Назови головной убор",
                "Какие бывают закуски к пиву?",
                "Назови город на букву \"В\"",
                "Придумай кличку для хомяка",
                "Какие комнатные растения есть на твоем подоконнике?",
                "Что можно добавить в суп?"
            ]
        ),
        GameModel.CategoryModel(
            isSelected: false,
            category: .celebs,
            questions: [
                "Назови актрис, которые получили \"Оскар\"",
                "Вспомни кого-нибудь из Кардашьян-Дженнеров",
                "Назови знаменитость с фамилией на букву \"С\"",
                "Назови актера, который играл в нескольких франшизах",
                "Назови звездную парочку",
                "Какие звезды снимались в комедиях?",
            ]
        ),
        GameModel.CategoryModel(
            isSelected: false,
            category: .art,
            questions: [
                "Назови кинозлодея",
                "Какие Netflix сериалы ты знаешь?",
                "Вспомни фильм про животных",
                "Каких художников ты знаешь?",
                "Назови фильм Квентина Тарантино",
                "Назови фильмы, которые начинаются на букву \"С\".",
                "Какие картины считаются шедеврами мирового искусства?",
                "Какие песни стали саундтреками к популярным фильмам?",
                "Назови мультфильм, который был популярен в твоем детстве"
            ]
        ),
        GameModel.CategoryModel(
            isSelected: false,
            category: .nature,
            questions: [
                "Какие моря ты знаешь?",
                "Назови ягоду",
                "Какие животные живут в лесу?",
                "Каких животные едят траву?",
                "На каких деревьях растут съедобные плоды?",
                "Назови фрукт",
                "Назови животных, которые умеют лазать по деревьям",
                "Какие животные живут в Австралии?",
                "Что растет в лесу?",
                "Какие животные живут в пустыне?",
            ]
        ),
    ],
    punishments: [
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
    ],
    settings: GameModel.Settings(
        gameTime: .short,
        themeSound: .one,
        counterSound: .one,
        boomSound: .one,
        vibrationIsOn: true,
        punishmentsIsOn: true
    )
)
