
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
