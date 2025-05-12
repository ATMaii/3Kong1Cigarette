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