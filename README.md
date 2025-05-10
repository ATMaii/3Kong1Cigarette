# 3Kong1Cigarette
#

https://github.com/facebook/facebook-ios-sdk


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
                 
         
