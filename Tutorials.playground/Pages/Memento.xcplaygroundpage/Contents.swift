//: [Previous](@previous)

import UIKit

/*
 Паттерн Memento позволяет сохранять и восстанавливать объект. Он состоит из трех частей:
 
 1. Originator — объект, который необходимо сохранить или восстановить.
 2. Mementor представляет собой сохраненное состояние.
 3. Caretaker запрашивает сохранение у originator и получает в ответ memento. Caretaker отвечает за сохранение memento, а затем за его возврат originator для восстановления его состояния.
 Хотя это и не является обязательным, приложения для iOS обычно используют кодировщик для кодирования состояния originator в memento, а декодер — для декодирования memento обратно originator. Это позволяет повторно использовать логику кодирования и декодирования между originator-ами. Например, JSONEncoder и JSONDecoder позволяют кодировать объект в данные JSON и декодировать их из данных JSON соответственно.
 
 Используйте шаблон memento всякий раз, когда вы хотите сохранить, а затем восстановить состояние объекта.
 
 Например, вы можете использовать этот шаблон для реализации системы сохранения игры, где источником является состояние игры (такое как уровень, здоровье, количество жизней и т. д.), memento являются сохраненные данные, а caretaker-ом является игровая система.
 Вы также можете сохранить массив memento, представляющий стопку предыдущих состояний. Вы можете использовать это для реализации таких функций, как стеки отмены/возврата в IDE или графическом программном обеспечении.
 */

class Game: Codable {
    
    class State: Codable {
        var attemptsRemaining: Int = 3
        var level: Int = 1
        var score: Int = 0
    }
    
    var state = State()
    
    func rackUpMassivePoints() {
        state.score += 9002
    }
    
    func monsterEatsPlayer() {
        state.attemptsRemaining -= 1
    }
}
// MARK: - Memento
typealias GameMemento = Data

// MARK: - CareTaker
class GameSystem {
    
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    let userDefaults = UserDefaults.standard
    
    func save(_ game: Game, title: String) throws {
        let data = try encoder.encode(game)
        userDefaults.set(data, forKey: title)
    }
    
    func load (title: String) throws -> Game {
        guard let data = userDefaults.data(forKey: title),
              let game = try? decoder.decode(Game.self, from: data) else {
                  throw Error.gamenotFound
              }
        return game
    }
    
    public enum Error: String, Swift.Error {
        case gamenotFound
    }
    
}

// MARK: - Example

var game = Game()
game.monsterEatsPlayer()
game.rackUpMassivePoints()

// Save game

let gameSystem = GameSystem()
try gameSystem.save(game, title: "Cool game")

//New game
game = Game()
print ("New game Score: \(game.state.score)")

//Load game

game = try! gameSystem.load(title: "Cool game")
print ("Loaded score: \(game.state.score)")

//: [Next](@next)
