//
//  ContentView.swift
//  vkswiftUI
//
//  Created by Home on 09.01.2022.
//

import SwiftUI
import Combine

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showLogo: Bool = true
    
    private let keyboardIsOnPublisher = Publishers.Merge(
           NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
               .map { _ in true },
           NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
               .map { _ in false }
       )
           .removeDuplicates()
    
    var body: some View {
        ZStack{
            GeometryReader { geometry in
                Image("vkbackground-2")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
            }
            ScrollView(showsIndicators: false) {
                VStack {
                    if showLogo {
                    Image("logo_vk")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100.0, height: 100.0)
                    }
                    HStack {
                        VStack(alignment: .trailing) {
                            Text("Login")
                                .frame(height: 34.0)
                                .foregroundColor(.white)
                            Text("Password")
                                .frame(height: 34.0)
                                .foregroundColor(.white)
                        }
                        VStack(alignment: .leading) {
                            TextField(
                                "User name (email address)",
                                text: $username)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                                .border(Color(UIColor.separator))
                                .cornerRadius(2.0)
                                .frame(maxWidth: 250.0)
                            SecureField(
                                "Password",
                                text: $password
                            ) {
                                // handleLogin(username: username, password: password)
                            }
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .border(Color(UIColor.separator))
                            .cornerRadius(2.0)
                            .frame(maxWidth: 250.0)
                        }
                    }
                    .padding(.top, 30.0)
                    Spacer()
                    Button(action: {
                        print("Login ...")
                    }, label: {
                        Text("Enter")
                            .padding(5.0)
                            .frame(width: 100.0)
                    })
                        .disabled(username.isEmpty || password.isEmpty)
                        .foregroundColor(.white)
                        .accentColor(.black)
                        .background(.mint)
                        .cornerRadius(5.0)
                        .padding(.top, 30.0)
                }
                .onReceive(keyboardIsOnPublisher) { isKeyboardOn in
                               withAnimation(Animation.easeInOut(duration: 0.5)) {
                                   self.showLogo = !isKeyboardOn
                               }
                           }

            }.onTapGesture {
                UIApplication.shared.endEditing()
            }

        }
    }
}

extension UIApplication {
   func endEditing() {
       sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
