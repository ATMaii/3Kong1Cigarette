
struct Deck {
    private(set) var cards: [Card] = []

    init() {
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                cards.append(Card(suit: suit, rank: rank))
            }
        }
        cards.shuffle()
    }

    mutating func dealCard() -> Card? {
        return cards.popLast()
    }
}
