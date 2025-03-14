//
//  TimerService.swift
//  BombGame
//
//  Created by Николай Игнатов on 14.02.2025.
//

import Foundation

protocol TimerDelegate: AnyObject {
    func timerIsFinished()
}

final class TimerService {
    weak var delegate: TimerDelegate?
    
    var isPaused = false
    
    private var timeLeft = 0
    private var timer: Timer?
    
    func startTimer() {
        timer?.invalidate()
        timeLeft = DataService.shared.gameModel.settings.gameTime.value
        isPaused = false
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true
        )
    }
    
    func togglePause() {
        isPaused.toggle()
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func handleTimerIsFinished() {
        stopTimer()
        delegate?.timerIsFinished()
    }
    
    @objc private func updateTimer() {
        guard !isPaused else { return }
        if timeLeft > 0 {
            timeLeft -= 1
            ConsoleLogger.i(timeLeft)
        } else {
            handleTimerIsFinished()
        }
    }
}
