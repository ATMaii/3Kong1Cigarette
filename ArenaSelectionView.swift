import SwiftUI

struct ArenaSelectionView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("เลือกสนาม")
                    .font(.largeTitle)
                    .bold()

                NavigationLink(destination: ArenaView(rooms: RookieRoom.allCases.map {
                    Room(displayName: $0.displayName, roomValue: $0.roomValue)
                }, stadiumName: "Rookie Stadium")) {
                    Text("Rookie Stadium")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }

                NavigationLink(destination: ArenaView(rooms: BeginnerRoom.allCases.map {
                    Room(displayName: $0.displayName, roomValue: $0.roomValue)
                }, stadiumName: "Beginner Stadium")) {
                    Text("Beginner Stadium")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }

                NavigationLink(destination: ArenaView(rooms: AmateurRoom.allCases.map {
                    Room(displayName: $0.displayName, roomValue: $0.roomValue)
                }, stadiumName: "Amateur Stadium")) {
                    Text("Amateur Stadium")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }

                NavigationLink(destination: ArenaView(rooms: MasterRoom.allCases.map {
                    Room(displayName: $0.displayName, roomValue: $0.roomValue)
                }, stadiumName: "Master Stadium")) {
                    Text("Master Stadium")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }
            .padding()
        }
    }
}

import SwiftUI

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
                    }
                    .padding(.horizontal)
                }

                if let arena = selectedArena {
                    NavigationLink(
                        destination: WaitingRoomView(arena: arena.name),
                        label: {
                            Text("เข้าห้อง


struct ArenaSelectionView: View {
    @State private var selectedArena: String? = nil

    let arenaOptions: [(name: String, image: String, color: Color)] = [
        ("Wembley", "Wembley", .red)
        ("Maracana", "Maracana", .green),
        ("Allianz Arena", "AllianzArena", .blue),
        ("Santiago Bernabeu", "SantiagoBernabeu", .purple)
    ]

    var body: some View {
        NavigationView {
            VStack {
                Text("Select Your Arena")
                    .font(.largeTitle)
                    .padding(.top)

                ForEach(arenaOptions, id: \.name) { arena in
                    Button(action: {
                        selectedArena = arena.name
                    }) {
                        VStack {
                            Image(arena.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 100)
                                .cornerRadius(8)

                            Text(arena.name)
                                .font(.title3)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(arena.color))
                                .padding(.horizontal)
                        }
                    }
                    .padding(.vertical, 5)
                }

                if let selectedArena = selectedArena {
                    NavigationLink(destination: GameView(arena: selectedArena)) {
                        Text("Enter Arena")
                            .font(.title2)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.top, 20)
                    }
                    .padding(.horizontal)
                }

                Spacer()
            }
            .padding()
        }
    }
}

struct GameView: View {
    let arena: String
    var body: some View {
        Text("You entered

import SwiftUI

struct ArenaSelectionView: View {
    @State private var selectedArena: String? = nil
    @State private var navigateToGame = false

    // รายชื่อสนามและชื่อรูป
    let arenas = [
        ("Allianz Arena", "AllianzArena", Color.blue),
        ("Maracana", "Maracana", Color.green),
        ("Wembley", "Wembley", Color.red),
        ("Santiago Bernabeu", "SantiagoBernabeu", Color.purple)
    ]

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Select Your Arena")
                    .font(.largeTitle)
                    .bold()
                    .padding()

                ForEach(0..<arenas.count, id: \.self) { index in
                    let arena = arenas[index]
                    Button(action: {
                        selectedArena = arena.0
                        navigateToGame = true
                    }) {
                        HStack {
                            Image(arena.1)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 80)
                                .cornerRadius(8)

                            Text(arena.0)
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                        }
                        .padding()
                        .background(arena.2)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                    }
                }

                NavigationLink(
                    destination: GameView(arena: selectedArena ?? "Allianz Arena"),
                    isActive: $navigateToGame
                ) {
                    EmptyView()
                }
            }
            .padding()
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
    @State private var selectedArena: String?

    var body: some View {
        VStack {
            Text("เลือกสนาม")
                .font(.largeTitle)
                .padding()

            HStack {
                // Wembley (E)
                Button(action: {
                    selectedArena = "Wembley"
                }) {
                    Text("Wembley")
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }

                // Allianz Arena (A)
                Button(action: {
                    selectedArena = "Allianz Arena"
                }) {
                    Text("Allianz Arena")
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
            HStack {
                // Maracana (B)
                Button(action: {
                    selectedArena = "Maracana (Brazil)"
                }) {
                    Text("Maracana")
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
            }

                // Santiago Bernabéu (S)
                Button(action: {
                    selectedArena = "Santiago Bernabéu"
                }) {
                    Text("Santiago Bernabéu")
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
            }

            if let selectedArena = selectedArena {
                Text("คุณเลือกสนาม

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
                    selectedArena = "Santiago Bernabeu"
                    goToGame()
                }) {
                    Text("Santiago Bernabeu")
                        .font(.title)
                        .padding()
                        .background(Color.purple)
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
            print("You selected: ")

func selectStadium(by chips: Int) -> String? {
    switch chips {
    case 50_000...:
        return "Santiago Bernabeu" // Master
    case 20_000..<50_000:
        return "Allianz Arena" // Amateur
    case 10_000..<20_000:
        return "Maracana" // Beginner
    case 5_000..<10_000:
        return "Wembley" // Rookie
    default:
        return nil // ชิปไม่พอเข้าเล่น
    }
}
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

            Button(action: {
                selectedArena = "Wembley"
            }
                VStack {
                    Image("Wembley") // รูปภาพสนาม Wembley
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 100)
                    Text("Wembley")
                        .font(.title)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                }
                         }
            .padding()

    if let selectedArena = selectedArena {
                Text("คุณเลือกสนาม
                
             case Rookie = "Rookie Arena"
             struct Arena {
    let             stadium: Stadium
    ...
                     }
    let arena = Arena(stadium: .Rookie, roomValue: 20, playersJoined: 4, maxPlayers: 4)
print(arena.roomName) // "Arena I"
    let area = Arena(stadium: .Rookie, roomValue: 50, playersJoined: 4, maxPlayers: 4) print(arena.roomName) // "Arena II"
    let area = Arena(stadium: .Rookie, roomValue: 100, playersJoined: 4, maxPlayers: 4) print(arena.roomName) // "Arena III"
    let area = Arena(stadium: .Rookie, roomValue: 200, playersJoined: 4, maxPlayers: 4) print(arena.roomName) // "Arena IV"
                    }
            }
        }
