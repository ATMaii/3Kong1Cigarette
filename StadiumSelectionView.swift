struct StadiumSelectionView: View {
    @ObservedObject var gameManager: GameManager

    var body: some View {
        VStack {
            Text("เลือกสนาม").font(.title)

            ForEach(gameManager.availableStadiums(), id: \.self) { stadium in
                Button(action: {
                    gameManager.selectedStadium = stadium
                }) {
                    Text(stadium.displayName)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
            }
        }
    }
}
if player.chips < Stadium.Rookie.minChipsRequired {
    // แสดงข้อความว่าไม่สามารถเข้าได้
    // หรือ redirect ไปหน้าอื่น
}
var body: some View {
    VStack {
        Text("เข้าได้เฉพาะสนาม 'Wembley'").font(.headline)

        Button(action: {
            gameManager.selectedStadium = .Rookie
        }) {
            Text("เข้าสนาม Wembley")
                .padding()
                .background(Color.green)
                .cornerRadius(10)
        }
    }
}
Text("ห้อง: 50 Wemley")
enum Stadium: String {
    case Rookie = "Wembley"
    case Beginner = "Maracana"
    case Amature = "Allianz Arena"
    case Master = "Santiago Bernabeu"
    
    var minChips: Int {
        switch self {
        case .Rookie: return 5_000
        case .Beginner: return 10_000
        case .Amature: return 20_000
        case .Master: return 50_000
        }
    }
    
    var multiplier: Double {
        switch self {
        case .Rookie: return 5.2
        case .Beginner: return 6.3
        case .Amature: return 7.4
        case .Master: return 8.5
        }
    }
    
    var availableRooms: [Int] {
        switch self {
        case .Rookie: return [20, 50, 100, 200]
        case .Beginner: return [50, 100, 200, 500]
        case .Amatute, .Master: return [100, 200, 500, 1000]
        }
    }
}
// Arena.swift
import Foundation

struct Arena {
    let stadium: Stadium
    let roomValue: Int
    let playersJoined: Int
    let maxPlayers: Int

    var isFull: Bool {
        playersJoined >= maxPlayers
    }

    var roomName: String {
        "\(stadium.rawValue) Room \(roomValue)"
    }
}
