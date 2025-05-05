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

    // GameView.swift

import SwiftUI

struct GameView: View {
    @StateObject private var gameLogic = GameLogic(playerNames: ["Player 1", "Player 2", "Player 3", "Player 4"])
    
    var body: some View {
        VStack {
            Text("Game: 3kong1ciggalate")
                .font(.largeTitle)
                .padding()

            // Loop through each player and display their hand
            ForEach(gameLogic.players, id: \.name) { player in
                VStack(alignment: .leading) {
                    Text("

// GameView.swift

import SwiftUI

struct GameView: View {
    @StateObject private var gameLogic = GameLogic(playerNames: ["Player 1", "Player 2", "Player 3", "Player 4"])
    
    var body: some View {
        VStack {
            Text("Game: 3kong1ciggalate")
                .font(.largeTitle)
                .padding()

            // Loop through each player and display their hand
            ForEach(gameLogic.players, id: \.name) { player in
                VStack(alignment: .leading) {
                    Text("

                         
