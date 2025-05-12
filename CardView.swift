struct CardView: View {
    let card: Card

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white)
                .frame(width: 60, height: 90)
                .shadow(radius: 2)

            VStack {
                Text(card.rank.symbol)
                Text(card.suit.symbol)
            }
            .font(.caption)
        }
    }
}