//
//  DataService.swift
//  BombGame
//
//  Created by Николай Игнатов on 14.02.2025.
//

import Foundation

final class DataService {
    var gameModel: GameModel
    
    static let shared = DataService()
   
    private init() {
        self.gameModel = GameModel(
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
                gameTime: 5,
                themeSound: .one,
                counterSound: .one,
                boomSound: .one,
                vibrationIsOn: true,
                withPunishments: true
            )
        )
    }
    
    func getRandomQuestion() -> String {
        var questions: [String] = []
        let selectedCategories = gameModel.categories.filter { $0.isSelected }
        
        if selectedCategories.isEmpty {
            gameModel.categories.forEach {
                questions.append(contentsOf: $0.questions)
            }
        } else {
            selectedCategories.forEach {
                questions.append(contentsOf: $0.questions)
            }
        }
    
        return questions.randomElement() ?? "errora"
    }
    
    func getRandomPunishment() -> String {
        gameModel.punishments.randomElement() ?? ""
    }
    
    func getAllCategories() -> [GameModel.CategoryModel] {
        gameModel.categories
    }
    
    func getRules() -> [String] {
        gameModel.rules
    }
    
    func getSettings() -> GameModel.Settings {
        gameModel.settings
    }
}
