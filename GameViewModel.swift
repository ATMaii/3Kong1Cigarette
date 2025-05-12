class GameViewModel: ObservableObject {
    @Published var players: [Player] = []
    @Published var hasStarted = false
    @Published var handByType: [HandType: [Card]] = [:]
    @Published var sortType: SortType = .rank

    func startGame() {
        if players.count == 4 && !hasStarted {
            hasStarted = true
            let hand = Deck().draw(count: 13)
            handByType = splitHand(hand)
        }
    }

    func loadPlayers() {
        players = [
            Player(id: 1, name: "Left", chips: 1000),
            Player(id: 2, name: "Top", chips: 1000),
            Player(id: 3, name: "Right", chips: 1000),
            Player(id: 4, name: "You", chips: 1000)
        ]
        startGame() // แจกไพ่หลังจากเพิ่มครบ 4 คน
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
