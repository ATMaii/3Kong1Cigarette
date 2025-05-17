import SwiftUI

struct StadiumSelectionView: View {
    @State private var selectedStadium: String?

    var body: some View {
        VStack {
            Text("เลือกสนาม")
                .font(.largeTitle)
                .padding()

            HStack {
                // Wembley (E)
                Button(action: {
                    selectedStadium = "Wembley"
                }) {
                    Text("Wembley")
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }

                // Maracana (B)
                Button(action: {
                    selectedStadium = "Maracana (Brazil)"
                }) {
                    Text("Maracana")
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
            }

            HStack {
                // Allianz Arena (A)
                Button(action: {
                    selectedStadium = "Allianz Arena"
                }) {
                    Text("Allianz Arena")
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                // Santiago Bernabéu (S)
                Button(action: {
                    selectedStadium = "Santiago Bernabéu"
                }) {
                    Text("Santiago Bernabéu")
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
            }

            if let selectedStadium = selectedArena {
                Text("คุณเลือกสนาม

    // ฟังก์ชันเมื่อเลือกสนาม
    func goToGame() {
        if let arena = selectedArena {
            print("You selected:

func selectStadium(by chips: Int) -> String? {
    switch chips {
    case 50_000...:
        return "Santiago Bernabeu" // Master
    case 20_000..<50_000:
        return "Allianz Arena" // Amateur
    case 10_000..<20_000:
        return "Brazil" // Beginner
    case 5_000..<10_000:
        return "Wemley" // Rookie
    default:
        return nil // ชิปไม่พอเข้าเล่น
    }
}

enum Stadium {
    case Rookie
    case Beginner
    case Amature
    case Master

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

struct Arena {
    let stadium: Stadium
    let roomValue: Int
    let playersJoined: Int
    let maxPlayers: Int
}

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
}
let beginnerStadium = Stadium.Beginner
let beginnerArenas = beginnerStadium.availableRooms


enum AmatureRoom: String, CaseIterable {
    case clubI = "Amature"
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
    case roomI = "Master500"
    case roomII = "Master1000"
    case roomIII = "Master2000"
    case roomIV = "Master5000"

    var roomValue: Int {
        switch self {
        case .roomI: return 500
        case .roomII: return 1000
        case .roomIII: return 2000
        case .roomIV: return 5000
        }
    }
}
let masterStadium = Stadium.Master
let masterArenas = masterStadium.availableRooms

extension Stadium {
    var minChips: Int {
        switch self {
        case .Rookie: return 5_000
        case .Beginner: return 10_000
        case .Amature: return 20_000
        case .Master: return 50_000
        }
    }
}

import SwiftUI

struct ArenaSelectionView: View {
    @State private var selectedArena: String? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Select a Stadium")
                    .font(.largeTitle)
                    .padding()

                // ปุ่มเลือกสนามที่มีภาพและชื่อสนาม
                VStack {
                    Button(action: { selectedArena = "Allianz Arena" }) {
                        VStack {
                            Image("AllianzArena") // รูปภาพสนาม
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 100)
                            Text("Allianz Arena")
                        }
                    }
                    .padding()

                    Button(action: { selectedArena = "Maracana" }) {
                        VStack {
                            Image("Maracana") // รูปภาพสนาม
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 100)
                            Text("Maracana")
                        }
                    }
                    .padding()

                    Button(action: { selectedArena = "Wembley" }) {
                        VStack {
                            Image("Wembley") // รูปภาพสนาม
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 100)
                            Text("Wembley")
                        }
                    }
                    .padding()

                    Button(action: { selectedArena = "Santiago Bernabeu" }) {
                        VStack {
                            Image("SantiagoBernabeu") // รูปภาพสนาม
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 100)
                            Text("Santiago Bernabeu")
                        }
                    }
                    .padding()
                }

                NavigationLink(destination: GameView(arena: selectedArena ?? "Allianz Arena")) {
                    Text("Enter Arena")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct ArenaSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ArenaSelectionView()
    }
}

import SwiftUI

struct ArenaSelectionView: View {
    @State private var selectedArena: String? = nil

    var body: some View {
        VStack {
            Text("Select Your Arena")
                .font(.largeTitle)
                .padding()

            HStack {
                Button(action: {
                    selectedArena = "Allianz Arena"
                    goToGame()
                }) {
                    Text("Allianz Arena")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                Button(action: {
                    selectedArena = "Maracana"
                    goToGame()
                }) {
                    Text("Maracana")
                        .font(.title)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }

            HStack {
                Button(action: {
                    selectedArena = "Wembley"
                    goToGame()
                }) {
                    Text("Wembley")
                        .font(.title)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                Button(action: {
                    selectedArena = "Santiago Bernabeu"
                    goToGame()
                }) {
                    Text("Santiago Bernabeu")
                        .font(.title)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
    }

    // ฟังก์ชันเมื่อเลือกสนาม
    func goToGame() {
        if let arena = selectedArena {
            print("You selected:

func selectStadium(by chips: Int) -> String? {
    switch chips {
    case 50_000...:
        return "Santiago Bernabeu" // Master
    case 20_000..<50_000:
        return "Allianz Arena" // Amateur
    case 10_000..<20_000:
        return "Brazil" // Beginner
    case 5_000..<10_000:
        return "Wemley" // Rookie
    default:
        return nil // ชิปไม่พอเข้าเล่น
    }
}
struct Arena {
    let stadium: Stadium
    let roomValue: Int // เช่น 50, 100
    let playersJoined: Int
    let maxPlayers: Int
    
    var isFull: Bool {
        playersJoined >= maxPlayers
    }
    
    var roomName: String {
        "


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
Text("ห้อง: 20 Wemley")
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
