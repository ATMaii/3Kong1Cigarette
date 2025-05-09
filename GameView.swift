// MARK: - Models

enum Suit: String, CaseIterable { ... }

enum Rank: Int, CaseIterable, Comparable { ... }

struct Card: Identifiable, Equatable { ... }

// MARK: - GameView

struct GameView: View {
    ...
}

import SwiftUI
import Foundation

// MARK: - Card Model

enum Suit: String, CaseIterable {
    case hearts = "♥"
    case diamonds = "♦"
    case clubs = "♣"
    case spades = "♠"
}

enum Rank: Int, CaseIterable, Comparable {
    case two = 2, three, four, five, six, seven, eight, nine, ten
    case jack = 11, queen, king, ace = 14

    var display: String {
        switch self {
        case .jack: return "J"
        case .queen: return "Q"
        case .king: return "K"
        case .ace: return "A"
        default: return String(self.rawValue)
        }
    }

    static func < (lhs: Rank, rhs: Rank) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

struct Card: Identifiable, Equatable {
    let id = UUID()
    let suit: Suit
    let rank: Rank

    var description: String {
        return "

import Foundation

enum RowPosition {
    case head, middle, tail
}

struct Card: Equatable {
    enum Suit: String, CaseIterable {
        case hearts, diamonds, clubs, spades
    }

    enum Rank: Int, Comparable, CaseIterable {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack = 11, queen, king, ace = 14

        static func < (lhs: Rank, rhs: Rank) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }
    }

    let rank: Rank
    let suit: Suit
}

// MARK: - Evaluation Functions

func isRoyalFlush(_ hand: [Card]) -> Bool {
    return isStraightFlush(hand) && hand.contains { $0.rank == .ace }
}

func isStraightFlush(_ hand: [Card]) -> Bool {
    return isFlush(hand) && isStraight(hand)
}

func isFourOfAKind(_ hand: [Card]) -> Bool {
    let rankCounts = Dictionary(grouping: hand, by: { $0.rank }).mapValues { $0.count }
    return rankCounts.values.contains(4)
}

func isFullHouse(_ hand: [Card]) -> Bool {
    let rankCounts = Dictionary(grouping: hand, by: { $0.rank }).mapValues { $0.count }
    return rankCounts.values.contains(3) && rankCounts.values.contains(2)
}

func isFullHouseOfAces(_ hand: [Card]) -> Bool {
    let grouped = Dictionary(grouping: hand, by: { $0.rank })
    return grouped[.ace]?.count == 3 && grouped.values.contains { $0.count == 2 }
}

func isFlush(_ hand: [Card]) -> Bool {
    return Set(hand.map { $0.suit }).count == 1
}

func isStraight(_ hand: [Card]) -> Bool {
    let sortedRanks = hand.map { $0.rank.rawValue }.sorted()
    let lowAce = [2, 3, 4, 5, 14] // Ace low straight
    let highStraight = Array(sortedRanks.first!...sortedRanks.first! + hand.count - 1)
    return sortedRanks == lowAce || sortedRanks == highStraight
}

func isThreeOfAKind(_ hand: [Card]) -> Bool {
    let rankCounts = Dictionary(grouping: hand, by: { $0.rank }).mapValues { $0.count }
    return rankCounts.values.contains(3)
}

func isTwoPair(_ hand: [Card]) -> Bool {
    let rankCounts = Dictionary(grouping: hand, by: { $0.rank }).mapValues { $0.count }
    return rankCounts.values.filter { $0 == 2 }.count == 2
}

func isPair(_ hand: [Card]) -> Bool {
    let rankCounts = Dictionary(grouping: hand, by: { $0.rank }).mapValues { $0.count }
    return rankCounts.values.contains(2)
}

func isPairOfAces(_ hand: [Card]) -> Bool {
    let aces = hand.filter { $0.rank == .ace }
    return aces.count == 2
}

// MARK: - Score Calculation

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

    return score
}

// MARK: - Result Evaluation

func checkResult() {
    // ประเมินแถวต่าง ๆ
    let topScore = calculateHandScore(hand: arrangedCards[0], row: .head)
    let middleScore = calculateHandScore(hand: arrangedCards[1], row: .middle)
    let bottomScore = calculateHandScore(hand: arrangedCards[2], row: .tail)

    // รวมคะแนนจากทั้ง 3 แถว
    let totalScore = topScore + middleScore + bottomScore

    // แสดงผลคะแนน
    print("Top Score: \(topScore)")
    print("Middle Score: \(middleScore)")
    print("Bottom Score: \(bottomScore)")
    print("Total Score: \(totalScore)")
}

let results = ScoreManager.calculateMoneyScores(from: rawScores, stadium: stadium, selectedBet: selectedBet)



        }
    }
    // ฟังก์ชั่นเมื่อเวลาหมด
    func timeUp() {
        showTimeUpAlert = true
        gameFinished = true
        calculateScores()  // คำนวณคะแนนหลังเวลาหมด
    }
    // ฟังก์ชั่นเมื่อผู้เล่นกด "จัดเสร็จแล้ว"
    func finishGame() {
        timerIsActive = false
        gameFinished = true
        calculateScores()  // คำนวณคะแนนหลังจากผู้เล่นกดจัดเสร็จแล้ว
    }
    // ฟังก์ชั่นคำนวณคะแนน
    func calculateScores() {
        // คำนวณคะแนนของผู้เล่น (ตัวอย่างง่าย ๆ)
        // สมมุติว่าเกมนี้คำนวณคะแนนเป็นการสุ่ม
        scores = ["Player 1": Int.random(in: 0...100),
                  "Player 2": Int.random(in: 0...100),
                  "Player 3": Int.random(in: 0...100),
                  "Player 4": Int.random(in: 0...100)]
        
        // หาผู้ชนะ
        if let winnerPlayer = scores.max(by: { $0.value < $1.value }) {
            winner = winnerPlayer.key
        }
    }
    var body: some View {
        VStack {
            if !gameFinished {
                // แสดงเวลา
                Text("เวลาที่เหลือ:
                     
import SwiftUI

struct GameView: View {
    @State private var player3Cards: [Card] = [] // เก็บไพ่ของผู้เล่น
    @State private var arrangedCards: [[Card]] = [[], [], []] // แถวหัว, กลาง, ท้าย
    @State private var timer: Timer? // ตัวจับเวลา
    @State private var timeLeft = 120 // เวลานับถอยหลัง 120 วินาที
// ฟังก์ชั่นเริ่มเกมใหม่
func startNewGame() {
    let shuffledDeck = CardDeck.allCards.shuffled() // สุ่มไพ่ทั้งหมด
        player3Cards = Array(shuffledDeck[0..<13]) // แจกไพ่ 13 ใบให้ผู้เล่น
        arrangedCards = [[], [], []] // รีเซ็ตการจัดไพ่
        timeLeft = 120 // รีเซ็ตเวลา
        startTimer() // เริ่มจับเวลา
    }
    // ฟังก์ชั่นจับเวลา
    func startTimer() {
        timer?.invalidate() // ยกเลิกการจับเวลาครั้งก่อน
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeLeft > 0 {
                timeLeft -= 1
            }
        }
    }
    // ฟังก์ชั่นสำหรับการลากไพ่
    func onDrag(card: Card) -> some Gesture {
        return DragGesture()
            .onChanged { value in
                // อัพเดตตำแหน่งขณะลาก
            }
            .onEnded { value in
                // เมื่อไพ่ปล่อย ให้คำนวณตำแหน่งที่วาง
                if value.location.y < 100 {
                    self.arrangedCards[0].append(card)  // วางในแถวหัว
                } else if value.location.y < 200 {
                    self.arrangedCards[1].append(card)  // วางในแถวกลาง
                } else {
                    self.arrangedCards[2].append(card)  // วางในแถวท้าย
                }
            }
    }
    var body: some View {
        VStack {
            // แถวหัว (3 ใบ)
            HStack {
                ForEach(arrangedCards[0], id: \.id) { card in }
                    Text("
let score = evaluateHand(cards: player.hand)
print("คะแนนของผู้เล่น:

import SwiftUI
           
struct GameView: View {
    @ObservedObject var gameManager = GameManager.shared

    var body: some View {
        VStack {
            ForEach(gameManager.players.indices, id: \.self) { index in
                VStack(alignment: .leading) {
                    Text("ผู้เล่น
// ฟังก์ชั่นเริ่มเกมใหม่
import SwiftUI
                 
struct GameView: View {
    @State private var timeRemaining = 120 // ตั้งเวลาเริ่มต้นเป็น 120 วินาที
    @State private var timerIsActive = false
    @State private var showTimeUpAlert = false
    @State private var gameFinished = false
    
    let gameManager = GameManager()
    
// สร้างตัวจับเวลา
func startTimer() {
        if timerIsActive { return }
        timerIsActive = true
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                timer.invalidate()
                self.timeUp() // เรียกฟังก์ชั่นเมื่อเวลาหมด
            }
        }
    }
    func timeUp() {
        showTimeUpAlert = true
        gameFinished = true
    }
    func finishGame() {
        // เมื่อผู้เล่นกด "จัดเสร็จแล้ว" ให้หยุดเวลาและไปขั้นตอนถัดไป
        timerIsActive = false
        gameFinished = true
    }
    var body: some View {
        VStack {
            // แสดงเวลา
            Text("เวลาที่เหลือ:
                 
func startNewGame() {
    let shuffledDeck = CardDeck.allCards.shuffled() // สุ่มไพ่ทั้งหมด
        player3Cards = Array(shuffledDeck[0..<13]) // แจกไพ่ 13 ใบให้ผู้เล่น 
        arrangedCards = [[], [], []] // รีเซ็ตการจัดไพ่
        timeLeft = 120 // รีเซ็ตเวลา
        startTimer() // เริ่มจับเวลา
    }                
    // ฟังก์ชั่นจับเวลา
    func startTimer() {
        timer?.invalidate() // ยกเลิกการจับเวลาครั้งก่อน
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeLeft > 0 {
                timeLeft -= 1
            }
        }
    }
    // ฟังก์ชั่นสำหรับการลากไพ่
    func onDrag(card: Card) -> some Gesture {
        return DragGesture()
            .onChanged { value in
                // อัพเดตตำแหน่งขณะลาก
            }
            .onEnded { value in
                // เมื่อไพ่ปล่อย ให้คำนวณตำแหน่งที่วาง
                if value.location.y < 100 {
                    self.arrangedCards[0].append(card)  // วางในแถวหัว
                } else if value.location.y < 200 {
                    self.arrangedCards[1].append(card)  // วางในแถวกลาง
                } else {
                    self.arrangedCards[2].append(card)  // วางในแถวท้าย
                }
            }
    }
    var body: some View {
        VStack {
            // แถวหัว (3 ใบ)
            HStack {
                ForEach(arrangedCards[0], id: \.id) { card in }
                    Text("

// เพิ่มปุ่มเมื่อเกมจบ
import SwiftUI
                     
struct GameEndView: View {
    @Binding var isGameOver: Bool
    @Binding var isGameActive: Bool

    var body: some View {
        VStack {
            Text("เกมจบแล้ว!")
                .font(.title)
            HStack {
                Button("เล่นต่อ") {
                    isGameActive = true
                    isGameOver = false
                    // เริ่มเกมใหม่
                    startNewGame() // ฟังก์ชันเริ่มเกมใหม่
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)

                Button("ออกจากเกม") {
                    isGameOver = false
                    // ออกจากเกม
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
    }
}                
@State private var isGameOver = false
@State private var isGameActive = true
                     
var body: some View {
    VStack {
        if isGameOver {
            GameEndView(isGameOver: $isGameOver, isGameActive: $isGameActive)
        } else {
            // แสดงส่วนของเกม เช่น การเล่น การแจกไพ่
            // เมื่อเกมจบ ก็จะเปลี่ยน `isGameOver` เป็น true
        }
    }
}
                         
let score = evaluateHand(cards: player.hand)
print("คะแนนของผู้เล่น:
func evaluateHand(cards: [Card]) -> Int {
    if isRoyalFlush(cards) {
       print ("Royal Flush")
       return 10 //  (สูงสุด)
    } else if isStraightFlush(cards) {
        print("Straight Flush")
        return 9
    } else if isFourOfAKind(cards) {
        print("Four of a Kind")
        return 8
    } else if isFullHouse(cards) {
        print("Full House")
        return 7
    } else if isFlush(cards) {
        print("Flush")
        return 6
    } else if isStraight(cards) {
        print("Straight")
        return 5
    } else if isThreeOfAKind(cards) {
        print("Three of a Kind")
        return 4
    } else if isTwoPair(cards) {
        print("Two Pair")
        return 3
    } else if isPair(cards) {
        print("Pair")
        return 2
    } else {
        print("High Card")
        return 1
    }
}
        
func isStraightFlush(_ cards: [Card]) -> Bool {
    let sortedCards = cards.sorted { $0.rank.rawValue < $1.rank.rawValue }
    let sameSuit = Set(cards.map { $0.suit }).count == 1 // ตรวจสอบว่าเป็นดอกเดียวกัน
    let consecutive = sortedCards.enumerated().allSatisfy { (index, card) in
        index == 0 || card.rank.rawValue == sortedCards[index - 1].rank.rawValue + 1
    }
    return sameSuit && consecutive
}                    
func isFourOfAKind(_ cards: [Card]) -> Bool {
    let grouped = Dictionary(grouping: cards, by: { $0.rank })
    return grouped.values.contains { $0.count == 4 }
}          
func isFullHouse(_ cards: [Card]) -> Bool {
    // ตัวอย่างการตรวจสอบ Full House
    return false // เพิ่มการตรวจสอบ Full House ที่นี่
}
func isStraight(_ cards: [Card]) -> Bool {
    // ตัวอย่างการตรวจสอบ Straight
    return false // เพิ่มการตรวจสอบ Straight ที่นี่
}
func isFlush(_ cards: [Card]) -> Bool {
    // ตัวอย่างการตรวจสอบ Flush
    return false // เพิ่มการตรวจสอบ Flush ที่นี่
}
func isThreeOfAKind(_ cards: [Card]) -> Bool {
    // ตัวอย่างการตรวจสอบ Three of a Kind
    return false // เพิ่มการตรวจสอบ Three of a Kind ที่นี่
}
func isPair(_ cards: [Card]) -> Bool {
    // ตัวอย่างการตรวจสอบ Pair
    return false // เพิ่มการตรวจสอบ Pair ที่นี่
}
func checkResult() {
    // ประเมินแถวต่าง ๆ
    let topScore = evaluateHand(cards: arrangedCards[0]) // แถวหัว
    let middleScore = evaluateHand(cards: arrangedCards[1]) // แถวกลาง
    let bottomScore = evaluateHand(cards: arrangedCards[2]) // แถวท้าย
}
    let totalScore = topScore + middleScore + bottomScore // รวมคะแนนจากทั้ง 3 แถว
    // แสดงผลคะแนน
    print("Top Score:


