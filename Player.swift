
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

// Player.swift

import Foundation

class Player: ObservableObject {
    let name: String
    @Published var hand: [Card]
    @Published var score: Int
    
    init(name: String) {
        self.name = name
        self.hand = []
        self.score = 0
    }
}
