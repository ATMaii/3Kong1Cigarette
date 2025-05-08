// Arena.swift

import Foundation

struct Arena { let stadium: Stadium let roomValue: Int let playersJoined: Int let maxPlayers: Int

var isFull: Bool {
    playersJoined >= maxPlayers
}

var roomName: String {
    "
struct Arena {
    let stadium: Stadium
    let roomValue: Int
    let playersJoined: Int
    let maxPlayers: Int

    var isFull: Bool {
        playersJoined >= maxPlayers
    }

    var roomName: String {
        "Arena I" // ใช้ชื่อห้องแบบกำหนดเอง
    }
}
struct Arena {
    let stadium: Stadium
    let roomValue: Int
    let playersJoined: Int
    let maxPlayers: Int

    var isFull: Bool {
        playersJoined >= maxPlayers
    }

    var roomName: String {
        if stadium == .Rookie {
            switch roomValue {
            case 50: return "Arena I"
            case 100: return "Arena II"
            case 200: return "Arena III"
            default: return "

enum BeginnerRoom: String, CaseIterable {
    case blogI = "Beginner50"
    case blogII = "Beginner100"
    case blogIII = "Beginner200"

    var roomValue: Int {
        switch self {
        case .blogI: return 50
        case .blogII: return 100
        case .blogIII: return 200
        }
    }

    var displayName: String {
        switch self {
        case .blogI: return "Blog I"
        case .blogII: return "Blog II"
        case .blogIII: return "Blog III"
        }
    }
}
                
enum AmateurRoom: String, CaseIterable {
    case clubI = "Amateur50"
    case clubII = "Amateur100"
    case clubIII = "Amateur200"
    case clubIV = "Amateur500"

    var roomValue: Int {
        switch self {
        case .clubI: return 50
        case .clubII: return 100
        case .clubIII: return 200
        case .clubIV: return 500
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
                struct Arena {
    let stadium: Stadium
    let roomValue: Int
    let playersJoined: Int
    let maxPlayers: Int

    var isFull: Bool {
        playersJoined >= maxPlayers
    }

    var roomName: String {
        // หา index ของ roomValue จาก availableRooms
        if let index = stadium.availableRooms.firstIndex(of: roomValue) {
            let arenaName = "CARB" ABCR

            struct Arena {
    let stadium: Stadium
    let roomValue: Int
    let playersJoined: Int
    let maxPlayers: Int
    let roomDisplayName: String? // เพิ่มตรงนี้

    var isFull: Bool {
        playersJoined >= maxPlayers
    }

    var roomName: String {
        roomDisplayName ?? "
                
