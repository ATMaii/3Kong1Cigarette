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
}

let straightFlushProps : [Prop]

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
let moreFullHouses: [Prop] = [

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

prop(name:HouseMam
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
    ])
]

Prop (name:HouseJack
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
    ])
]

Prop (name:Houses10
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
]

Prop (name:Houses999
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
]

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
]let fullHouses777: [[Card]] = [
    // 777AA
    [
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil)
    ],
    // 777KK
    [
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil)
    ],
    // 777QQ
    [
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil)
    ],
    // 777JJ
    [
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil)
    ],
    // 77710
    [
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil)
    ],
    // 7779
    [
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil)
    ],
    // 7778
    [
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil)
    ],
    // 7776
    [
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil)
    ],
    // 7775
    [
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil)
    ],
    // 7774
    [
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil)
    ],
    // 7773
    [
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil)
    ],
    // 7772
    [
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil)
    ]
]
let fullHouses666: [[Card]] = [
    // 666AA
    [
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil)
    ],
    // 666KK
    [
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil)
    ],
    // 666QQ
    [
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil)
    ],
    // 666JJ
    [
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil)
    ],
    // 66610-10
    [
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil)
    ]
]
let fullHouses666_2: [[Card]] = [
    // 66699
    [
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil)
    ],
    // 66688
    [
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil)
    ],
    // 66677
    [
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil)
    ],
    // 66655
    [
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil)
    ],
    // 66644
    [
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil)
    ],
    // 66633
    [
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil)
    ],
    // 66622
    [
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil)
    ]
]
let fullHouses555_2: [[Card]] = [
    // 555AA
    [
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil)
    ],
    // 555KK
    [
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil)
    ],
    // 555QQ
    [
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil)
    ],
    // 555JJ
    [
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil)
    ],
    // 55510
    [
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil)
    ],
    // 55599
    [
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil)
    ],
    // 55588
    [
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil)
    ],
    // 55577
    [
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil)
    ],
    // 55566
    [
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil)
    ],
    // 55544
    [
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil)
    ],
    // 55533
    [
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil)
    ],
    // 55522
    [
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil)
    ]
]
let fullHouses444_2: [[Card]] = [
    // 444AA
    [
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil)
    ],
    // 444KK
    [
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil)
    ],
    // 444QQ
    [
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil)
    ],
    // 444JJ
    [
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil)
    ],
    // 44410
    [
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil)
    ],
    // 44499
    [
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil)
    ],
    // 44488
    [
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil)
    ],
    // 44477
    [
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil)
    ],
    // 44466
    [
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil)
    ],
    // 44455
    [
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil)
    ],
    // 44433
    [
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil)
    ],
    // 44422
    [
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil)
    ]
]
let fullHouses333_2: [[Card]] = [
    // 333AA
    [
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil)
    ],
    // 333KK
    [
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil)
    ],
    // 333QQ
    [
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil)
    ],
    // 333JJ
    [
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil)
    ],
    // 33310
    [
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil)
    ],
    // 33399
    [
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil)
    ],
    // 33388
    [
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil)
    ],
    // 33377
    [
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil)
    ],
    // 33366
    [
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil)
    ],
    // 33355
    [
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil)
    ],
    // 33344
    [
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil)
    ],
    // 33322
    [
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil)
    ]
]
let fullHouses222_3: [[Card]] = [
    // 222AA
    [
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil)
    ],
    // 222KK
    [
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil)
    ],
    // 222QQ
    [
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil)
    ],
    // 222JJ
    [
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil)
    ],
    // 22210
    [
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil)
    ],
    // 22299
    [
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil)
    ],
    // 22288
    [
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil)
    ],
    // 22277
    [
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil)
    ],
    // 22266
    [
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil)
    ],
    // 22255
    [
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil)
    ],
    // 22244
    [
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil)
    ],
    // 22233
    [
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil)
    ]
             point: 1
]

}


let flushRanks: [[Rank]] = [Prop
    [.ace, .king, .queen, .jack, .nine],
    [.ace, .king, .queen, .jack, .eight],
    [.ace, .king, .queen, .jack, .seven],
    [.ace, .king, .queen, .jack, .six],
    [.ace, .king, .queen, .jack, .five],
    [.ace, .king, .queen, .jack, .four],
    [.ace, .king, .queen, .jack, .three],
    [.ace, .king, .queen, .jack, .two],
    [.ace, .queen, .jack, .ten, .nine],
    [.ace, .queen, .jack, .ten, .eight],
    [.ace, .queen, .jack, .ten, .seven],
    [.ace, .queen, .jack, .ten, .six],
    [.ace, .queen, .jack, .ten, .five],
    [.ace, .queen, .jack, .ten, .four],
    [.ace, .queen, .jack, .ten, .three],
    [.ace, .queen, .jack, .ten, .two],
    [.king, .queen, .jack, .ten, .eight],
    [.queen, .jack, .nine, .six, .three],
    [.ten, .eight, .seven, .five, .two],
    [.eight, .seven, .five, .four, .two]

    // เพิ่มตามลำดับความแข็ง
]


let straightRanks: [[Rank]] = [
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
            let bonus = rowScores * 4
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

let threeOfAKinds: [[Rank]] = [
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
        print("Player

Player 1 = ?
Player 2 = ?
Player 3 = ?
Player 4 = ?
