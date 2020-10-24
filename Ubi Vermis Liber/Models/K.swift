//
//  K.swift
//  Ubi Vermis Liber
//
//  Created by Estella Newton on 10/10/20.
//  Copyright © 2020 Estella Newton. All rights reserved.
//

import Foundation

struct K {
    struct Color {
        static let teel = "Teel"
        static let blue = "Blue"
        static let lightGreen = "LightGreen"
        static let green = "Green"
        static let lightBlue = "LightBlue"
        static let red = "Red"
        static let pink = "Pink"
        static let darkBlue = "DarkBlue"
        
    }
    struct Emails {
        static let freja = "frejaharrison@gmail.com"
        static let estella = "estellanewton@gmail.com"
        static let anna = "annasandquist@gmail.com"
        static let sophia = "sophiaburner@gmail.com"
        static let saoirse = "saorisemurray@gmail.com"
        static let hallie = "hallie@gmail.com"
    }
    struct Fonts {
        static let montserrat = "Montserrat"
        static let lato = "Lato-Thin"
        static let patrickHand = "PatrickHand-Regular"
    }
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}

struct Users {
    static let users = [
        K.Emails.estella: K.Color.teel,
        K.Emails.freja: K.Color.red,
        K.Emails.anna: K.Color.lightBlue,
        K.Emails.hallie: K.Color.lightGreen,
        K.Emails.sophia: K.Color.blue
    ]
}
