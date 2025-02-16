//
//  AudioPlayerService.swift
//  BombGame
//
//  Created by Николай Игнатов on 10.02.2025.
//

import AVFoundation

final class AudioPlayerService {
    enum AudioPlayerType {
        case background
        case game
    }
    
    static let shared = AudioPlayerService()
    private var backgroundPlayer: AVAudioPlayer?
    private var gamePlayer: AVAudioPlayer?
    
    private init() {}
    
    func playSound(named fileName: String, type: AudioPlayerType = .game, repeatable: Bool = false) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
            ConsoleLogger.i("Файл \(fileName) не найден")
            return
        }
        
        do {
            switch type {
            case .background:
                backgroundPlayer = try AVAudioPlayer(contentsOf: url)
                backgroundPlayer?.numberOfLoops = repeatable ? -1 : 0
                backgroundPlayer?.prepareToPlay()
                backgroundPlayer?.play()
                
            case .game:
                gamePlayer = try AVAudioPlayer(contentsOf: url)
                gamePlayer?.numberOfLoops = repeatable ? -1 : 0
                gamePlayer?.prepareToPlay()
                gamePlayer?.play()
            }
        } catch {
            ConsoleLogger.i("Ошибка при воспроизведении звука: \(error.localizedDescription)")
        }
    }
    
    func pause(type: AudioPlayerType = .game) {
        switch type {
        case .background:
            backgroundPlayer?.pause()
        case .game:
            gamePlayer?.pause()
        }
    }
    
    func resume(type: AudioPlayerType = .game) {
        switch type {
        case .background:
            backgroundPlayer?.play()
        case .game:
            gamePlayer?.play()
        }
    }
    
    func stop(type: AudioPlayerType = .game) {
        switch type {
        case .background:
            backgroundPlayer?.stop()
            backgroundPlayer = nil
        case .game:
            gamePlayer?.stop()
            gamePlayer = nil
        }
    }
}
