import UIKit

class GameViewController: UIViewController {
    // ตัวแปรเก็บข้อมูลของผู้เล่น
    var players: [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // เพิ่มตัวอย่างผู้เล่น
        let player1 = Player(id: 1, name: "Bottom Player", chips: 10)
        let player2 = Player(id: 2, name: "Left Player", chips: 10)
        let player3 = Player(id: 3, name: "Top Player", chips: 10)
        let player4 = Player(id: 4, name: "Right Player", chips: 10)
        players = [player1, player2, player3, player4]
        
        // แสดงโต๊ะ
        drawTable()
    }

    func drawTable() {
    let tableSize: CGFloat = 300
    let tableOrigin = CGPoint(x: 50, y: 50)

    let table = UIView()
    table.frame = CGRect(origin: tableOrigin, size: CGSize(width: tableSize, height: tableSize))
    table.backgroundColor = .clear
    self.view.addSubview(table)
    self.tableView = table

    // วาดมงกุฏตรงกลาง
    let crownImageView = UIImageView(image: UIImage(named: "crown"))
    crownImageView.contentMode = .scaleAspectFit
    crownImageView.frame = CGRect(x: (tableSize - 100) / 2, y: (tableSize - 100) / 2, width: 100, height: 100)
    table.addSubview(crownImageView)

    // เพิ่มตำแหน่งผู้เล่นเหมือนเดิม
    let leftPlayerPosition = CGRect(x: 0, y: 150, width: 50, height: 50)
    let topPlayerPosition = CGRect(x: 150, y: 0, width: 50, height: 50)
    let rightPlayerPosition = CGRect(x: 300, y: 150, width: 50, height: 50)
    let bottomPlayerPosition = CGRect(x: 150, y: 300, width: 50, height: 50)

    addPlayerMarker(at: leftPlayerPosition, name: "Left")
    addPlayerMarker(at: topPlayerPosition, name: "Top")
    addPlayerMarker(at: rightPlayerPosition, name: "Right")
    addPlayerMarker(at: bottomPlayerPosition, name: "Bottom")
    
   // เพิ่มปุ่ม toggleSortButton ที่มุมขวาล่าง
    toggleSortButton = UIButton(type: .system)
    toggleSortButton.setTitle("《》", for: .normal)
    toggleSortButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
    let buttonWidth: CGFloat = 40
    let buttonHeight: CGFloat = 40
    toggleSortButton.frame = CGRect(x: view.frame.width - buttonWidth - 20, y: table.frame.maxY + 20, width: buttonWidth, height: buttonHeight)
    toggleSortButton.addTarget(self, action: #selector(toggleSort), for: .touchUpInside)
    view.addSubview(toggleSortButton)
        
    }
    
    func addPlayerMarker(at position: CGRect, name: String) {
        let playerMarker = UILabel()
        playerMarker.frame = position
        playerMarker.text = name
        playerMarker.textAlignment = .center
        playerMarker.backgroundColor = .green
        playerMarker.textColor = .white
        self.view.addSubview(playerMarker)
    }
}

struct Player {
    var id: Int
    var name: String
    var chips: Int
}

func addCardsForBottomPlayer(in table: UIView) {
    // สร้างสำรับไพ่
    var deck = createDeck()
    deck.shuffle()
    let hand = Array(deck.prefix(13)) // สุ่มเลือก 13 ใบ

    let cardWidth: CGFloat = 24
    let cardHeight: CGFloat = 36
    let spacing: CGFloat = 6
    let totalWidth = CGFloat(hand.count) * (cardWidth + spacing) - spacing

    let startX = (table.frame.width - totalWidth) / 2
    let yPosition = table.frame.height - cardHeight - 10

    for (i, card) in hand.enumerated() {
        let cardView = UIView()
        let xPosition = startX + CGFloat(i) * (cardWidth + spacing)
        cardView.frame = CGRect(x: xPosition, y: yPosition, width: cardWidth, height: cardHeight)
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 4
        cardView.layer.borderWidth = 1
        cardView.layer.borderColor = UIColor.black.cgColor

        let label = UILabel(frame: cardView.bounds)
        label.text = card.description // ใช้ .description แสดงไพ่ เช่น "A♠"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .center
        cardView.addSubview(label)

        table.addSubview(cardView)
    }
}

enum SortType {
    case rank
    case suit

    mutating func toggle() {
        self = (self == .rank) ? .suit : .rank
    }
}

func sortHand(_ hand: [Card], by sortType: SortType) -> [Card] {
    switch sortType {
    case .rank:
        return hand.sorted {
            if $0.rank.rawValue == $1.rank.rawValue {
                return $0.suit.rawValue < $1.suit.rawValue
            } else {
                return $0.rank.rawValue < $1.rank.rawValue
            }
        }
    case .suit:
        return hand.sorted {
            if $0.suit.rawValue == $1.suit.rawValue {
                return $0.rank.rawValue < $1.rank.rawValue
            } else {
                return $0.suit.rawValue < $1.suit.rawValue
            }
        }
    }
}

// เรียกใช้
let hand = Deck().draw(count: 13)
let sortedHand = sortHand(hand, by: .rank)
addCards(sortedHand, toBottomOf: table)
toggleSortButton.setTitle("《》", for: .normal)

@objc func sortByRank() {
    clearBottomCards()
    let sorted = sortHand(bottomHand, by: .rank)
    addCards(sorted, toBottomOf: table)
}

@objc func sortBySuit() {
    clearBottomCards()
    let sorted = sortHand(bottomHand, by: .suit)
    addCards(sorted, toBottomOf: table)
}

func clearBottomCards() {
    for cardView in bottomCardViews {
        cardView.removeFromSuperview()
    }
    bottomCardViews.removeAll()
}
