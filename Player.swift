class Player: Identifiable, ObservableObject {
    let id = UUID()
    let name: String
    let avatar: String
    var isReady: Bool = false
    var hand: [Card] = []
    var head: [Card] = []
    var middle: [Card] = []
    var tail: [Card] = []
}
struct Player {
    var id: Int
    var name: String
    var chips: Int
    var isActive: Bool {
        return chips > 0
    }

    init(id: Int, name: String) {
        self.id = id
        self.name = name
        self.chips = 5000 // เริ่มต้นด้วย 5,000 ชิป
    }
}

let newPlayer = Player(id: 101, name: "Newbie")

struct Player {
    var hand: [Card] = []
}

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
        print("Chip Received")

// Player.swift

import Foundation

class Player: Identifiable {
    let id = UUID()
    var name: String
    var hand: [Card]

    init(name: String) {
        self.name = name
        self.hand = []
    }
}

// Player.swift

import Foundation

class Player: ObservableObject {
    let name: String
    @Published var hand: [Card]
    @Published var score: Int
    
    init(name: String) {
        self.name = name
        self.hand = []
        self.score = 0
    }
}

// Player.swift

struct Player: Identifiable {
    let id = UUID()
    let name: String
    var hand: [Card] = []
    var head: [Card] = []
    var middle: [Card] = []
    var tail: [Card] = []
    var score: Int = 0
    
    mutating func splitHand() {
        guard hand.count == 13 else { return }

        // เรียงไพ่ก่อนแบ่ง
        let sorted = hand.sorted(by: { ($0.rank.rawValue, $0.suit.rawValue) < ($1.rank.rawValue, $1.suit.rawValue) })
        
        head = Array(sorted[0..<3])
        middle = Array(sorted[3..<8])
        tail = Array(sorted[8..<13])
    }
}

struct Player: Identifiable {
    let id: Int
    var hand: [Card] = []

    mutating func sortHand() {
        hand.sort {
            if $0.suit.rawValue == $1.suit.rawValue {
                return $0.rank.rawValue < $1.rank.rawValue
            } else {
                return $0.suit.rawValue < $1.suit.rawValue
            }
        }
    }
}

struct Player: Identifiable {
    let id: Int
    var hand: [Card] = []

    mutating func sortHand() {
        hand.sort {
            if $0.suit.rawValue == $1.suit.rawValue {
                return $0.rank.rawValue < $1.rank.rawValue
            } else {
                return $0.suit.rawValue < $1.suit.rawValue
            }
        }
    }
}

struct Player {
    var hand: [Card] = []
    var head: [Card] = []
    var middle: [Card] = []
    var tail: [Card] = []

    mutating func splitHandIntoPiles() {
        guard hand.count == 13 else { return }
        tail = Array(hand[0..<5])
        middle = Array(hand[5..<10])
        head = Array(hand[10..<13])
    }
}

struct Player {
    var fullHand: [Card] = []
    var tail: [Card] = []
    var middle: [Card] = []
    var head: [Card] = []
}

struct Player {
    let id: Int
    var chips: Int  // ชิปของผู้เล่น
    var hands: [[Card]] // 3 กองของผู้เล่น
}

struct Game {
    var players: [Player]
    var pot: Int = 0  // หม้อรวมชิป
}
func initializePlayers() -> [Player] {
    let initialChips = 5000  // เริ่มต้นที่ 5000 ชิป
    let players = [
        Player(id: 0, chips: initialChips, hands: [[]]),
        Player(id: 1, chips: initialChips, hands: [[]]),
        Player(id: 2, chips: initialChips, hands: [[]]),
        Player(id: 3, chips: initialChips, hands: [[]])
    ]
    return players
}
func playerBet(player: inout Player, betAmount: Int) {
    if player.chips >= betAmount {
        player.chips -= betAmount
        game.pot += betAmount  // เพิ่มชิปลงในหม้อ
    } else {
        print("ไม่มียอดชิปเพียงพอในการวางเดิมพัน")
    }
}
func awardChips(winner: Player) {
    let winningAmount = game.pot
    winner.chips += winningAmount
    game.pot = 0  // หม้อว่าง
}
func comparePlayers(p1: inout Player, p2: inout Player) {
    let result = compareHands(p1.hands, p2.hands)
    
    if result == 1 {
        // P1 ชนะ
        awardChips(winner: p1)
    } else if result == -1 {
        // P2 ชนะ
        awardChips(winner: p2)
    } else {
        // เสมอ
    }
}
struct Player {
    let id: Int
    var chips: Int  // ชิปของผู้เล่น
    var hands: [[Card]] // 3 กองของผู้เล่น (หัว, กลาง, ท้าย)
    
    // ฟังก์ชันสำหรับวางเดิมพัน
    mutating func bet(amount: Int, pot: inout Int) -> Bool {
        if chips >= amount {
            chips -= amount
            pot += amount  // เพิ่มชิปลงในหม้อ
            return true
        } else {
            print("ไม่มียอดชิปเพียงพอในการวางเดิมพัน")
            return false
        }
    }
    
    // ฟังก์ชันสำหรับการชนะและรับชิป
    mutating func win(potAmount: Int) {
        chips += potAmount
    }
}
func initializePlayers() -> [Player] {
    let initialChips = 5000  // เริ่มต้นที่ 5000 ชิป
    let players = [
        Player(id: 0, chips: initialChips, hands: [[]]),
        Player(id: 1, chips: initialChips, hands: [[]]),
        Player(id: 2, chips: initialChips, hands: [[]]),
        Player(id: 3, chips: initialChips, hands: [[]])
    ]
    return players
}
func playerBet(player: inout Player, betAmount: Int, pot: inout Int) {
    if player.bet(amount: betAmount, pot: &pot) {
        print("ผู้เล่น")
            
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
        print("พรุ่งนี้แก้ตัวใหม่")

struct Player {
    let id: Int
    let name: String
    var chips: Int = 5_000
    var lastBonusDate: Date? = Date()
    var hand: [Card] = []
    var head: [Card] = []
    var middle: [Card] = []
    var tail: [Card] = []
    var score: Int = 0

    var isActive: Bool { chips > 0 }

    mutating func checkDailyBonus() {
        let calendar = Calendar.current
        if let lastDate = lastBonusDate, calendar.isDateInToday(lastDate) {
            return
        }
        chips += 5_000
        lastBonusDate = Date()
    }

    mutating func sortHand() {
        hand.sort(by: { $0.rank.rawValue < $1.rank.rawValue })
    }

    mutating func splitHand() {
        head = Array(hand.prefix(3))
        middle = Array(hand[3..<8])
        tail = Array(hand.suffix(5))
    }
}