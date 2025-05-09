// GameLogic.swift

import Foundation

enum HandType: Int {
    case highCard = 0
    case pair = 1
    case twoPair = 2
    case threeOfAKind = 3
    case straight = 4
    case flush = 5
    case fullHouse = 6
    case fourOfAKind = 7
    case straightFlush = 8
    case royalFlush = 9
}

class ScoreCalculator {
    
    static func evaluateHand(hand: [Card]) -> HandType {
        if HandEvaluator.isRoyalFlush(hand) {
            return .royalFlush
        } else if HandEvaluator.isStraightFlush(hand) {
            return .straightFlush
        } else if HandEvaluator.isFourOfAKind(hand) {
            return .fourOfAKind
        } else if HandEvaluator.isFullHouse(hand) {
            return .fullHouse
        } else if HandEvaluator.isFlush(hand) {
            return .flush
        } else if HandEvaluator.isStraight(hand) {
            return .straight
        } else if HandEvaluator.isThreeOfAKind(hand) {
            return .threeOfAKind
        } else if HandEvaluator.isTwoPair(hand) {
            return .twoPair
        } else if HandEvaluator.isPair(hand) {
            return .pair
        } else {
            return .highCard
        }
    }

    static func calculateScore(for hand: [Card]) -> Int {
        let handType = evaluateHand(hand: hand)
        return handType.rawValue
    }
}

import Foundation

class HandEvaluator {
    
    static func isRoyalFlush(_ hand: [Card]) -> Bool {
        return isStraightFlush(hand) && hand.contains { $0.rank == .ace }
    }

    static func isStraightFlush(_ hand: [Card]) -> Bool {
        return isFlush(hand) && isStraight(hand)
    }

    static func isFourOfAKind(_ hand: [Card]) -> Bool {
        let rankCounts = Dictionary(grouping: hand, by: { $0.rank }).mapValues { $0.count }
        return rankCounts.values.contains(4)
    }

    static func isFullHouse(_ hand: [Card]) -> Bool {
        let rankCounts = Dictionary(grouping: hand, by: { $0.rank }).mapValues { $0.count }
        return rankCounts.values.contains(3) && rankCounts.values.contains(2)
    }

    static func isFlush(_ hand: [Card]) -> Bool {
        return Set(hand.map { $0.suit }).count == 1
    }

    static func isStraight(_ hand: [Card]) -> Bool {
        let sortedRanks = hand.map { $0.rank.rawValue }.sorted()
        let lowAce = [2, 3, 4, 5, 14]
        let highStraight = Array(sortedRanks.first!...sortedRanks.first! + hand.count - 1)
        return sortedRanks == lowAce || sortedRanks == highStraight
    }

    static func isThreeOfAKind(_ hand: [Card]) -> Bool {
        let rankCounts = Dictionary(grouping: hand, by: { $0.rank }).mapValues { $0.count }
        return rankCounts.values.contains(3)
    }

    static func isTwoPair(_ hand: [Card]) -> Bool {
        let rankCounts = Dictionary(grouping: hand, by: { $0.rank }).mapValues { $0.count }
        return rankCounts.values.filter { $0 == 2 }.count == 2
    }

    static func isPair(_ hand: [Card]) -> Bool {
        let rankCounts = Dictionary(grouping: hand, by: { $0.rank }).mapValues { $0.count }
        return rankCounts.values.contains(2)
    }
}

import Foundation

class GameLogic {
    var players: [Player]
    var deck: Deck

    init(playerNames: [String]) {
        self.players = playerNames.map { Player(name: $0) }
        self.deck = Deck()
    }

    func startGame() {
        deck.shuffle()
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

    func determineWinner() -> Player? {
        let highestScorePlayer = players.max { (player1, player2) -> Bool in
            return ScoreCalculator.calculateScore(for: player1.hand) < ScoreCalculator.calculateScore(for: player2.hand)
        }
        return highestScorePlayer
    }
}


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

func evaluateHand(cards: [Card], playerIndex: Int, playersCount: Int) -> Int {
    var score = 0
// ตรวจสอบประเภทของมือไพ่
    if isRoyalFlush(cards) {
        score = 8 // Royal Flush
    } else if isStraightFlush(cards) {
        score = 7 // Straight Flush
    } else if isFourOfAKind(cards) {
        score = 6 // Four of a Kind
    } else if isFullHouse(cards) {
        score = 1 // Full House
    } else if isFlush(cards) {
        score = 1 // Flush
    } else if isStraight(cards) {
        score = 1 // Straight
    } else if isThreeOfAKind(cards) {
        score = 1 // Three of a Kind
    } else if isTwoPair(cards) {
        score = 1 // Two Pair
    } else if isPair(cards) {
        score = 1 // Pair
    } else {
        score = 1 // High Card
    }
    // คูณคะแนนเมื่อชนะ 3 กอง
    if playerIndex == 0 { // สมมติว่า playerIndex 0 ชนะ 3 กอง
        score *= 2
    }
    // คูณคะแนนเมื่อชนะ 3 คน
    if playersCount == 3 { // สมมติว่า 3 คนชนะ
        score *= 4
    }
    return score
}
      
let gameLogic = GameLogic(players: [player1, player2, player3, player4])
let scores = gameLogic.calculateScores()
// ใช้ scores ใน UI ต่อได้เลย เช่น แสดงผล
      
// ฟังก์ชันสำหรับจัดไพ่
func shuffleAndDealCards() -> [[String]] {
    let cards = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    
    // สุ่มไพ่
    let shuffledCards = cards.shuffled()
    
    // จัดไพ่เป็นรูปแบบ 5-5-3
    let firstRow = Array(shuffledCards[0..<3])   // แถวที่ 1
    let secondRow = Array(shuffledCards[3..<8]) // แถวที่ 2
    let thirdRow = Array(shuffledCards[8..<13]) // แถวที่ 3
    
    return [firstRow, secondRow, thirdRow]
}

// ทดสอบการจัดไพ่
let dealtCards = shuffleAndDealCards()

// แสดงผลลัพธ์
for (index, row) in dealtCards.enumerated() {
    print("Row

import SwiftUI

struct ContentView: View {
    @State private var player1Score = 0
    @State private var player2Score = 0

    var body: some View {
        VStack {
            Text("Player 1 Score:
                 
struct GameLogic {
    
    static func isRoyalFlush(_ hand: [Card]) -> Bool {
        return isStraightFlush(hand) && hand.contains { $0.rank == .ace }
    }

    static func isStraightFlush(_ hand: [Card]) -> Bool {
        return isFlush(hand) && isStraight(hand)
    }

    static func isFourOfAKind(_ hand: [Card]) -> Bool {
        let rankCounts = Dictionary(grouping: hand, by: { $0.rank }).mapValues { $0.count }
        return rankCounts.values.contains(4)
    }

    static func isFullHouse(_ hand: [Card]) -> Bool {
        let rankCounts = Dictionary(grouping: hand, by: { $0.rank }).mapValues { $0.count }
        return rankCounts.values.contains(3) && rankCounts.values.contains(2)
    }

    static func isFullHouseOfAces(_ hand: [Card]) -> Bool {
        let grouped = Dictionary(grouping: hand, by: { $0.rank })
        return grouped[.ace]?.count == 3 && grouped.values.contains { $0.count == 2 }
    }

    static func isFlush(_ hand: [Card]) -> Bool {
        return Set(hand.map { $0.suit }).count == 1
    }

    static func isStraight(_ hand: [Card]) -> Bool {
        let sortedRanks = hand.map { $0.rank.rawValue }.sorted()
        let lowAce = [2, 3, 4, 5, 14]
        let highStraight = Array(sortedRanks.first!...sortedRanks.first! + hand.count - 1)
        return sortedRanks == lowAce || sortedRanks == highStraight
    }

    static func isThreeOfAKind(_ hand: [Card]) -> Bool {
        let rankCounts = Dictionary(grouping: hand, by: { $0.rank }).mapValues { $0.count }
        return rankCounts.values.contains(3)
    }

    static func isTwoPair(_ hand: [Card]) -> Bool {
        let rankCounts = Dictionary(grouping: hand, by: { $0.rank }).mapValues { $0.count }
        return rankCounts.values.filter { $0 == 2 }.count == 2
    }

    static func isPair(_ hand: [Card]) -> Bool {
        let rankCounts = Dictionary(grouping: hand, by: { $0.rank }).mapValues { $0.count }
        return rankCounts.values.contains(2)
    }

    static func isPairOfAces(_ hand: [Card]) -> Bool {
        let aces = hand.filter { $0.rank == .ace }
        return aces.count == 2
    }
}