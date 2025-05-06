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
