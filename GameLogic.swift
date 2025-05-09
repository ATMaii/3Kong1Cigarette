// GameLogic.swift

import Foundation

class GameLogic: ObservableObject {
    @Published var players: [Player]
    var deck: Deck

    init(playerNames: [String]) {
        self.players = playerNames.map { Player(name: $0) }
        self.deck = Deck()
    }

    func startNewGame() {
        deck.shuffle()
        for i in 0..<players.count {
            players[i].hand = deck.drawCards(count: 13)
        }
    }
    
    func splitIntoThreePiles(player: Player) -> ([Card], [Card], [Card]) {
        var head: [Card] = []
        var middle: [Card] = []
        var tail: [Card] = []

        // แบ่งไพ่ 13 ใบให้เป็น 3 กอง
        let playerHand = player.hand.sorted { $0.rank.rawValue < $1.rank.rawValue }

        for i in 0..<13 {
            if i < 5 {
                tail.append(playerHand[i])  // กองท้าย
            } else if i < 10 {
                middle.append(playerHand[i])  // กองกลาง
            } else {
                head.append(playerHand[i])  // กองหัว
            }
        }

        return (head, middle, tail)
    }
}


import Foundation

class GameLogic {
    var deck = Deck()
    var players: [Player] = []

    init(playerNames: [String]) {
        self.players = playerNames.map { Player(name: $0) }
    }

    func startGame() {
        deck.reset()
        dealCards()
    }

    private func dealCards() {
        for player in players {
            player.hand = deck.drawCards(count: 13)
            player.hand.sort {
                if $0.rank.rawValue == $1.rank.rawValue {
                    return $0.suit.rawValue < $1.suit.rawValue
                }
                return $0.rank.rawValue < $1.rank.rawValue
            }
        }
    }
}

// GameLogic.swift

import Foundation

class GameLogic: ObservableObject {
    @Published var players: [Player]
    var deck: Deck
    
    init(playerNames: [String]) {
        self.deck = Deck()
        self.players = playerNames.map { Player(name: $0) }
    }
    
    func startGame() {
        deck.shuffle()
        dealCards()
        calculateScores()
    }
    
    private func dealCards() {
        for player in players {
            var hand: [Card] = []
            for _ in 0..<13 {
                if let card = deck.drawCard() {
                    hand.append(card)
                }
            }
            player.hand = hand
        }
    }
    
    private func calculateScores() {
        for player in players {
            player.score = calculateScore(for: player.hand)
        }
    }
    
    private func calculateScore(for hand: [Card]) -> Int {
        // คำนวณคะแนนของมือไพ่ที่ได้รับ
        // ตัวอย่างการคำนวณ: คะแนนตามลำดับไพ่จากน้อยไปมาก
        let sortedHand = hand.sorted { $0.rank.rawValue < $1.rank.rawValue }
        
        // กรณีตัวอย่าง คำนวณเป็นคะแนนตามลำดับไพ่ (จะต้องปรับตามกติกาจริง)
        var score = 0
        for card in sortedHand {
            score += card.rank.rawValue
        }
        
        return score
    }
}

// GameLogic.swift

private func calculateScore(for hand: [Card]) -> Int {
    let sortedHand = hand.sorted { $0.rank.rawValue < $1.rank.rawValue }
    var score = 0
    
    // คำนวณคะแนนจากไพ่ในมือ
    for card in sortedHand {
        score += card.rank.rawValue
    }

    // ตรวจสอบว่ามีการชนะทั้ง 3 แถวหรือไม่ (ตัวอย่าง)
    let isTripleWin = checkTripleWin(for: hand)
    if isTripleWin {
        score *= 3  // ถ้าชนะทั้ง 3 แถว จะคูณคะแนน
    }
    
    return score
}

// ฟังก์ชันตรวจสอบการชนะทั้ง 3 แถว
private func checkTripleWin(for hand: [Card]) -> Bool {
    // ตัวอย่างการตรวจสอบ ถ้ามีชุดที่เป็นไพ่ชุดพิเศษ (เช่น ตอง, โฟร์)
    // สามารถปรับแก้ตามกฎที่ต้องการ
    let hasThreeOfAKind = hand.filter { $0.rank == .three }.count == 3
    let hasFourOfAKind = hand.filter { $0.rank == .four }.count == 4
    let hasStraightFlush = checkStraightFlush(for: hand)

    return hasThreeOfAKind && hasFourOfAKind && hasStraightFlush
}

private func checkStraightFlush(for hand: [Card]) -> Bool {
    // ตัวอย่างการตรวจสอบ ฟรัช และเรียงลำดับ
    return true
}

// GameLogic.swift

private func determineWinner() {
    let highestScore = players.max { $0.score < $1.score }
    
    if let winner = highestScore {
        self.winner = winner
        print("Winner:

import Foundation

struct Card {
    let rank: String  // เช่น "A", "K", "Q", "2", ...
    let suit: String  // เช่น "♠", "♥", ...
}

struct PlayerHand {
    let top: [Card]    // 3 ใบ
    let middle: [Card] // 5 ใบ
    let bottom: [Card] // 5 ใบ
}

class GameLogic {
    var players: [PlayerHand]
    
    init(players: [PlayerHand]) {
        self.players = players
    }

    func calculateScores() -> [Int] {
        var scores = [Int](repeating: 0, count: players.count)
        
        for i in 0..<players.count {
            for j in 0..<players.count where i != j {
                let result = compare(players[i], players[j])
                scores[i] += result
            }
        }
        
        return scores
    }

    private func compare(_ a: PlayerHand, _ b: PlayerHand) -> Int {
        var score = 0
        score += compareLayer(a.top, b.top, isTop: true)
        score += compareLayer(a.middle, b.middle, isTop: false)
        score += compareLayer(a.bottom, b.bottom, isTop: false)
        
        // ตัวอย่างโบนัส: เห่า A (Full House JJJAA หรือ AAAJJ ที่ล่าง)
        if isFullHouseWithThreeAces(a.bottom) { score += 2 }
        if isFullHouseWithThreeAces(b.bottom) { score -= 2 }
        
        return score
    }

    private func compareLayer(_ a: [Card], _ b: [Card], isTop: Bool) -> Int {
        // TODO: เปรียบเทียบมือจริงจัง เช่น คู่ vs ตอง vs high card
        // เบื้องต้น: วัดแค่จำนวนคู่
        let aRank = rankPower(cards: a)
        let bRank = rankPower(cards: b)
        return aRank == bRank ? 0 : (aRank > bRank ? 1 : -1)
    }

    private func isFullHouseWithThreeAces(_ cards: [Card]) -> Bool {
        let ranks = cards.map { $0.rank }
        return ranks.filter { $0 == "A" }.count >= 3
    }

    private func rankPower(cards: [Card]) -> Int {
        // ตัวอย่าง logic ง่ายๆ ให้แต้มตามคู่/ตอง
        var rankCount = [String: Int]()
        for card in cards {
            rankCount[card.rank, default: 0] += 1
        }

        let counts = rankCount.values.sorted(by: >)

        switch counts {
        case [3, 2]:
            return 7 // Full House
        case [3]:
            return 6 // ตอง
        case [2, 2]:
            return 5 // 2 คู่
        case [2]:
            return 4 // 1 คู่
        default:
            return 1 // high card
        }
    }
}
