//
//  MessageManager.swift
//  Ubi Vermis Liber
//
//  Created by Estella Newton on 10/18/20.
//  Copyright © 2020 Estella Newton. All rights reserved.
//

import Foundation
import Firebase
class MessageManager: ObservableObject {
    let db = Firestore.firestore()
    
    @Published var messages = [Message]()
    
    func loadMessages() {
        
        
        db.collection(K.FStore.collectionName).addSnapshotListener { (querySnapshot, error) in
            
            self.messages = []
            
            if let e = error {
                print("Error: \(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
                            let newMessage = Message(objectID: "\(String(describing: index))", sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            print(messageSender)
                            print(messageBody)
                            
                        }
                        
                    }
                }
            }
        }
    }
}
