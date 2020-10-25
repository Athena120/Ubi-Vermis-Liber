//
//  ContentView.swift
//  Ubi Vermis Liber
//
//  Created by Estella Newton on 10/3/20.
//  Copyright © 2020 Estella Newton. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.07, green: 0.80, blue: 0.77)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    HStack {
                        NavigationLink(destination: Chat(), label: {
                            Text("Chat >")
                                .foregroundColor(.white)
                                .font(Font.custom(K.Fonts.montserrat, size: 20))
                            .padding()
                        })
                        NavigationLink(destination: Welcome(), label: {
                            Text("Log Out >")
                            .foregroundColor(.white)
                            .font(Font.custom(K.Fonts.montserrat, size: 20))
                            .padding()
                        })
                    }
                    Text("Ubi Vermis Liber")
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .foregroundColor(.white)
                        .padding(.top)
                    Text("Read in the wrong places")
                        .font(Font.custom(K.Fonts.montserrat, size: 20))
                        .fontWeight(.thin)
                        .foregroundColor(.white)
                        .italic()
                    Image("book")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding(.vertical)
                    Divider()
                    
//                    NavigationLink(destination: Detail(), label: {
//                        Text("  +New Book+  ")
//                            .foregroundColor(.white)
//                            .overlay(
//                                Rectangle()
//                                    .stroke(Color.white, lineWidth: 1)
//                                
//                        )
//                    })
                    List {
                        ListView(title: "Lord of the flies")
                        
                        
                    }
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListView: View {
    
    let title: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 50)
                .foregroundColor(.white)
                .padding(.vertical)
            HStack {
                Image("book")
                    .resizable()
                    .frame(width: 25, height: 25)
                Text(title)
                    .foregroundColor(.gray)
                
            }
        }
    }
}
