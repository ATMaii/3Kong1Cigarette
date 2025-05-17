
// Stadium.swift import Foundation

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

// Arena.swift 

import Foundation

struct Arena { let stadium: Stadium let roomValue: Int let playersJoined: Int let maxPlayers: Int

var isFull: Bool {
    playersJoined >= maxPlayers
}

var roomName: String {
    " 

enum RookieRoom: String, CaseIterable {
    case arenaI = "Rookie20"
    case arenaII = "Rookie50"
    case arenaIII = "Rookie100"
    case arenaIV = "Rookie200"

    var roomValue: Int {
        switch self {
        case .arenaI: return 20
        case .arenaII: return 50
        case .arenaIII: return 100
        case .arenaIV: return 200
        }
    }

    var displayName: String {
        switch self {
        case .arenaI: return "Arena I"
        case .arenaII: return "Arena II"
        case .arenaIII: return "Arena III"
        case .arenaIV: return "Arena IV"
        }
    }
}
enum BeginnerRoom: String, CaseIterable {
    case blogI = "Beginner50"
    case blogII = "Beginner100"
    case blogIII = "Beginner200"
    case blogIV = "Beginner500"

    var roomValue: Int {
        switch self {
        case .blogI: return 50
        case .blogII: return 100
        case .blogIII: return 200
        case .blogIV: return 500
        }
    }

    var displayName: String {
        switch self {
        case .blogI: return "Blog I"
        case .blogII: return "Blog II"
        case .blogIII: return "Blog III"
        case .blogIV: return "Blog IV"
        }
    }
}
enum AmateurRoom: String, CaseIterable {
    case clubI = "Amateur100"
    case clubII = "Amateur200"
    case clubIII = "Amateur500"
    case clubIV = "Amateur1000"

    var roomValue: Int {
        switch self {
        case .clubI: return 100
        case .clubII: return 200
        case .clubIII: return 500
        case .clubIV: return 1000
        }
    }

    var displayName: String {
        switch self {
        case .clubI: return "Club I"
        case .clubII: return "Club II"
        case .clubIII: return "Club III"
        case .clubIV: return "Club IV"
        }
    }
}
enum MasterRoom: String, CaseIterable {
    case roomI = "Master100"
    case roomII = "Master200"
    case roomIII = "Master500"
    case roomIV = "Master1000"

    var roomValue: Int {
        switch self {
        case .roomI: return 100
        case .roomII: return 200
        case .roomIII: return 500
        case .roomIV: return 1000
        }
    }

    var displayName: String {
        switch self {
        case .roomI: return "Room I"
        case .roomII: return "Room II"
        case .roomIII: return "Room III"
        case .roomIV: return "Room IV"
        }
    }
}
func roomName(for stadium: Stadium) -> String {
        " 
}

