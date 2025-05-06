
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
        let head = Array(player.hand.prefix(3))  // หัว 3 ใบ
        let middle = Array(player.hand.dropFirst(5).prefix(5))  // กลาง 5 ใบ
        let tail = Array(player.hand.dropFirst(10).prefix(5))  // ท้าย 5 ใบ

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

extension GameManager {
    func splitIntoThreePiles(player: Player) -> (head: [Card], middle: [Card], tail: [Card]) {
        let hand = player.hand
        let head = Array(hand.prefix(5))
        let middle = Array(hand.dropFirst(5).prefix(5))
        let tail = Array(hand.dropFirst(10).prefix(3))
        return (head, middle, tail)
    }
}

func splitIntoThreePiles() -> ([Card], [Card], [Card]) {
    var head: [Card] = []
    var middle: [Card] = []
    var tail: [Card] = []
    
    // เรียงไพ่จากท้ายไปหัว
    for i in 0..<13 {
        if i < 5 {
            tail.append(playerHand[i])  // 5 ใบแรกเป็นกองท้าย
        } else if i < 10 {
            middle.append(playerHand[i])  // 5 ใบถัดมาเป็นกองกลาง
        } else {
            head.append(playerHand[i])  // 3 ใบสุดท้ายเป็นกองหัว
        }
    }
    
    return (head, middle, tail)
}

    let (head, middle, tail) = splitIntoThreePiles()

print("หัว:

func startNewGame() {
    var deck = Deck()
    deck.shuffle()

    for i in 0..<players.count {
        players[i].hand = deck.drawCards(count: 13)
        players[i].splitHandIntoPiles()
    }
      }


      class GameManager: ObservableObject {
    static let shared = GameManager()

    @Published var players: [Player] = []

    func startNewGame() {
        var deck = Card.allCards.shuffled()
        players = []

        for _ in 0..<4 {
            var hand: [Card] = []
            for _ in 0..<13 {
                hand.append(deck.removeFirst())
            }

            let sortedHand = hand.sorted(by: cardSort)
            let tail = Array(sortedHand[0..<5])
            let middle = Array(sortedHand[5..<10])
            let head = Array(sortedHand[10..<13])

            let player = Player(fullHand: hand, tail: tail, middle: middle, head: head)
            players.append(player)
        }
    }

    private func cardSort(_ a: Card, _ b: Card) -> Bool {
        if a.suit.rawValue == b.suit.rawValue {
            return a.rank.rawValue < b.rank.rawValue
        } else {
            return a.suit.rawValue < b.suit.rawValue
        }
    }
      }
