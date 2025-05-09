# 3Kong1Cigarette
#

// MARK: - Result Evaluation

func checkResult(for players: inout [Player]) {
    for i in 0..<players.count {
        let topScore = calculateHandScore(hand: players[i].cards[0], row: .head)
        let middleScore = calculateHandScore(hand: players[i].cards[1], row: .middle)
        let bottomScore = calculateHandScore(hand: players[i].cards[2], row: .tail)

        let totalScore = topScore + middleScore + bottomScore

        print("\(players[i].name) - Top: \(topScore), Middle: \(middleScore), Bottom: \(bottomScore), Total: \(totalScore)")
    }
}

func settleChips(players: inout [Player]) {
    var rawScores: [Int] = players.map {
        calculateHandScore(hand: $0.cards[0], row: .head) +
        calculateHandScore(hand: $0.cards[1], row: .middle) +
        calculateHandScore(hand: $0.cards[2], row: .tail)
    }

    for i in 0..<players.count {
        for j in i+1..<players.count {
            let diff = rawScores[i] - rawScores[j]
            if diff > 0 {
                players[i].chips += diff * 10
                players[j].chips -= diff * 10
            } else if diff < 0 {
                players[i].chips += diff * 10
                players[j].chips -= diff * 10
            }
        }
    }

    for player in players {
        print("\(player.name): \(player.chips) chips")
    }
}


let rankCounts = Dictionary(grouping: hand, by: { $0.rank }).mapValues { $0.count }
    return rankCounts.values.contains(4)
}
func isFullHouse(_ hand: [Card]) -> Bool {
    let rankCounts = Dictionary(grouping: hand, by: { $0.rank }).mapValues { $0.count }
    return rankCounts.values.contains(3) && rankCounts.values.contains(2)
}
func isFlush(_ hand: [Card]) -> Bool {
    return Set(hand.map { $0.suit }).count == 1
}
func isStraight(_ hand: [Card]) -> Bool {
    let sortedRanks = hand.map { $0.rank.rawValue }.sorted()
    let lowAce = [1, 2, 3, 4, 5]
    let highStraight = Array(sortedRanks.first!...sortedRanks.first! + hand.count - 1)
    return sortedRanks == lowAce || sortedRanks == highStraight
}
func isThreeOfAKind(_ hand: [Card]) -> Bool {
    let rankCounts = Dictionary(grouping: hand, by: { $0.rank }).mapValues { $0.count }
    return rankCounts.values.contains(3)
}
func isPair(_ hand: [Card]) -> Bool {
    let rankCounts = Dictionary(grouping: hand, by: { $0.rank }).mapValues { $0.count }
    return rankCounts.values.contains(2)
}

func isPairOfAces(_ hand: [Card]) -> Bool {
    let aces = hand.filter { $0.rank == .ace }
    return aces.count == 2
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
                 
let rawScores = [11, -7, -15, 11]
let stadium: Stadium = .Rookie
let selectedBet = 50

let results = ScoreManager.calculateMoneyScores(from: rawScores, stadium: stadium, selectedBet: selectedBet)
                 
for result in results {
    print("Player
          
let player1 = PlayerScore(playerName: "Player 1", rawScore: 11, stadium: .Rookie)
   print("
         