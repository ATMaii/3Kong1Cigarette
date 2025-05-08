import SwiftUI

struct ArenaSelectionView: View {
    @State private var selectedArena: String?

    var body: some View {
        VStack {
            Text("เลือกสนาม")
                .font(.largeTitle)
                .padding()

            HStack {
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
            }) {
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
            .padding()

            if let selectedArena = selectedArena {
                Text("คุณเลือกสนาม
                
             case Rookie = "Rookie Arena"
             struct Arena {
    let             stadium: Stadium
    ...
                     }
    let arena = Arena(stadium: .Rookie, roomValue: 50, playersJoined: 3, maxPlayers: 4)
print(arena.roomName) // "Rookie Arena 50"
