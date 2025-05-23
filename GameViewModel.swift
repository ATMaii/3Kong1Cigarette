class GameViewModel: ObservableObject {
    @Published var players: [Player] = []
    @Published var hasStarted: Bool = false
    @Published var handByType: [HandType: [Card]] = [:]
    @State private var currentTime: String = ""
    @Published var hasStarted = false
    @Published var sortType: SortType = .rank
 
    // เริ่มเกม
    func startGame() {
        resetGame()   // รีเซ็ตสถานะเกม
        loadPlayers() // โหลดข้อมูลผู้เล่น
        dealCards()   // แจกไพ่
        updateTime()  // เริ่มการอัปเดตเวลา
    }

    // รีเซ็ตสถานะของเกม
    func resetGame() {
        players.removeAll() // ลบผู้เล่นทั้งหมด
        hasStarted = false  // เปลี่ยนสถานะเกม
        handByType = [:]    // ล้างข้อมูลไพ่ที่เกี่ยวข้อง
    }

    // โหลดผู้เล่น
    func loadPlayers() {
        players.append(Player(name: "Player 1", handByType: [:])) 
        players.append(Player(name: "Player 2", handByType: [:]))
        players.append(Player(name: "Player 3", handByType: [:]))
        players.append(Player(name: "Player 4", handByType: [:]))
    }

    // แจกไพ่
    func dealCards() {
        // แจกไพ่ให้กับผู้เล่นแต่ละคน
        for i in 0..<players.count {
            players[i].handByType = CardDeck.generateHand() // ใช้ฟังก์ชันสมมุติที่สร้างไพ่
        }
        hasStarted = true
    }

    // ฟังก์ชันอัปเดตเวลา
    func updateTime() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            self.currentTime = formatter.string(from: Date())
        }
    }

    func startGame() {
        if players.count == 4 && !hasStarted {
            hasStarted = true
            let hand = Deck().draw(count: 13)
            handByType = splitHand(hand)
        }
    }

    func loadPlayers() {
        players = [
            Player(id: 1, name: "Left", chips: 5000),
            Player(id: 2, name: "Top", chips: 5000),
            Player(id: 3, name: "Right", chips: 5000),
            Player(id: 4, name: "You", chips: 5000)
        ]

func timeIsUp() {
        // คุณสามารถเพิ่มฟังก์ชั่นที่ต้องการให้ทำเมื่อเวลาหมด เช่น จบเกม หรือจัดการคะแนน
        print("เวลาเสร็จแล้ว!")
        // ใส่คำสั่งที่จะทำเมื่อเวลาหมด
    }
}
        startGame() // แจกไพ่หลังจากเพิ่มครบ 4 คน
    }
func startGame() {
    guard !hasStarted else { return }
    hasStarted = true
    // แจกไพ่ / ตั้งค่าเกมอื่น ๆ
}
    func toggleSort() {
        sortType.toggle()
        if hasStarted {
            let flatHand = handByType.flatMap { $0.value }
            let sorted = sortHand(flatHand, by: sortType)
            handByType = splitHand(sorted)
        }
    }
}
class GameViewModel: ObservableObject {
    @Published var hasStarted = false
class GameTimer: ObservableObject {
    @Published var timeLeft: Int = 120 // เวลานับถอยหลังเริ่มต้นที่ 120 วินาที
    var timer: Timer?

func startGame() {
    hasStarted = true
    // แจกไพ่ที่นี่
    let newHand = Deck().draw(count: 13)
    assignHandToTypes(newHand) // หรือวิธีที่คุณใช้แยกเป็นหัว กลาง ท้าย
}
    @Published var hands: [HandType: [Card]] = [
        .front: [],
        .middle: [],
        .back: []
    ]
    @Published var remainingCards: [Card] = []
    
    func startGame() {
        remainingCards = Deck().draw(count: 13)
        hands = [.front: [], .middle: [], .back: []]
    }
    
    func moveCard(_ card: Card, to handType: HandType) {
        if hands[handType]?.count ?? 0 >= (handType == .front ? 3 : 5) { return } // จำกัดจำนวน
        if let index = remainingCards.firstIndex(of: card) {
            remainingCards.remove(at: index)
            hands[handType]?.append(card)
        }
    }
}

    func startTimer() {
        timer?.invalidate() // ถ้ามี timer ที่กำลังทำงานอยู่ ให้หยุดก่อน
        timeLeft = 120 // เริ่มต้นใหม่ที่ 120 วินาที
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.updateTimer()
        }
    }

    func updateTimer() {
        if timeLeft > 0 {
            timeLeft -= 1
        } else {
            timer?.invalidate()
            // เวลาเต็มแล้ว ให้เรียกฟังก์ชั่นจัดการต่อไป
            self.timeIsUp()
        }
    }

func autoArrange() {
    let sorted = remainingCards.sorted {
        if $0.rank.rawValue == $1.rank.rawValue {
            return $0.suit.rawValue < $1.suit.rawValue
        } else {
            return $0.rank.rawValue < $1.rank.rawValue
        }
    }
    
    hands[.front] = Array(sorted.prefix(3))
    hands[.middle] = Array(sorted.dropFirst(3).prefix(5))
    hands[.back] = Array(sorted.dropFirst(8).prefix(5))
    remainingCards = []
}

// เปรียบเทียบมือของ Bottom กับผู้เล่นอื่นๆ
    func compareBottomWithOthers() {
        let bottom = players[3] // player 3 (Bottom)
        for i in 0..<3 { // เปรียบเทียบกับ 3 ขาอื่น
            let opponent = players[i]
            let result = compareHands(bottom.handByType, opponent.handByType)
            print("Bottom vs
