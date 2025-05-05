
struct Card {
    let suit: Suit   // ดอก (เช่น โพธิ์ดำ โพธิ์แดง ข้าวหลามตัด ดอกจิก)
    let rank: Rank   // แต้ม (เช่น 2–10, J, Q, K, A)
}
enum Suit: String, CaseIterable {
    case hearts = "♥", diamonds = "♦", clubs = "♣", spades = "♠"
}

enum Rank: Int, CaseIterable {
    case two = 2, three, four, five, six, seven, eight, nine, ten
    case jack = 11, queen, king, ace
}

// Card.swift

enum Suit: String, CaseIterable {
    case hearts = "♥"
    case diamonds = "♦"
    case clubs = "♣"
    case spades = "♠"
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

// Card.swift

import Foundation

enum Suit: String {
    case hearts = "♥", diamonds = "♦", clubs = "♣", spades = "♠"
}

enum Rank: Int, CaseIterable {
    case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
    
    var display: String {
        switch self {
        case .ace: return "A"
        case .jack: return "J"
        case .queen: return "Q"
        case .king: return "K"
        default: return "

            
