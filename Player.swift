
struct Player {
    var hand: [Card] = []
}

// Player.swift

import Foundation

class Player: Identifiable {
    let id = UUID()
    var name: String
    var hand: [Card]

    init(name: String) {
        self.name = name
        self.hand = []
    }
}
