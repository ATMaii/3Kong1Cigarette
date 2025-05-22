import SwiftUI
import PhotosUI
import FacebookCore

struct ProfileSetupView: View {
    @Binding var isPresented: Bool
    @State private var profileImage: UIImage? = nil
    @State private var isShowingPicker = false
    @State private var nickname: String = ""
    @State private var selectedGender: String = "ไม่ระบุ"
    let genders = ["ไม่ระบุ", "ชาย", "หญิง"]

    var body: some View {
        VStack(spacing: 20) {
            // รูปโปรไฟล์
            if let image = profileImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.blue, lineWidth: 2))
            } else if let accessToken = AccessToken.current {
                let userId = accessToken.userID
                let imageURL = URL(string: "https://graph.facebook.com/

    var body: some View {
        VStack(spacing: 20) {
            Text("ตั้งค่าข้อมูลส่วนตัว")
                .font(.title2)
                .bold()

            TextField("ชื่อเล่น", text: $nickname)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Picker("เพศ", selection: $selectedGender) {
                ForEach(genders, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)

            Button("บันทึก") {
                print("ชื่อ:

}