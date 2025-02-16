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
        self.gameModel = gameModelMock
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
    
    func toggleVibrationSettings() {
        gameModel.settings.vibrationIsOn.toggle()
    }
    
    func togglePunishmentSettings() {
        gameModel.settings.punishmentsIsOn.toggle()
    }
}
