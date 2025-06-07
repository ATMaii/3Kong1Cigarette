enum HandProp: Int, Comparable {
    case highCard = 0, onePair, twoPair, trips, straight, flush, fullHouse, quads, straightFlush, royalFlush

    static func < (lhs: HandProp, rhs: HandProp) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

func compareHands(_ hand1: [Card], _ hand2: [Card]) -> Int {
    let prop1 = evaluateHand(hand1)
    let prop2 = evaluateHand(hand2)

    // เทียบว่าใคร Prop ดีกว่า
    if prop1 != prop2 {
        return prop1.rawValue > prop2.rawValue ? 1 : -1
    }

    // ถ้า prop เหมือนกัน → ดู kicker (เรียงลำดับจากใหญ่ไปเล็กก่อน)
    let sorted1 = hand1.sorted(by: { $0.rank.rawValue > $1.rank.rawValue })
    let sorted2 = hand2.sorted(by: { $0.rank.rawValue > $1.rank.rawValue })

    for i in 0..<min(sorted1.count, sorted2.count) {
        if sorted1[i].rank.rawValue > sorted2[i].rank.rawValue {
            return 1
        } else if sorted1[i].rank.rawValue < sorted2[i].rank.rawValue {
            return -1
        }
    }

    return 0 // เสมอทุกใบจริง
}
let Example 

Player 1 

Head: Q♠️, J♦️, J♠️

Middle: K♥️, 10♥️, 9♥️, 4♥️, 3♥️

Tail: A♦️, 9♦️, 8♦️, 7♦️, 2♦️


Player 2

Head: K♠️, K♣️, Q♦️

Middle: J♥️, 7♥️, 5♥️, 6♥️, 2♥️

Tail: 5♠️, 4♠️, 3♠️, 2♠️, A♠️


Player 3

Head: A♥️, A♣️, 3♦️

Middle: 9♣️, 8♣️, 7♣️, 5♣️, 2♣️

Tail: K♦️, 10♦️, 6♦️, 5♦️, 4♦️


Player 4

Head: 8♥️, Q♣️, Q♥️

Middle: J♣️, 10♣️, 6♣️, 4♣️, 3♣️

Tail: 10♠️, 9♠️, 8♠️, 7♠️, 6♠️


จากตัวอย่างไพ่ของแต่ละผู้เล่น (สมมติ):
Player 1 (ผู้เล่น 1) ->

Head: Q♠️, J♦️, J♠️

Middle: K♥️, 10♥️, 9♥️,4♥️,3♥️

Tail: A♦️, 9♦️, 8♦️, 7♦️,2♦️

Player 2 (ผู้เล่น 2) ->

Head: K♠️, K♣️, Q♦️

Middle: 10♠️, 9♠️, 8♠️, 7♠️, 6♠️

Tail: 5♠️, 4♠️, 3♠️, 2♠️, A♠️

Player 3 (ผู้เล่น 3) ->

Head: A♥️, A♣️, 3♦️

Middle: 9♣️, 8♣️, 7♣️, 5♣️, 2♣️

Tail: K♦️, 10♦️, 6♦️, 5♦️, 4♦️

Player 4 (ผู้เล่น 4) ->

Head: 8♥️, Q♣️, Q♥️

Middle: J♥️, 7♥️, 5♥️, 6♥️,2♥️

Tail: J♣️, 10♣️, 6♣️, 4♣️,3♣️


struct Card {
    let rank: Rank
    let suit: Suit
}

enum Rank: Int {
    case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
}

enum Suit: String {
    case spades = "♠", hearts = "♥", diamonds = "♦", clubs = "♣"
}

struct Prop {
    let name: String
    let cards: [Card]
}

let RoyalFlushProps: [Prop]

Prop(name:RoyalFlush
props: [
        Card(rank: .ace, suit: .spades),
        Card(rank: .king, suit: .spades),
        Card(rank: .queen, suit: .spades),
        Card(rank: .jack, suit: .spades),
        Card(rank: .ten, suit: .spades)
    ]),
Prop(name:RoyalFlush
props: [
        Card(rank: .ace, suit: .hearts),
        Card(rank: .king, suit: .hearts),
        Card(rank: .queen, suit: .hearts),
        Card(rank: .jack, suit: .hearts),
        Card(rank: .ten, suit: .hearts)
     ]),
Prop(name:RoyalFlush
props: [
        Card(rank: .ace, suit: .diamonds),
        Card(rank: .king, suit: .diamonds),
        Card(rank: .queen, suit: .diamonds),
        Card(rank: .jack, suit: .diamonds),
        Card(rank: .ten, suit: .diamonds)
    ]),
Prop(name:RoyalFlush
props: [
    Card(rank: .ace, suit: .clubs),
    Card(rank: .king, suit: .clubs),
    Card(rank: .queen, suit: .clubs),
    Card(rank: .jack, suit: .clubs),
    Card(rank: .ten, suit: .clubs),
       ]),
          point: 8

let StraightFlushProps: [Prop]

Prop(name:StraightFlush
props: [
        Card(rank: .ace, suit: .spades),
        Card(rank: .two, suit: .spades),
        Card(rank: .three, suit: .spades),
        Card(rank: .four, suit: .spades),
        Card(rank: .five, suit: .spades)
       ]),

Prop(name:StraightFlush
props: [
        Card(rank: .king, suit: .spades),
        Card(rank: .queen, suit: .spades),
        Card(rank: .jack, suit: .spades),
        Card(rank: .ten, suit: .spades),
        Card(rank: .nine, suit: .spades)
       ]),
                 

Prop(name:StraightFlush
props: [
        Card(rank: .queen, suit: .spades),
        Card(rank: .jack, suit: .spades),
        Card(rank: .ten, suit: .spades),
        Card(rank: .nine, suit: .spades),
        Card(rank: .eight, suit: .spades)
       ]),
                         
Prop(name:StraightFlush
props: [
        Card(rank: .jack, suit: .spades),
        Card(rank: .ten, suit: .spades),
        Card(rank: .nine, suit: .spades),
        Card(rank: .eight, suit: .spades),
        Card(rank: .seven, suit: .spades)
       ]),
                           
Prop(name:StraightFlush
props: [
        Card(rank: .ten, suit: .spades),
        Card(rank: .nine, suit: .spades),
        Card(rank: .eight, suit: .spades),
        Card(rank: .seven, suit: .spades),
        Card(rank: .six, suit: .spades)
       ]),

Prop(name:StraightFlush
props: [
        Card(rank: .nine, suit: .spades),
        Card(rank: .eight, suit: .spades),
        Card(rank: .seven, suit: .spades),
        Card(rank: .six, suit: .spades),
        Card(rank: .five, suit: .spades)
       ]),

Prop(name:StraightFlush
props: [
        Card(rank: .eight, suit: .spades),
        Card(rank: .seven, suit: .spades),
        Card(rank: .six, suit: .spades),
        Card(rank: .five, suit: .spades),
        Card(rank: .four, suit: .spades)
       ]),
           
Prop(name:StraightFlush
props: [
        Card(rank: .seven, suit: .spades),
        Card(rank: .six, suit: .spades),
        Card(rank: .five, suit: .spades),
        Card(rank: .four, suit: .spades),
        Card(rank: .three, suit: .spades)
       ]),
         
Prop(name:StraightFlush
props: [
        Card(rank: .six, suit: .spades),
        Card(rank: .five, suit: .spades),
        Card(rank: .four, suit: .spades),
        Card(rank: .three, suit: .spades),
        Card(rank: .two, suit: .spades)
       ]),

Prop(name:StraightFlush
props: [
        Card(rank: .ace, suit: .hearts),
        Card(rank: .two, suit: .hearts),
        Card(rank: .three, suit: .hearts),
        Card(rank: .four, suit: .hearts),
        Card(rank: .five, suit: .hearts)
       ]),

Prop(name:StraightFlush
props: [
        Card(rank: .king, suit: .hearts),
        Card(rank: .queen, suit: .hearts),
        Card(rank: .jack, suit: .hearts),
        Card(rank: .ten, suit: .hearts),
        Card(rank: .nine, suit: .hearts)
       ]),

Prop(name:StraightFlush
props: [
        Card(rank: .queen, suit: .hearts),
        Card(rank: .jack, suit: .hearts),
        Card(rank: .ten, suit: .hearts),
        Card(rank: .nine, suit: .hearts),
        Card(rank: .eight, suit: .hearts)
       ]),

Prop(name:StraightFlush
props: [
        Card(rank: .jack, suit: .hearts),
        Card(rank: .ten, suit: .hearts),
        Card(rank: .nine, suit: .hearts),
        Card(rank: .eight, suit: .hearts),
        Card(rank: .seven, suit: .hearts)
       ]),

Prop(name:StraightFlush
props: [
        Card(rank: .ten, suit: .hearts),
        Card(rank: .nine, suit: .hearts),
        Card(rank: .eight, suit: .hearts),
        Card(rank: .seven, suit: .hearts),
        Card(rank: .six, suit: .hearts)
       ]),

Prop(name:StraightFlush
props:  [
        Card(rank: .nine, suit: .hearts),
        Card(rank: .eight, suit: .hearts),
        Card(rank: .seven, suit: .hearts),
        Card(rank: .six, suit: .hearts),
        Card(rank: .five, suit: .hearts)
        ]),

Prop(name:StraightFlush
props: [
        Card(rank: .eight, suit: .hearts),
        Card(rank: .seven, suit: .hearts),
        Card(rank: .six, suit: .hearts),
        Card(rank: .five, suit: .hearts),
        Card(rank: .four, suit: .hearts)
        ]),

Prop(name:StraightFlush
props: [
        Card(rank: .seven, suit: .hearts),
        Card(rank: .six, suit: .hearts),
        Card(rank: .five, suit: .hearts),
        Card(rank: .four, suit: .hearts),
        Card(rank: .three, suit: .hearts)
       ]),

Prop(name:StraightFlush
props: [
        Card(rank: .six, suit: .hearts),
        Card(rank: .five, suit: .hearts),
        Card(rank: .four, suit: .hearts),
        Card(rank: .three, suit: .hearts),
        Card(rank: .two, suit: .hearts)
       ]),

Prop(name:StraightFlush
props: [
        Card(rank: .ace, suit: .diamonds),
        Card(rank: .two, suit: .diamonds),
        Card(rank: .three, suit: .diamonds),
        Card(rank: .four, suit: .diamonds),
        Card(rank: .five, suit: .diamonds)
       ]),

Prop(name:StraightFlush
props: [
        Card(rank: .king, suit: .diamonds),
        Card(rank: .queen, suit: .diamonds),
        Card(rank: .jack, suit: .diamonds),
        Card(rank: .ten, suit: .diamonds),
        Card(rank: .nine, suit: .diamonds)
       ]),

Prop(name:StraightFlush
props: [
        Card(rank: .queen, suit: .diamonds),
        Card(rank: .jack, suit: .diamonds),
        Card(rank: .ten, suit: .diamonds),
        Card(rank: .nine, suit: .diamonds),
        Card(rank: .eight, suit: .diamonds)
       ]),

Prop(name:StraightFlush
props: [
        Card(rank: .jack, suit: .diamonds),
        Card(rank: .ten, suit: .diamonds),
        Card(rank: .nine, suit: .diamonds),
        Card(rank: .eight, suit: .diamonds),
        Card(rank: .seven, suit: .diamonds)
       ]),

Prop(name:StraightFlush
props: [
        Card(rank: .ten, suit: .diamonds),
        Card(rank: .nine, suit: .diamonds),
        Card(rank: .eight, suit: .diamonds),
        Card(rank: .seven, suit: .diamonds),
        Card(rank: .six, suit: .diamonds)
       ]),

Prop(name:StraightFlush
props: [
        Card(rank: .nine, suit: .diamonds),
        Card(rank: .eight, suit: .diamonds),
        Card(rank: .seven, suit: .diamonds),
        Card(rank: .six, suit: .diamonds),
        Card(rank: .five, suit: .diamonds)
       ]),

Prop(name:StraightFlush
props: [
        Card(rank: .eight, suit: .diamonds),
        Card(rank: .seven, suit: .diamonds),
        Card(rank: .six, suit: .diamonds),
        Card(rank: .five, suit: .diamonds),
        Card(rank: .four, suit: .diamonds)
        ]),

Prop(name:StraightFlush
props: [
        Card(rank: .seven, suit: .diamonds),
        Card(rank: .six, suit: .diamonds),
        Card(rank: .five, suit: .diamonds),
        Card(rank: .four, suit: .diamonds),
        Card(rank: .three, suit: .diamonds)
       ]),

Prop(name:StraightFlush
props: [
        Card(rank: .six, suit: .diamonds),
        Card(rank: .five, suit: .diamonds),
        Card(rank: .four, suit: .diamonds),
        Card(rank: .three, suit: .diamonds),
        Card(rank: .two, suit: .diamonds)
        ]),
             point: 7
     
}

let fourOfAKindProps: [Prop]

Prop(name:FourAce
props: [
    Card(rank: .ace, suit: .spades),
    Card(rank: .ace, suit: .hearts),
    Card(rank: .ace, suit: .clubs),
    Card(rank: .ace, suit: .diamonds),
    Card(rank: .two, suit: .hearts)
    ]),

// Four Kings + 3
Prop(name: FourKing
props: [
        Card(rank: .king, suit: .spades),
        Card(rank: .king, suit: .hearts),
        Card(rank: .king, suit: .clubs),
        Card(rank: .king, suit: .diamonds),
        Card(rank: .three, suit: .spades)
    ]),

// Four Queens + 4
Prop(name: FourMam
props: [  
        Card(rank: .queen, suit: .spades),
        Card(rank: .queen, suit: .hearts),
        Card(rank: .queen, suit: .clubs),
        Card(rank: .queen, suit: .diamonds),
        Card(rank: .four, suit: .hearts)
    ]),

// Four Jacks + 5
Prop(name: FourJack
props: [ 
        Card(rank: .jack, suit: .spades),
        Card(rank: .jack, suit: .hearts),
        Card(rank: .jack, suit: .clubs),
        Card(rank: .jack, suit: .diamonds),
        Card(rank: .five, suit: .clubs)
    ]),

// Four Tens + 6
Prop(name: Four10
props: [ 
        Card(rank: .ten, suit: .spades),
        Card(rank: .ten, suit: .hearts),
        Card(rank: .ten, suit: .clubs),
        Card(rank: .ten, suit: .diamonds),
        Card(rank: .six, suit: .diamonds)
    ]),

// Four Nines + 7
Prop(name: Four9
props: [ 
        Card(rank: .nine, suit: .spades),
        Card(rank: .nine, suit: .hearts),
        Card(rank: .nine, suit: .clubs),
        Card(rank: .nine, suit: .diamonds),
        Card(rank: .seven, suit: .spades)
    ]),

// Four Eights + 9
Prop(name: Four8
props: [  
        Card(rank: .eight, suit: .spades),
        Card(rank: .eight, suit: .hearts),
        Card(rank: .eight, suit: .clubs),
        Card(rank: .eight, suit: .diamonds),
        Card(rank: .nine, suit: .hearts)
    ]),

// Four Sevens + 10
Prop(name: Four7
props: [ 
        Card(rank: .seven, suit: .spades),
        Card(rank: .seven, suit: .hearts),
        Card(rank: .seven, suit: .clubs),
        Card(rank: .seven, suit: .diamonds),
        Card(rank: .ten, suit: .clubs)
    ]),

// Four Sixes + J
Prop(name: Four6
props: [ 
        Card(rank: .six, suit: .spades),
        Card(rank: .six, suit: .hearts),
        Card(rank: .six, suit: .clubs),
        Card(rank: .six, suit: .diamonds),
        Card(rank: .jack, suit: .diamonds)
    ]),

// Four Fives + Q
Prop(name: Four5 
props: [
        Card(rank: .five, suit: .spades),
        Card(rank: .five, suit: .hearts),
        Card(rank: .five, suit: .clubs),
        Card(rank: .five, suit: .diamonds),
        Card(rank: .queen, suit: .spades)
    ]),

// Four Fours + K
Prop(name: FourOf4
props: [ 
        Card(rank: .four, suit: .spades),
        Card(rank: .four, suit: .hearts),
        Card(rank: .four, suit: .clubs),
        Card(rank: .four, suit: .diamonds),
        Card(rank: .king, suit: .hearts)
    ]),

// Four Threes + A
Prop(name: Four3
props: [
        Card(rank: .three, suit: .spades),
        Card(rank: .three, suit: .hearts),
        Card(rank: .three, suit: .clubs),
        Card(rank: .three, suit: .diamonds),
        Card(rank: .ace, suit: .clubs)
    ]),

// Four Twos + 9
Prop(name: Four2
props: [
        Card(rank: .two, suit: .spades),
        Card(rank: .two, suit: .hearts),
        Card(rank: .two, suit: .clubs),
        Card(rank: .two, suit: .diamonds),
        Card(rank: .nine, suit: .diamonds)
    ]
       )   point: 6 
}

struct Prop {
    let name: FullHouse
    let props: [Card] // การเก็บไพ่ใน Prop นี้
}

let fullHousesProp : [Prop]
     
    // AAAKK
prop(name:HouseAce
props : [
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil)
    ]),
    // AAAQQ
prop(name:HouseAce
props : [
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil)
    ]),
    // AAAJJ
prop(name:HouseAce
props :[
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil)
    ]),
    // AAA10
prop(name:HouseAce
props :[
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil)
    ]),
    // AAA99
prop(name:HouseAce
props :[
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil)
    ]),
    // AAA88
prop(name:HouseAce
props :[
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil)
    ]),
    // AAA77
prop(name:HouseAce
props :[
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil)
    ]),
    // AAA66
prop(name:HouseAce
props :[
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil)
    ]),
    // AAA55
prop(name:HouseAce
props :[
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil)
    ]),
    // AAA44
prop(name:HouseAce
props :[
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil)
    ]),
    // AAA33
prop(name:HouseAce
props :[
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil)
    ]),
    // AAA22
prop(name:HouseAce
props :[
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil)
    ]),
            point: 2
    ]

// ต่อจาก fullHouses
let moreFullHouses: [Prop]

    // KKKAA
prop(name:HouseKing
props :
    [
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil)
    ]),
    // KKKQQ
prop(name:HouseKing
props :
    [
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil)
    ]),
    // KKKJJ
prop(name:HouseKing
props :
    [
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil)
    ]),
    // KKK10
prop(name:HouseKing
props :
    [
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil)
    ]),
    // KKK99
prop(name:HouseKing
props :
    [
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil)
    ]),
    // KKK88
prop(name:HouseKing
props :
    [
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil)
    ]),
    // KKK77
prop(name:HouseKing
props :
    [
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil)
    ]),
    // KKK66
prop(name:HouseKing
props :
    [
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil)
    ]),
    // KKK55
prop(name:HouseKing
props :
    [
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil)
    ]),
    // KKK44
prop(name:HouseKing
props :
    [
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil)
    ]),
    // KKK33
prop(name:HouseKing
props :
    [
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil)
    ]),
    // KKK22
prop(name:HouseKing
props :
    [
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil)
    ]),
]

prop(name : HouseMam
    // QQQAA
props :[
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil)
    ],
     // QQQKK
props :[
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil)
    ],
    // QQQJJ
props :[
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil)
    ],
    // QQQ10
props :[
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil)
    ],
    // QQQ99
props :[
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil)
    ],
    // QQQ88
props :[
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil)
    ],
    // QQQ77
props :[
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil)
    ],
    // QQQ66
props :[
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil)
    ],
    // QQQ55
props :[
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil)
    ],
    // QQQ44
props :[
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil)
    ],
    // QQQ33
 props :[
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil)
    ],
    // QQQ22
props :[
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil)
    ]
)

Prop (name : HouseJack
    // JJJAA
props : [
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil)
    ],
    // JJJKK
props : [
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil)
    ],
    // JJJQQ
props : [
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil)
    ],
    // JJJ10
props : [
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil)
    ],
    // JJJ99
props : [
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil)
    ],
    // JJJ88
props : [
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil)
    ],
    // JJJ77
props : [
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil)
    ],
    // JJJ66
props : [
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil)
    ],
    // JJJ55
props : [
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil)
    ],
    // JJJ44
props : [
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil)
    ],
    // JJJ33
props : [
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil)
    ],
    // JJJ22
props : [
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil)
    ]
)

Prop (name : Houses10
    // 10-10-10 AA
props : [
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil)
    ],
    // 10-10-10 KK
props : [
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil)
    ],
    // 10-10-10 QQ
props : [
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil)
    ],
    // 10-10-10 JJ
props : [
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil)
    ],
    // 10-10-10 99
props : [
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil)
    ],
    // 10-10-10 88
props : [
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil)
    ],
    // 10-10-10 77
props : [
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil)
    ],
    // 10-10-10 66
props : [
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil)
    ],
    // 10-10-10 55
props : [
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil)
    ],
    // 10-10-10 44
props : [
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil)
    ],
    // 10-10-10 33
props : [
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil)
    ],
    // 10-10-10 22
props : [
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil)
    ]
)

Prop (name : Houses999
    // 999AA
props :    [
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil)
    ],
    // 999KK
props :    [
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil)
    ],
    // 999QQ
props :    [
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil)
    ],
    // 999JJ
props :    [
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil)
    ],
    // 99910
props :    [
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil)
    ],
    // 99988
props :    [
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil)
    ],
    // 99977
props :    [
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil)
    ],
    // 99966
props :    [
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil)
    ],
    // 99955
props :    [
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil)
    ],
    // 99944
props :    [
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil)
    ],
    // 99933
props :    [
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil)
    ],
    // 99922
props :    [
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil)
    ]
)

Prop(name : fullHouses888
    // 888AA
props :    [
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil)
    ],
    // 888KK
props :    [
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil)
    ],
    // 888QQ
props :    [
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil)
    ],
    // 888JJ
props :    [
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil)
    ],
    // 88810
props :    [
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil)
    ],
    // 88899
props :    [
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil)
    ],
    // 88877
props :    [
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil)
    ],
    // 88866
props :    [
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil)
    ],
    // 88855
props :    [
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil)
    ],
    // 88844
props :    [
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil)
    ],
    // 88833
props :    [
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil)
    ],
    // 88822
props :    [
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil)
    ]
)

Prop(name : fullHouses777
    // 777AA
props :    [
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil)
    ],
    // 777KK
props :    [
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil)
    ],
    // 777QQ
props :    [
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil)
    ],
    // 777JJ
props :    [
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil)
    ],
    // 77710
props :    [
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil)
    ],
    // 77799
props :    [
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil)
    ],
    // 77788
props :    [
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil)
    ],
    // 77766
props :    [
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil)
    ],
    // 77755
props :    [
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil)
    ],
    // 77744
props :    [
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil)
    ],
    // 77733
props :    [
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil)
    ],
    // 77722
props :    [
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil)
    ]
)

Prop (name : fullHouses666
    // 666AA
props :    [
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil)
    ],
    // 666KK
props :    [
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil)
    ],
    // 666QQ
props :    [
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil)
    ],
    // 666JJ
props :    [
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil)
    ],
    // 66610-10
props :    [
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil)
    ],
    // 66699
props :    [
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil)
    ],
    // 66688
props :    [
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil)
    ],
    // 66677
props :    [
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil)
    ],
    // 66655
props :    [
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil)
    ],
    // 66644
props :    [
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil)
    ],
    // 66633
props :    [
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil)
    ],
    // 66622
props :    [
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil)
    ]
)

Prop (name : fullHouses555
    // 555AA
props :    [
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil)
    ],
    // 555KK
props :    [
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil)
    ],
    // 555QQ
props :    [
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil)
    ],
    // 555JJ
props :    [
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil)
    ],
    // 55510
props :    [
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil)
    ],
    // 55599
props :    [
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil)
    ],
    // 55588
props :    [
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil)
    ],
    // 55577
props :    [
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil)
    ],
    // 55566
props :   [
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil)
    ],
    // 55544
props :    [
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil)
    ],
    // 55533
props :    [
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil)
    ],
    // 55522
props :    [
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil)
    ]
)

Prop (name : fullHouses444
    // 444AA
props :    [
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil)
    ],
    // 444KK
props :    [
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil)
    ],
    // 444QQ
props :    [
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil)
    ],
    // 444JJ
props :    [
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil)
    ],
    // 44410
 props :   [
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil)
    ],
    // 44499
props :    [
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil)
    ],
    // 44488
props :    [
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil)
    ],
    // 44477
props :    [
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil)
    ],
    // 44466
props :    [
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil)
    ],
    // 44455
props :    [
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil)
    ],
    // 44433
props :    [
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil)
    ],
    // 44422
props :    [
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil)
    ]
)

Prop (name : fullHouses333
    // 333AA
props :    [
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil)
    ],
    // 333KK
props :    [
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil)
    ],
    // 333QQ
props :    [
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil)
    ],
    // 333JJ
props :    [
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil)
    ],
    // 33310
props :    [
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil)
    ],
    // 33399
props :    [
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil)
    ],
    // 33388
props :    [
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil)
    ],
    // 33377
props :    [
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil)
    ],
    // 33366
props :    [
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil)
    ],
    // 33355
props :    [
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil)
    ],
    // 33344
props :    [
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil)
    ],
    // 33322
props :    [
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil)
    ]
)

Prop (name : fullHouses222
    // 222AA
props :    [
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil)
    ],
    // 222KK
props :    [
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil)
    ],
    // 222QQ
props :    [
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil)
    ],
    // 222JJ
props :    [
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil)
    ],
    // 22210
props :    [
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil)
    ],
    // 22299
props :    [
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil)
    ],
    // 22288
props :    [
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil)
    ],
    // 22277
props :    [
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil)
    ],
    // 22266
props :    [
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil)
    ],
    // 22255
props :    [
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil)
    ],
    // 22244
props :    [
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil)
    ],
    // 22233
props :    [
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil)
    ]
             point: 1
)

}


struct flushRanks: [[Rank]] = [Prop
    [.ace, .king, .queen, .jack, .nine],
    [.ace, .king, .queen, .jack, .eight],
    [.ace, .king, .queen, .jack, .seven],
    [.ace, .king, .queen, .jack, .six],
    [.ace, .king, .queen, .jack, .five],
    [.ace, .king, .queen, .jack, .four],
    [.ace, .king, .queen, .jack, .three],
    [.ace, .king, .queen, .jack, .two],
    [.ace, .king, .queen, .ten, .nine],
    [.ace, .king, .queen, .ten, .eight],
    [.ace, .king, .queen, .ten, .seven],
    [.ace, .king, .queen, .ten, .six],
    [.ace, .king, .queen, .ten, .five],
    [.ace, .king, .queen, .ten, .four],
    [.ace, .king, .queen, .ten, .three],
    [.ace, .king, .queen, .ten, .two],
    [.ace, .king, .queen, .nine, .eight],
    [.ace, .king, .queen, .nine, .seven],
    [.ace, .king, .queen, .nine, .six],
    [.ace, .king, .queen, .nine, .five],
    [.ace, .king, .queen, .nine, .four],
    [.ace, .king, .queen, .nine, .three],
    [.ace, .king, .queen, .nine, .two],
    [.ace, .king, .queen, .eight, .seven],
    [.ace, .king, .queen, .eight, .six],
    [.ace, .king, .queen, .eight, .five],
    [.ace, .king, .queen, .eight, .four],
    [.ace, .king, .queen, .eight, .three],
    [.ace, .king, .queen, .eight, .two],
    [.ace, .king, .queen, .seven, .six],
    [.ace, .king, .queen, .seven, .five],
    [.ace, .king, .queen, .seven, .four],
    [.ace, .king, .queen, .seven, .three],
    [.ace, .king, .queen, .seven, .two],
    [.ace, .king, .queen, .six, .five],
    [.ace, .king, .queen, .six, .four],
    [.ace, .king, .queen, .six, .three],
    [.ace, .king, .queen, .six, .two],
    [.ace, .king, .queen, .five, .four],
    [.ace, .king, .queen, .five, .three],
    [.ace, .king, .queen, .five, .two],
    [.ace, .king, .queen, .four, .three],
    [.ace, .king, .queen, .four, .two],
    [.ace, .king, .queen, .three, .two],
    [.ace, .king, .jack, .ten, .nine],
    [.ace, .king, .jack, .ten, .eight],
    [.ace, .king, .jack, .ten, .seven],
    [.ace, .king, .jack, .ten, .six],
    [.ace, .king, .jack, .ten, .five],
    [.ace, .king, .jack, .ten, .four],
    [.ace, .king, .jack, .ten, .three],
    [.ace, .king, .jack, .ten, .two],
    [.ace, .king, .jack, .nine, .eight],
    [.ace, .king, .jack, .nine, .seven],
    [.ace, .king, .jack, .nine, .six],
    [.ace, .king, .jack, .nine, .five],
    [.ace, .king, .jack, .nine, .four],
    [.ace, .king, .jack, .nine, .three],
    [.ace, .king, .jack, .nine, .two],
    [.ace, .king, .jack, .eight, .seven],
    [.ace, .king, .jack, .eight, .six],
    [.ace, .king, .jack, .eight, .five],
    [.ace, .king, .jack, .eight, .four],
    [.ace, .king, .jack, .eight, .three],
    [.ace, .king, .jack, .eight, .two],
    [.ace, .king, .jack, .seven, .six],
    [.ace, .king, .jack, .seven, .five],
    [.ace, .king, .jack, .seven, .four],
    [.ace, .king, .jack, .seven, .three],
    [.ace, .king, .jack, .seven, .two],
    [.ace, .king, .jack, .six, .five],
    [.ace, .king, .jack, .six, .four],
    [.ace, .king, .jack, .six, .three],
    [.ace, .king, .jack, .six, .two],
    [.ace, .king, .jack, .five, .four],
    [.ace, .king, .jack, .five, .three],
    [.ace, .king, .jack, .five, .two],
    [.ace, .king, .jack, .four, .three],
    [.ace, .king, .jack, .four, .two],
    [.ace, .king, .jack, .three, .two],
    [.ace, .king, .ten, .nine, .eight],
    [.ace, .king, .ten, .nine, .seven],
    [.ace, .king, .ten, .nine, .six],
    [.ace, .king, .ten, .nine, .five],
    [.ace, .king, .ten, .nine, .four],
    [.ace, .king, .ten, .nine, .three],
    [.ace, .king, .ten, .nine, .two],
    [.ace, .king, .ten, .eight, .seven],
    [.ace, .king, .ten, .eight, .six],
    [.ace, .king, .ten, .eight, .five],
    [.ace, .king, .ten, .eight, .four],
    [.ace, .king, .ten, .eight, .three],
    [.ace, .king, .ten, .eight, .two],
    [.ace, .king, .ten, .seven, .six],
    [.ace, .king, .ten, .seven, .five],
    [.ace, .king, .ten, .seven, .four],
    [.ace, .king, .ten, .seven, .three],
    [.ace, .king, .ten, .seven, .two],
    [.ace, .king, .ten, .six, .five],
    [.ace, .king, .ten, .six, .four],
    [.ace, .king, .ten, .six, .three],
    [.ace, .king, .ten, .six, .two],
    [.ace, .king, .ten, .five, .four],
    [.ace, .king, .ten, .five, .three],
    [.ace, .king, .ten, .five, .two],
    [.ace, .king, .ten, .four, .three],
    [.ace, .king, .ten, .four, .two],
    [.ace, .king, .ten, .three, .two],
    [.ace, .king, .nine, .eight, .seven],
    [.ace, .king, .nine, .eight, .six],
    [.ace, .king, .nine, .eight, .five],
    [.ace, .king, .nine, .eight, .four],
    [.ace, .king, .nine, .eight, .three],
    [.ace, .king, .nine, .eight, .two],
    [.ace, .king, .nine, .seven, .six],
    [.ace, .king, .nine, .seven, .five],
    [.ace, .king, .nine, .seven, .four],
    [.ace, .king, .nine, .seven, .three],
    [.ace, .king, .nine, .seven, .two],
    [.ace, .king, .nine, .six, .five],
    [.ace, .king, .nine, .six, .four],
    [.ace, .king, .nine, .six, .three],
    [.ace, .king, .nine, .six, .two],
    [.ace, .king, .nine, .five, .four],
    [.ace, .king, .nine, .five, .three],
    [.ace, .king, .nine, .five, .two],
    [.ace, .king, .nine, .four, .three],
    [.ace, .king, .nine, .four, .two],
    [.ace, .king, .nine, .three, .two],
    [.ace, .king, .eight, .seven, .six],
    [.ace, .king, .eight, .seven, .five],
    [.ace, .king, .eight, .seven, .four],
    [.ace, .king, .eight, .seven, .three],
    [.ace, .king, .eight, .seven, .two],
    [.ace, .king, .eight, .six, .four],
    [.ace, .king, .eight, .six, .three],
    [.ace, .king, .eight, .six, .two],
    [.ace, .king, .eight, .five, .four],
    [.ace, .king, .eight, .five, .three],
    [.ace, .king, .eight, .five, .two],
    [.ace, .king, .eight, .four, .three],
    [.ace, .king, .eight, .four, .two],
    [.ace, .king, .eight, .three, .two],
    [.ace, .king, .seven, .six, .five],
    [.ace, .king, .seven, .six, .four],
    [.ace, .king, .seven, .six, .three],
    [.ace, .king, .seven, .six, .two],
    [.ace, .king, .seven, .five, .four],
    [.ace, .king, .seven, .five, .three],
    [.ace, .king, .seven, .five, .two],
    [.ace, .king, .seven, .four, .three],
    [.ace, .king, .seven, .four, .two],
    [.ace, .king, .seven, .three, .two],
    [.ace, .king, .six, .five, .four],
    [.ace, .king, .six, .five, .three],
    [.ace, .king, .six, .five, .two],
    [.ace, .king, .six, .four, .three],
    [.ace, .king, .six, .four, .two],
    [.ace, .king, .six, .three, .two],
    [.ace, .king, .five, .four, .three],
    [.ace, .king, .five, .four, two],
    [.ace, .king, .five, .three, two],
    [.ace, .king, .four, .three, .two],

    [.ace, .queen, .jack, .ten, .nine],
    [.ace, .queen, .jack, .ten, .eight],
    [.ace, .queen, .jack, .ten, .seven],
    [.ace, .queen, .jack, .ten, .six],
    [.ace, .queen, .jack, .ten, .five],
    [.ace, .queen, .jack, .ten, .four],
    [.ace, .queen, .jack, .ten, .three],
    [.ace, .queen, .jack, .ten, .two],
    [.ace, .queen, .jack, .nine, .eight],
    [.ace, .queen, .jack, .nine, .seven],
    [.ace, .queen, .jack, .nine, .six],
    [.ace, .queen, .jack, .nine, .five],
    [.ace, .queen, .jack, .nine, .four],
    [.ace, .queen, .jack, .nine, .three],
    [.ace, .queen, .jack, .nine, .two],
    [.ace, .queen, .jack, .eight, .seven],
    [.ace, .queen, .jack, .eight, .six],
    [.ace, .queen, .jack, .eight, .five],
    [.ace, .queen, .jack, .eight, .four],
    [.ace, .queen, .jack, .eight, .three],
    [.ace, .queen, .jack, .eight, .two],
    [.ace, .queen, .jack, .seven, .six],
    [.ace, .queen, .jack, .seven, .five],
    [.ace, .queen, .jack, .seven, .four],
    [.ace, .queen, .jack, .seven, .three],
    [.ace, .queen, .jack, .seven, .two],
    [.ace, .queen, .jack, .six, .five],
    [.ace, .queen, .jack, .six, .four],
    [.ace, .queen, .jack, .six, .three],
    [.ace, .queen, .jack, .six, .two],
    [.ace, .queen, .jack, .five, .four],
    [.ace, .queen, .jack, .five, .three],
    [.ace, .queen, .jack, .five, .two],
    [.ace, .queen, .jack, .four, .three],
    [.ace, .queen, .jack, .four, .two],
    [.ace, .queen, .jack, .three, .two],
    [.ace, .queen, .ten, .nine, .eight],
    [.ace, .queen, .ten, .nine, .seven],
    [.ace, .queen, .ten, .nine, .six],
    [.ace, .queen, .ten, .nine, .five],
    [.ace, .queen, .ten, .nine, .four],
    [.ace, .queen, .ten, .nine, .three],
    [.ace, .queen, .ten, .nine, .two],
    [.ace, .queen, .ten, .eight, .seven],
    [.ace, .queen, .ten, .eight, .six],
    [.ace, .queen, .ten, .eight, .five],
    [.ace, .queen, .ten, .eight, .four],
    [.ace, .queen, .ten, .eight, .three],
    [.ace, .queen, .ten, .eight, .two],
    [.ace, .queen, .ten, .seven, .six],
    [.ace, .queen, .ten, .seven, .five],
    [.ace, .queen, .ten, .seven, .four],
    [.ace, .queen, .ten, .seven, .three],
    [.ace, .queen, .ten, .seven, .two],
    [.ace, .queen, .ten, .six, .five],
    [.ace, .queen, .ten, .six, .four],
    [.ace, .queen, .ten, .six, .three],
    [.ace, .queen, .ten, .six, .two],
    [.ace, .queen, .ten, .five, .four],
    [.ace, .queen, .ten, .five, .three],
    [.ace, .queen, .ten, .five, .two],
    [.ace, .queen, .ten, .four, .three],
    [.ace, .queen, .ten, .four, .two],
    [.ace, .queen, .ten, .three, .two],
    [.ace, .queen, .nine, .eight, .seven],
    [.ace, .queen, .nine, .eight, .six],
    [.ace, .queen, .nine, .eight, .five],
    [.ace, .queen, .nine, .eight, .four],
    [.ace, .queen, .nine, .eight, .three],
    [.ace, .queen, .nine, .eight, .two],
    [.ace, .queen, .nine, .seven, .six],
    [.ace, .queen, .nine, .seven, .five],
    [.ace, .queen, .nine, .seven, .four],
    [.ace, .queen, .nine, .seven, .three],
    [.ace, .queen, .nine, .seven, .two],
    [.ace, .queen, .nine, .six, .five],
    [.ace, .queen, .nine, .six, .four],
    [.ace, .queen, .nine, .six, .three],
    [.ace, .queen, .nine, .six, .two],
    [.ace, .queen, .nine, .five, .four],
    [.ace, .queen, .nine, .five, .three],
    [.ace, .queen, .nine, .five, .two],
    [.ace, .queen, .nine, .four, .three],
    [.ace, .queen, .nine, .four, .two],
    [.ace, .queen, .nine, .three, .two],
    [.ace, .queen, .eight, .seven, .six],
    [.ace, .queen, .eight, .seven, .five],
    [.ace, .queen, .eight, .seven, .four],
    [.ace, .queen, .eight, .seven, .three],
    [.ace, .queen, .eight, .seven, .two],
    [.ace, .queen, .eight, .six, .five],
    [.ace, .queen, .eight, .six, .four],
    [.ace, .queen, .eight, .six, .three],
    [.ace, .queen, .eight, .six, .two],
    [.ace, .queen, .eight, .five, .four],
    [.ace, .queen, .eight, .five, .three],
    [.ace, .queen, .eight, .five, .two],
    [.ace, .queen, .eight, .four, .three],
    [.ace, .queen, .eight, .four, .two],
    [.ace, .queen, .eight, .three, .two],
    [.ace, .queen, .seven, .six, .five],
    [.ace, .queen, .seven, .six, .four],
    [.ace, .queen, .seven, .six, .three],
    [.ace, .queen, .seven, .six, .two],
    [.ace, .queen, .seven, .five, .four],
    [.ace, .queen, .seven, .five, .three],
    [.ace, .queen, .seven, .five, .two],
    [.ace, .queen, .seven, .four, .three],
    [.ace, .queen, .seven, .four, .two],
    [.ace, .queen, .seven, .three, .two],
    [.ace, .queen, .six, .five, .four],
    [.ace, .queen, .six, .five, .three],
    [.ace, .queen, .six, .five, .two],
    [.ace, .queen, .six, .four, .three],
    [.ace, .queen, .six, .four, .two],
    [.ace, .queen, .six, .three, .two],
    [.ace, .queen, .five, .four, .three],
    [.ace, .queen, .five, .four, .two],
    [.ace, .queen, .four, .three, .two],

    [.ace, .jack, .ten, .nine, .eight],
    [.ace, .jack, .ten, .nine, .seven],
    [.ace, .jack, .ten, .nine, .six],
    [.ace, .jack, .ten, .nine, .five],
    [.ace, .jack, .ten, .nine, .four],
    [.ace, .jack, .ten, .nine, .three],
    [.ace, .jack, .ten, .nine, .two],
    [.ace, .jack, .ten, .eight, .seven],
    [.ace, .jack, .ten, .eight, .six],
    [.ace, .jack, .ten, .eight, .five],
    [.ace, .jack, .ten, .eight, .four],
    [.ace, .jack, .ten, .eight, .three],
    [.ace, .jack, .ten, .eight, .two],
    [.ace, .jack, .ten, .seven, .six],
    [.ace, .jack, .ten, .seven, .five],
    [.ace, .jack, .ten, .seven, .four],
    [.ace, .jack, .ten, .seven, .three],
    [.ace, .jack, .ten, .seven, .two],
    [.ace, .jack, .ten, .six, .five],
    [.ace, .jack, .ten, .six, .four],
    [.ace, .jack, .ten, .six, .three],
    [.ace, .jack, .ten, .six, .two],
    [.ace, .jack, .ten, .five, .four],
    [.ace, .jack, .ten, .five, .three],
    [.ace, .jack, .ten, .five, .two],
    [.ace, .jack, .ten, .four, .three],
    [.ace, .jack, .ten, .four, .two],
    [.ace, .jack, .ten, .three, .two],
    [.ace, .jack, .nine, .eight, .seven],
    [.ace, .jack, .nine, .eight, .six],
    [.ace, .jack, .nine, .eight, .five],
    [.ace, .jack, .nine, .eight, .four],
    [.ace, .jack, .nine, .eight, .three],
    [.ace, .jack, .nine, .eight, .two],
    [.ace, .jack, .nine, .seven, .six],
    [.ace, .jack, .nine, .seven, .five],
    [.ace, .jack, .nine, .seven, .four],
    [.ace, .jack, .nine, .seven, .three],
    [.ace, .jack, .nine, .seven, .two],
    [.ace, .jack, .nine, .six, .five],
    [.ace, .jack, .nine, .six, .four],
    [.ace, .jack, .nine, .six, .three],
    [.ace, .jack, .nine, .six, .two],
    [.ace, .jack, .nine, .five, .four],
    [.ace, .jack, .nine, .five, .three],
    [.ace, .jack, .nine, .five, .two],
    [.ace, .jack, .nine, .four, .three],
    [.ace, .jack, .nine, .four, .two],
    [.ace, .jack, .nine, .three, .two],
    [.ace, .jack, .eight, .seven, .six],
    [.ace, .jack, .eight, .seven, .five],
    [.ace, .jack, .eight, .seven, .four],
    [.ace, .jack, .eight, .seven, .three],
    [.ace, .jack, .eight, .seven, .two],
    [.ace, .jack, .eight, .six, .five],
    [.ace, .jack, .eight, .six, .four],
    [.ace, .jack, .eight, .six, .three],
    [.ace, .jack, .eight, .six, .two],
    [.ace, .jack, .eight, .five, .four],
    [.ace, .jack, .eight, .five, .three],
    [.ace, .jack, .eight, .five, .two],
    [.ace, .jack, .eight, .four, .three],
    [.ace, .jack, .eight, .four, .two],
    [.ace, .jack, .eight, .three, .two],
    [.ace, .jack, .seven, .six, .five],
    [.ace, .jack, .seven, .six, .four],
    [.ace, .jack, .seven, .six, .three],
    [.ace, .jack, .seven, .six, .two],
    [.ace, .jack, .seven, .five, .four],
    [.ace, .jack, .seven, .five, .three],
    [.ace, .jack, .seven, .five, .two],
    [.ace, .jack, .seven, .four, .three],
    [.ace, .jack, .seven, .four, .two],
    [.ace, .jack, .seven, .three, .two],
    [.ace, .jack, .six, .five, .four],
    [.ace, .jack, .six, .five, .three],
    [.ace, .jack, .six, .five, .two],
    [.ace, .jack, .six, .four, .three],
    [.ace, .jack, .six, .four, .two],
    [.ace, .jack, .six, .three, .two],
    [.ace, .jack, .five, .four, .three],
    [.ace, .jack, .five, .four, .two],
    [.ace, .jack, .five, .three, .two],
    [.ace, .jack, .four, .three, .two],

    [.ace, .ten, .nine, .eight, .seven],
    [.ace, .ten, .nine, .eight, .six],
    [.ace, .ten, .nine, .eight, .five],
    [.ace, .ten, .nine, .eight, .four,
    [.ace, .ten, .nine, .eight, .three],
    [.ace, .ten, .nine, .eight, .two],
    [.ace, .ten, .nine, .seven, .six],
    [.ace, .ten, .nine, .seven, .five],
    [.ace, .ten, .nine, .seven, .four],
    [.ace, .ten, .nine, .seven, .three],
    [.ace, .ten, .nine, .seven, .two],
    [.ace, .ten, .nine, .six, .five],
    [.ace, .ten, .nine, .six, .four],
    [.ace, .ten, .nine, .six, .three],
    [.ace, .ten, .nine, .six, .two],
    [.ace, .ten, .nine, .five, .four],
    [.ace, .ten, .nine, .five, .three],
    [.ace, .ten, .nine, .five, .two],
    [.ace, .ten, .nine, .four, .three],
    [.ace, .ten, .nine, .four, .two],
    [.ace, .ten, .nine, .three, .two],
    [.ace, .ten, .eight, .seven, .six],
    [.ace, .ten, .eight, .seven, .five],
    [.ace, .ten, .eight, .seven, .four],
    [.ace, .ten, .eight, .seven, .three],
    [.ace, .ten, .eight, .seven, .two],
    [.ace, .ten, .eight, .six, .five],
    [.ace, .ten, .eight, .six, .four],
    [.ace, .ten, .eight, .six, .three],
    [.ace, .ten, .eight, .six, .two],
    [.ace, .ten, .eight, .five, .four],
    [.ace, .ten, .eight, .five, .three],
    [.ace, .ten, .eight, .five, .two],
    [.ace, .ten, .eight, .four, .three],
    [.ace, .ten, .eight, .four, .two],
    [.ace, .ten, .eight, .three, .two],
    [.ace, .ten, .seven, .six, .five],
    [.ace, .ten, .seven, .six, .four],
    [.ace, .ten, .seven, .six, .three],
    [.ace, .ten, .seven, .six, .two],
    [.ace, .ten, .seven, .five, .four],
    [.ace, .ten, .seven, .five, .three],
    [.ace, .ten, .seven, .five, .two],
    [.ace, .ten, .seven, .four, .three],
    [.ace, .ten, .seven, .four, .two],
    [.ace, .ten, .seven, .three, .two],
    [.ace, .ten, .six, .five, .four],
    [.ace, .ten, .six, .five, .three],
    [.ace, .ten, .six, .five, .two],
    [.ace, .ten, .six, .four, .three],
    [.ace, .ten, .six, .four, .two],
    [.ace, .ten, .six, .three, .two],
    [.ace, .ten, .five, .four, .three],
    [.ace, .ten, .five, .four, .two],
    [.ace, .ten, .five, .three, .two],
    [.ace, .ten, .four, .three, .two],

    [.ace, .nine, .eight, .seven, .six],
    [.ace, .nine, .eight, .seven, .five],
    [.ace, .nine, .eight, .seven, .four],
    [.ace, .nine, .eight, .seven, .three],
    [.ace, .nine, .eight, .seven, .two],
    [.ace, .nine, .eight, .six, .five],
    [.ace, .nine, .eight, .six, .four],
    [.ace, .nine, .eight, .six, .three],
    [.ace, .nine, .eight, .six, .two],
    [.ace, .nine, .eight, .five, .four],
    [.ace, .nine, .eight, .five, .three],
    [.ace, .nine, .eight, .five, .two],
    [.ace, .nine, .eight, .four, .three],
    [.ace, .nine, .eight, .four, .two],
    [.ace, .nine, .eight, .three, .two],
    [.ace, .nine, .seven, .six, .five],
    [.ace, .nine, .seven, .six, .four],
    [.ace, .nine, .seven, .six, .three],
    [.ace, .nine, .seven, .six, .two],
    [.ace, .nine, .seven, .five, .four],
    [.ace, .nine, .seven, .five, .three],
    [.ace, .nine, .seven, .five, .two],
    [.ace, .nine, .seven, .four, .three],
    [.ace, .nine, .seven, .four, .two],
    [.ace, .nine, .seven, .three, .two],
    [.ace, .nine, .six, .five, .four],
    [.ace, .nine, .six, .five, .three],
    [.ace, .nine, .six, .five, .two],
    [.ace, .nine, .six, .four, .three],
    [.ace, .nine, .six, .four, .two],
    [.ace, .nine, .six, .three, .two],
    [.ace, .nine, .five, .four, .three],
    [.ace, .nine, .five, .four, .two],
    [.ace, .nine, .five, .three, .two],
    [.ace, .nine, .four, .three, .two],
    [.ace, .eight, .seven, .six, .five],
    [.ace, .eight, .seven, .six, .four],
    [.ace, .eight, .seven, .six, .three],
    [.ace, .eight, .seven, .six, .two],
    [.ace, .eight, .seven, .five, .four],
    [.ace, .eight, .seven, .five, .three],
    [.ace, .eight, .seven, .five, .two],
    [.ace, .eight, .seven, .four, .three],
    [.ace, .eight, .seven, .four, .two],
    [.ace, .eight, .seven, .three, .two],
    [.ace, .eight, .six, .five, .four],
    [.ace, .eight, .six, .five, .three],
    [.ace, .eight, .six, .five, .two],
    [.ace, .eight, .six, .four, .three],
    [.ace, .eight, .six, .four, .two],
    [.ace, .eight, .six, .three, .two],
    [.ace, .eight, .five, .four, .three],
    [.ace, .eight, .five, .four, .two],
    [.ace, .eight, .five, .three, .two],
    [.ace, .eight, .four, .three, .two],
    [.ace, .seven, .six, .five, .four],
    [.ace, .seven, .six, .five, .three],
    [.ace, .seven, .six, .five, .two],
    [.ace, .seven, .six, .four, .three],
    [.ace, .seven, .six, .four, .two],
    [.ace, .seven, .six, .three, .two],
    [.ace, .seven, .five, .four, .three],
    [.ace, .seven, .five, .four, .two],
    [.ace, .seven, .five, .three, .two],
    [.ace, .seven, .four, .three, .two],
    [.ace, .six, .five, .four, .three],
    [.ace, .six, .five, .four, .two],
    [.ace, .six, .five, .three, .two],
    [.ace, .six, .four, .three, .two],

    [.king, .queen, .jack, .ten, .eight],
    [.king, .queen, .jack, .ten, .seven],
    [.king, .queen, .jack, .ten, .six],
    [.king, .queen, .jack, .ten, .five],
    [.king, .queen, .jack, .ten, .four],
    [.king, .queen, .jack, .ten, .three],
    [.king, .queen, .jack, .ten, .two],
    [.king, .queen, .jack, .nine, .eight],
    [.king, .queen, .jack, .nine, .seven],
    [.king, .queen, .jack, .nine, .six],
    [.king, .queen, .jack, .nine, .five],
    [.king, .queen, .jack, .nine, .four],
    [.king, .queen, .jack, .nine, .three],
    [.king, .queen, .jack, .nine, .two],
    [.king, .queen, .jack, .eight, .seven],
    [.king, .queen, .jack, .eight, .six],
    [.king, .queen, .jack, .eight, .five],
    [.king, .queen, .jack, .eight, .four],
    [.king, .queen, .jack, .eight, .three],
    [.king, .queen, .jack, .eight, .two],
    [.king, .queen, .jack, .seven, .six],
    [.king, .queen, .jack, .seven, .five],
    [.king, .queen, .jack, .seven, .four],
    [.king, .queen, .jack, .seven, .three],
    [.king, .queen, .jack, .seven, .two],
    [.king, .queen, .jack, .six, .five],
    [.king, .queen, .jack, .six, .four],
    [.king, .queen, .jack, .six, .three],
    [.king, .queen, .jack, .six, .two],
    [.king, .queen, .jack, .five, .four],
    [.king, .queen, .jack, .five, .three],
    [.king, .queen, .jack, .five, .two],
    [.king, .queen, .jack, .four, .three],
    [.king, .queen, .jack, .four, .two],
    [.king, .queen, .jack, .three, .two],
    [.king, .queen, .ten, .nine, .eight],
    [.king, .queen, .ten, .nine, .seven],
    [.king, .queen, .ten, .nine, .six],
    [.king, .queen, .ten, .nine, .five],
    [.king, .queen, .ten, .nine, .four],
    [.king, .queen, .ten, .nine, .three],
    [.king, .queen, .ten, .nine, .two],
    [.king, .queen, .ten, .eight, .seven],
    [.king, .queen, .ten, .eight, .six],
    [.king, .queen, .ten, .eight, .five],
    [.king, .queen, .ten, .eight, .four],
    [.king, .queen, .ten, .eight, .three],
    [.king, .queen, .ten, .eight, .two],
    [.king, .queen, .ten, .seven, .six],
    [.king, .queen, .ten, .seven, .five],
    [.king, .queen, .ten, .seven, .four],
    [.king, .queen, .ten, .seven, .three],
    [.king, .queen, .ten, .seven, .two],
    [.king, .queen, .ten, .six, .five],
    [.king, .queen, .ten, .six, .four],
    [.king, .queen, .ten, .six, .three],
    [.king, .queen, .ten, .six, .two],  
    [.king, .queen, .ten, .five, .four],
    [.king, .queen, .ten, .five, .three],
    [.king, .queen, .ten, .five, .two],
    [.king, .queen, .ten, .four, .three],
    [.king, .queen, .ten, .four, .two],
    [.king, .queen, .ten, .three, .two],
    [.king, .queen, .nine, .eight, .seven],
    [.king, .queen, .nine, .eight, .six],
    [.king, .queen, .nine, .eight, .five],
    [.king, .queen, .nine, .eight, .four],
    [.king, .queen, .nine, .eight, .three],
    [.king, .queen, .nine, .eight, .two],
    [.king, .queen, .nine, .seven, .six],
    [.king, .queen, .nine, .seven, .five],
    [.king, .queen, .nine, .seven, .four],
    [.king, .queen, .nine, .seven, .three],
    [.king, .queen, .nine, .seven, .two],
    [.king, .queen, .nine, .six, .five],
    [.king, .queen, .nine, .six, .four],
    [.king, .queen, .nine, .six, .three],
    [.king, .queen, .nine, .six, .two],
    [.king, .queen, .nine, .five, .four],
    [.king, .queen, .nine, .five, .three],
    [.king, .queen, .nine, .five, .two],
    [.king, .queen, .nine, .four, .three],
    [.king, .queen, .nine, .four, .two],
    [.king, .queen, .nine, .three, .two],
    [.king, .queen, .eight, .seven, .six],
    [.king, .queen, .eight, .seven, .five],
    [.king, .queen, .eight, .seven, .four],
    [.king, .queen, .eight, .seven, .three],
    [.king, .queen, .eight, .seven, .two],
    [.king, .queen, .eight, .six, .four],
    [.king, .queen, .eight, .six, .three],
    [.king, .queen, .eight, .six, .two],
    [.king, .queen, .eight, .five, .four],
    [.king, .queen, .eight, .five, .three],
    [.king, .queen, .eight, .five, .two],
    [.king, .queen, .eight, .four, .three],
    [.king, .queen, .eight, .four, .two],
    [.king, .queen, .eight, .three, .two],
    [.king, .queen, .seven, .six, .five],
    [.king, .queen, .seven, .six, .four],
    [.king, .queen, .seven, .six, .three],
    [.king, .queen, .seven, .six, .two],
    [.king, .queen, .seven, .five, .four],
    [.king, .queen, .seven, .five, .three],
    [.king, .queen, .seven, .five, .two],
    [.king, .queen, .seven, .four, .three],
    [.king, .queen, .seven, .four, .two],
    [.king, .queen, .seven, .three, .two],
    [.king, .queen, .six, .five, .four],
    [.king, .queen, .six, .five, .three],
    [.king, .queen, .six, .five, .two],
    [.king, .queen, .six, .four, .three],
    [.king, .queen, .six, .four, .two],
    [.king, .queen, .six, .three, .two],
    [.king, .queen, .five, .four, .three],
    [.king, .queen, .five, .four, .two],
    [.king, .queen, .five, .three, .two],
    [.king, .queen, .four, .three, .two],

    [.king, .jack, .ten, .nine, .eight],
    [.king, .jack, .ten, .nine, .seven],
    [.king, .jack, .ten, .nine, .six],
    [.king, .jack, .ten, .nine, .five],
    [.king, .jack, .ten, .nine, .four],
    [.king, .jack, .ten, .nine, .three],
    [.king, .jack, .ten, .nine, .two],
    [.king, .jack, .ten, .eight, .seven],
    [.king, .jack, .ten, .eight, .six],
    [.king, .jack, .ten, .eight, .five],
    [.king, .jack, .ten, .eight, .four],
    [.king, .jack, .ten, .eight, .three],
    [.king, .jack, .ten, .eight, .two],
    [.king, .jack, .ten, .seven, .six],
    [.king, .jack, .ten, .seven, .five],
    [.king, .jack, .ten, .seven, .four],
    [.king, .jack, .ten, .seven, .three],
    [.king, .jack, .ten, .seven, .two],
    [.king, .jack, .ten, .six, .five],
    [.king, .jack, .ten, .six, .four],
    [.king, .jack, .ten, .six, .three],
    [.king, .jack, .ten, .six, .two],  
    [.king, .jack, .ten, .five, .four],
    [.king, .jack, .ten, .five, .three],
    [.king, .jack, .ten, .five, .two],
    [.king, .jack, .ten, .four, .three],
    [.king, .jack, .ten, .four, .two],
    [.king, .jack, .ten, .three, .two],
    [.king, .jack, .nine, .eight, .seven],
    [.king, .jack, .nine, .eight, .six],
    [.king, .jack, .nine, .eight, .five],
    [.king, .jack, .nine, .eight, .four],
    [.king, .jack, .nine, .eight, .three],
    [.king, .jack, .nine, .eight, .two],
    [.king, .jack, .nine, .seven, .six],
    [.king, .jack, .nine, .seven, .five],
    [.king, .jack, .nine, .seven, .four],
    [.king, .jack, .nine, .seven, .three],
    [.king, .jack, .nine, .seven, .two],
    [.king, .jack, .nine, .six, .five],
    [.king, .jack, .nine, .six, .four],
    [.king, .jack, .nine, .six, .three],
    [.king, .jack, .nine, .six, .two],
    [.king, .jack, .nine, .five, .four],
    [.king, .jack, .nine, .five, .three],
    [.king, .jack, .nine, .five, .two],
    [.king, .jack, .nine, .four, .three],
    [.king, .jack, .nine, .four, .two],
    [.king, .jack, .nine, .three, .two],
    [.king, .jack, .eight, .seven, .six],
    [.king, .jack, .eight, .seven, .five],
    [.king, .jack, .eight, .seven, .four],
    [.king, .jack, .eight, .seven, .three],
    [.king, .jack, .eight, .seven, .two],
    [.king, .jack, .eight, .six, .four],
    [.king, .jack, .eight, .six, .three],
    [.king, .jack, .eight, .six, .two],
    [.king, .jack, .eight, .five, .four],
    [.king, .jack, .eight, .five, .three],
    [.king, .jack, .eight, .five, .two],
    [.king, .jack, .eight, .four, .three],
    [.king, .jack, .eight, .four, .two],
    [.king, .jack, .eight, .three, .two],
    [.king, .jack, .seven, .six, .five],
    [.king, .jack, .seven, .six, .four],
    [.king, .jack, .seven, .six, .three],
    [.king, .jack, .seven, .six, .two],
    [.king, .jack, .seven, .five, .four],
    [.king, .jack, .seven, .five, .three],
    [.king, .jack, .seven, .five, .two],
    [.king, .jack, .seven, .four, .three],
    [.king, .jack, .seven, .four, .two],
    [.king, .jack, .seven, .three, .two],
    [.king, .jack, .six, .five, .four],
    [.king, .jack, .six, .five, .three],
    [.king, .jack, .six, .five, .two],
    [.king, .jack, .six, .four, .three],
    [.king, .jack, .six, .four, .two],
    [.king, .jack, .six, .three, .two],
    [.king, .jack, .five, .four, .three],
    [.king, .jack, .five, .four, .two],
    [.king, .jack, .five, .three, .two],
    [.king, .jack, .four, .three, .two],

    [.king, .ten, .nine, .eight, .seven],
    [.king, .ten, .nine, .eight, .six],
    [.king, .ten, .nine, .eight, .five],
    [.king, .ten, .nine, .eight, .four,
    [.king, .ten, .nine, .eight, .three],
    [.king, .ten, .nine, .eight, .two],
    [.king, .ten, .nine, .seven, .six],
    [.king, .ten, .nine, .seven, .five],
    [.king, .ten, .nine, .seven, .four],
    [.king, .ten, .nine, .seven, .three],
    [.king, .ten, .nine, .seven, .two],
    [.king, .ten, .nine, .six, .five],
    [.king, .ten, .nine, .six, .four],
    [.king, .ten, .nine, .six, .three],
    [.king, .ten, .nine, .six, .two],
    [.king, .ten, .nine, .five, .four],
    [.king, .ten, .nine, .five, .three],
    [.king, .ten, .nine, .five, .two],
    [.king, .ten, .nine, .four, .three],
    [.king, .ten, .nine, .four, .two],
    [.king, .ten, .nine, .three, .two],
    [.king, .ten, .eight, .seven, .six],
    [.king, .ten, .eight, .seven, .five],
    [.king, .ten, .eight, .seven, .four],
    [.king, .ten, .eight, .seven, .three],
    [.king, .ten, .eight, .seven, .two],
    [.king, .ten, .seven, .six, .five],
    [.king, .ten, .seven, .six, .four],
    [.king, .ten, .seven, .six, .three],
    [.king, .ten, .seven, .six, .two],
    [.king, .ten, .six, .five, .four],
    [.king, .ten, .six, .five, .three],
    [.king, .ten, .six, .five, .two],
    [.king, .ten, .six, .four, .three],
    [.king, .ten, .six, .four, .two],
    [.king, .ten, .five, .four, .three],
    [.king, .ten, .five, .four, .two],
    [.king, .ten, .five, .three, .two],
    [.king, .ten, .four, .three, .two],

    [.king, .nine, .eight, .seven, .six],
    [.king, .nine, .eight, .seven, .five],
    [.king, .nine, .eight, .seven, .four],
    [.king, .nine, .eight, .seven, .three],
    [.king, .nine, .eight, .seven, .two],
    [.king, .nine, .eight, .six, .five],
    [.king, .nine, .eight, .six, .four],
    [.king, .nine, .eight, .six, .three],
    [.king, .nine, .eight, .six, .two],
    [.king, .nine, .eight, .five, .four],
    [.king, .nine, .eight, .five, .three],
    [.king, .nine, .eight, .five, .two],
    [.king, .nine, .eight, .four, .three],
    [.king, .nine, .eight, .four, .two],
    [.king, .nine, .eight, .three, .two],
    [.king, .nine, .seven, .six, .five],
    [.king, .nine, .seven, .six, .four],
    [.king, .nine, .seven, .six, .three],
    [.king, .nine, .seven, .six, .two],
    [.king, .nine, .seven, .five, .four],
    [.king, .nine, .seven, .five, .three],
    [.king, .nine, .seven, .five, .two],
    [.king, .nine, .seven, .four, .three],
    [.king, .nine, .seven, .four, .two],
    [.king, .nine, .seven, .three, .two],
    [.king, .nine, .six, .five, .four],
    [.king, .nine, .six, .five, .three],
    [.king, .nine, .six, .five, .two],
    [.king, .nine, .six, .four, .three],
    [.king, .nine, .six, .four, .two],
    [.king, .nine, .five, .four, .three],
    [.king, .nine, .five, .four, .two],
    [.king, .nine, .five, .three, .two],
    [.king, .nine, .four, .three, .two],
    [.king, .eight, .seven, .six, .five],
    [.king, .eight, .seven, .six, .four],
    [.king, .eight, .seven, .six, .three],
    [.king, .eight, .seven, .six, .two],
    [.king, .eight, .seven, .five, .four],
    [.king, .eight, .seven, .five, .three],
    [.king, .eight, .seven, .five, .two],
    [.king, .eight, .seven, .four, .three],
    [.king, .eight, .seven, .four, .two],
    [.king, .eight, .seven .three, .two],
    [.king, .eight, .six, .five, .four],
    [.king, .eight, .six, .five, .three],
    [.king, .eight, .six, .five, .two],
    [.king, .eight, .six, .four, .three],
    [.king, .eight, .six, .four, .two],
    [.king, .eight, .six, .three, .two],
    [.king, .eight, .five, .four, .three],
    [.king, .eight, .five, .four, .two],
    [.king, .eight, .five, .three, .two],
    [.king, .eight, .four, .three, .two],
    [.king, .seven, .six, .five, .four],
    [.king, .seven, .six, .five, .three],
    [.king, .seven, .six, .five, .two],
    [.king, .seven, .six, .four, .three],
    [.king, .seven, .six, .four, .two],
    [.king, .seven, .six, .three, .two],
    [.king, .seven, .five, .four, .three],
    [.king, .seven, .five, .four, .two],
    [.king, .seven, .five, .three, .two],
    [.king, .seven, .four, .three, .two],
    [.king, .six, .five, .four, .three],
    [.king, .six, .five, .four, .two],
    [.king, .six, .five, .three, .two],
    [.king, .six, .four, .three, .two],
    [.king, .five, .four, .three, .two],

    [.queen, .jack, .ten, .nine, .seven],
    [.queen, .jack, .ten, .nine, .six],
    [.queen, .jack, .ten, .nine, .five],
    [.queen, .jack, .ten, .nine, .four],
    [.queen, .jack, .ten, .nine, .three],
    [.queen, .jack, .ten, .nine, .two],
    [.queen, .jack, .ten, .eight, .seven],
    [.queen, .jack, .ten, .eight, .six],
    [.queen, .jack, .ten, .eight, .five],
    [.queen, .jack, .ten, .eight, .four],
    [.queen, .jack, .ten, .eight, .three],
    [.queen, .jack, .ten, .eight, .two],
    [.queen, .jack, .ten, .seven, .six],
    [.queen, .jack, .ten, .seven, .five],
    [.queen, .jack, .ten, .seven, .four],
    [.queen, .jack, .ten, .seven, .three],
    [.queen, .jack, .ten, .seven, .two],
    [.queen, .jack, .ten, .six, .five],
    [.queen, .jack, .ten, .six, .four],
    [.queen, .jack, .ten, .six, .three],
    [.queen, .jack, .ten, .six, .two],  
    [.queen, .jack, .ten, .five, .four],
    [.queen, .jack, .ten, .five, .three],
    [.queen, .jack, .ten, .five, .two],
    [.queen, .jack, .ten, .four, .three],
    [.queen, .jack, .ten, .four, .two],
    [.queen, .jack, .ten, .three, .two],
    [.queen, .jack, .nine, .eight, .seven],
    [.queen, .jack, .nine, .eight, .six],
    [.queen, .jack, .nine, .eight, .five],
    [.queen, .jack, .nine, .eight, .four],
    [.queen, .jack, .nine, .eight, .three],
    [.queen, .jack, .nine, .eight, .two],
    [.queen, .jack, .nine, .seven, .six],
    [.queen, .jack, .nine, .seven, .five],
    [.queen, .jack, .nine, .seven, .four],
    [.queen, .jack, .nine, .seven, .three],
    [.queen, .jack, .nine, .seven, .two],
    [.queen, .jack, .nine, .six, .five],
    [.queen, .jack, .nine, .six, .four],
    [.queen, .jack, .nine, .six, .three],
    [.queen, .jack, .nine, .six, .two],
    [.queen, .jack, .nine, .five, .four],
    [.queen, .jack, .nine, .five, .three],
    [.queen, .jack, .nine, .five, .two],
    [.queen, .jack, .nine, .four, .three],
    [.queen, .jack, .nine, .four, .two],
    [.queen, .jack, .nine, .three, .two],
    [.queen, .jack, .eight, .seven, .six],
    [.queen, .jack, .eight, .seven, .five],
    [.queen, .jack, .eight, .seven, .four],
    [.queen, .jack, .eight, .seven, .three],
    [.queen, .jack, .eight, .seven, .two],
    [.queen, .jack, .eight, .six, .four],
    [.queen, .jack, .eight, .six, .three],
    [.queen, .jack, .eight, .six, .two],
    [.queen, .jack, .eight, .five, .four],
    [.queen, .jack, .eight, .five, .three],
    [.queen, .jack, .eight, .five, .two],
    [.queen, .jack, .eight, .four, .three],
    [.queen, .jack, .eight, .four, .two],
    [.queen, .jack, .eight, .three, .two],
    [.queen, .jack, .seven, .six, .five],
    [.queen, .jack, .seven, .six, .four],
    [.queen, .jack, .seven, .six, .three],
    [.queen, .jack, .seven, .six, .two],
    [.queen, .jack, .six, .five, .four],
    [.queen, .jack, .six, .five, .three],
    [.queen, .jack, .six, .five, .two],
    [.queen, .jack, .six, .four, .three],
    [.queen, .jack, .six, .four, .two],
    [.queen, .jack, .five, .four, .three],
    [.queen, .jack, .five, .four, .two],
    [.queen, .jack, .five, .three, .two],
    [.queen, .jack, .four, .three, .two],
    [.queen, .ten, .nine, .eight, .seven],
    [.queen, .ten, .nine, .eight, .six],
    [.queen, .ten, .nine, .eight, .five],
    [.queen, .ten, .nine, .eight, .four,
    [.queen, .ten, .nine, .eight, .three],
    [.queen, .ten, .nine, .eight, .two],
    [.queen, .ten, .nine, .seven, .six],
    [.queen, .ten, .nine, .seven, .five],
    [.queen, .ten, .nine, .seven, four],
    [.queen, .ten, .nine, .seven, .three],
    [.queen, .ten, .nine, .seven, .two],
    [.queen, .ten, .nine, .six, .four],
    [.queen, .ten, .nine, .six, .three],
    [.queen, .ten, .nine, .six, .two],
    [.queen, .ten, .nine, .five, .four],
    [.queen, .ten, .nine, .five, .three],
    [.queen, .ten, .nine, .five, .two],
    [.queen, .ten, .nine, .four, .three],
    [.queen, .ten, .nine, .four, .two],
    [.queen, .ten, .nine, .three, .two],
    [.queen, .ten, .eight, .seven, .six],
    [.queen, .ten, .eight, .seven, .five],
    [.queen, .ten, .eight, .seven, .four],
    [.queen, .ten, .eight, .seven, .three],
    [.queen, .ten, .eight, .seven, .two],
    [.queen, .ten, .seven, .six, .five],
    [.queen, .ten, .seven, .six, .four],
    [.queen, .ten, .seven, .six, .three],
    [.queen, .ten, .seven, .six, .two],
    [.queen, .ten, .six, .five, .four],
    [.queen, .ten, .six, .five, .three],
    [.queen, .ten, .six, .five, .two],
    [.queen, .ten, .six, .four, .three],
    [.queen, .ten, .six, .four, .two],
    [.queen, .ten, .six, .three, .two],
    [.queen, .ten, .five, .four, .three],
    [.queen, .ten, .five, .four, .two],
    [.queen, .ten, .five, .three, .two],
    [.queen, .ten, .four, .three, .two],
    [.queen, .nine, .eight, .seven, .six],
    [.queen, .nine, .eight, .seven, .five],
    [.queen, .nine, .eight, .seven, .four],
    [.queen, .nine, .eight, .seven, .three],
    [.queen, .nine, .eight, .seven, .two],
    [.queen, .nine, .seven, .six, .five],
    [.queen, .nine, .seven, .six, .four],
    [.queen, .nine, .seven, .six, .three],
    [.queen, .nine, .seven, .six, .two],
    [.queen, .nine, .seven, .five, .four],
    [.queen, .nine, .seven, .five, .three],
    [.queen, .nine, .seven, .five, .two],
    [.queen, .nine, .seven, .four, .three],
    [.queen, .nine, .seven, .four, .two],
    [.queen, .nine, .seven, .three, .two],
    [.queen, .nine, .six, .five, .four],
    [.queen, .nine, .six, .five, .three],
    [.queen, .nine, .six, .five, .two],
    [.queen, .nine, .six, .four, .three],
    [.queen, .nine, .six, .four, .two],
    [.queen, .nine, .six, .three, .two],
    [.queen, .nine, .five, .four, .three],
    [.queen, .nine, .five, .four, .two],
    [.queen, .nine, .four, .three, .two],
    [.queen, .eight, .seven, .six, .five],
    [.queen, .eight, .seven, .six, .four],
    [.queen, .eight, .seven, .six, .three],
    [.queen, .eight, .seven, .six, .two],
    [.queen, .eight, .six, .five, .four],
    [.queen, .eight, .six, .five, .three],
    [.queen, .eight, .six, .five, .two],
    [.queen, .eight, .five, .four, .three],
    [.queen, .eight, .five, .four, .two],
    [.queen, .eight, .five, .three, .two],
    [.queen, .eight, .four, .three, .two],
    [.queen, .seven, .six, .five, .four],
    [.queen, .seven, .six, .five, .three],
    [.queen, .seven, .six, .five, .two],
    [.queen, .seven, .six, .four, .three],
    [.queen, .seven, .six, .four, .two],
    [.queen, .seven, .six, .three, .two],
    [.queen, .seven, .five, .four, .three],
    [.queen, .seven, .five, .four, .two],
    [.queen, .seven, .four, .three, .two],
    [.queen, .six, .five, .four, .three],
    [.queen, .six, .five, .four, .two],
    [.queen, .six, .five, .three, .two],
    [.queen, .six, .four, .three, .two],
    [.queen, .five, .four, .three, .two],

    [.jack, .ten, .nine, .eight, .six],
    [.jack, .ten, .nine, .eight, .five],
    [.jack, .ten, .nine, .eight, .four],
    [.jack, .ten, .nine, .eight, .three],
    [.jack, .ten, .nine, .eight, .two],
    [.jack, .ten, .nine, .seven, .six],
    [.jack, .ten, .nine, .seven, .five],
    [.jack, .ten, .nine, .seven, .four],
    [.jack, .ten, .nine, .seven, .three],
    [.jack, .ten, .nine, .seven, .two],
    [.jack, .ten, .nine, .six, .five],
    [.jack, .ten, .nine, .six, .four],
    [.jack, .ten, .nine, .six, .three],
    [.jack, .ten, .nine, .six, .two],
    [.jack, .ten, .nine, .five, .four],
    [.jack, .ten, .nine, .five, .three],
    [.jack, .ten, .nine, .five, .two],
    [.jack, .ten, .nine, .four, .three],
    [.jack, .ten, .nine, .four, .two],
    [.jack, .ten, .nine, .three, .two],
    [.jack, .ten, .eight, .seven, .six],
    [.jack, .ten, .eight, .seven, .five],
    [.jack, .ten, .eight, .seven, .four],
    [.jack, .ten, .eight, .seven, .three],
    [.jack, .ten, .eight, .seven, .two],
    [.jack, .ten, .eight, .six, .five],
    [.jack, .ten, .eight, .six, .four],
    [.jack, .ten, .eight, .six, .three],
    [.jack, .ten, .eight, .six, .two],
    [.jack, .ten, .eight, .five, .four],
    [.jack, .ten, .eight, .five, .three],
    [.jack, .ten, .eight, .five, .two],
    [.jack, .ten, .eight, .four, .three],
    [.jack, .ten, .eight, .four, .two],
    [.jack, .ten, .eight, .three, .two],
    [.jack, .ten, .seven, .six, .five],
    [.jack, .ten, .seven, .six, .four],
    [.jack, .ten, .seven, .six, .three],
    [.jack, .ten, .seven, .six, .two],
    [.jack, .ten, .seven, .five, .four],
    [.jack, .ten, .seven, .five, .three],
    [.jack, .ten, .seven, .five, .two],
    [.jack, .ten, .seven, .four, .three],
    [.jack, .ten, .seven, .four, .two],
    [.jack, .ten, .seven, .three, .two],
    [.jack, .ten, .six, .five, .four],
    [.jack, .ten, .six, .five, .three],
    [.jack, .ten, .six, .five, .two],
    [.jack, .ten, .six, .four, .three],
    [.jack, .ten, .six, .four, .two],
    [.jack, .ten, .six, .three, .two],
    [.jack, .ten, .five, .four, .three],
    [.jack, .ten, .five, .four, .two],
    [.jack, .ten, .five, .three, .two],
    [.jack, .ten, .four, .three, .two],
    [.jack, .nine, .eight, .seven, .six],
    [.jack, .nine, .eight, .seven, .five],
    [.jack, .nine, .eight, .seven, .four],
    [.jack, .nine, .eight, .seven, .three],
    [.jack, .nine, .eight, .seven, .two],
    [.jack, .nine, .eight, .six, .five],
    [.jack, .nine, .eight, .six, .four],
    [.jack, .nine, .eight, .six, .three],
    [.jack, .nine, .eight, .six, .two],
    [.jack, .nine, .eight, .five, .four],
    [.jack, .nine, .eight, .five, .three],
    [.jack, .nine, .eight, .five, .two],
    [.jack, .nine, .eight, .four, .three],
    [.jack, .nine, .eight, .four, .two],
    [.jack, .nine, .eight, .three, .two],
    [.jack, .nine, .seven, .six, .five],
    [.jack, .nine, .seven, .six, .four],
    [.jack, .nine, .seven, .six, .three],
    [.jack, .nine, .seven, .six, .two],
    [.jack, .nine, .seven, .five, .four],
    [.jack, .nine, .seven, .five, .three],
    [.jack, .nine, .seven, .five, .two],
    [.jack, .nine, .seven, .four, .three],
    [.jack, .nine, .seven, .four, .two],
    [.jack, .nine, .seven, .three, .two],
    [.jack, .nine, .six, .five, .four],
    [.jack, .nine, .six, .five, .three],
    [.jack, .nine, .six, .five, .two],
    [.jack, .nine, .six, .four, .three],
    [.jack, .nine, .six, .four, .two],
    [.jack, .nine, .six, .three, .two],
    [.jack, .nine, .five, .four, .three],
    [.jack, .nine, .five, .four, .two],
    [.jack, .nine, .five, .three, .two],
    [.jack, .nine, .four, .three, .two],
    [.jack, .eight, .seven, .six, .five],
    [.jack, .eight, .seven, .six, .four],
    [.jack, .eight, .seven, .six, .three],
    [.jack, .eight, .seven, .six, .two],
    [.jack, .eight, .seven, .five, .four],
    [.jack, .eight, .seven, .five, .three],
    [.jack, .eight, .seven, .five, .two],
    [.jack, .eight, .seven, .four, .three],
    [.jack, .eight, .seven, .four, .two],
    [.jack, .eight, .seven, .three, .two],
    [.jack, .eight, .six, .five, .four],
    [.jack, .eight, .six, .five, .three],
    [.jack, .eight, .six, .five, .two],
    [.jack, .eight, .six, .four, .three],
    [.jack, .eight, .six, .four, .two],
    [.jack, .eight, .six, .three, .two],
    [.jack, .eight, .five, .four, .three],
    [.jack, .eight, .five, .four, .two],
    [.jack, .eight, .five, .three, .two],
    [.jack, .eight, .four, .three, .two],
    [.jack, .seven, .six, .five, .four],
    [.jack, .seven, .six, .five, .three],
    [.jack, .seven, .six, .five, .two],
    [.jack, .seven, .six, .four, .three],
    [.jack, .seven, .six, .four, .two],
    [.jack, .seven, .six, .three, .two],
    [.jack, .seven, .five, .four, .three],
    [.jack, .seven, .five, .four, .two],
    [.jack, .seven, .five, .three, .two],
    [.jack, .seven, .four, .three, .two],
    [.jack, .six, .five, .four, .three],
    [.jack, .six, .five, .four, .two],
    [.jack, .six, .five, .three, .two],
    [.jack, .six, .four, .three, .two],
    [.jack, .five,.four, .three, .two],

    [.ten, .nine, .eight, .seven, .five],
    [.ten, .nine, .eight, .seven, .four],
    [.ten, .nine, .eight, .seven, .three],
    [.ten, .nine, .eight, .seven, .two],
    [.ten, .nine, .eight, .six, .five],
    [.ten, .nine, .eight, .six, .four],
    [.ten, .nine, .eight, .six, .three],
    [.ten, .nine, .eight, .six, .two],
    [.ten, .nine, .eight, .five, .four],
    [.ten, .nine, .eight, .five, .three],
    [.ten, .nine, .eight, .five, .two],
    [.ten, .nine, .eight, .four, .three],
    [.ten, .nine, .eight, .four, .two],
    [.ten, .nine, .eight, .three, .two],
    [.ten, .nine, .seven, .six, .five],
    [.ten, .nine, .seven, .six, .four],
    [.ten, .nine, .seven, .six, .three],
    [.ten, .nine, .seven, .six, .two],
    [.ten, .nine, .seven, .five, .four],
    [.ten, .nine, .seven, .five, .three],
    [.ten, .nine, .seven, .five, .two],
    [.ten, .nine, .seven, .four, .three],
    [.ten, .nine, .seven, .four, .two],
    [.ten, .nine, .seven, .three, .two],
    [.ten, .nine, .six, .five, .four],
    [.ten, .nine, .six, .five, .three],
    [.ten, .nine, .six, .five, .two],
    [.ten, .nine, .six, .four, .three],
    [.ten, .nine, .six, .four, .two],
    [.ten, .nine, .six, .three, .two],
    [.ten, .nine, .five, .four, .three],
    [.ten, .nine, .five, .four, .two],
    [.ten, .nine, .five, .three, .two],
    [.ten, .nine, .four, .three, .two],

    [.ten, .eight, .seven, .six, .five],
    [.ten, .eight, .seven, .six, .four],
    [.ten, .eight, .seven, .six, .three],
    [.ten, .eight, .seven, .six, .two],
    [.ten, .eight, .seven, .five, .four],
    [.ten, .eight, .seven, .five, .three],
    [.ten, .eight, .seven, .five, .two],
    [.ten, .eight, .seven, .four, .three],
    [.ten, .eight, .seven, .four, .two],
    [.ten, .eight, .seven, .three, .two],
    [.ten, .eight, .six, .five, .four],
    [.ten, .eight, .six, .five, .three],
    [.ten, .eight, .six, .five, .two],
    [.ten, .eight, .six, .four, .three],
    [.ten, .eight, .six, .four, .two],
    [.ten, .eight, .six, .three, .two],
    [.ten, .eight, .five, .four, .three],
    [.ten, .eight, .five, .four, .two],
    [.ten, .eight, .five, .three, .two],
    [.ten, .eight, .four, .three, .two],
    [.ten, .seven, .six, .five, .four],
    [.ten, .seven, .six, .five, .three],
    [.ten, .seven, .six, .five, .two],
    [.ten, .seven, .five, .four, .three],
    [.ten, .seven, .five, .four, .two],
    [.ten, .seven, .five, .three, .two],
    [.ten, .seven, .four, .three, .two],
    [.ten, .six, .five, .four, .three],
    [.ten, .six, .five, .four, .two],
    [.ten, .six, .five, .three, .two],
    [.ten, .six, .four, .three, .two],
    [.ten, .five, .four, .three, .two],

    [.nine, .eight, .seven, .six, .four],
    [.nine, .eight, .seven, .six, .three],
    [.nine, .eight, .seven, .six, .two],
    [.nine, .eight, .seven, .five, .four],
    [.nine, .eight, .seven, .five, .three],
    [.nine, .eight, .seven, .five, .two],
    [.nine, .eight, .seven, .four, .three],
    [.nine, .eight, .seven, .four, .two],
    [.nine, .eight, .seven, .three, .two],
    [.nine, .eight, .six, .five, .four],
    [.nine, .eight, .six, .five, .three],
    [.nine, .eight, .six, .five, .two],
    [.nine, .eight, .six, .four, .three],
    [.nine, .eight, .six, .four, .two],
    [.nine, .eight, .six, .three, .two],
    [.nine, .eight, .five, .four, .three],
    [.nine, .eight, .five, .four, .two],
    [.nine, .eight, .five, .three, .two],
    [.nine, .eight, .four, .three, .two],
    [.nine, .seven, .six, .five, .four],
    [.nine, .seven, .six, .five, .three],
    [.nine, .seven, .six, .five, .two],
    [.nine, .seven, .six, .four, .three],
    [.nine, .seven, .six, .four, .two],
    [.nine, .seven, .six, .three, .two],   
    [.nine, .seven, .five, .four, .three],
    [.nine, .seven, .five, .four, .two],
    [.nine, .seven, .four, .three, .two],
    [.nine, .six, .five, .four, .three],
    [.nine, .six, .five, .four, .two],
    [.nine, .six, .five, .three, .two],
    [.nine, .six, .four, .three, .two],
    [.nine, .five, .four, .three, .two],

    [.eight, .seven, .six, .five, .three],
    [.eight, .seven, .six, .five, .two],
    [.eight, .seven, .six, .four, .three],
    [.eight, .seven, .six, .four, .two],
    [.eight, .seven, .six, .three, .two],   
    [.eight, .seven, .five, .four, .three],
    [.eight, .seven, .five, .four, .two]
    [.eight, .seven, .four, .three, .two],
    [.eight, .six, .five, .four, .three],
    [.eight, .six, .five, .four, .two],
    [.eight, .six, .five, .three, .two],
    [.eight, .six, .four, .three, .two],
    [.eight, .five, .four, .three, .two],

    [.seven, .six, .five, .four, .two],
    [.seven, .six, .five, .three, .two],
    [.seven, .six, .four, .three, .two],
    [.seven, .five, .four, .three, .two],
    
              point: 1
    // เพิ่มตามลำดับความแข็ง
]


struct straightRanks: [[Rank]] = [Prop
    [.ace, .king, .queen, .jack, .ten],   // Royal Straight (highest)
  [.ace, .two, .three, .four, .five]    // A-2-3-4-5 (under highest)
    [.king, .queen, .jack, .ten, .nine],
    [.queen, .jack, .ten, .nine, .eight],
    [.jack, .ten, .nine, .eight, .seven],
    [.ten, .nine, .eight, .seven, .six],
    [.nine, .eight, .seven, .six, .five],
    [.eight, .seven, .six, .five, .four],
    [.seven, .six, .five, .four, .three],
    [.six, .five, .four, .three, .two],
  ]

struct threeOfAKinds: [[Rank]] = [
    [.ace, .ace, .ace],
    [.king, .king, .king],
    [.queen, .queen, .queen],
    [.jack, .jack, .jack],
    [.ten, .ten, .ten],
    [.nine, .nine, .nine],
    [.eight, .eight, .eight],
    [.seven, .seven, .seven],
    [.six, .six, .six],
    [.five, .five, .five],
    [.four, .four, .four],
    [.three, .three, .three],
    [.two, .two, .two]
]

// MARK: - Supporting Types

struct Card { let rank: Int // 2-14 (where 11=J, 12=Q, 13=K, 14=A) let suit: String // "♠", "♥", "♦", "♣" }

enum RowPosition { case head, middle, tail }

enum HandType: Int, Comparable { case highCard = 0 case pair case threeOfAKind case straightFlush case fourOfAKind case fullHouse case fullHouseAces

static func < (lhs: HandType, rhs: HandType) -> Bool {
    return lhs.rawValue < rhs.rawValue
}

}

struct Player { let id: Int let head: [Card] let middle: [Card] let tail: [Card] var score: Int = 0 }

// MARK: - Evaluation

func isPairOfAces(cards: [Card]) -> Bool { return cards.filter { $0.rank == 14 }.count == 2 }

func evaluateHand(_ cards: [Card], position: RowPosition) -> HandType { // Dummy logic — replace with actual evaluation rules if position == .head && cards.count == 3 { let ranks = Set(cards.map { $0.rank }) if ranks.count == 1 { return .threeOfAKind } if ranks.count == 2 { return .pair } } else if cards.count == 5 { let ranks = cards.map { $0.rank }.sorted() let isFlush = Set(cards.map { $0.suit }).count == 1 let isStraight = Set(zip(ranks, ranks.dropFirst()).map { $1 - $0 }).max() == 1 && Set(ranks).count == 5

if isStraight && isFlush { return .straightFlush }
    // Add other rules like 4 of a kind, full house, etc.
}
return .highCard

}

func scoreForHandType(_ handType: HandType, cards: [Card], row: RowPosition) -> Int { switch row { case .head: if handType == .pair && isPairOfAces(cards: cards) { return 2 } if handType == .pair { return 1 } if handType == .threeOfAKind { return 5 } return 1 case .middle: switch handType { case .straightFlush: return 14 case .fourOfAKind: return 12 case .fullHouseAces: return 4 case .fullHouse: return 2 default: return 1 } case .tail: switch handType { case .straightFlush: return 7 case .fourOfAKind: return 6 case .fullHouseAces: return 2 case .fullHouse: return 1 default: return 1 } } }

func compareHands(p1: [Card], p2: [Card], position: RowPosition) -> Int { let v1 = evaluateHand(p1, position: position) let v2 = evaluateHand(p2, position: position) if v1 > v2 { return 1 } else if v1 < v2 { return -1 } else { return 0 } }

// MARK: - Calculate All Scores

func calculateScores(players: inout [Player]) { let n = players.count for i in 0..<n { for j in 0..<n where i != j { let head = compareHands(p1: players[i].head, p2: players[j].head, position: .head) let mid = compareHands(p1: players[i].middle, p2: players[j].middle, position: .middle) let tail = compareHands(p1: players[i].tail, p2: players[j].tail, position: .tail)

var wins = 0
        if head > 0 { wins += 1 }
        if mid > 0 { wins += 1 }
        if tail > 0 { wins += 1 }

        let rowScores = (
            (head > 0 ? scoreForHandType(evaluateHand(players[i].head, position: .head), cards: players[i].head, row: .head) : 0) +
            (mid > 0 ? scoreForHandType(evaluateHand(players[i].middle, position: .middle), cards: players[i].middle, row: .middle) : 0) +
            (tail > 0 ? scoreForHandType(evaluateHand(players[i].tail, position: .tail), cards: players[i].tail, row: .tail) : 0)
        )

        if wins == 3 {
            let bonus = rowScores * 2
            players[i].score += bonus
            players[j].score -= bonus
        } else {
            players[i].score += head + mid + tail
            players[j].score -= head + mid + tail
        }
    }
}

}

func calculateScores(players: inout [Player]) {
    let n = players.count

    for i in 0..<n {
        for j in 0..<n where i != j {
            let h1 = evaluateHand(players[i].head, position: .head)
            let h2 = evaluateHand(players[j].head, position: .head)
            let m1 = evaluateHand(players[i].middle, position: .middle)
            let m2 = evaluateHand(players[j].middle, position: .middle)
            let t1 = evaluateHand(players[i].tail, position: .tail)
            let t2 = evaluateHand(players[j].tail, position: .tail)

            let headResult = h1 > h2 ? 1 : (h1 < h2 ? -1 : 0)
            let midResult = m1 > m2 ? 1 : (m1 < m2 ? -1 : 0)
            let tailResult = t1 > t2 ? 1 : (t1 < t2 ? -1 : 0)

            var iScore = 0
            var jScore = 0

            // เก็บคะแนนแต่ละแถว
            if headResult > 0 {
                iScore += scoreForHandType(h1.type, cards: players[i].head, row: .head)
                jScore -= scoreForHandType(h1.type, cards: players[i].head, row: .head)
            } else if headResult < 0 {
                iScore -= scoreForHandType(h2.type, cards: players[j].head, row: .head)
                jScore += scoreForHandType(h2.type, cards: players[j].head, row: .head)
            }

            if midResult > 0 {
                iScore += scoreForHandType(m1.type, cards: players[i].middle, row: .middle)
                jScore -= scoreForHandType(m1.type, cards: players[i].middle, row: .middle)
            } else if midResult < 0 {
                iScore -= scoreForHandType(m2.type, cards: players[j].middle, row: .middle)
                jScore += scoreForHandType(m2.type, cards: players[j].middle, row: .middle)
            }

            if tailResult > 0 {
                iScore += scoreForHandType(t1.type, cards: players[i].tail, row: .tail)
                jScore -= scoreForHandType(t1.type, cards: players[i].tail, row: .tail)
            } else if tailResult < 0 {
                iScore -= scoreForHandType(t2.type, cards: players[j].tail, row: .tail)
                jScore += scoreForHandType(t2.type, cards: players[j].tail, row: .tail)
            }

            // ตรวจว่าชนะทั้ง 3 ขาไหม (Sweep)
            if headResult > 0 && midResult > 0 && tailResult > 0 {
                let sweepBonus = iScore * 4
                players[i].score += sweepBonus
                players[j].score -= sweepBonus
            } else {
                players[i].score += iScore
                players[j].score += jScore
            }
        }
    }
}


func isStraight(hand: [Card]) -> Bool {
    let ranks = hand.map { $0.rank.rawValue }.sorted()
    
    // ตรวจสอบว่าไพ่ในมือมี 5 ใบที่สามารถเรียงลำดับได้
    var uniqueRanks = Set(ranks)  // ทำให้ค่าซ้ำหายไป
    if uniqueRanks.count < 5 {  // ถ้ามีไพ่ไม่ถึง 5 ใบที่ไม่ซ้ำ
        return false
    }
    
    // ตรวจสอบการเรียงตัวของไพ่
    let minRank = ranks.min()!
    let maxRank = ranks.max()!
    
    // สเตรทที่สามารถเกิดขึ้นได้จาก 2 ถึง Ace
    let validRanks = Set(minRank...maxRank)
    
    // เช็คว่าไพ่ครบตามที่ต้องการในช่วงที่เราคำนวณ
    return validRanks == uniqueRanks
}


func calculateTotalScores(players: [Player]) -> [Int] {
    var scores = Array(repeating: 0, count: players.count)

    for i in 0..<players.count {
        for j in 0..<players.count where i != j {
            let p1 = players[i]
            let p2 = players[j]

            var p1Wins = 0
            var p2Wins = 0
            var p1Bonus = 0
            var p2Bonus = 0

            // Head
            let (h1, h2) = compareRow(p1.head, p2.head, row: .head)
            p1Wins += (h1 > 0 ? 1 : 0)
            p2Wins += (h2 > 0 ? 1 : 0)
            p1Bonus += (h1 > 0 ? bonusScore(for: p1.head, row: .head) : 0)
            p2Bonus += (h2 > 0 ? bonusScore(for: p2.head, row: .head) : 0)

            // Middle
            let (m1, m2) = compareRow(p1.middle, p2.middle, row: .middle)
            p1Wins += (m1 > 0 ? 1 : 0)
            p2Wins += (m2 > 0 ? 1 : 0)
            p1Bonus += (m1 > 0 ? bonusScore(for: p1.middle, row: .middle) : 0)
            p2Bonus += (m2 > 0 ? bonusScore(for: p2.middle, row: .middle) : 0)

            // Tail
            let (t1, t2) = compareRow(p1.tail, p2.tail, row: .tail)
            p1Wins += (t1 > 0 ? 1 : 0)
            p2Wins += (t2 > 0 ? 1 : 0)
            p1Bonus += (t1 > 0 ? bonusScore(for: p1.tail, row: .tail) : 0)
            p2Bonus += (t2 > 0 ? bonusScore(for: p2.tail, row: .tail) : 0)

            var p1Score = 0
            var p2Score = 0

            if p1Wins == 3 {
                let total = (bonusScore(for: p1.head, row: .head)
                           + bonusScore(for: p1.middle, row: .middle)
                           + bonusScore(for: p1.tail, row: .tail))
                p1Score += total * 4
                p2Score -= total * 4
            } else if p2Wins == 3 {
                let total = (bonusScore(for: p2.head, row: .head)
                           + bonusScore(for: p2.middle, row: .middle)
                           + bonusScore(for: p2.tail, row: .tail))
                p2Score += total * 4
                p1Score -= total * 4
            } else {
                p1Score += h1 + m1 + t1 + p1Bonus
                p2Score += h2 + m2 + t2 + p2Bonus
            }

            scores[i] += p1Score
        }
    }

    return scores
}

func printFinalScores(players: [Player]) {
    let totalScores = calculateTotalScores(players: players)

    for (index, score) in totalScores.enumerated() {
        print("Player"

Player 1 = score
Player 2 = score
Player 3 = score
Player 4 = score
)
