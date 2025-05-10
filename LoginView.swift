import SwiftUI
import FacebookLogin

struct LoginView: View {
    var body: some View {
        VStack {
            Text("3Kong1Ciggalate")
                .font(.largeTitle)
                .padding()

            Button(action: {
                loginWithFacebook()
            }) {
                Text("Login with Facebook")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 220, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }

import SwiftUI
import FacebookLogin
import FacebookCore

struct ContentView: View {
    @State private var isLoggedIn = false
    @State private var showProfileSetup = false
    @State private var facebookName: String = ""
    
    var body: some View {
        Group {
            if isLoggedIn {
                if showProfileSetup {
                    ProfileSetupView(isPresented: $showProfileSetup, nickname: facebookName, onFinish: {
                        // เมื่อกรอกข้อมูลเสร็จ ไปหน้าเกม
                        isLoggedIn = true
                        showProfileSetup = false
                    })
                } else {
                    GameView()
                }
            } else {
                Button("Login with Facebook") {
                    let manager = LoginManager()
                    manager.logIn(permissions: [.publicProfile], viewController: nil) { result in
                        switch result {
                        case .success(_, _, let token):
                            fetchFacebookName(token: token.tokenString)
                        case .failed(let error):
                            print("Facebook login failed: