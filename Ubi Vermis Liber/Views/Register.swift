//
//  Register.swift
//  Ubi Vermis Liber
//
//  Created by Estella Newton on 10/4/20.
//  Copyright © 2020 Estella Newton. All rights reserved.
//
import Firebase
import SwiftUI
struct Register: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var color = Color(K.Color.red)
    var body: some View {
        ZStack {
            Color(K.Color.pink)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Register")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(K.Color.red))
                    .padding()
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.white)
                        .frame( height: 50)
                    .padding(.vertical)
                    TextField("Email", text: $email)
                        .font(.body)
                        .padding()
                        .disableAutocorrection(true)
                    
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.white)
                        .frame( height: 50)
                    .padding(.vertical)
                    SecureField("Password", text: $password)
                        .font(.body)
                        .padding()
                        .disableAutocorrection(true)
                }
                Button(action: {
                    
                    Auth.auth().createUser(withEmail: self.email, password: self.password) { authResult, error in
                        if let e = error {
                            print(e)
                        } else {
                            self.color = Color(.green)
                        }
                    }
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 100, height: 50)
                            .foregroundColor(color)
                        Text("Done")
                            .font(Font.custom(K.Fonts.lato, size: 20))
                            .foregroundColor(.white)
                        
                    }
                }
                if color == Color(.green) {
                    NavigationLink(destination: ContentView()) {
                        ZStack {
                            Rectangle()
                                .frame(height: 50)
                                .foregroundColor(Color(K.Color.red))
                                .padding(.vertical)
                            
                            Text("Register")
                                .font(.title)
                                .padding()
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
    }
}


struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
