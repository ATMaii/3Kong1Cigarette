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

Prop(name: "RoyalFlush"
props: [
        Card(rank: .ace, suit: .spades),
        Card(rank: .king, suit: .spades),
        Card(rank: .queen, suit: .spades),
        Card(rank: .jack, suit: .spades),
        Card(rank: .ten, suit: .spades)
    ]),
Prop(name: "RoyalFlush"
props: [
        Card(rank: .ace, suit: .hearts),
        Card(rank: .king, suit: .hearts),
        Card(rank: .queen, suit: .hearts),
        Card(rank: .jack, suit: .hearts),
        Card(rank: .ten, suit: .hearts)
     ]),
Prop(name: "RoyalFlush"
props: [
        Card(rank: .ace, suit: .diamonds),
        Card(rank: .king, suit: .diamonds),
        Card(rank: .queen, suit: .diamonds),
        Card(rank: .jack, suit: .diamonds),
        Card(rank: .ten, suit: .diamonds)
    ]),
Prop(name: "RoyalFlush"
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

Prop(name: "straightFlush"
props: [
        Card(rank: .ace, suit: .spades),
        Card(rank: .two, suit: .spades),
        Card(rank: .three, suit: .spades),
        Card(rank: .four, suit: .spades),
        Card(rank: .five, suit: .spades)
       ]),

Prop(name: "straightFlush"
props: [
        Card(rank: .king, suit: .spades),
        Card(rank: .queen, suit: .spades),
        Card(rank: .jack, suit: .spades),
        Card(rank: .ten, suit: .spades),
        Card(rank: .nine, suit: .spades)
       ]),
                 

Prop(name: "straightFlush"
props: [
        Card(rank: .queen, suit: .spades),
        Card(rank: .jack, suit: .spades),
        Card(rank: .ten, suit: .spades),
        Card(rank: .nine, suit: .spades),
        Card(rank: .eight, suit: .spades)
       ]),
                         
Prop(name: "straightFlush"
props: [
        Card(rank: .jack, suit: .spades),
        Card(rank: .ten, suit: .spades),
        Card(rank: .nine, suit: .spades),
        Card(rank: .eight, suit: .spades),
        Card(rank: .seven, suit: .spades)
       ]),
                           
Prop(name: "straightFlush"
props: [
        Card(rank: .ten, suit: .spades),
        Card(rank: .nine, suit: .spades),
        Card(rank: .eight, suit: .spades),
        Card(rank: .seven, suit: .spades),
        Card(rank: .six, suit: .spades)
       ]),

Prop(name: "straightFlush"
props: [
        Card(rank: .nine, suit: .spades),
        Card(rank: .eight, suit: .spades),
        Card(rank: .seven, suit: .spades),
        Card(rank: .six, suit: .spades),
        Card(rank: .five, suit: .spades)
       ]),

Prop(name: "straightFlush"
props: [
        Card(rank: .eight, suit: .spades),
        Card(rank: .seven, suit: .spades),
        Card(rank: .six, suit: .spades),
        Card(rank: .five, suit: .spades),
        Card(rank: .four, suit: .spades)
       ]),
           
Prop(name: "straightFlush"
props: [
        Card(rank: .seven, suit: .spades),
        Card(rank: .six, suit: .spades),
        Card(rank: .five, suit: .spades),
        Card(rank: .four, suit: .spades),
        Card(rank: .three, suit: .spades)
       ]),
         
Prop(name: "straightFlush"
props: [
        Card(rank: .six, suit: .spades),
        Card(rank: .five, suit: .spades),
        Card(rank: .four, suit: .spades),
        Card(rank: .three, suit: .spades),
        Card(rank: .two, suit: .spades)
       ]),

Prop(name: "straightFlush"
props: [
        Card(rank: .ace, suit: .hearts),
        Card(rank: .two, suit: .hearts),
        Card(rank: .three, suit: .hearts),
        Card(rank: .four, suit: .hearts),
        Card(rank: .five, suit: .hearts)
       ]),

Prop(name: "straightFlush"
props: [
        Card(rank: .king, suit: .hearts),
        Card(rank: .queen, suit: .hearts),
        Card(rank: .jack, suit: .hearts),
        Card(rank: .ten, suit: .hearts),
        Card(rank: .nine, suit: .hearts)
       ]),

Prop(name: "straightFlush"
props: [
        Card(rank: .queen, suit: .hearts),
        Card(rank: .jack, suit: .hearts),
        Card(rank: .ten, suit: .hearts),
        Card(rank: .nine, suit: .hearts),
        Card(rank: .eight, suit: .hearts)
       ]),

Prop(name: "straightFlush"
props: [
        Card(rank: .jack, suit: .hearts),
        Card(rank: .ten, suit: .hearts),
        Card(rank: .nine, suit: .hearts),
        Card(rank: .eight, suit: .hearts),
        Card(rank: .seven, suit: .hearts)
       ]),

Prop(name: "straightFlush"
props: [
        Card(rank: .ten, suit: .hearts),
        Card(rank: .nine, suit: .hearts),
        Card(rank: .eight, suit: .hearts),
        Card(rank: .seven, suit: .hearts),
        Card(rank: .six, suit: .hearts)
       ]),

Prop(name: "straightFlush"
props:  [
        Card(rank: .nine, suit: .hearts),
        Card(rank: .eight, suit: .hearts),
        Card(rank: .seven, suit: .hearts),
        Card(rank: .six, suit: .hearts),
        Card(rank: .five, suit: .hearts)
        ]),

Prop(name: "straightFlush"
props: [
        Card(rank: .eight, suit: .hearts),
        Card(rank: .seven, suit: .hearts),
        Card(rank: .six, suit: .hearts),
        Card(rank: .five, suit: .hearts),
        Card(rank: .four, suit: .hearts)
        ]),

Prop(name: "straightFlush"
props: [
        Card(rank: .seven, suit: .hearts),
        Card(rank: .six, suit: .hearts),
        Card(rank: .five, suit: .hearts),
        Card(rank: .four, suit: .hearts),
        Card(rank: .three, suit: .hearts)
       ]),

Prop(name: "straightFlush"
props: [
        Card(rank: .six, suit: .hearts),
        Card(rank: .five, suit: .hearts),
        Card(rank: .four, suit: .hearts),
        Card(rank: .three, suit: .hearts),
        Card(rank: .two, suit: .hearts)
       ]),

Prop(name: "straightFlush"
props: [
        Card(rank: .ace, suit: .diamonds),
        Card(rank: .two, suit: .diamonds),
        Card(rank: .three, suit: .diamonds),
        Card(rank: .four, suit: .diamonds),
        Card(rank: .five, suit: .diamonds)
       ]),

Prop(name: "straightFlush"
props: [
        Card(rank: .king, suit: .diamonds),
        Card(rank: .queen, suit: .diamonds),
        Card(rank: .jack, suit: .diamonds),
        Card(rank: .ten, suit: .diamonds),
        Card(rank: .nine, suit: .diamonds)
       ]),

Prop(name: "straightFlush"
props: [
        Card(rank: .queen, suit: .diamonds),
        Card(rank: .jack, suit: .diamonds),
        Card(rank: .ten, suit: .diamonds),
        Card(rank: .nine, suit: .diamonds),
        Card(rank: .eight, suit: .diamonds)
       ]),

Prop(name: "straightFlush"
props: [
        Card(rank: .jack, suit: .diamonds),
        Card(rank: .ten, suit: .diamonds),
        Card(rank: .nine, suit: .diamonds),
        Card(rank: .eight, suit: .diamonds),
        Card(rank: .seven, suit: .diamonds)
       ]),

Prop(name: "straightFlush"
props: [
        Card(rank: .ten, suit: .diamonds),
        Card(rank: .nine, suit: .diamonds),
        Card(rank: .eight, suit: .diamonds),
        Card(rank: .seven, suit: .diamonds),
        Card(rank: .six, suit: .diamonds)
       ]),

Prop(name: "straightFlush"
props: [
        Card(rank: .nine, suit: .diamonds),
        Card(rank: .eight, suit: .diamonds),
        Card(rank: .seven, suit: .diamonds),
        Card(rank: .six, suit: .diamonds),
        Card(rank: .five, suit: .diamonds)
       ]),

Prop(name: "straightFlush"
props: [
        Card(rank: .eight, suit: .diamonds),
        Card(rank: .seven, suit: .diamonds),
        Card(rank: .six, suit: .diamonds),
        Card(rank: .five, suit: .diamonds),
        Card(rank: .four, suit: .diamonds)
        ]),

Prop(name: "straightFlush"
props: [
        Card(rank: .seven, suit: .diamonds),
        Card(rank: .six, suit: .diamonds),
        Card(rank: .five, suit: .diamonds),
        Card(rank: .four, suit: .diamonds),
        Card(rank: .three, suit: .diamonds)
       ]),

Prop(name: "straightFlush"
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

Prop(name: "FourOfAKind"

props: [
    Card(rank: .ace, suit: .spades),
    Card(rank: .ace, suit: .hearts),
    Card(rank: .ace, suit: .clubs),
    Card(rank: .ace, suit: .diamonds),
    Card(rank: .two, suit: .hearts)
    ]),
Prop(name: "FourOfAKind"
    // Four Kings + 3
  props: [
        Card(rank: .king, suit: .spades),
        Card(rank: .king, suit: .hearts),
        Card(rank: .king, suit: .clubs),
        Card(rank: .king, suit: .diamonds),
        Card(rank: .three, suit: .spades)
    ]),
Prop(name: "FourOfAKind"
    // Four Queens + 4
  props: [  
        Card(rank: .queen, suit: .spades),
        Card(rank: .queen, suit: .hearts),
        Card(rank: .queen, suit: .clubs),
        Card(rank: .queen, suit: .diamonds),
        Card(rank: .four, suit: .hearts)
    ]),
Prop(name: "FourOfAKind"
    // Four Jacks + 5
   props: [ 
        Card(rank: .jack, suit: .spades),
        Card(rank: .jack, suit: .hearts),
        Card(rank: .jack, suit: .clubs),
        Card(rank: .jack, suit: .diamonds),
        Card(rank: .five, suit: .clubs)
    ]),
Prop(name: "FourOfAKind"
    // Four Tens + 6
   props: [ 
        Card(rank: .ten, suit: .spades),
        Card(rank: .ten, suit: .hearts),
        Card(rank: .ten, suit: .clubs),
        Card(rank: .ten, suit: .diamonds),
        Card(rank: .six, suit: .diamonds)
    ]),
Prop(name: "FourOfAKind"
    // Four Nines + 7
   props: [ 
        Card(rank: .nine, suit: .spades),
        Card(rank: .nine, suit: .hearts),
        Card(rank: .nine, suit: .clubs),
        Card(rank: .nine, suit: .diamonds),
        Card(rank: .seven, suit: .spades)
    ]),
Prop(name: "FourOfAKind"
    // Four Eights + 8
  props: [  
        Card(rank: .eight, suit: .spades),
        Card(rank: .eight, suit: .hearts),
        Card(rank: .eight, suit: .clubs),
        Card(rank: .eight, suit: .diamonds),
        Card(rank: .nine, suit: .hearts)
    ]),
Prop(name: "FourOfAKind"
    // Four Sevens + 10
   props: [ 
        Card(rank: .seven, suit: .spades),
        Card(rank: .seven, suit: .hearts),
        Card(rank: .seven, suit: .clubs),
        Card(rank: .seven, suit: .diamonds),
        Card(rank: .ten, suit: .clubs)
    ]),
Prop(name: "FourOfAKind"
    // Four Sixes + J
   props: [ 
        Card(rank: .six, suit: .spades),
        Card(rank: .six, suit: .hearts),
        Card(rank: .six, suit: .clubs),
        Card(rank: .six, suit: .diamonds),
        Card(rank: .jack, suit: .diamonds)
    ]),
Prop(name: "FourOfAKind"
    // Four Fives + Q
    props: [
        Card(rank: .five, suit: .spades),
        Card(rank: .five, suit: .hearts),
        Card(rank: .five, suit: .clubs),
        Card(rank: .five, suit: .diamonds),
        Card(rank: .queen, suit: .spades)
    ]),
Prop(name: "FourOfAKind"
    // Four Fours + K
   props: [ 
        Card(rank: .four, suit: .spades),
        Card(rank: .four, suit: .hearts),
        Card(rank: .four, suit: .clubs),
        Card(rank: .four, suit: .diamonds),
        Card(rank: .king, suit: .hearts)
    ]),
Prop(name: "FourOfAKind"
    // Four Threes + A
    props: [
        Card(rank: .three, suit: .spades),
        Card(rank: .three, suit: .hearts),
        Card(rank: .three, suit: .clubs),
        Card(rank: .three, suit: .diamonds),
        Card(rank: .ace, suit: .clubs)
    ]),
Prop(name: "FourOfAKind"
    // Four Twos + 9
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

let fullHouses: [[Card]] = [
    // AAAKK
    [
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil)
    ],
    // AAAQQ
    [
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil)
    ],
    // AAAJJ
    [
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil)
    ],
    // AAA10
    [
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil)
    ],
    // AAA99
    [
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil)
    ],
    // AAA88
    [
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil)
    ],
    // AAA77
    [
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil)
    ],
    // AAA66
    [
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil)
    ],
    // AAA55
    [
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil)
    ],
    // AAA44
    [
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil)
    ],
    // AAA33
    [
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil)
    ],
    // AAA22
    [
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil)
    ],
            point: 2
    ]

    // KKKAA
    [
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil)
    ],
    // KKKQQ
    [
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil)
    ],
    // KKKJJ
    [
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil)
    ],
    // KKK10
    [
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil)
    ],
    // KKK9
    [
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil)
    ],
    // KKK8
    [
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil)
    ],
    // KKK7
    [
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil)
    ],
    // KKK6
    [
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil)
    ],
    // KKK5
    [
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil)
    ],
    // KKK4
    [
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil)
    ],
    // KKK3
    [
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil)
    ],
    // KKK2
    [
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil)
    ],
]// ต่อจาก fullHouses
let moreFullHouses: [[Card]] = [
    // QQQAA
    [
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil)
    ],
    // QQQKK
    [
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil)
    ],
    // QQQJJ
    [
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil)
    ],
    // QQQ10
    [
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil)
    ],
    // QQQ9
    [
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil)
    ],
    // QQQ8
    [
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil)
    ],
    // QQQ7
    [
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil)
    ],
    // QQQ6
    [
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil)
    ],
    // QQQ5
    [
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil)
    ],
    // QQQ4
    [
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil)
    ],
    // QQQ3
    [
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil)
    ],
    // QQQ2
    [
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil)
    ]
]
let jjjFullHouses: [[Card]] = [
    // JJJAA
    [
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil)
    ],
    // JJJKK
    [
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil)
    ],
    // JJJQQ
    [
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil)
    ],
    // JJJ10
    [
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil)
    ],
    // JJJ9
    [
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil)
    ],
    // JJJ8
    [
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil)
    ],
    // JJJ7
    [
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil)
    ],
    // JJJ6
    [
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil)
    ],
    // JJJ5
    [
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil)
    ],
    // JJJ4
    [
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil)
    ],
    // JJJ3
    [
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil)
    ],
    // JJJ2
    [
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil)
    ]
]
let fullHouses: [[Card]] = [
    // 10-10-10 AA
    [
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil)
    ],
    // 10-10-10 KK
    [
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil)
    ],
    // 10-10-10 QQ
    [
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil)
    ],
    // 10-10-10 JJ
    [
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil)
    ],
    // 10-10-10 99
    [
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil)
    ],
    // 10-10-10 88
    [
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil)
    ],
    // 10-10-10 77
    [
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil)
    ],
    // 10-10-10 66
    [
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil)
    ],
    // 10-10-10 55
    [
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil)
    ],
    // 10-10-10 44
    [
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil)
    ],
    // 10-10-10 33
    [
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil)
    ],
    // 10-10-10 22
    [
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil)
    ]
]

let fullHouses999: [[Card]] = [
    // 999AA
    [
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil)
    ],
    // 999KK
    [
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil)
    ],
    // 999QQ
    [
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil)
    ],
    // 999JJ
    [
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil)
    ],
    // 99910
    [
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil)
    ],
    // 99988
    [
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil)
    ],
    // 99977
    [
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil)
    ],
    // 99966
    [
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil)
    ],
    // 99955
    [
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil)
    ],
    // 99944
    [
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil)
    ],
    // 99933
    [
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil)
    ],
    // 99922
    [
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .two, suit: nil),
        Card(rank: .two, suit: nil)
    ]
]
let fullHouses888: [[Card]] = [
    // 888AA
    [
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .ace, suit: nil),
        Card(rank: .ace, suit: nil)
    ],
    // 888KK
    [
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .king, suit: nil),
        Card(rank: .king, suit: nil)
    ],
    // 888QQ
    [
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .queen, suit: nil),
        Card(rank: .queen, suit: nil)
    ],
    // 888JJ
    [
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .jack, suit: nil),
        Card(rank: .jack, suit: nil)
    ],
    // 88810
    [
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .ten, suit: nil),
        Card(rank: .ten, suit: nil)
    ],
    // 8889
    [
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .nine, suit: nil),
        Card(rank: .nine, suit: nil)
    ],
    // 8887
    [
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .seven, suit: nil),
        Card(rank: .seven, suit: nil)
    ],
    // 8886
    [
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .six, suit: nil),
        Card(rank: .six, suit: nil)
    ],
    // 8885
    [
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .five, suit: nil),
        Card(rank: .five, suit: nil)
    ],
    // 8884
    [
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .four, suit: nil),
        Card(rank: .four, suit: nil)
    ],
    // 8883
    [
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .eight, suit: nil),
        Card(rank: .three, suit: nil),
        Card(rank: .three, suit: nil)
    ],
    // 8882
    [
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