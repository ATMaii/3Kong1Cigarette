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

// GameView.swift

import SwiftUI

struct GameView: View {
    @StateObject private var gameLogic = GameLogic(playerNames: ["Player 1", "Player 2", "Player 3", "Player 4"])
    @State private var gameStarted = false
    
    var body: some View {
        VStack {
            Text("Game: 3kong1ciggalate")
                .font(.largeTitle)
                .padding()

            if gameStarted {
                // Loop through each player and display their hand
                ForEach(gameLogic.players, id: \.name) { player in
                    VStack(alignment: .leading) {
                        Text("

                             
// GameView.swift

import SwiftUI

struct GameView: View {
    @StateObject private var gameManager = GameManager()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("3kong1ciggalate")
                .font(.largeTitle)
                .bold()

            ForEach(gameManager.players) { player in
                VStack {
                    Text(player.name)
                        .font(.headline)
                        .padding(.bottom, 4)
                    
                    HStack {
                        ForEach(player.hand.sorted(by: { ($0.suit.rawValue, $0.rank.rawValue) < ($1.suit.rawValue, $1.rank.rawValue) }), id: \.description) { card in
                            Text(card.description())
                                .padding(6)
                                .background(Color.white)
                                .cornerRadius(5)
                                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1))
                        }
                    }

                    Text("คะแนน:

VStack(alignment: .leading, spacing: 4) {
    Text("หัว:                       
