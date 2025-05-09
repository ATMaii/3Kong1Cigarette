import UIKit

class GameViewController: UIViewController {
    // ตัวแปรเก็บข้อมูลของผู้เล่น
    var players: [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // เพิ่มตัวอย่างผู้เล่น
        let player1 = Player(id: 1, name: "Left Player", chips: 10)
        let player2 = Player(id: 2, name: "Top Player", chips: 10)
        let player3 = Player(id: 3, name: "Right Player", chips: 10)
        let player4 = Player(id: 4, name: "Bottom Player", chips: 10)
        players = [player1, player2, player3, player4]
        
        // แสดงโต๊ะ
        drawTable()
    }
    
    func drawTable() {
        // วาดกลางโต๊ะที่เป็นตาราง
        let table = UIView()
        table.frame = CGRect(x: 50, y: 50, width: 300, height: 300)
        table.backgroundColor = .gray
        self.view.addSubview(table)
        
        // เพิ่มแถว
        let row1 = UIView()
        row1.frame = CGRect(x: 50, y: 50, width: 300, height: 50)
        row1.backgroundColor = .lightGray
        table.addSubview(row1)
        
        let row2 = UIView()
        row2.frame = CGRect(x: 50, y: 100, width: 300, height: 50)
        row2.backgroundColor = .lightGray
        table.addSubview(row2)
        
        let row3 = UIView()
        row3.frame = CGRect(x: 50, y: 150, width: 300, height: 50)
        row3.backgroundColor = .lightGray
        table.addSubview(row3)
        
        // ตำแหน่งผู้เล่น
        let leftPlayerPosition = CGRect(x: 0, y: 150, width: 50, height: 50)
        let topPlayerPosition = CGRect(x: 150, y: 0, width: 50, height: 50)
        let rightPlayerPosition = CGRect(x: 300, y: 150, width: 50, height: 50)
        let bottomPlayerPosition = CGRect(x: 150, y: 300, width: 50, height: 50)
        
        addPlayerMarker(at: leftPlayerPosition, name: "Left")
        addPlayerMarker(at: topPlayerPosition, name: "Top")
        addPlayerMarker(at: rightPlayerPosition, name: "Right")
        addPlayerMarker(at: bottomPlayerPosition, name: "Bottom")
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