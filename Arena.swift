// Arena.swift



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

struct Arena {
    let stadium: Stadium
    let roomValue: Int
    let playersJoined: Int
    let maxPlayers: Int

    var isFull: Bool {
        return playersJoined >= maxPlayers
    }

    var roomName: String {
        switch stadium {
        case .Rookie:
            return RookieRoom.allCases.first(where: { $0.roomValue == roomValue })?.displayName ?? "Unknown Room"
        case .Beginner:
            return BeginnerRoom.allCases.first(where: { $0.roomValue == roomValue })?.displayName ?? "Unknown Room"
        case .Amature:
            return AmateurRoom.allCases.first(where: { $0.roomValue == roomValue })?.displayName ?? "Unknown Room"
        case .Master:
            return MasterRoom.allCases.first(where: { $0.roomValue == roomValue })?.displayName ?? "Unknown Room"
        }
    }
}

let arena = Arena(stadium: .Rookie, roomValue: 50, playersJoined: 3, maxPlayers: 4)
print("สนาม:

import Foundation

struct Arena { let stadium: Stadium let roomValue: Int let playersJoined: Int let maxPlayers: Int

var isFull: Bool {
    playersJoined >= maxPlayers
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
        "room"

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
    var displayName: String {
        switch self {
    case .arenaI: return "Arena I"
    case .arenaII: return "Arena II"
    case .arenaII: return "Arena III"
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
    case clubI = "Amateur50"
    case clubII = "Amateur100"
    case clubIII = "Amateur200"
    case clubIV = "Amateur500"

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
                
import SwiftUI

struct Arena: Identifiable {
    let id = UUID()
    let name: String
    let color: Color
}

struct ArenaSelectionView: View {
    let arenas = [
        Arena(name: "Allianz Arena", color: .blue),
        Arena(name: "Maracana", color: .green),
        Arena(name: "Wembley", color: .red),
        Arena(name: "Santiago Bernabeu", color: .purple)
    ]

    @State private var selectedArena: Arena?

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("เลือกสนาม")
                    .font(.largeTitle)
                    .bold()

                ForEach(arenas) { arena in
                    Button(action: {
                        selectedArena = arena
                    }) {
                        Text(arena.name)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(arena.color)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(selectedArena?.id == arena.id ? Color.white : Color.clear, lineWidth: 3)
                            )
                    }
                    .padding(.horizontal)
                }

                if let arena = selectedArena {
                    NavigationLink(
                        destination: GameView(arena: arena.name),
                        label: {
                            Text("เข้าสู่สนาม
