Button("แยกไพ่ 3 กอง") {
    for player in gameManager.players {
        let (head, middle, tail) = gameManager.splitIntoThreePiles(player: player)
        print("ผู้เล่นimport SwiftUI

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

@State var players: [Player] = []
@State var gameManager = GameManager()

var body: some View {
    VStack {
        Button("เริ่มเกมใหม่") {
            gameManager.startNewGame(&players)
        }

        ForEach(players.indices, id: \.self) { index in
            PlayerHandView(player: players[index])
        }

        Text("คะแนนรวม:
import SwiftUI

struct GameView: View {
    @State var player = Player()
    @State var deck = Deck()

var body: some View {
        VStack {
            HStack {
                Button("สุ่มไพ่") {
                    deck = Deck()
                    player.hand = []
                    for _ in 0..<13 {
                        if let card = deck.drawCard() {
                            player.hand.append(card)
                        }
                    }
                    player.hand.sort {
                        if $0.suit.rawValue == $1.suit.rawValue {
                            return $0.rank.rawValue < $1.rank.rawValue
                        }
                        return $0.suit.rawValue < $1.suit.rawValue
                    }
                }

                Button("แบ่ง 3 กอง") {
                    player.splitIntoPiles()
                }
            }
            .padding()

            Text("ไพ่ของผู้เล่น").font(.title2)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(player.hand, id: \.self) { card in
                        Text("

Button("เริ่มเกมใหม่") {
    gameManager.startNewGame()
   }                          

import SwiftUI

struct GameView: View {
    @StateObject private var gameManager = GameManager()

    var body: some View {
        VStack {
            ForEach(gameManager.players) { player in
                HStack {
                    Text("ผู้เล่น

import SwiftUI

struct GameView: View {
    @StateObject private var gameManager = GameManager()

    var body: some View {
        VStack {
            ForEach(gameManager.players) { player in
                VStack {
                    Text("ผู้เล่น

import SwiftUI

struct GameView: View {
    @StateObject private var gameManager = GameManager()

    var body: some View {
        VStack {
            ForEach(gameManager.players) { player in
                VStack {
                    Text("ผู้เล่น

import SwiftUI

struct GameView: View {
    @StateObject private var gameManager = GameManager()

    var body: some View {
        VStack {
            // แสดงไพ่และคะแนนของผู้เล่น
            ForEach(gameManager.players) { player in
                VStack {
                    Text("ผู้เล่น

  Button("แยกไพ่ 3 กอง") {
    for player in gameManager.players {
        let (head, middle, tail) = gameManager.splitIntoThreePiles(player: player)
        print("ผู้เล่น                       

        VStack {
    ForEach(players.indices, id: \.self) { index in
        VStack(alignment: .leading) {
            Text("ผู้เล่น

                 
struct GameView: View {
    @ObservedObject var gameManager = GameManager.shared

    var body: some View {
        VStack {
            ForEach(gameManager.players.indices, id: \.self) { index in
                VStack(alignment: .leading) {
                    Text("ผู้เล่น


struct DraggableCard: View {
    let card: Card
    var body: some View {
        Text(card.display) // สมมุติว่าคุณมี display สำหรับ Card
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 2)
            .onDrag {
                return NSItemProvider(object: NSString(string: "

import SwiftUI

class GameTimer: ObservableObject {
    @Published var secondsRemaining: Int = 120 // เปลี่ยนเป็น 120 วินาที
    var timer: Timer?
    var isRunning = false

    func start() {
        if isRunning { return } // ห้ามเริ่มใหม่ถ้ากำลังจับเวลาอยู่
        isRunning = true
        secondsRemaining = 120 // รีเซ็ตเวลาให้กลับไปที่ 120 วินาที
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.secondsRemaining > 0 {
                self.secondsRemaining -= 1
            } else {
                self.stop() // หยุดเวลาเมื่อหมดเวลา
            }
        }
    }

    func stop() {
        timer?.invalidate() // หยุดจับเวลา
        isRunning = false
    }

    func reset() {
        stop()
        secondsRemaining = 120 // รีเซ็ตเวลาเป็น 120 วินาที
    }
}

struct GameView: View {
    @StateObject var gameTimer = GameTimer()
    
    @State private var isGameStarted = false
    
    var body: some View {
        VStack {
            // แสดงเวลาที่เหลือ
            Text("Time Remaining:

                 
