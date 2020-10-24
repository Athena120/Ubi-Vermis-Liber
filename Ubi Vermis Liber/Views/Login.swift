//
//  Login.swift
//  Ubi Vermis Liber
//
//  Created by Estella Newton on 10/4/20.
//  Copyright © 2020 Estella Newton. All rights reserved.
//

import SwiftUI
import Firebase
struct Login: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var color = Color(K.Color.green)
    var body: some View {
        ZStack {
            Color(K.Color.lightGreen)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(K.Color.green))
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
                    
                    Auth.auth().signIn(withEmail: self.email, password: self.password) {  authResult, error in
                        
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
                            .font(Font.custom("Lato-Thin", size: 20))
                            .foregroundColor(.white)
                        
                    }
                }
                if color == Color(.green) {
                    NavigationLink(destination: ContentView()) {
                        ZStack {
                            Rectangle()
                                .frame(height: 50)
                                .foregroundColor(Color("Green"))
                                .padding(.vertical)
                            Text("Login")
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

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
