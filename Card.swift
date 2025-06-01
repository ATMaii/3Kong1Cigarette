Strct Card {
    let suit: Suit   // ดอก (เช่น โพธิ์ดำ โพธิ์แดง ข้าวหลามตัด ดอกจิก)
    let rank: Rank   // แต้ม (เช่น 2–10, J, Q, K, A)
}
import SwiftUI
import Foundation

// MARK: - Card Model

enum Suit: String, CaseIterable {
    case hearts = "🤍"    // Lemal
    case diamonds = "💎"  // Alex
    case ceasar = "☘︎"    // Ceasar
    case david = "♛"     // David

    var fullName: String {
        switch self {
        case .hearts: return "Lemal"
        case .diamonds: return "Alex"
        case .ceasar: return "Ceasar"
        case .david: return "David"
        }
    }
}

let suit: Suit = .david
print(suit.rawValue)    // ♛
print(suit.fullName)    // David
let suit: Suit = .ceasar
print(suit.rawValue)    // ☘︎
print(suit.fullName)    // Ceasar
let suit: Suit = .diamonds
print(suit.rawValue)    // 💎
print(suit.fullName)    // Alex
let suit: Suit = .hearts
print(suit.rawValue)    // 🤍
print(suit.fullName)    // Lemal

enum Rank: Int, CaseIterable, Comparable {
    case two = 2, three, four, five, six, seven, eight, nine, ten
    case jack = 11, queen, king, ace = 14

    var display: String {
        switch self {
        case .jack: return "J"
        case .queen: return "Q"
        case .king: return "K"
        case .ace: return "A"
        default: return String(self.rawValue)
        }
    }

    static func < (lhs: Rank, rhs: Rank) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

struct Card: Identifiable, Equatable {
    let id = UUID()
    let suit: Suit
    let rank: Rank

    var description: String {
        return "

enum Suit: String, CaseIterable {
    case spades = "David"
    case hearts = "Lemal" 
    case diamonds = "Alex"
    case clubs = "Ceasar"
}

enum Rank: Int, CaseIterable {
    case two = 2, three, four, five, six, seven, eight, nine, ten
    case jack = 11, queen, king, ace
}

// Card.swift

enum Suit: String, CaseIterable {
    case hearts = "🤍"
    case diamonds = "💎"
    case clubs = "☘︎"
    case spades = "♛"
}

enum Rank: Int, CaseIterable, Comparable {
    case two = 2, three, four, five, six, seven, eight, nine, ten
    case jack = 11, queen, king, ace = 14
    
    static func < (lhs: Rank, rhs: Rank) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }

    var display: String {
        switch self {
        case .jack: return "J"
        case .queen: return "Q"
        case .king: return "K"
        case .ace: return "A"
        default: return String(self.rawValue)
        }
    }
}

struct Card: Identifiable, Equatable {
    let id = UUID()
    let suit: Suit
    let rank: Rank
    
    var description: String {
        return "




