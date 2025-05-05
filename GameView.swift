import SwiftUI

struct GameView: View {
    @State private var deck = Deck()
    @State private var player = Player()
    
    var body: some View {
        VStack {
            Text("ไพ่ของผู้เล่น").font(.title)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(player.hand.sorted(by: cardSort), id: \.self) { card in
                        Text("
