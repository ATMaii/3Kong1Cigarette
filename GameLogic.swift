import Foundation

enum HandType: Int {
    case royalFlush = 10
    case straightFlush = 9
    case fourOfAKind = 8
    case fullHouse = 7
    case flush = 6
    case straight = 5
    case threeOfAKind = 4
    case twoPair = 3
    case pair = 2
    case highCard = 1
}

func straightRank(_ hand: [Card]) -> Int? {
    let ranks = hand.map { $0.rank.rawValue }.sorted()

    let straights = [
        [2, 3, 4, 5, 6],
        [3, 4, 5, 6, 7],
        [4, 5, 6, 7, 8],
        [5, 6, 7, 8, 9],
        [6, 7, 8, 9, 10],
        [7, 8, 9, 10, 11],
        [8, 9, 10, 11, 12],
        [9, 10, 11, 12, 13],
        [14, 2, 3, 4, 5],    // A-2-3-4-5
        [10, 11, 12, 13, 14] // 10-J-Q-K-A
    ]

    for (index, straight) in straights.enumerated() {
        if Set(ranks) == Set(straight) {
            return index + 1
        }
    }

    return nil
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
    
    return score
}

func calculateHandScore(hand: [Card], row: RowPosition) -> Int {
    var score = 0

    if isRoyalFlush(hand) {
        score = 8
        if row == .middle { score *= 2 }
    } else if isStraightFlush(hand) {
        score = 7
        if row == .middle { score *= 2 }
    } else if isFourOfAKind(hand) {
        score = 6
        if row == .middle { score *= 2 }
    } else if isFullHouseOfAces(hand) {
        score = 2
        if row == .middle { score *= 2 }
    } else if isFullHouse(hand) {
        score = 1
        if row == .middle { score *= 2 }
    } else if isFlush(hand) || isStraight(hand) || isThreeOfAKind(hand) || isTwoPair(hand) || isPair(hand) {
        score = 1
    }
    if row == .head {
        if isThreeOfAKind(hand) {
            score = 5 // หัวตอง
        } else if isPairOfAces(hand) {
            score = 2 // หัวคู่ A
    }
    }
    // คูณคะแนนเมื่อได้ทะลุ
    if didWinAllThreeHands {
    score *= 2
    } 
    // คูณคะแนนเมื่อชนะ 3 คน ดาร์บี้
    if defeatedPlayers.count == 3 {
    score *= 4
    }
    return score
    }

// GameLogic.swift

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
        return straightRank(hand) != nil
    }

    static func straightRank(_ hand: [Card]) -> Int? {
        let ranks = hand.map { $0.rank.rawValue }.sorted()
        let straights = [
            [2, 3, 4, 5, 6],
            [3, 4, 5, 6, 7],
            [4, 5, 6, 7, 8],
            [5, 6, 7, 8, 9],
            [6, 7, 8, 9, 10],
            [7, 8, 9, 10, 11],
            [8, 9, 10, 11, 12],
            [9, 10, 11, 12, 13],
            [14, 2, 3, 4, 5],    // A-2-3-4-5 (รองใหญ่สุด)
            [10, 11, 12, 13, 14] // 10-J-Q-K-A (ใหญ่สุด)
        ]
        for (index, straight) in straights.enumerated() {
            if Set(ranks) == Set(straight) {
                return index + 1
            }
        }
        return nil
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

                 
struct GameLogic {
    
    static func compareHands(_ handA: [Card], _ handB: [Card]) -> Int {
        // เปรียบเทียบสองมือ ใครชนะ
        // return 1 if A ชนะ, -1 if B ชนะ
        return 0
    }

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
        let ranks = hand.map { $0.rank.rawValue }.sorted()
        let straights = [
            [2, 3, 4, 5, 6],
            [3, 4, 5, 6, 7],
            [4, 5, 6, 7, 8],
            [5, 6, 7, 8, 9],
            [6, 7, 8, 9, 10],
            [7, 8, 9, 10, 11],
            [8, 9, 10, 11, 12],
            [9, 10, 11, 12, 13],
            [14, 2, 3, 4, 5],
            [10, 11, 12, 13, 14]
        ]
        return straights.contains { Set($0) == Set(ranks) }
    }
    static func straightRank(_ hand: [Card]) -> Int? {
        let ranks = hand.map { $0.rank.rawValue }.sorted()
        let straights = [
            [2, 3, 4, 5, 6],
            [3, 4, 5, 6, 7],
            [4, 5, 6, 7, 8],
            [5, 6, 7, 8, 9],
            [6, 7, 8, 9, 10],
            [7, 8, 9, 10, 11],
            [8, 9, 10, 11, 12],
            [9, 10, 11, 12, 13],
            [14, 2, 3, 4, 5],
            [10, 11, 12, 13, 14]
        ]
        for (index, straight) in straights.enumerated() {
            if Set(ranks) == Set(straight) {
                return index + 1
            }
        }
        return nil
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
    static func isHighCard(_ hand: [Card]) -> Bool {
    let rankCounts = Dictionary(grouping: hand, by: { $0.rank }).mapValues { $0.count }
    let hasPairOrBetter = rankCounts.values.contains { $0 >= 2 }
    return !hasPairOrBetter
    }
    static func isPairOfAces(_ hand: [Card]) -> Bool {
        let aces = hand.filter { $0.rank == .ace }
        return aces.count == 2
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

// GameLogic.swift

import SwiftUI

struct ContentView: View {
    @State private var player1Score = 0
    @State private var player2Score = 0

private func determineWinner() {
    let highestScore = players.max { $0.score < $1.score }
}
struct Card { 
    let rank: String  // เช่น "A", "K", "Q", "2", ...
    let suit: String  // เช่น "♠", "♥", ...
}

struct PlayerHand {
    let top: [Card]    // 3 ใบ
    let middle: [Card] // 5 ใบ
    let bottom: [Card] // 5 ใบ
}
    
    if let winner = highestScore {
        self.winner = winner
        print("Winner:
             }
    }
}
    var body: some View {
        VStack {
            Text("Player 1 Score:
             
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
        
        // ตัวอย่างโบนัส: เห่า A (Full House AAAJJ ที่ล่าง)
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
    }
      
let gameLogic = GameLogic(players: [player1, player2, player3, player4])
let scores = gameLogic.calculateScores()
// ใช้ scores ใน UI ต่อได้เลย เช่น แสดงผล
      
// ฟังก์ชันสำหรับจัดไพ่
func shuffleAndDealCards() -> [[String]] {
    let cards = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
    
    // สุ่มไพ่
    let shuffledCards = cards.shuffled()
    
    // จัดไพ่เป็นรูปแบบ 5-5-3
    let firstRow = Array(shuffledCards[0..<3])   // แถวที่ 1
    let secondRow = Array(shuffledCards[3..<8]) // แถวที่ 2
    let thirdRow = Array(shuffledCards[8..<13]) // แถวที่ 3
    
    return [firstRow, secondRow, thirdRow]
}

import SwiftUI

struct ContentView: View {
    @State private var player1Score = 0
    @State private var player2Score = 0
    @State private var player3Score = 0
    @State private var player4Score = 0
    
    // เปรียบเทียบแต่ละชั้น
    func compareHands(_ hand1: [Card], _ hand2: [Card]) -> Int {
        // ตัวอย่างการเปรียบเทียบไพ่
        // แค่เปรียบเทียบจำนวนไพ่ในชุด ถ้ามีจำนวนมากกว่าชนะ
        return (hand1.count > hand2.count) ? 1 : (hand1.count < hand2.count ? -1 : 0)
    }
    
    func calculateScore(player1Top: [Card], player1Middle: [Card], player1Bottom: [Card],
                        player2Top: [Card], player2Middle: [Card], player2Bottom: [Card],
                        player3Top: [Card], player3Middle: [Card], player3Bottom: [Card],
                        player4Top: [Card], player4Middle: [Card], player4Bottom: [Card]) {
        
        let score1 = compareHands(player1Top, player2Top) + compareHands(player1Middle, player2Middle) + compareHands(player1Bottom, player2Bottom)
        let score2 = compareHands(player1Top, player3Top) + compareHands(player1Middle, player3Middle) + compareHands(player1Bottom, player3Bottom)
        let score3 = compareHands(player1Top, player4Top) + compareHands(player1Middle, player4Middle) + compareHands(player1Bottom, player4Bottom)
        
        player1Score = score1 + score2 + score3
        
        let score4 = compareHands(player2Top, player3Top) + compareHands(player2Middle, player3Middle) + compareHands(player2Bottom, player3Bottom)
        let score5 = compareHands(player2Top, player4Top) + compareHands(player2Middle, player4Middle) + compareHands(player2Bottom, player4Bottom)
        
        player2Score = score4 + score5
        
        let score6 = compareHands(player3Top, player4Top) + compareHands(player3Middle, player4Middle) + compareHands(player3Bottom, player4Bottom)
        
        player3Score = score6
        
        // คะแนนสุดท้ายของ Player 4
        player4Score = score1 + score2 + score3 + score4 + score5 + score6
    }
    
    var body: some View {
        VStack {
            Text("Player 1 Score:

struct GameLogic {

    class GameLogic {
    var players: [Player]
    init(players: [Player]) {
        self.players = players
        }
    }
    // เปรียบเทียบคะแนนของผู้เล่น
    func calculateScores() -> [Int] {
        var scores: [Int] = []
        for player in players {
            let playerScore = evaluatePlayerScore(player: player)
            scores.append(playerScore)
        }
        return scores
    }
    // คำนวณคะแนนของผู้เล่น
    func evaluatePlayerScore(player: Player) -> Int {
        var totalScore = 0
        // เปรียบเทียบแต่ละกองของผู้เล่น
        for row in RowPosition.allCases {
            let hand = player.handForRow(row)
            let handRank = evaluateHand(cards: hand)
            totalScore += handRank // ปรับตามค่าที่ต้องการ เช่น คะแนนของมือ
        }
        return totalScore
    }
    // เปรียบเทียบการชนะของผู้เล่น
    func comparePlayers() -> [Int] {
        var scores = calculateScores()
        var results: [Int] = []
        for i in 0..<players.count {
            var playerResult = 0
            for j in 0..<players.count {
                if i != j {
                    let result = compareHands(player1: players[i], player2: players[j])
                    playerResult += result
                }
            }
            results.append(playerResult)
        }
        return results
    }
    // เปรียบเทียบไพ่ระหว่าง 2 ผู้เล่น
    func compareHands(player1: Player, player2: Player) -> Int {
        // เปรียบเทียบทุกกองที่จัดไว้
        var result = 0
        for row in RowPosition.allCases {
            let hand1 = player1.handForRow(row)
            let hand2 = player2.handForRow(row)
            if evaluateHand(cards: hand1) > evaluateHand(cards: hand2) {
                result += 1
            } else if evaluateHand(cards: hand1) < evaluateHand(cards: hand2) {
                result -= 1
            }
        }
        return result
    }
}
// เปลี่ยนไปใช้ RowPosition ที่แยกการจัดการมือ
enum RowPosition: CaseIterable {
    case head, middle, tail
}
// ฟังก์ชันประเมินมือไพ่
func evaluateHand(cards: [Card]) -> Int {
    // แสดงให้เห็นวิธีการคำนวณมือไพ่ตามประเภท เช่น Royal Flush, Straight, Pair ฯลฯ
    // ใช้เงื่อนไขต่างๆ ในการประเมินมือไพ่
    return 0 // เปลี่ยนค่ากลับตามการเปรียบเทียบ

import Foundastruct GameLogic {
    
    static func compareHands(_ handA: [Card], _ handB: [Card]) -> Int {
        // เปรียบเทียบสองมือ ใครชนะ
        // return 1 if A ชนะ, -1 if B ชนะ
        return 0
    }

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

    func straightRank(_ hand: [Card]) -> Int? {
    let ranks = hand.map { $0.rank.rawValue }.sorted()

    let straights = [
        [2, 3, 4, 5, 6],
        [3, 4, 5, 6, 7],
        [4, 5, 6, 7, 8],
        [5, 6, 7, 8, 9],
        [6, 7, 8, 9, 10],
        [7, 8, 9, 10, 11],
        [8, 9, 10, 11, 12],
        [9, 10, 11, 12, 13],
        [14, 2, 3, 4, 5],    // A-2-3-4-5
        [10, 11, 12, 13, 14] // 10-J-Q-K-A
    ]

    for (index, straight) in straights.enumerated() {
        if Set(ranks) == Set(straight) {
            return index + 1
        }
    }
    return nil
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

    class GameLogic {

    var players: [Player]

    init(players: [Player]) {
        self.players = players
      }
    }
    // เปรียบเทียบคะแนนของผู้เล่น
    func calculateScores() -> [Int] {
        var scores: [Int] = []

        for player in players {
            let playerScore = evaluatePlayerScore(player: player)
            scores.append(playerScore)
        }

        return scores
    }

    // คำนวณคะแนนของผู้เล่น
    func evaluatePlayerScore(player: Player) -> Int {
        var totalScore = 0

        // เปรียบเทียบแต่ละกองของผู้เล่น
        for row in RowPosition.allCases {
            let hand = player.handForRow(row)
            let handRank = evaluateHand(cards: hand)

            totalScore += handRank // ปรับตามค่าที่ต้องการ เช่น คะแนนของมือ
        }

        return totalScore
    }

    // เปรียบเทียบการชนะของผู้เล่น
    func comparePlayers() -> [Int] {
        var scores = calculateScores()

        var results: [Int] = []
        for i in 0..<players.count {
            var playerResult = 0
            for j in 0..<players.count {
                if i != j {
                    let result = compareHands(player1: players[i], player2: players[j])
                    playerResult += result
                }
            }
            results.append(playerResult)
        }

        return results
    }
    }
    // เปรียบเทียบไพ่ระหว่าง 2 ผู้เล่น
    func compareHands(player1: Player, player2: Player) -> Int {
        // เปรียบเทียบทุกกองที่จัดไว้
        var result = 0
        for row in RowPosition.allCases {
            let hand1 = player1.handForRow(row)
            let hand2 = player2.handForRow(row)

            if evaluateHand(cards: hand1) > evaluateHand(cards: hand2) {
                result += 1
            } else if evaluateHand(cards: hand1) < evaluateHand(cards: hand2) {
                result -= 1
            }
        }
        return result
    }
}
                 
// เปลี่ยนไปใช้ RowPosition ที่แยกการจัดการมือ
enum RowPosition: CaseIterable {
    case head, middle, tail
}

// ฟังก์ชันประเมินมือไพ่
func evaluateHand(cards: [Card]) -> Int {
    // แสดงให้เห็นวิธีการคำนวณมือไพ่ตามประเภท เช่น Royal Flush, Straight, Pair ฯลฯ
    // ใช้เงื่อนไขต่างๆ ในการประเมินมือไพ่
    return 0 // เปลี่ยนค่ากลับตามการเปรียบเทียบ
}

                 
