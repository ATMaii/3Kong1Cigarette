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
