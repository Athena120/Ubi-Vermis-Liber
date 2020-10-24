//
//  Welcome.swift
//  Ubi Vermis Liber
//
//  Created by Estella Newton on 10/3/20.
//  Copyright © 2020 Estella Newton. All rights reserved.
//

import SwiftUI

struct Welcome: View {
    var body: some View {
        NavigationView{
            VStack {
                ZStack {
                    Color(K.Color.lightBlue)
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        Text("Welcome")
                            .font(Font.custom(K.Fonts.montserrat, size: 50))
                            .fontWeight(.black)
                            .foregroundColor(.white)
                        Divider()
                        NavigationLink(destination: Register(), label: {
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 25)
                                    .frame(height: 50)
                                    .foregroundColor(Color(K.Color.teel))
                                    .padding()
                                
                                Text("Register")
                                    .foregroundColor(.white)
                                
                            }
                        })
                        NavigationLink(destination: Login()) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 25)
                                    .frame(height: 50)
                                    .foregroundColor(Color(K.Color.teel))
                                    .padding()
                                
                                Text("Login")
                                    .foregroundColor(.white)
                            }
                            
                        }
                    }
                    
                }
                
            }
        }
        .navigationBarTitle("Welcome")
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
