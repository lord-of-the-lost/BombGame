//
//  ConsoleLogger.swift
//  BombGame
//
//  Created by Николай Игнатов on 16.02.2025.
//

import Foundation

struct ConsoleLogger {
    static func i(_ items: Any...) {
#if DEBUG
        print(items)
#endif
    }
}
