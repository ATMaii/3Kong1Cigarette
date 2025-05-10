import SwiftUI

struct EntertainmentComplexView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to the Entertainment Complex!")
                    .font(.largeTitle)
                    .padding()

                // ปุ่มสำหรับเลือกโซนต่างๆ
                VStack(spacing: 20) {
                    NavigationLink(destination: CinemaView()) {
                        Text("โรงหนัง")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    NavigationLink(destination: RestaurantView()) {
                        Text("ร้านอาหาร")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    NavigationLink(destination: GameZoneView()) {
                        Text("โซนเกม")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    NavigationLink(destination: SwimmingPoolView()) {
                        Text("สระว่ายน้ำ")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
    }
}

// ตัวอย่างหน้า Cinema
struct CinemaView: View {
    var body: some View {
        VStack {
            Text("โรงหนัง")
                .font(.largeTitle)
                .padding()

            Text("เลือกภาพยนตร์ที่ต้องการดู")
                .padding()

            // ตัวอย่างของรายการหนัง
            List {
                Text("ภาพยนตร์ 1")
                Text("ภาพยนตร์ 2")
                Text("ภาพยนตร์ 3")
            }
        }
    }
}

// ตัวอย่างหน้า Restaurant
struct RestaurantView: View {
    var body: some View {
        VStack {
            Text("ร้านอาหาร")
                .font(.largeTitle)
                .padding()

            Text("เลือกเมนูที่ต้องการ")
                .padding()

            // ตัวอย่างของเมนูอาหาร
            List {
                Text("เมนู 1")
                Text("เมนู 2")
                Text("เมนู 3")
            }
        }
    }
}

// ตัวอย่างหน้า Game Zone
struct GameZoneView: View {
    var body: some View {
        VStack {
            Text("โซนเกม")
                .font(.largeTitle)
                .padding()

            Text("เลือกเกมที่ต้องการเล่น")
                .padding()

            // ตัวอย่างของเกมในโซนนี้
            List {
                Text("เกม 1")
                Text("เกม 2")
                Text("เกม 3")
            }
        }
    }
}

// ตัวอย่างหน้า Swimming Pool
struct SwimmingPoolView: View {
    var body: some View {
        VStack {
            Text("สระว่ายน้ำ")
                .font(.largeTitle)
                .padding()

            Text("เวลาทำการและบริการ")
                .padding()

            // ตัวอย่างของบริการในสระว่ายน้ำ
            List {
                Text("บริการ 1")
                Text("บริการ 2")
                Text("บริการ 3")
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        EntertainmentComplexView()
    }
}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}