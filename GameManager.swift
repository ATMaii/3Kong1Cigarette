
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

    // เพิ่มฟังก์ชันเพื่อแยกไพ่เป็น 3 กอง (หัว กลาง ท้าย)
    func splitIntoThreePiles(player: Player) -> ([Card], [Card], [Card]) {
        let head = Array(player.hand.prefix(5))  // หัว 5 ใบ
        let middle = Array(player.hand.dropFirst(5).prefix(5))  // กลาง 5 ใบ
        let tail = Array(player.hand.dropFirst(10).prefix(3))  // ท้าย 3 ใบ

        return (head, middle, tail)
    }

    // เพิ่มฟังก์ชันคำนวณคะแนน
    func calculateScore(player: Player) -> Int {
        // คะแนนที่ได้จากหัว
        let headScore = evaluateHand(player: player, hand: Array(player.hand.prefix(5)))
        
        // คะแนนที่ได้จากกลาง
        let middleScore = evaluateHand(player: player, hand: Array(player.hand.dropFirst(5).prefix(5)))
        
        // คะแนนที่ได้จากท้าย
        let tailScore = evaluateHand(player: player, hand: Array(player.hand.dropFirst(10).prefix(3)))

        return headScore + middleScore + tailScore
    }

    private func evaluateHand(player: Player, hand: [Card]) -> Int {
        // ตัวอย่างการคำนวณคะแนน (สามารถปรับปรุงตามการประเมินไพ่)
        return hand.count  // เริ่มต้นแค่ return จำนวนไพ่ในมือ
    }
}

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
            players[i].sortHand()
        }
    }

    func compareScores() -> Player? {
        var winner: Player? = nil
        var highestScore = 0

        for player in players {
            let score = calculateScore(player: player)
            if score > highestScore {
                highestScore = score
                winner = player
            }
        }

        return winner
    }

    func calculateScore(player: Player) -> Int {
        let headScore = evaluateHand(player: player, hand: Array(player.hand.prefix(5)))
        let middleScore = evaluateHand(player: player, hand: Array(player.hand.dropFirst(5).prefix(5)))
        let tailScore = evaluateHand(player: player, hand: Array(player.hand.dropFirst(10).prefix(3)))
        return headScore + middleScore + tailScore
    }

    private func evaluateHand(player: Player, hand: [Card]) -> Int {
        // เพิ่มเงื่อนไขในการประเมินคะแนนตามแถวต่าง ๆ
        return hand.count
    }
}

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
            players[i].sortHand()
        }
    }

    func calculateScore(player: Player) -> Int {
        let headScore = evaluateHand(player: player, hand: Array(player.hand.prefix(5)))
        let middleScore = evaluateHand(player: player, hand: Array(player.hand.dropFirst(5).prefix(5)))
        let tailScore = evaluateHand(player: player, hand: Array(player.hand.dropFirst(10).prefix(3)))
        return headScore + middleScore + tailScore
    }

    func evaluateHand(player: Player, hand: [Card]) -> Int {
        // เพิ่มเงื่อนไขในการประเมินคะแนนตามแถวต่าง ๆ
        return hand.count
    }

    func compareScores() -> Player? {
        var winner: Player? = nil
        var highestScore = 0

        for player in players {
            let score = calculateScore(player: player)
            if score > highestScore {
                highestScore = score
                winner = player
            }
        }

        return winner
    }
}

