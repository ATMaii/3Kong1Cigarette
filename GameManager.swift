
// GameManager.swift

func startNewGame() {
    let names = ["ผู้เล่น 1", "ผู้เล่น 2", "ผู้เล่น 3", "ผู้เล่น 4"]
    players = names.map { Player(name: $0) }
    
    var deck = Deck()
    deck.shuffle()
    
    for i in 0..<players.count {
        players[i].hand = (0..<13).compactMap { _ in deck.drawCard() }
        players[i].splitHand()
    }

    // คะแนนรวมสามกอง
    for i in 0..<players.count {
        let player = players[i]
        let score = evaluateThreePiles(head: player.head, middle: player.middle, tail: player.tail)
        players[i].score = score
    }

    winner = players.max(by: { $0.score < $1.score })
}

func evaluateThreePiles(head: [Card], middle: [Card], tail: [Card]) -> Int {
    var score = 0
    score += evaluateHand(head)      // อาจให้คะแนนน้อยหน่อย
    score += evaluateHand(middle) * 2
    score += evaluateHand(tail) * 3
    return score
}

func evaluateHand(_ cards: [Card]) -> Int {
    // ตัวอย่างการให้คะแนนเบื้องต้น: คู่ = 1, ตอง = 3, โฟว์ = 6, ฟูลเฮาส์ = 4, สเตรทฟลัช = 10 ฯลฯ
    // TODO: เขียนระบบตรวจมือจริง ๆ
    return Int.random(in: 0...10) // ใช้แบบสุ่มแทนก่อน
}

import Foundation

class GameManager: ObservableObject {
    @Published var players: [Player] = []
    @Published var deck = Deck()

    func startNewGame() {
        deck = Deck()
        players = [Player(), Player(), Player(), Player()]
        dealCards()
    }

    func dealCards() {
        for i in 0..<players.count {
            players[i].hand = []
            for _ in 0..<13 {
                if let card = deck.dealCard() {
                    players[i].hand.append(card)
                }
            }
            players[i].sortHand()
        }
    }
}

func startNewGame() {
    deck = Deck()
    players = [Player(), Player(), Player(), Player()]
    dealCards()
}

import Foundation

class GameManager: ObservableObject {
    @Published var players: [Player] = []
    private var deck = Deck()

    init() {
        startNewGame()
    }

    func startNewGame() {
        deck = Deck()
        players = [Player(id: 1), Player(id: 2), Player(id: 3), Player(id: 4)]
        dealCards()
    }

    private func dealCards() {
        deck.shuffle()
        for i in 0..<players.count {
            players[i].hand = (0..<13).compactMap { _ in deck.dealCard() }
            players[i].sortHand() // เรียงไพ่ตามดอก + แต้ม
        }
    }
}
