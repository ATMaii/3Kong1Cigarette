
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

// Player.swift

struct Player: Identifiable {
    let id = UUID()
    let name: String
    var hand: [Card] = []
    var head: [Card] = []
    var middle: [Card] = []
    var tail: [Card] = []
    var score: Int = 0
    
    mutating func splitHand() {
        guard hand.count == 13 else { return }

        // เรียงไพ่ก่อนแบ่ง
        let sorted = hand.sorted(by: { ($0.rank.rawValue, $0.suit.rawValue) < ($1.rank.rawValue, $1.suit.rawValue) })
        
        head = Array(sorted[0..<3])
        middle = Array(sorted[3..<8])
        tail = Array(sorted[8..<13])
    }
}

struct Player: Identifiable {
    let id: Int
    var hand: [Card] = []

    mutating func sortHand() {
        hand.sort {
            if $0.suit.rawValue == $1.suit.rawValue {
                return $0.rank.rawValue < $1.rank.rawValue
            } else {
                return $0.suit.rawValue < $1.suit.rawValue
            }
        }
    }
}
