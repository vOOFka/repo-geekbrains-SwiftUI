//
//  ContentView.swift
//  vkswiftUI
//
//  Created by Home on 09.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack{
            GeometryReader { geometry in
                Image("vkbackground-1")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
            }
            VStack {
                Image("logo_vk")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100.0, height: 100.0)
                    .padding(.bottom, 30.0)
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
                Button(action: {
                    print("Login ...")
                }, label: {
                    Text("Enter")
                        .padding(5.0)
                        .frame(width: 100.0)
                })
                    .disabled(username.isEmpty || password.isEmpty)
                    .accentColor(.black)
                    .foregroundColor(.white)
                    .background(.mint)
                    .cornerRadius(5.0)
                    .padding(.top, 30.0)
                Spacer()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
