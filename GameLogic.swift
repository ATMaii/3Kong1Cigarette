import Foundation

enum HandType: Int {
    case highCard = 1
    case pair
    case twoPair
    case threeOfAKind
    case straight
    case flush
    case fullHouse
    case fourOfAKind
    case straightFlush
    case royalFlush

    static let straights: [[Int]] = [
        [2, 3, 4, 5, 6],
        [3, 4, 5, 6, 7],
        [4, 5, 6, 7, 8],
        [5, 6, 7, 8, 9],
        [6, 7, 8, 9, 10],
        [7, 8, 9, 10, 11],
        [8, 9, 10, 11, 12],
        [9, 10, 11, 12, 13],
        [10, 11, 12, 13, 14], // 10-J-Q-K-A
        [14, 2, 3, 4, 5]      // A-2-3-4-5
    ]
}


func getHandType(_ cards: [Card]) -> HandType {
    if isRoyalFlush(cards) { return .royalFlush }
    if isStraightFlush(cards) { return .straightFlush }
    if isFourOfAKind(cards) { return .fourOfAKind }
    if isFullHouse(cards) { return .fullHouse }
    if isFlush(cards) { return .flush }
    if isStraight(cards) { return .straight }
    if isThreeOfAKind(cards) { return .threeOfAKind }
    if isTwoPair(cards) { return .twoPair }
    if isPair(cards) { return .pair }
    return .highCard
}

func isFoul(head: [Card], middle: [Card], tail: [Card]) -> Bool {
    let headRank = getHandType(head).rawValue
    let middleRank = getHandType(middle).rawValue
    let tailRank = getHandType(tail).rawValue

    // ตรวจสอบลำดับต้องเป็น: tail > middle > head
    return !(tailRank >= middleRank && middleRank >= headRank)
}
    
func HandEvaluator(hand: [Card])->HandType {
        var score = 0
    
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

func calculateScore(hand : [Card], playerIndex: Int, playersCount: Int) -> Int {
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
    
import Foundation

struct HandEvaluator {

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
    let ranks = hand.map
{ $0.rank.rawValue }.sorted()
    return HandType.straights.contains { Set($0) == Set(ranks) }
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
        return straights.contains { Set($0) == Set(ranks) }
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


enum RowPosition {
    case head, middle, tail
}

struct Player {
    let index: Int
    let head: [Card]
    let middle: [Card]
    let tail: [Card]
}

func compareRow(_ cards1: [Card], _ cards2: [Card], row: RowPosition) -> (Int, Int) {
    let type1 = evaluateHandType(cards: cards1)
    let type2 = evaluateHandType(cards: cards2)

    if type1 == type2 {
        return (0, 0)
    } else if type1 > type2 {
        return (1, -1)
    } else {
        return (-1, 1)
    }
}

func bonusScore(for cards: [Card], row: RowPosition) -> Int {
    var score = 0
    if isRoyalFlush(cards) {
        score = 8
    } else if isStraightFlush(cards) {
        score = 7
    } else if isFourOfAKind(cards) {
        score = 6
    } else if isFullHouseOfAces(cards) {
        score = 2
    } else if isFullHouse(cards) {
        score = 1
    } else if isFlush(cards) || isStraight(cards) || isThreeOfAKind(cards) || isTwoPair(cards) || isPair(cards) {
        score = 1
    }

    if row == .middle {
        score *= 2
    }
    if row == .head {
        if isThreeOfAKind(cards) {
            score = 5
        } else if isPairOfAces(cards) {
            score = 2
        }
    }

    return score
}

func calculateTotalScores(players: [Player]) -> [Int] {
    var scores = Array(repeating: 0, count: players.count)

    for i in 0..<players.count {
        for j in (i + 1)..<players.count {
            let p1 = players[i]
            let p2 = players[j]

            var p1Wins = 0
            var p2Wins = 0
            var p1Score = 0
            var p2Score = 0

            // Head
            let (h1, h2) = compareRow(p1.head, p2.head, row: .head)
            p1Wins += (h1 > 0 ? 1 : 0)
            p2Wins += (h2 > 0 ? 1 : 0)
            p1Score += h1 + bonusScore(for: p1.head, row: .head)
            p2Score += h2 + bonusScore(for: p2.head, row: .head)

            // Middle
            let (m1, m2) = compareRow(p1.middle, p2.middle, row: .middle)
            p1Wins += (m1 > 0 ? 1 : 0)
            p2Wins += (m2 > 0 ? 1 : 0)
            p1Score += m1 + bonusScore(for: p1.middle, row: .middle)
            p2Score += m2 + bonusScore(for: p2.middle, row: .middle)

            // Tail
            let (t1, t2) = compareRow(p1.tail, p2.tail, row: .tail)
            p1Wins += (t1 > 0 ? 1 : 0)
            p2Wins += (t2 > 0 ? 1 : 0)
            p1Score += t1 + bonusScore(for: p1.tail, row: .tail)
            p2Score += t2 + bonusScore(for: p2.tail, row: .tail)

            if p1Wins == 3 {
                p1Score *= 2
                p2Score *= 2
            } else if p2Wins == 3 {
                p1Score *= 2
                p2Score *= 2
            }

            scores[i] += p1Score
            scores[j] += p2Score
        }
    }

    return scores
}

struct Player {
    var id: Int
    var hand: [Card] // 13 cards (รวมทุกแถว)
    var score: Int = 0
    var chips: Int = 5000 // เริ่มต้นชิป
}

// ฟังก์ชันคำนวณ Chips
func calculateChips(players: [Player]) {
    for player in players {
        let finalChips = player.chips + player.score * 100  // คูณกับ 100 เพื่อแปลงคะแนนเป็น Chips
        print("Player

            Text("Player 1 Score:
                 
import Foundation    
class GameLogic: ObservableObject {
    @Published var players: [Player]
    var deck: Deckimport Foundation

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
        for index in players.indices {
            players[index].hand = deck.drawCards(count: 13)
            players[index].hand.sort {
                if $0.rank.rawValue == $1.rank.rawValue {
                    return $0.suit.rawValue < $1.suit.rawValue
                }
                return $0.rank.rawValue < $1.rank.rawValue
            }
        }
    }

    func determineWinner() -> Player? {
        players.max { p1, p2 in
            ScoreCalculator.calculateScore(for: p1.hand) < ScoreCalculator.calculateScore(for: p2.hand)
                    }
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
            if i < 3 {
                head.append(playerHand[i])  // กองท้าย
            } else if i < 8 {
                middle.append(playerHand[i])  // กองกลาง
            } else {
                tail.append(playerHand[i])  // กองหัว
            }
        }

        return (head, middle, tail)
    }
}
// ส่วนนี้อยู่ใน GameView.swift
struct GameView: View {
    @ObservedObject var gameLogic: GameLogic

    var body: some View {
        VStack {
            Text("Player 1 Score:
// GameLogic.swift
import SwiftUI

struct ContentView : View {
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

import Foundation

class GameLogic {
    var players: [PlayerHand]

    // Initializer เพื่อกำหนดค่าเริ่มต้นของผู้เล่น
    init(players: [PlayerHand]) {
        self.players = players
    }

    // ฟังก์ชันเปรียบเทียบไพ่
    func compareHands(player1: PlayerHand, player2: PlayerHand) -> Int {
        // ตัวอย่างการเปรียบเทียบไพ่และคืนค่าผลลัพธ์ (คุณสามารถแก้ไขให้ตรงตามตรรกะของคุณ)
        return 0 // ตัวอย่างการคืนค่า
    }
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
                 
import Foundation

class GameLogic {
    var players: [Player]

    init(players: [Player]) {
        self.players = players
    }

    func compareHands(player1: Player, player2: Player) -> Int {
        // Logic เพื่อเปรียบเทียบไพ่ของทั้งสองผู้เล่น
        // คืนค่าเป็นผลลัพธ์จากการเปรียบเทียบ
        return 0 // ตัวอย่างการคืนค่า
    }
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

    static func idstraight(_ hand: [Card]) -> Bool {
    let ranks = hand.map { $0.rank.rawValue }.sorted()
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

class GameLogic {
    var players: [Player]

    init(players: [Player]) {
        self.players = players
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
}

func prepareNextRound() {
    // ตรวจสอบสถานะผู้เล่น
    players = players.filter { $0.isActive }

    if players.count < 2 {
        print("Not enough players to continue.")
        // อาจแสดงผล Game Over หรือรอเพิ่มผู้เล่น
    } else {
        print("Starting next round with
                 
