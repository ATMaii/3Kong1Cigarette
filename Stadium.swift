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

import Foundation

enum Stadium {
    case Rookie, Beginner, Amature, Master

    var availableRooms: [Arena] {
        switch self {
        case .Rookie:
            return RookieRoom.allCases.map { Arena(stadium: self, roomValue: $0.roomValue, playersJoined: 0, maxPlayers: 4) }
        case .Beginner:
            return BeginnerRoom.allCases.map { Arena(stadium: self, roomValue: $0.roomValue, playersJoined: 0, maxPlayers: 4) }
        case .Amature:
            return AmatureRoom.allCases.map { Arena(stadium: self, roomValue: $0.roomValue, playersJoined: 0, maxPlayers: 4) }
        case .Master:
            return MasterRoom.allCases.map { Arena(stadium: self, roomValue: $0.roomValue, playersJoined: 0, maxPlayers: 4) }
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
        return " " }
}

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
    let selectedStadium: Stadium = .Rookie

    // ดูห้องที่เปิดให้เล่นในสนามนี้
    let rooms = selectedStadium.availableRooms // [20, 50, 100, 500]

    // สร้าง Arena ห้องที่เลือก เช่น ห้อง 50 ชิป
    let arena = Arena(stadium: selectedStadium, roomValue: 50, playersJoined: 3, maxPlayers: 4)

print("สนาม:")


extension Stadium {
    var availableArenas: [Arena] {
        switch self {
        case .Rookie:
            return RookieRoom.allCases.map {
                Arena(stadium: self, roomValue: $0.roomValue, playersJoined: 0, maxPlayers: 4)
            }
        case .Beginner:
            return BeginnerRoom.allCases.map {
                Arena(stadium: self, roomValue: $0.roomValue, playersJoined: 0, maxPlayers: 4)
            }
        case .Amature:
            return AmatureRoom.allCases.map {
                Arena(stadium: self, roomValue: $0.roomValue, playersJoined: 0, maxPlayers: 4)
            }
        case .Master:
            return MasterRoom.allCases.map {
                Arena(stadium: self, roomValue: $0.roomValue, playersJoined: 0, maxPlayers: 4)
            }
        }
    }
}

import Foundation

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
}

let rookieStadium = Stadium.Rookie
let rookieArenas = rookieStadium.availableRooms

enum BeginnerRoom: String, CaseIterable {
    case blogI = "BeginnerBlogI"
    case blogII = "BeginnerBlogII"
    case blogIII = "BeginnerBlogIII"
    case blogIV = "BeginnerBlogIV"

    var roomValue: Int {
        switch self {
        case .blogI: return 50
        case .blogII: return 100
        case .blogIII: return 200
        case .blogIV: return 500
        }
    }
}

let beginnerStadium = Stadium.Beginner
let beginnerArenas = beginnerStadium.availableRooms

enum AmatureRoom: String, CaseIterable {
    case clubI = "AmatureClubI"
    case clubII = "AmatureClubII"
    case clubIII = "AmatureClubIII"
    case clubIV = "AmatureClubIV"

    var roomValue: Int {
        switch self {
        case .clubI: return 100
        case .clubII: return 200
        case .clubIII: return 500
        case .clubIV: return 1_000
        }
    }
}

let amatureStadium = Stadium.Amature
let amatureArenas = amatureStadium.availableRooms

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
}

let masterStadium = Stadium.Master
let masterArenas = masterStadium.availableRooms