struct StadiumSelectionView: View {
    @ObservedObject var gameManager: GameManager

    var body: some View {
        VStack {
            Text("เลือกสนาม").font(.title)

            ForEach(gameManager.availableStadiums(), id: \.self) { stadium in
                Button(action: {
                    gameManager.selectedStadium = stadium
                }) {
                    Text(stadium.displayName)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
            }
        }
    }
}
if player.chips < Stadium.Rookie.minChipsRequired {
    // แสดงข้อความว่าไม่สามารถเข้าได้
    // หรือ redirect ไปหน้าอื่น
}
var body: some View {
    VStack {
        Text("เข้าได้เฉพาะสนาม 'Wembley'").font(.headline)

        Button(action: {
            gameManager.selectedStadium = .Rookie
        }) {
            Text("เข้าสนาม Wembley")
                .padding()
                .background(Color.green)
                .cornerRadius(10)
        }
    }
}
Text("ห้อง: 50 Wemley")
