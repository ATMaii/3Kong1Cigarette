
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

// Deck.swift

import Foundation

class Deck {
    private(set) var cards: [Card] = []

    init() {
        reset()
    }

    func reset() {
        cards = []
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                cards.append(Card(suit: suit, rank: rank))
            }
        }
        shuffle()
    }

    func shuffle() {
        cards.shuffle()
    }

    func drawCard() -> Card? {
        guard !cards.isEmpty else { return nil }
        return cards.removeFirst()
    }

    func drawCards(count: Int) -> [Card] {
        var drawn: [Card] = []
        for _ in 0..<count {
            if let card = drawCard() {
                drawn.append(card)
            }
        }
        return drawn
    }
}
