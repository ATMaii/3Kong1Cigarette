
class GameTimer: ObservableObject {
    @Published var timeLeft: Int = 120 // เวลานับถอยหลังเริ่มต้นที่ 120 วินาที
    var timer: Timer?
    
    func startTimer() {
        timer?.invalidate() // ถ้ามี timer ที่กำลังทำงานอยู่ ให้หยุดก่อน
        timeLeft = 120 // เริ่มต้นใหม่ที่ 120 วินาที
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.updateTimer()
        }
    }
    
    func updateTimer() {
        if timeLeft > 0 {
            timeLeft -= 1
        } else {
            timer?.invalidate()
            // เวลาเต็มแล้ว ให้เรียกฟังก์ชั่นจัดการต่อไป
            self.timeIsUp()
        }
    }
    
    func timeIsUp() {
        // คุณสามารถเพิ่มฟังก์ชั่นที่ต้องการให้ทำเมื่อเวลาหมด เช่น จบเกม หรือจัดการคะแนน
        print("เวลาเสร็จแล้ว!")
        // ใส่คำสั่งที่จะทำเมื่อเวลาหมด
    }
}
