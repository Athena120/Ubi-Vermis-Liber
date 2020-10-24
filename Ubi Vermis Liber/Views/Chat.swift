//
//  Chat.swift
//  Ubi Vermis Liber
//
//  Created by Estella Newton on 10/5/20.
//  Copyright © 2020 Estella Newton. All rights reserved.
//

import SwiftUI
import Firebase


struct Chat: View {
    
    let db = Firestore.firestore()
    
    @ObservedObject var messageManager = MessageManager()
    @State var text: String = ""
    
    var body: some View {
        ZStack {
            Color(K.Color.red)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Chat")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                HStack {
                    NavigationLink(destination: ContentView(), label: {
                        Text("< Home                                           ")
                            .foregroundColor(.white)
                            .font(Font.custom(K.Fonts.montserrat, size: 15))
                            .padding(.horizontal)
                    })
                    NavigationLink(destination: ContentView(), label: {
                        Text("Log Out >")
                            .foregroundColor(.white)
                            .font(Font.custom(K.Fonts.montserrat, size: 15))
                            .padding(.horizontal)
                    })
                }
                List(messageManager.messages) { message in
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(Color(K.Color.teel))
                        Text(message.body)
                            .foregroundColor(Color(K.Color.darkBlue))
//                        Text(String(self.messageManager.messages.count))
                    }
                    
                }
                ZStack {
                    Rectangle()
                        .frame(height: 60)
                        .foregroundColor(Color(K.Color.pink))
                    HStack {
                        TextField("Send a message", text: $text)
                            .padding()
                            .foregroundColor(.white)
                        Button(action: {
                            if self.text != "" {
                                let messageBody = self.text
                                if let messageSender = Auth.auth().currentUser?.email {
                                    self.db.collection(K.FStore.collectionName).addDocument(data: [
                                        K.FStore.senderField: messageSender,
                                        K.FStore.bodyField: messageBody,
                                        K.FStore.dateField: Date().timeIntervalSince1970
                                    ]) { (error) in
                                        if let e = error {
                                            print("Error: \(e)")
                                        } else {                                         print("Data saved!")
                                            print(messageBody)
                                            
                                        }
                                    }
                                }
                            }
                        }) {
                            ZStack {
                                Ellipse()
                                    .frame(width: 55, height: 50)
                                    .foregroundColor(.white)
                                    .padding()
                                Text("Send")                               .padding()
                                    .foregroundColor(Color(K.Color.red))
                            }
                        }
                    }
                }
            }      }.onAppear() {
                
                self.messageManager.loadMessages()
        }
        
    }
}


struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        Chat()
    }
}

struct MessageView: View {
    let color: String
    let label: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color(color))
            Text(label)
                .foregroundColor(Color(K.Color.darkBlue))
        }
    }
}

