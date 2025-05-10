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

    func loginWithFacebook() {
        let manager = LoginManager()
        manager.logIn(permissions: [.publicProfile, .email], viewController: UIApplication.shared.windows.first?.rootViewController) { result in
            switch result {
            case .success(_, _, let token):
                print("Logged in with token:

import SwiftUI
import FacebookLogin
import FacebookCore

struct LoginView: View {
    @State private var facebookName: String = ""

    var body: some View {
        VStack {
            Button("Login with Facebook") {
                LoginManager().logIn(permissions: ["public_profile"], from: nil) { result, error in
                    if let error = error {
                        print("Login failed:


let request = GraphRequest(graphPath: "me", parameters: ["fields": "name"], tokenString: tokenString, version: nil, httpMethod: .get)
request.start { _, result, error in
    if let error = error {
        print("Graph Request Failed: