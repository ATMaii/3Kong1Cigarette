
// GameView.swift

import SwiftUI

struct GameView: View {
    @StateObject private var gameLogic = GameLogic(playerNames: ["Player 1", "Player 2", "Player 3", "Player 4"])
    
    var body: some View {
        VStack {
            Text("Game: 3kong1ciggalate")
                .font(.largeTitle)
                .padding()

            // Loop through each player and display their hand
            ForEach(gameLogic.players, id: \.name) { player in
                VStack(alignment: .leading) {
                    Text("

// GameView.swift

import SwiftUI

struct GameView: View {
    @StateObject private var gameLogic = GameLogic(playerNames: ["Player 1", "Player 2", "Player 3", "Player 4"])
    
    var body: some View {
        VStack {
            Text("Game: 3kong1ciggalate")
                .font(.largeTitle)
                .padding()

            // Loop through each player and display their hand
            ForEach(gameLogic.players, id: \.name) { player in
                VStack(alignment: .leading) {
                    Text("

                         
Button("แยกไพ่ 3 กอง") {
    for player in gameManager.players {
        let (head, middle, tail) = gameManager.splitIntoThreePiles(player: player)
        print("ผู้เล่นimport SwiftUI

struct GameView: View {
    @State private var deck = Deck()
    @State private var player = Player()
    
    var body: some View {
        VStack {
            Text("ไพ่ของผู้เล่น").font(.title)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(player.hand.sorted(by: cardSort), id: \.self) { card in
                        Text("

    // GameView.swift

import SwiftUI

struct GameView: View {
    @StateObject private var gameLogic = GameLogic(playerNames: ["Player 1", "Player 2", "Player 3", "Player 4"])
    
    var body: some View {
        VStack {
            Text("Game: 3kong1ciggalate")
                .font(.largeTitle)
                .padding()

            // Loop through each player and display their hand
            ForEach(gameLogic.players, id: \.name) { player in
                VStack(alignment: .leading) {
                    Text("

// GameView.swift

import SwiftUI

struct GameView: View {
    @StateObject private var gameLogic = GameLogic(playerNames: ["Player 1", "Player 2", "Player 3", "Player 4"])
    
    var body: some View {
        VStack {
            Text("Game: 3kong1ciggalate")
                .font(.largeTitle)
                .padding()

            // Loop through each player and display their hand
            ForEach(gameLogic.players, id: \.name) { player in
                VStack(alignment: .leading) {
                    Text("

// GameView.swift

import SwiftUI

struct GameView: View {
    @StateObject private var gameLogic = GameLogic(playerNames: ["Player 1", "Player 2", "Player 3", "Player 4"])
    @State private var gameStarted = false
    
    var body: some View {
        VStack {
            Text("Game: 3kong1ciggalate")
                .font(.largeTitle)
                .padding()

            if gameStarted {
                // Loop through each player and display their hand
                ForEach(gameLogic.players, id: \.name) { player in
                    VStack(alignment: .leading) {
                        Text("

                             
// GameView.swift

import SwiftUI

struct GameView: View {
    @StateObject private var gameManager = GameManager()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("3kong1ciggalate")
                .font(.largeTitle)
                .bold()

            ForEach(gameManager.players) { player in
                VStack {
                    Text(player.name)
                        .font(.headline)
                        .padding(.bottom, 4)
                    
                    HStack {
                        ForEach(player.hand.sorted(by: { ($0.suit.rawValue, $0.rank.rawValue) < ($1.suit.rawValue, $1.rank.rawValue) }), id: \.description) { card in
                            Text(card.description())
                                .padding(6)
                                .background(Color.white)
                                .cornerRadius(5)
                                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1))
                        }
                    }

                    Text("คะแนน:

VStack(alignment: .leading, spacing: 4) {
    Text("หัว:                       

@State var players: [Player] = []
@State var gameManager = GameManager()

var body: some View {
    VStack {
        Button("เริ่มเกมใหม่") {
            gameManager.startNewGame(&players)
        }

        ForEach(players.indices, id: \.self) { index in
            PlayerHandView(player: players[index])
        }

        Text("คะแนนรวม:
import SwiftUI

struct GameView: View {
    @State var player = Player()
    @State var deck = Deck()

var body: some View {
        VStack {
            HStack {
                Button("สุ่มไพ่") {
                    deck = Deck()
                    player.hand = []
                    for _ in 0..<13 {
                        if let card = deck.drawCard() {
                            player.hand.append(card)
                        }
                    }
                    player.hand.sort {
                        if $0.suit.rawValue == $1.suit.rawValue {
                            return $0.rank.rawValue < $1.rank.rawValue
                        }
                        return $0.suit.rawValue < $1.suit.rawValue
                    }
                }

                Button("แบ่ง 3 กอง") {
                    player.splitIntoPiles()
                }
            }
            .padding()

            Text("ไพ่ของผู้เล่น").font(.title2)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(player.hand, id: \.self) { card in
                        Text("

Button("เริ่มเกมใหม่") {
    gameManager.startNewGame()
   }                          

import SwiftUI

struct GameView: View {
    @StateObject private var gameManager = GameManager()

    var body: some View {
        VStack {
            ForEach(gameManager.players) { player in
                HStack {
                    Text("ผู้เล่น

import SwiftUI

struct GameView: View {
    @StateObject private var gameManager = GameManager()

    var body: some View {
        VStack {
            ForEach(gameManager.players) { player in
                VStack {
                    Text("ผู้เล่น

import SwiftUI

struct GameView: View {
    @StateObject private var gameManager = GameManager()

    var body: some View {
        VStack {
            ForEach(gameManager.players) { player in
                VStack {
                    Text("ผู้เล่น

import SwiftUI

struct GameView: View {
    @StateObject private var gameManager = GameManager()

    var body: some View {
        VStack {
            // แสดงไพ่และคะแนนของผู้เล่น
            ForEach(gameManager.players) { player in
                VStack {
                    Text("ผู้เล่น

  Button("แยกไพ่ 3 กอง") {
    for player in gameManager.players {
        let (head, middle, tail) = gameManager.splitIntoThreePiles(player: player)
        print("ผู้เล่น                       

        VStack {
    ForEach(players.indices, id: \.self) { index in
        VStack(alignment: .leading) {
            Text("ผู้เล่น

                 
struct GameView: View {
    @ObservedObject var gameManager = GameManager.shared

    var body: some View {
        VStack {
            ForEach(gameManager.players.indices, id: \.self) { index in
                VStack(alignment: .leading) {
                    Text("ผู้เล่น


struct DraggableCard: View {
    let card: Card
    var body: some View {
        Text(card.display) // สมมุติว่าคุณมี display สำหรับ Card
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 2)
            .onDrag {
                return NSItemProvider(object: NSString(string: "

import SwiftUI

class GameTimer: ObservableObject {
    @Published var secondsRemaining: Int = 120 // เปลี่ยนเป็น 120 วินาที
    var timer: Timer?
    var isRunning = false

    func start() {
        if isRunning { return } // ห้ามเริ่มใหม่ถ้ากำลังจับเวลาอยู่
        isRunning = true
        secondsRemaining = 120 // รีเซ็ตเวลาให้กลับไปที่ 120 วินาที
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.secondsRemaining > 0 {
                self.secondsRemaining -= 1
            } else {
                self.stop() // หยุดเวลาเมื่อหมดเวลา
            }
        }
    }

    func stop() {
        timer?.invalidate() // หยุดจับเวลา
        isRunning = false
    }

    func reset() {
        stop()
        secondsRemaining = 120 // รีเซ็ตเวลาเป็น 120 วินาที
    }
}

struct GameView: View {
    @StateObject var gameTimer = GameTimer()
    
    @State private var isGameStarted = false
    
    var body: some View {
        VStack {
            // แสดงเวลาที่เหลือ
            Text("Time Remaining:

                 
@StateObject var gameTimer = GameTimer()

var body: some View {
    VStack {
        // แสดงเวลาที่เหลือ
        Text("เวลาที่เหลือ:
             
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

import SwiftUI

struct GameView: View {
    @State private var timeRemaining = 120 // ตั้งเวลาเริ่มต้นเป็น 120 วินาที
    @State private var timerIsActive = false
    @State private var showTimeUpAlert = false
    @State private var gameFinished = false
    @State private var winner: String = ""
    @State private var scores: [String: Int] = [:]  // สร้าง dictionary เก็บคะแนนของผู้เล่น
    
    let gameManager = GameManager()

    // ฟังก์ชั่นเริ่มนับเวลา
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
    @State private var timeRemaining = 120 // ตั้งเวลาเริ่มต้นเป็น 120 วินาที
    @State private var timerIsActive = false
    @State private var showTimeUpAlert = false
    @State private var gameFinished = false
    @State private var winner: String = ""
    @State private var scores: [String: Int] = [:]  // สร้าง dictionary เก็บคะแนนของผู้เล่น
    
    let gameManager = GameManager()

    // ฟังก์ชั่นเริ่มนับเวลา
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
    @State private var timeRemaining = 120 // ตั้งเวลาเริ่มต้นเป็น 120 วินาที
    @State private var timerIsActive = false
    @State private var showTimeUpAlert = false
    @State private var gameFinished = false
    @State private var winner: String = ""
    @State private var scores: [String: Int] = [:]  // สร้าง dictionary เก็บคะแนนของผู้เล่น
    
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
        calculateScores()  // คำนวณคะแนนหลังเวลาหมด
    }
    
    func finishGame() {
        // เมื่อผู้เล่นกด "จัดเสร็จแล้ว" ให้หยุดเวลาและไปขั้นตอนถัดไป
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
            // แสดงเวลา
            Text("เวลาที่เหลือ:

import SwiftUI

struct GameView: View {
    @State private var timeRemaining = 120 // ตั้งเวลาเริ่มต้นเป็น 120 วินาที
    @State private var timerIsActive = false
    @State private var showTimeUpAlert = false
    @State private var gameFinished = false
    @State private var winner: String = ""
    @State private var scores: [String: Int] = [:]  // สร้าง dictionary เก็บคะแนนของผู้เล่น
    
    let gameManager = GameManager()

    // ฟังก์ชั่นเริ่มนับเวลา
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

// เพิ่มปุ่มเมื่อเกมจบ
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
                ForEach(arrangedCards[0], id: \.id) { card in
                    Text("

   func evaluateHand(cards: [Card]) -> Int {
    if isStraightFlush(cards) {
        return 9 // Straight Flush (สูงสุด)
    } else if isFourOfAKind(cards) {
        return 8 // Four of a Kind
    } else if isFullHouse(cards) {
        return 7 // Full House
    } else if isFlush(cards) {
        return 6 // Flush
    } else if isStraight(cards) {
        return 5 // Straight
    } else if isThreeOfAKind(cards) {
        return 4 // Three of a Kind
    } else if isTwoPair(cards) {
        return 3 // Two Pair
    } else if isPair(cards) {
        return 2 // Pair
    } else {
        return 1 // High Card
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

    let totalScore = topScore + middleScore + bottomScore // รวมคะแนนจากทั้ง 3 แถว
    
    // แสดงผลคะแนน
    print("Top Score:

// ตัวอย่างการคำนวณคะแนนในกรณีที่ผู้เล่นชนะ
func calculateScore(hand: [Card], isWinner: Bool) -> Int {
    let handRank = evaluateHand(cards: hand) // ใช้ evaluateHand ที่เราทำไปก่อนหน้านี้
    let baseScore = handRank * 100 // สมมุติว่า 1 คะแนน = 100

    // ถ้าผู้เล่นชนะ
    if isWinner {
        return baseScore * 2 // คูณคะแนน 2 เท่าถ้าชนะ
    } else {
        return baseScore
    }
}

func calculateScore(hand: [Card], isWinner: Bool, isWinnerForAllHands: Bool) -> Int {
    let handRank = evaluateHand(cards: hand) // ใช้ evaluateHand ที่เราทำไปก่อนหน้านี้
    let baseScore = handRank * 100 // สมมุติว่า 1 คะแนน = 100

    // ถ้าผู้เล่นชนะทั้ง 3 กอง
    if isWinnerForAllHands {
        return baseScore * 4 // คูณคะแนน 4 เท่าถ้าชนะทั้ง 3 กอง
    } else if isWinner {
        return baseScore * 2 // คูณคะแนน 2 เท่าถ้าชนะ
    } else {
        return baseScore
    }
}

          let playerHand: [Card] = ... // มือไพ่ของผู้เล่น
          let isWinnerForAllHands = true // สมมุติว่าผู้เล่นชนะทั้ง 3 กอง
          let isWinner = true // สมมุติว่าผู้เล่นชนะในกองของตัวเอง

          let finalScore = calculateScore(hand: playerHand, isWinner: isWinner, isWinnerForAllHands: isWinnerForAllHands)

func calculateScoreForAllHands(playerHands: [[Card]], winningHands: [Bool]) -> Int {
    var totalScore = 0
    var totalWins = 0
    
    // เปรียบเทียบไพ่ในแต่ละกอง
    for (index, hand) in playerHands.enumerated() {
        let handRank = evaluateHand(cards: hand) // ฟังก์ชันที่ใช้ประเมินมือไพ่
        let baseScore = handRank * 100 // คะแนนพื้นฐาน (สามารถปรับให้เป็นตัวเลขที่ต้องการ)
        
        // เช็คว่าชนะในกองนี้หรือไม่
        if winningHands[index] {
            totalScore += baseScore
            totalWins += 1
        }
    }
    
    // ถ้าชนะทั้ง 3 ขา (หมายถึง totalWins = 3)
    if totalWins == 3 {
        return totalScore * 4 // คูณ 4 เมื่อชนะทั้งหมด
    } else {
        return totalScore
    }
}

          let playerHands = [
    [Card(rank: .five, suit: .hearts), Card(rank: .three, suit: .spades), Card(rank: .nine, suit: .diamonds)], // ท้าย
    [Card(rank: .jack, suit: .hearts), Card(rank: .king, suit: .clubs), Card(rank: .ace, suit: .spades)], // กลาง
    [Card(rank: .queen, suit: .hearts), Card(rank: .seven, suit: .diamonds), Card(rank: .four, suit: .spades)] // หัว
]

let winningHands = [true, true, true] // สมมุติว่าผู้เล่นชนะทั้ง 3 กอง

let finalScore = calculateScoreForAllHands(playerHands: playerHands, winningHands: winningHands)
print("Total score:

      
func calculateHandScore(hand: [Card], row: RowPosition) -> Int {
    var score = 0

    if isRoyalFlush(hand) {
        score = 7
        if row == .middle { score *= 2 }
    } else if isStraightFlush(hand) {
        score = 6
        if row == .middle { score *= 2 }
    } else if isFourOfAKind(hand) {
        score = 5
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
      
let playerHand = [/* ชุดไพ่ของผู้เล่น */]
let score = calculateHandScore(hand: playerHand, row: .head) // หรือ .middle / .tail
      
// ฟังก์ชันตรวจสอบว่าเป็นหัวคู่ A หรือไม่
func isPairOfAces(hand: [Card]) -> Bool {
    // ตรวจสอบว่ามีไพ่ A 2 ใบหรือไม่
    let aceCards = hand.filter { $0.rank == .ace }
    return aceCards.count == 2
}

// ฟังก์ชันตรวจสอบว่าเป็นหัวตองหรือไม่
func isThreeOfAKind(hand: [Card]) -> Bool {
    let groupedByRank = Dictionary(grouping: hand, by: { $0.rank })
    return groupedByRank.values.contains { $0.count == 3 }
}

let playerHand = [/* ชุดไพ่ของผู้เล่น */]
let isHeadRow = true // หรือ false ขึ้นอยู่กับว่าเป็นแถวไหน
let score = calculateHandScore(hand: playerHand, isHeadRow: isHeadRow)

func isRoyalFlush(_ hand: [Card]) -> Bool {
    return isStraightFlush(hand) && hand.contains(where: { $0.rank == .ace })
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


enum RowPosition {
    case head
    case middle
    case tail
}

func calculateHandScore(hand: [Card], row: RowPosition) -> Int {
    var score = 0

    if isRoyalFlush(hand) {
        score = 7
        if row == .middle { score *= 2 }
    } else if isStraightFlush(hand) {
        score = 6
        if row == .middle { score *= 2 }
    } else if isFourOfAKind(hand) {
        score = 5
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

// เรียกใช้งาน
let playerHand = [/* ชุดไพ่ของผู้เล่น */]
let score = calculateHandScore(hand: playerHand, row: .head)

// สร้างไพ่ตัวอย่าง
let playerHand: [Card] = [/* ใส่ไพ่ที่ต้องการทดสอบ */]

// ทดสอบแถวต่างๆ
let headScore = calculateHandScore(hand: playerHand, row: .head)
let middleScore = calculateHandScore(hand: playerHand, row: .middle)
let tailScore = calculateHandScore(hand: playerHand, row: .tail)

print("Head Row Score:
