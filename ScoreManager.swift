// ScoreManager.swift

struct PlayerScore {
    let playerID: Int
    let rawScore: Int
    let stadium: Stadium
    let selectedBet: Int

    var totalMoney: Int {
        return rawScore * selectedBet
    }
}

class ScoreManager {
    static func calculateMoneyScores(from rawScores: [Int], stadium: Stadium, selectedBet: Int) -> [PlayerScore] {
        return rawScores.enumerated().map { index, score in
            PlayerScore(playerID: index + 1, rawScore: score, stadium: stadium, selectedBet: selectedBet)
        }
    }
}
