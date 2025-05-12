class GameViewModel: ObservableObject {
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