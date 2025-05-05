
// GameLogic.swift

import Foundation

class GameLogic {
    var deck = Deck()
    var players: [Player] = []

    init(playerNames: [String]) {
        self.players = playerNames.map { Player(name: $0) }
    }

    func startGame() {
        deck.reset()
        dealCards()
    }

    private func dealCards() {
        for player in players {
            player.hand = deck.drawCards(count: 13)
            player.hand.sort {
                if $0.rank.rawValue == $1.rank.rawValue {
                    return $0.suit.rawValue < $1.suit.rawValue
                }
                return $0.rank.rawValue < $1.rank.rawValue
            }
        }
    }
}
