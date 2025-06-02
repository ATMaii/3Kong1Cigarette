enum GamePhase {
    case login
    case selectStadium
    case selectRoom
    case waitingForPlayers
    case dealingCards
    case arrangingHands
    case waitingForConfirmation
    case evaluating
    case comparing
    case showingScore
    case updatingScores
    case roundFinished
}

// GameManager.swift

class GameManager: ObservableObject {
    @Published var phase: GamePhase = .login
    @Published var selectedStadium: Stadium?
    @Published var selectedRoom: Room?
    @Published var players: [Player] = []
    
    var deck = Deck()

    func login() {
        phase = .selectStadium
    }

    func selectStadium(_ stadium: Stadium) {
        selectedStadium = stadium
        phase = .selectRoom
    }

    func selectRoom(_ room: Room) {
        selectedRoom = room
        players = []
        phase = .waitingForPlayers
    }

    func addPlayer(_ player: Player) {
        players.append(player)
        if players.count == 4 {
            startGame()
        }
    }

import Foundation

class GameManager: ObservableObject {
    @Published var players: [Player] = []   
    @Published var currentRound: Int = 1
    @Published var isGameOver: Bool = false
    private var gameLogic: GameLogic
    private var scoreManager: ScoreManager
    init(playerNames: [String]) {
        self.players = playerNames.map { Player(name: $0) }
        self.gameLogic = GameLogic(players: self.players)
        self.scoreManager = ScoreManager(players: self.players)
    }

    func startGame() {
        phase = .dealingCards
        deck = Deck()
        deck.shuffle()
        for i in 0..<players.count {
            players[i].hand = (0..<13).compactMap { _ in deck.drawCard() }
        }
        phase = .arrangingHands
    }

    func confirmHands(for playerID: UUID, head: [Card], middle: [Card], tail: [Card]) {
        if let index = players.firstIndex(where: { $0.id == playerID }) {
            players[index].head = head
            players[index].middle = middle
            players[index].tail = tail
        }

        if players.allSatisfy({ !$0.head.isEmpty && !$0.middle.isEmpty && !$0.tail.isEmpty }) {
            phase = .evaluating
            evaluateHands()
        }
    }

    func evaluateHands() {
        // TODO: เทียบคะแนนตามกติกา
        phase = .showingScore
    }

    func playAgain() {
        phase = .waitingForPlayers
        players.removeAll()
    }

    func resetForNextRound() {
        for i in 0..<players.count {
            players[i].hand = []
            players[i].head = []
            players[i].middle = []
            players[i].tail = []
        }
        deck.reset()
        startGame()
    }
}
    
    func startNewGame() {
        currentRound = 1
        isGameOver = false
        for player in players {
            player.reset()
        }
        gameLogic.startGame()
    }
    func playRound() {
        gameLogic.startGame()

        let roundScores = gameLogic.calculateRoundScores()
        scoreManager.updateScores(with: roundScores)

        currentRound += 1
        if currentRound > 5 {
            isGameOver = true
        }
    }

    func winner() -> Player? {
        return scoreManager.highestScorePlayer()
    }

    // Stadium for Chips logic
    func stadiumForChips(_ chips: Int) -> Stadium? {
        switch chips {
        case 50_000...:
            return .santiagoBernabeu
        case 20_000..<50_000:
            return .allianzArena
        case 10_000..<20_000:
            return .brazil
        case 5_000..<10_000:
            return .wemley
        default:
            return nil
        }

import Foundation

enum Stadium: String {
    case wemley = "Wemley"
    case brazil = "Brazil"
    case allianzArena = "Allianz Arena"
    case santiagoBernabeu = "Santiago Bernabeu"
}

class Player {
    static private var nextID: Int = 0

    var id: Int
    var name: String
    var chips: Int
    var lastBonusDate: Date?

    // สำหรับเกม
    var hand: [Card] = []
    var score: Int = 0
    var head: [Card] = []
    var middle: [Card] = []
    var tail: [Card] = []

    var isActive: Bool {
        return chips > 0
    }

    init(name: String) {
        self.id = Player.nextID
        Player.nextID += 1
        self.name = name
        self.chips = 5000
        self.lastBonusDate = Date()
    }

    func checkDailyBonus() {
        let calendar = Calendar.current
        if let lastDate = lastBonusDate,
           calendar.isDateInToday(lastDate) {
            return
        }
        chips += 5000
        lastBonusDate = Date()
        print("Daily bonus received.")
    }

    func reset() {
        chips = 5000
        lastBonusDate = Date()
    }
}

    players = names.enumerated().map { index, name in
    let player = Player(id: index + 1, name: name)
    player.hand = (0..<13).compactMap { _ in deck.drawCard() }
    player.hand.sort { $0.rank.rawValue < $1.rank.rawValue }
    return player
}

class Player {
    var id: Int
    var name: String
    var chips: Int
    var lastBonusDate: Date?

    var isActive: Bool {
        return chips > 0
    }

    init(id: Int, name: String) {
        self.id = id
        self.name = name
        self.chips = 5000 // เริ่มต้นด้วย 5,000 ชิป
        self.lastBonusDate = Date() // รับชิปทันทีเมื่อสมัคร
    }

    mutating func checkDailyBonus() {
        let calendar = Calendar.current
        if let lastDate = lastBonusDate,
           calendar.isDateInToday(lastDate) {
            return // ถ้ารับแล้ววันนี้ไม่ให้รับโบนัสอีก
        }
        chips += 5000 // เพิ่มชิป 5,000
        lastBonusDate = Date() // อัพเดทวันที่รับโบนัสล่าสุด
        print(" ")

import Foundation

struct Player {
    var id: Int
    var name: String
    var chips: Int
    var lastBonusDate: Date?
    var isActive: Bool {
        return chips > 0
    }
    init(id: Int, name: String) {
        self.id = id
        self.name = name
        self.chips = 5000 // เริ่มต้นด้วย 5,000 ชิป
        self.lastBonusDate = Date() // รับชิปทันทีเมื่อสมัคร
    }
    mutating func checkDailyBonus() {
        let calendar = Calendar.current
        if let lastDate = lastBonusDate,
           calendar.isDateInToday(lastDate) {
            return // ถ้ารับแล้ววันนี้ไม่ให้รับโบนัสอีก
        }
        chips += 5000 // เพิ่มชิป 5,000
        lastBonusDate = Date() // อัพเดทวันที่รับโบนัสล่าสุด
        print(" ")

class GameManager: ObservableObject {
    var playerChips: Int = 0

    func availableStadiums() -> [Stadium] {
        return Stadium.allCases.filter { playerChips >= $0.minChipsRequired }
    }

    func stadiumForChips() -> Stadium? {
        return Stadium.allCases.reversed().first { playerChips >= $0.minChipsRequired }
    }
}

@Published var selectedStadium: Stadium? = nil

struct Player {
    let name: String
    let head: [Card]
    let middle: [Card]
    let tail: [Card]
}

let player = Player(id: 1, name: " ")
let manager = GameManager(playerNames: [player.name])

if let stadium = manager.stadiumForChips(player.chips) {
    print("ผู้เล่นเข้าสนาม")

    init() {
        startGame()
    }

    func startGame() {
        // สร้างNewPlayer
        let names = ["player1", "player2", "player3", "player4"]
        players = names.enumerated().map { index, name in Player(id: index + 1, name: name) }

        // สร้างและสับไพ่
        deck = Deck()
        deck.shuffle()

struct Player {
    var id: Int
    var name: String
    var chips: Int
    var lastBonusDate: Date?
    var hand: [Card] = []         // ไพ่ 13 ใบ
    var score: Int = 0            // เก็บคะแนนหลังเปรียบเทียบ
    var head: [Card] = []
    var middle: [Card] = []
    var tail: [Card] = []

    var isActive: Bool {
        return chips > 0
    }

    init(id: Int, name: String) {
        self.id = id
        self.name = name
        self.chips = 5000
        self.lastBonusDate = Date()
    }

    mutating func checkDailyBonus() {
        let calendar = Calendar.current
        if let lastDate = lastBonusDate,
           calendar.isDateInToday(lastDate) {
            return
        }
        chips += 5000
        lastBonusDate = Date()
    }
}
func startGame() {
    let names = ["player1", "player2", "player3", "player4"]
    players = names.enumerated().map { index, name in
        var player = Player(id: index + 1, name: name)
        player.hand = (0..<13).compactMap { _ in deck.drawCard() }
        player.hand.sort { $0.rank.rawValue < $1.rank.rawValue } // เรียงมือไว้
        return player
    }
// ยังไม่จัดเป็น head, middle, tail
}
players[2].head = headCardsFromUI
players[2].middle = middleCardsFromUI
players[2].tail = tailCardsFromUI

import Foundation

enum Stadium: String {
    case wemley = "Wemley"
    case brazil = "Brazil"
    case allianzArena = "Allianz Arena"
    case santiagoBernabeu = "Santiago Bernabeu"
}

class Player {
    static private var nextID: Int = 0

    var id: Int
    var name: String
    var chips: Int
    var lastBonusDate: Date?

    var isActive: Bool {
        return chips > 0
    }

    init(name: String) {
        self.id = Player.nextID
        Player.nextID += 1
        self.name = name
        self.chips = 5000
        self.lastBonusDate = Date()
    }

    func checkDailyBonus() {
        let calendar = Calendar.current
        if let lastDate = lastBonusDate,
           calendar.isDateInToday(lastDate) {
            return
        }
        chips += 5000
        lastBonusDate = Date()
        print("Daily bonus received.")
    }

    func reset() {
        chips = 5000
        lastBonusDate = Date()
    }
}

class GameManager: ObservableObject {
    @Published var players: [Player] = []
    @Published var currentRound: Int = 1
    @Published var isGameOver: Bool = false

    private var gameLogic: GameLogic
    private var scoreManager: ScoreManager

    init(playerNames: [String]) {
        self.players = playerNames.map { Player(name: $0) }
        self.gameLogic = GameLogic(players: self.players)
        self.scoreManager = ScoreManager(players: self.players)
    }

    func startNewGame() {
        currentRound = 1
        isGameOver = false
        for player in players {
            player.reset()
        }
        gameLogic.startGame()
    }

    func playRound() {
        gameLogic.startGame()

        let roundScores = gameLogic.calculateRoundScores()
        scoreManager.updateScores(with: roundScores)

        currentRound += 1
        if currentRound > 5 {
            isGameOver = true
        }
    }

    func winner() -> Player? {
        return scoreManager.highestScorePlayer()
    }

    func stadiumForChips(_ chips: Int) -> Stadium? {
        switch chips {
        case 50_000...:
            return .santiagoBernabeu
        case 20_000..<50_000:
            return .allianzArena
        case 10_000..<20_000:
            return .brazil
        case 5_000..<10_000:
            return .wemley
        default:
            return nil
        }
    }
}

    private func evaluateThreePiles(head: [Card], middle: [Card], tail: [Card]) -> Int {
        var score = 0
        score += evaluateHand(head) //
        score += evaluateHand(middle)//
        score += evaluateHand(tail) //
        return score
    }

    private func evaluateHand(_ cards: [Card]) -> Int {
        // ใช้สุ่มแทนการประเมินจริง (สำหรับทดลองก่อน)
        return Int.random(in: 0...10)
    }
}

import Foundation

class GameManager: ObservableObject {
    @Published var players: [Player] = []
    private var deck = Deck()

    init() {
        startGame()
    }

    func startGame() {
        deck = Deck()
        players = [Player(id: 1), Player(id: 2), Player(id: 3), Player(id: 4)]
        dealCards()
    }

    private func dealCards() {
        deck.shuffle()
        for i in 0..<players.count {
            players[i].hand = (0..<13).compactMap { _ in deck.dealCard() }
            players[i].sortHand() // เรียงไพ่ตามดอก + แต้ม
        }
    }
}

class GameManager: ObservableObject {
    @Published var players: [Player] = []
    private var deck = Deck()

    init() {
        startGame()
    }

    func startGame() {
        deck = Deck()
        deck.shuffle()

        players = [Player(id: 1), Player(id: 2), Player(id: 3), Player(id: 4)]

        dealCards()

        for i in 0..<players.count {
            let (head, middle, tail) = splitIntoThreePiles(player: players[i])
            players[i].head = head
            players[i].middle = middle
            players[i].tail = tail
        }

        for i in 0..<players.count {
            players[i].score = calculateScore(player: players[i])
        }
    }

    private func dealCards() {
        for i in 0..<players.count {
            players[i].hand = (0..<13).compactMap { _ in deck.dealCard() }
            players[i].sortHand()
        }
    }

    func splitIntoThreePiles(player: Player) -> ([Card], [Card], [Card]) {
        let tail = Array(player.hand.prefix(5))
        let middle = Array(player.hand.dropFirst(5).prefix(5))
        let head = Array(player.hand.suffix(3))
        return (head, middle, tail)
    }

    func calculateScore(player: Player) -> Int {
        let headScore = evaluateHand(player.head)
        let middleScore = evaluateHand(player.middle) 
        let tailScore = evaluateHand(player.tail) 
        return headScore + middleScore + tailScore
    }

    private func evaluateHand(_ hand: [Card]) -> Int {
        return hand.count  // ใช้จำนวนไพ่เป็นคะแนนเบื้องต้น
    }

    func compareScores() -> Player? {
        players.max(by: { $0.score < $1.score })
    }
}

import Foundation

class GameManager: ObservableObject {
    @Published var players: [Player] = []
    private var deck = Deck()

    init() {
        startGame()
    }

    func startGame() {
        deck = Deck()
        deck.shuffle()
        players = [Player(id: 1), Player(id: 2), Player(id: 3), Player(id: 4)]
        dealCards()

        // แบ่งไพ่เป็น 3 กอง และคำนวณคะแนน
        for player in players {
            let (head, middle, tail) = player.splitIntoThreePiles()
            player.head = head
            player.middle = middle
            player.tail = tail
            player.score = calculateScore(player: player)
        }
    }

    private func dealCards() {
        for i in 0..<players.count {
            players[i].hand = deck.drawCards(count: 13)
            players[i].sortHand()
        }
    }

    func calculateScore(player: Player) -> Int {

    private func evaluateHand(hand: [Card]) -> Int {
        // ตัวอย่างเบื้องต้น: ให้แต้มตามจำนวนไพ่
        return hand.count
    }

    func compareScores() -> Player? {
        return players.max(by: { $0.score < $1.score })
    }
}

func startGame() {
    let names = ["ผู้เล่น 1", "ผู้เล่น 2", "ผู้เล่น 3", "ผู้เล่น 4"]
    players = names.map { Player(name: $0) }
    
    var deck = Deck()
    deck.shuffle()
    
    for i in 0..<players.count {
        players[i].hand = (0..<13).compactMap { _ in deck.drawCard() }
        players[i].splitHand()
    }

    // คะแนนรวมสามกอง
    for i in 0..<players.count {
        let player = players[i]
        let score = evaluateThreePiles(head: player.head, middle: player.middle, tail: player.tail)
        players[i].score = score
    }

    winner = players.max(by: { $0.score < $1.score })
}

func evaluateThreePiles(head: [Card], middle: [Card], tail: [Card]) -> Int {
    var score = 0
    score += evaluateHand(head)   // อาจให้คะแนนน้อยหน่อย
    score += evaluateHand(middle) 
    score += evaluateHand(tail)
    return score
}

func evaluateHand(_ cards: [Card]) -> Int {
    // ตัวอย่างการให้คะแนนเบื้องต้น: คู่ = 1, ตอง = 3, โฟว์ = 6, ฟูลเฮาส์ = 1, สเตรทฟลัช = 8 ฯลฯ
    // TODO: เขียนระบบตรวจมือจริง ๆ
    return Int.random(in: 0...10) // ใช้แบบสุ่มแทนก่อน
}

import Foundation

class GameManager: ObservableObject {
    @Published var players: [Player] = []
    @Published var deck = Deck()

    func startGame() {
        deck = Deck()
        players = [Player(), Player(), Player(), Player()]
        dealCards()
    }

    func dealCards() {
        for i in 0..<players.count {
            players[i].hand = []
            for _ in 0..<13 {
                if let card = deck.dealCard() {
                    players[i].hand.append(card)
                }
            }
            players[i].sortHand()
        }
    }
}

func startGame() {
    deck = Deck()
    players = [Player(), Player(), Player(), Player()]
    dealCards()
}

import Foundation

class GameManager: ObservableObject {
    @Published var players: [Player] = []
    private var deck = Deck()

    init() {
        startGame()
    }

    func startGame() {
        deck = Deck()
        players = [Player(id: 1), Player(id: 2), Player(id: 3), Player(id: 4)]
        dealCards()
    }

    private func dealCards() {
        deck.shuffle()
        for i in 0..<players.count {
            players[i].hand = (0..<13).compactMap { _ in deck.dealCard() }
            players[i].sortHand() // เรียงไพ่ตามดอก + แต้ม
        }
    }
}

class GameManager: ObservableObject {
    @Published var players: [Player] = []
    private var deck = Deck()

    init() {
        startGame()
    }

    func startGame() {
        deck = Deck()
        players = [Player(id: 1), Player(id: 2), Player(id: 3), Player(id: 4)]
        dealCards()
    }

    private func dealCards() {
        deck.shuffle()
        for i in 0..<players.count {
            players[i].hand = (0..<13).compactMap { _ in deck.dealCard() }
            players[i].sortHand() // เรียงไพ่ตามดอก + แต้ม
        }
    }

    // เพิ่มฟังก์ชันเพื่อแยกไพ่เป็น 3 กอง (หัว กลาง ท้าย)
    func splitIntoThreePiles(player: Player) -> ([Card], [Card], [Card]) {
        let tail = Array(player.hand.prefix(5))                     // ใบที่ 1–5
        let middle = Array(player.hand.dropFirst(5).prefix(5))      // ใบที่ 6–10
        let head = Array(player.hand.suffix(3))                     // ใบที่ 11–13
        
        return (head, middle, tail)
    }

    // เพิ่มฟังก์ชันคำนวณคะแนน
    func calculateScore(player: Player) -> Int {
        // คะแนนที่ได้จากหัว
        let headScore = evaluateHand(player: player, hand: Array(player.hand.prefix(5)))
        
        // คะแนนที่ได้จากกลาง
        let middleScore = evaluateHand(player: player, hand: Array(player.hand.dropFirst(5).prefix(5)))
        
        // คะแนนที่ได้จากท้าย
        let tailScore = evaluateHand(player: player, hand: Array(player.hand.dropFirst(10).prefix(3)))

        return headScore + middleScore + tailScore
    }

    private func evaluateHand(player: Player, hand: [Card]) -> Int {
        // ตัวอย่างการคำนวณคะแนน (สามารถปรับปรุงตามการประเมินไพ่)
        return hand.count  // เริ่มต้นแค่ return จำนวนไพ่ในมือ
    }
}

class GameManager: ObservableObject {
    @Published var players: [Player] = []
    private var deck = Deck()

    init() {
        startGame()
    }

    func startGame() {
        deck = Deck()
        players = [Player(id: 1), Player(id: 2), Player(id: 3), Player(id: 4)]
        dealCards()
    }

    private func dealCards() {
        deck.shuffle()
        for i in 0..<players.count {
            players[i].hand = (0..<13).compactMap { _ in deck.dealCard() }
            players[i].sortHand()
        }
    }

    func compareScores() -> Player? {
        var winner: Player? = nil
        var highestScore = 0

        for player in players {
            let score = calculateScore(player: player)
            if score > highestScore {
                highestScore = score
                winner = player
            }
        }

        return winner
    }


class GameManager {
    var players: [Player]
    var deck: Deck

    init(players: [Player]) {
        self.players = players
        self.deck = Deck()
    }

    func startGame() {
        deck.shuffle()
        // แจกไพ่ให้กับผู้เล่นทุกคน
        for i in 0..<players.count {
            players[i].hand = deck.drawCards(count: 13)  // แจกไพ่ให้ผู้เล่น

func startGame() {
    var deck = Deck()
    deck.shuffle()

    for i in 0..<players.count {
        players[i].hand = deck.drawCards(count: 13)
        players[i].splitHandIntoPiles()
    }
      }

import Foundation

class GameManager {
    var players: [Player]
    var deck: Deck

    init(players: [Player]) {
        self.players = players
        self.deck = Deck()
    }

    func calculateHandScore(hand: [Card], row: RowPosition) -> Int {
        var score = 0
        if let straightRankValue = straightRank(hand) {
            score = straightRankValue
        }
        // คำนวณคะแนนอื่นๆ ถ้ามี
        return score
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
}

class GameManager: ObservableObject {
    static let shared = GameManager()

    @Published var players: [Player] = []

    func startGame() {
        var deck = Card.allCards.shuffled()
        players = []

        for _ in 0..<4 {
            var hand: [Card] = []
            for _ in 0..<13 {
                hand.append(deck.removeFirst())
            }

            let sortedHand = hand.sorted(by: cardSort)
            let tail = Array(sortedHand[0..<5])
            let middle = Array(sortedHand[5..<10])
            let head = Array(sortedHand[10..<13])

            let player = Player(fullHand: hand, tail: tail, middle: middle, head: head)
            players.append(player)
        }
    }

    private func cardSort(_ a: Card, _ b: Card) -> Bool {
        if a.suit.rawValue == b.suit.rawValue {
            return a.rank.rawValue < b.rank.rawValue
        } else {
            return a.suit.rawValue < b.suit.rawValue
        }
    }
      }

class GameManager {
    // properties...
    
    func calculateHandScore(hand: [Card], row: RowPosition) -> Int {
        var score = 0
        if isStraight(hand) {
            if let rank = straightRank(hand) {
                score = rank
            }
        }
        // อื่น ๆ...
        return score
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



enum HandRank: Int {
    case highCard = 1
    case pair, twoPair, threeOfAKind, straight, flush, fullHouse, fourOfAKind, straightFlush, royalFlush
}

func evaluateHand(_ hand: [Card]) -> HandRank {
    // ตรวจสอบลำดับมือ เช่น สเตรท ฟลัช ไพ่สูง ฯลฯ
    // สำหรับตอนนี้สมมุติใช้แค่ highCard
    return .highCard
}

func compareHands(_ hand1: [Card], _ hand2: [Card]) -> Int {
    let rank1 = evaluateHand(hand1).rawValue
    let rank2 = evaluateHand(hand2).rawValue

    if rank1 > rank2 {
        return 1 // hand1 ชนะ
    } else if rank1 < rank2 {
        return -1 // hand2 ชนะ
    } else {
        // ถ้าเท่ากันเปรียบเทียบไพ่สูง
        let sorted1 = hand1.sorted(by: >)
        let sorted2 = hand2.sorted(by: >)

        for i in 0..<min(sorted1.count, sorted2.count) {
            if sorted1[i].rank.rawValue > sorted2[i].rank.rawValue {
                return 1
            } else if sorted1[i].rank.rawValue < sorted2[i].rank.rawValue {
                return -1
            }
        }
        return 0 // เสมอ
    }
}

func calculateScore(players: [Player]) -> [String: Int] {
    var scores: [String: Int] = [:]

    for player in players {
        scores[player.name] = 0
    }

    for i in 0..<players.count {
        for j in 0..<players.count where i != j {
            let p1 = players[i]
            let p2 = players[j]

            let resultHead = compareHands(p1.head, p2.head)
            let resultMiddle = compareHands(p1.middle, p2.middle)
            let resultTail = compareHands(p1.tail, p2.tail)

            scores[p1.name, default: 0] += resultHead + resultMiddle + resultTail
        }
    }

    return scores
}
        
func compareMiddleRow(p1: [Card], p2: [Card], p3: [Card], p4: [Card]) {
    let allMiddleHands = [p1, p2, p3, p4]
    let middleRanks = allMiddleHands.map { evaluateHand(cards: $0) }

    // หาค่ามากสุด
    if let maxRank = middleRanks.max() {
        for (index, rank) in middleRanks.enumerated() {
            if rank == maxRank {
                print("Player

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
        print("Starting next round with")