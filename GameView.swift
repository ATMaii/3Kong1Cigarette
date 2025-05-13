// MARK: - Models

import SwiftUI
import Foundation

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

    var display: String {
        return "\(rank.display)\(suit.rawValue)"
    }
}

// MARK: - Views


import SwiftUI
import Foundation

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

    var display: String {
        return "\(rank.display)\(suit.rawValue)"
    }
}

// MARK: - Views

import SwiftUI

struct GameView: View {
    @StateObject var viewModel = GameViewModel()

    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()

            VStack {
                Spacer()

                // มงกุฎกลางโต๊ะ
                Image(systemName: "crown.fill")
                    .resizable()
                    .frame(width: 80, height: 60)
                    .foregroundColor(.yellow)
                    .padding(.bottom, 100)

                Spacer()
   
                if viewModel.hasStarted {
            // ไพ่ของผู้เล่นด้านล่าง + ปุ่ม 《》
            VStack(spacing: 8) {
                ForEach(HandType.allCases, id: \.self) { type in
                    HStack(spacing: -20) {
                        ForEach(viewModel.handByType[type] ?? []) { card in
                            CardView(card: card)
                        }
                        // ปุ่ม 《》 อยู่ในแนวเดียวกับไพ่
                        if type == .back {
                            Button(action: {
                                viewModel.toggleSort()
                            }) {
                                Text("《》")
                                    .font(.title)
                                    .padding(10)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            .padding(.leading, 8)
                        }
                    }
                }
            }
            .padding(.bottom, 16)
        }
    }

    // ปุ่ม ∞ แยกออกมาด้านล่างขวา แนวตั้ง
    VStack {
        Spacer()
        HStack {
            Spacer()
            Button(action: {
                viewModel.autoArrange()
            }) {
                Text("∞")
                    .font(.largeTitle)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.trailing, 16)
            .padding(.bottom, 100) // ให้สูงกว่าไพ่หน่อย
        }
            .onAppear {
    viewModel.loadPlayers()
    viewModel.startGame()
            }
     .onChange(of: viewModel.players.count) { count in
    if count == 4 {
        viewModel.startGame()                         
        }
    }
        
    struct GameView: View {
        @StateObject var viewModel = GameViewModel()
    @State private var isMenuOpen = false
    @State private var currentTime: String = ""

    var body: some View {
        ZStack(alignment: .topLeading) {
            GameContentView()
            // ปุ่ม 3 ขีด + เวลา
            VStack(alignment: .leading, spacing: 4) {
                // ปุ่ม 3 ขีด
                Button(action: {
                    isMenuOpen.toggle()
                }) {
                    Text("≡")
                        .font(.largeTitle)
                        .padding(8)
                        .background(Color.black.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                // เวลา
                Text(Self.formatter.string(from: currentTime))
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(6)
            }
            .padding(.leading, 12)
            .padding(.top, 20)

            // เมนู overlay เมื่อกดปุ่ม 3 ขีด
            if isMenuOpen {
                VStack(alignment: .leading, spacing: 12) {
                    Button("《 ออกจากเกมส์") {
                        // ทำสิ่งที่ต้องการเมื่อกด Exit
                    }
                    // เพิ่มเมนูอื่น ๆ ได้ที่นี่
                }
                .padding()
                .background(Color.black.opacity(0.8))
                .cornerRadius(12)
                .frame(maxWidth: 150)
                .position(x: 100, y: 100) // อยู่ข้างใต้ปุ่ม ≡
            }
        }
        .onAppear {
    updateTime()
    Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
        updateTime()
    }
        }
    func updateTime() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            self.currentTime = formatter.string(from: Date())
                                                                 }
    }
struct GameView: View {
    @StateObject private var gameLogic = GameLogic(playerNames: ["Player 1", "Player 2", "Player 3", "Player 4"])
    @State private var gameStarted = false
    @State private var isGameOver = false
    @State private var isGameActive = true
    @State private var timeRemaining = 120
    @State private var timer: Timer?

    var body: some View {
        VStack {
            Text("Game:3กอง")
                .font(.largeTitle)
                .padding()

            if !gameStarted {
                Button("Start") {
                    gameLogic.startNewGame()
                    gameStarted = true
                    startTimer()
                }
                .padding()
            }

            if gameStarted && isGameActive {
                let player3 = gameLogic.players[2] // ผู้เล่นหลัก

                VStack(spacing: 40) {
     // แถวหัว (3 ช่อง)
                    CardRowView(title: " ", cards: player3.headCards)
                        .onDrop(of: [UTType.text], isTargeted: nil) { providers in
                            handleDrop(providers: providers, target: .head)
                        }

                    // แถวกลาง (5 ช่อง)
                    CardRowView(title: " ", cards: player3.middleCards)
                        .onDrop(of: [UTType.text], isTargeted: nil) { providers in
                            handleDrop(providers: providers, target: .middle)
                        }

                    // แถวท้าย (5 ช่อง)
                    CardRowView(title: " ", cards: player3.tailCards)
                        .onDrop(of: [UTType.text], isTargeted: nil) { providers in
                            handleDrop(providers: providers, target: .tail)
                        }

                    Divider()

                    // ไพ่ที่ยังไม่ได้จัด
                    Text(" ")
                        .font(.headline)
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(player3.unarrangedCards, id: \.id) { card in
                                DraggableCard(card: card)
                                    .gesture(dragGesture(for: card))
                            }
                        }
                        .padding()
                    }

                    Button("Done") {
                        // บันทึกการจัดไพ่
                        isGameActive = false
                        isGameOver = true
                        timer?.invalidate()
                    }
                    .padding(.top)
                }
                .padding()

                Text("เวลาที่เหลือ:\(timeRemaining)")
            }

        }
        .alert(isPresented: $showScorePopup) {
            Alert(title: Text("Score"), message: Text(scoreSummary()), dismissButton: .default(Text("Ok")))
        }
}
    private func dragGesture(for card: Card) -> some Gesture {
        DragGesture()
            .onEnded { value in
                let y = value.location.y
                if y < 200 {
                    gameLogic.players[2].headCards.append(card)
                } else if y < 400 {
                    gameLogic.players[2].middleCards.append(card)
                } else {
                    gameLogic.players[2].tailCards.append(card)
                }
                gameLogic.players[2].unarrangedCards.removeAll { $0.id == card.id }
            }
    }

    private func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer?.invalidate()
                isGameActive = false
                isGameOver = true
                autoArrangeCards()
            }
        }
    }

    private func autoArrangeCards() {
        var player = gameLogic.players[2]
        let sorted = player.unarrangedCards.sorted { $0.rank.rawValue > $1.rank.rawValue }

        player.headCards = Array(sorted.prefix(3))
        player.middleCards = Array(sorted.dropFirst(3).prefix(5))
        player.tailCards = Array(sorted.dropFirst(8).prefix(5))
        player.unarrangedCards = []

        gameLogic.players[2] = player
    }
   private func calculateScores() {
        var scores: [String: Int] = [:]
        let players = gameLogic.players
        for i in 0..<players.count {
            var score = 0
            for j in 0..<players.count where i != j {
                score += gameLogic.compareHands(player1: players[i], player2: players[j])
            }
            scores[players[i].name] = score
        }
        finalScores = scores
    }

    private func scoreSummary() -> String {
        finalScores.map { "\($0.key): \($0.value) แต้ม" }.joined(separator: "\n")
    }
}

// MARK: - Components

struct CardRowView: View {
    let title: String
    let cards: [Card]

    var body: some View {
        VStack {
            Text(title)
                .font(.title2)
            HStack {
                ForEach(cards, id: \ .id) { card in
                    Text(card.display)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 2)
                }
            }
        }
    }
}

struct DraggableCard: View {
    let card: Card

    var body: some View {
        Text(card.display)
            .padding()
            .background(Color.yellow)
            .cornerRadius(8)
            .shadow(radius: 2)
            .onDrag {
                NSItemProvider(object: NSString(string: card.display))
            }
    }
}

func finishGame() {
    timer?.invalidate()
    isGameActive = false

    gameLogic.calculateScores() // <- ฟังก์ชันนี้คุณควรสร้างใน GameLogic.swift

    isGameOver = true
}

struct GameEndView: View {
    @Binding var isGameOver: Bool
    @Binding var isGameActive: Bool
    var results: [PlayerResult] // สมมุติ struct ที่เก็บคะแนนแต่ละคน

    var body: some View {
        VStack {
            Text("ผลคะแนน")
                .font(.title)

            ForEach(results, id: \.name) { result in
                HStack {
                    Text(result.name)
                    Spacer()
                    Text("
                         
struct DraggableCard: View {
    let card: Card
    
    var body: some View {
        Text(card.display)
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 2)
            .onDrag {
                return NSItemProvider(object: NSString(string: card.display))
            }
    }
}
            
import SwiftUI

struct GameView: View {
    @StateObject private var gameLogic = GameLogic(playerNames: ["Player 1", "Player 2", "Player 3", "Player 4"])
    @State private var gameStarted = false
    @State private var isGameOver = false
    @State private var isGameActive = true
    @State private var timeRemaining = 120
    @State private var timer: Timer?

    var body: some View {
        VStack {
            Text("Game:3กอง")
                .font(.largeTitle)
                .padding()

            if !gameStarted {
                Button("Start") {
                    gameLogic.startNewGame()
                    gameStarted = true
                    startTimer()
                }
                .padding()
            }

            if gameStarted && isGameActive {
                let player1 = gameLogic.players[2] // สมมุติว่า Player 3 คือตัวเรา

                VStack {
                    // Top bar
                    HStack {
                        Button("Exit") {
                            // ออกจากเกม
                        }

struct GameView: View {
    @StateObject private var gameLogic = GameLogic(playerNames: ["Player 1", "Player 2", "Player 3", "Player 4"])
    @State private var gameStarted = false
    @State private var timeRemaining = 120
    @State private var timer: Timer?
    @State private var isGameOver = false
    @State private var isGameActive = true

    var body: some View {
        VStack {
            Text("Game:3กอง")
                .font(.largeTitle)
                .padding()

            if !gameStarted {
                Button("Start") {
                    gameLogic.startNewGame()
                    gameStarted = true
                    startTimer()
                }
                .padding()
            }

            if gameStarted && isGameActive {
                Text("เวลาที่เหลือ: \(timeRemaining) วินาที")
                    .font(.headline)

                ForEach(gameLogic.players, id: \.\u0000name) { player in
                    VStack(alignment: .leading) {
                        Text(player.name)
                            .font(.title2)
                            .padding(.bottom, 4)

                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(player.hand, id: \.self) { card in
                                    DraggableCard(card: card)
                                }
                            }
                        }
                    }
                    .padding(.bottom)
                }

                Button("Done") {
                    finishGame()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }

            if isGameOver {
                GameEndView(isGameOver: $isGameOver, isGameActive: $isGameActive)
            }
        }
        .onDisappear {
            timer?.invalidate()
        }
    }

func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer?.invalidate()
                finishGame()
            }
        }
    }

func finishGame() {
        timer?.invalidate()
        isGameOver = true
        isGameActive = false
    }
}
                       
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
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)

                Button("ออกจากเกม") {
                    isGameOver = false
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
    }
}                           
struct GameEndView: View {
    @Binding var isGameOver: Bool
    @Binding var isGameActive: Bool
    let onPlayAgain: () -> Void
    let onExit: () -> Void

    @State private var autoStartCountdown = 10
    @State private var timer: Timer?

    var body: some View {
        VStack(spacing: 20) {
            Text("เกมจบแล้ว!")
                .font(.title)
            Text("เริ่มเกมใหม่ใน
            Button("Exit") {
            }  // ออกจากเกม         
            Spacer()
            Text("Player 1")
            Spacer()
            Text("Time:

import SwiftUI

struct GameView: View {
    @StateObject private var gameLogic = GameLogic(playerNames: ["Player 1", "Player 2", "Player 3", "Player 4"])
    @State private var gameStarted = false
    @State private var isGameOver = false
    @State private var isGameActive = true
    @State private var timeRemaining = 120
    @State private var timer: Timer?

    var body: some View {
        VStack {
            // Top Bar
            HStack {
                Button("《 Exit") {
                    // ออกเกม
                     
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

let results = ScoreManager.calculateMoneyScores(from: rawScores, stadium: stadium, selectedBet: selectedBet)


func totalChipsEarned(rawScore: Int, chipMultiplier: Int) -> Int {
    return rawScore * chipMultiplier
}
    
// MARK: - Score Result & Chip Settlement

func checkResult(for players: inout [Player]) {
    for index in players.indices {
        let topScore = calculateHandScore(hand: players[index].arrangedCards[0], row: .head)
        let middleScore = calculateHandScore(hand: players[index].arrangedCards[1], row: .middle)
        let bottomScore = calculateHandScore(hand: players[index].arrangedCards[2], row: .tail)
        let totalScore = topScore + middleScore + bottomScore

        print("Player \(players[index].id) Scores")
        print("Top Score: \(topScore)")
        print("Middle Score: \(middleScore)")
        print("Bottom Score: \(bottomScore)")
        print("Total Score: \(totalScore)\n")
    }
}

func settleChips(players: inout [Player]) {
    for i in 0..<players.count {
        for j in (i+1)..<players.count {
            let scoreI = totalScore(for: players[i])
            let scoreJ = totalScore(for: players[j])

            if scoreI > scoreJ {
                players[i].chips += 1
                players[j].chips -= 1
            } else if scoreI < scoreJ {
                players[i].chips -= 1
                players[j].chips += 1
            }
        }
    }

    for player in players {
        print("Player \(player.id) - Chips: \(player.chips)")
    }
}

func totalScore(for player: Player) -> Int {
    let topScore = calculateHandScore(hand: player.arrangedCards[0], row: .head)
    let middleScore = calculateHandScore(hand: player.arrangedCards[1], row: .middle)
    let bottomScore = calculateHandScore(hand: player.arrangedCards[2], row: .tail)
    return topScore + middleScore + bottomScore
}

struct Player {
    var id: Int
    var name: String
    var chips: Int
    var isActive: Bool {
        return chips > 0
    }
}

class GameSession {
    var players: [Player]
    var minimumChipsToPlay: Int

    init(players: [Player], minimumChipsToPlay: Int = 10) {
        self.players = players
        self.minimumChipsToPlay = minimumChipsToPlay
    }

    func prepareNextRound() {
        // ตรวจสอบสถานะผู้เล่น
        for (index, player) in players.enumerated() {
            if player.chips < minimumChipsToPlay {
                print("Player

    func prepareNextRound() {
    // ตรวจสอบสถานะผู้เล่น
    players = players.filter { $0.isActive }
           if players.count < 2 {
        print("Not enough players to continue.")
        // อาจแสดงผล Game Over หรือรอเพิ่มผู้เล่น
    } else {
        print("Starting next round with")

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

struct Player {
    let id: Int
    var arrangedCards: [[Card]]
    var chips: Int = 0
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

// MARK: - Score Result & Chip Settlement

func checkResult(for players: inout [Player]) {
    for index in players.indices {
        let topScore = calculateHandScore(hand: players[index].arrangedCards[0], row: .head)
        let middleScore = calculateHandScore(hand: players[index].arrangedCards[1], row: .middle)
        let bottomScore = calculateHandScore(hand: players[index].arrangedCards[2], row: .tail)
        let totalScore = topScore + middleScore + bottomScore

        print("Player \(players[index].id) Scores")
        print("Top Score: \(topScore)")
        print("Middle Score: \(middleScore)")
        print("Bottom Score: \(bottomScore)")
        print("Total Score: \(totalScore)\n")
    }
}

func settleChips(players: inout [Player]) {
    for i in 0..<players.count {
        for j in (i+1)..<players.count {
            let scoreI = totalScore(for: players[i])
            let scoreJ = totalScore(for: players[j])

            if scoreI > scoreJ {
                players[i].chips += 1
                players[j].chips -= 1
            } else if scoreI < scoreJ {
                players[i].chips -= 1
                players[j].chips += 1
            }
        }
    }

    for player in players {
        print("Player \(player.id) - Chips: \(player.chips)")
    }
}

func totalScore(for player: Player) -> Int {
    let topScore = calculateHandScore(hand: player.arrangedCards[0], row: .head)
    let middleScore = calculateHandScore(hand: player.arrangedCards[1], row: .middle)
    let bottomScore = calculateHandScore(hand: player.arrangedCards[2], row: .tail)
    return topScore + middleScore + bottomScore
}

import Foundation

enum RowPosition { case head, middle, tail }

struct Card: Equatable { enum Suit: String, CaseIterable { case hearts, diamonds, clubs, spades }

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

struct Player { let id: Int var arrangedCards: [[Card]] var chips: Int = 0 }

// MARK: - Evaluation Functions

func isRoyalFlush(_ hand: [Card]) -> Bool { return isStraightFlush(hand) && hand.contains { $0.rank == .ace } }

func isStraightFlush(_ hand: [Card]) -> Bool { return isFlush(hand) && isStraight(hand) }

func isFourOfAKind(_ hand: [Card]) -> Bool { let rankCounts = Dictionary(grouping: hand, by: { $0.rank }).mapValues { $0.count } return rankCounts.values.contains(4) }

func isFullHouse(_ hand: [Card]) -> Bool { let rankCounts = Dictionary(grouping: hand, by: { $0.rank }).mapValues { $0.count } return rankCounts.values.contains(3) && rankCounts.values.contains(2) }

func isFullHouseOfAces(_ hand: [Card]) -> Bool { let grouped = Dictionary(grouping: hand, by: { $0.rank }) return grouped[.ace]?.count == 3 && grouped.values.contains { $0.count == 2 } }

func isFlush(_ hand: [Card]) -> Bool { return Set(hand.map { $0.suit }).count == 1 }

func isStraight(_ hand: [Card]) -> Bool { let sortedRanks = hand.map { $0.rank.rawValue }.sorted() let lowAce = [2, 3, 4, 5, 14] // Ace low straight let highStraight = Array(sortedRanks.first!...sortedRanks.first! + hand.count - 1) return sortedRanks == lowAce || sortedRanks == highStraight }

func isThreeOfAKind(_ hand: [Card]) -> Bool { let rankCounts = Dictionary(grouping: hand, by: { $0.rank }).mapValues { $0.count } return rankCounts.values.contains(3) }

func isTwoPair(_ hand: [Card]) -> Bool { let rankCounts = Dictionary(grouping: hand, by: { $0.rank }).mapValues { $0.count } return rankCounts.values.filter { $0 == 2 }.count == 2 }

func isPair(_ hand: [Card]) -> Bool { let rankCounts = Dictionary(grouping: hand, by: { $0.rank }).mapValues { $0.count } return rankCounts.values.contains(2) }

func isPairOfAces(_ hand: [Card]) -> Bool { let aces = hand.filter { $0.rank == .ace } return aces.count == 2 }

// MARK: - Score Calculation

func calculateHandScore(hand: [Card], row: RowPosition) -> Int { var score = 0

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

// MARK: - Score Result & Chip Settlement

func checkResult(for players: inout [Player]) { for index in players.indices { let topScore = calculateHandScore(hand: players[index].arrangedCards[0], row: .head) let middleScore = calculateHandScore(hand: players[index].arrangedCards[1], row: .middle) let bottomScore = calculateHandScore(hand: players[index].arrangedCards[2], row: .tail) let totalScore = topScore + middleScore + bottomScore

print("Player

