//
//  AudioPlayerService.swift
//  BombGame
//
//  Created by Николай Игнатов on 10.02.2025.
//

import AVFoundation

final class AudioPlayerService {
    private var audioPlayer: AVAudioPlayer?
    static let shared = AudioPlayerService()
   
    private init() {}
    
    /// Воспроизведение звука
    func playSound(named fileName: String, repeatable: Bool = false) {
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
            print("Файл \(fileName) не найден")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
            audioPlayer?.numberOfLoops = repeatable ? -1 : 0
        } catch {
            print("Ошибка при воспроизведении звука: \(error.localizedDescription)")
        }
    }
    
    /// Пауза
    func pause() {
        audioPlayer?.pause()
    }
    
    /// Продолжить воспроизведение
    func resume() {
        audioPlayer?.play()
    }
    
    /// Остановить воспроизведение
    func stop() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
}

