// Stadium.swift 

import Foundation

enum Stadium: String, CaseIterable {
    case Rookie = "Wembley"
    case Beginner = "Maracana"
    case Amature = "Allianz Arena"
    case Master = "Santiago Bernabeu"

    var minChipsRequired: Int {
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
        case .Rookie: return [20, 50, 100, 500]
        case .Beginner: return [50, 100, 200, 500]
        case .Amature: return [100, 200, 500, 1000]
        case .Master: return [100, 200, 500, 1000]
        }
    }

    var displayName: String {
        switch self {
        case .Rookie: return "Wembley"
        case .Beginner: return "Brazil"
        case .Amature: return "Allianz Arena"
        case .Master: return "Santiago Bernabeu"
        }
    }
}
struct Arena {
    let stadium: Stadium
    let roomValue: Int
    let playersJoined: Int
    let maxPlayers: Int

    var isFull: Bool {
        return playersJoined >= maxPlayers
    }

    var roomName: String {
        return "

    let selectedStadium: Stadium = .Rookie

    // ดูห้องที่เปิดให้เล่นในสนามนี้
    let rooms = selectedStadium.availableRooms // [20, 50, 100, 500]

    // สร้าง Arena ห้องที่เลือก เช่น ห้อง 50 ชิป
    let arena = Arena(stadium: selectedStadium, roomValue: 50, playersJoined: 3, maxPlayers: 4)

print("สนาม:


enum Stadium: String, CaseIterable {
    case Rookie = "Wembley"
    case Beginner = "Maracana"
    case Amature = "Allianz"
    case Master = "Santiago"

    var availableBets: [Int] {
        switch self {
        case .Rookie: return [20, 50, 100, 200]
        case .Beginner: return [50, 100, 200, 500]
        case .Amature, .Master: return [100, 200, 500, 1000]
        }
    }
    }

enum Stadium: String, CaseIterable {
    case Rookie = "Wembley"
    case Beginner = "Maracana"
    case Amature = "Allianz"
    case Master = "Santiago"

    var minChipsRequired: Int {
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

    var rooms: [Int] {
        switch self {
        case .Rookie: return [20, 50, 100, 200]
        case .Beginner: return [50, 100, 200, 500]
        case .Amature: return [100, 200, 500, 1000]
        case .Master: return [100, 200, 500, 1000]
        }
    }

    var displayName: String {
        switch self {
        case .Rookie: return "Wembley"
        case .Beginner: return "Brazil"
        case .Amature: return "Allianz Arena"
        case .Master: return "Santiago Bernabeu"
        }
    }
}

enum Stadium: String { case Rookie = "Wembley" case Beginner = "Maracana" case Amature = "Allianz Arena" case Master = "Santiago Bernabeu"

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
    case .Rookie, return [20, 50, 100, 500]
    case .Beginner: return [50, 100, 200, 500]
    case .Amature: return [100, 200, 500, 1000]
    case .Master: return [100, 200, 500, 1000]
    }
}

}

