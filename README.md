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



         
