
// GameManager.swift

func startNewGame() {
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
