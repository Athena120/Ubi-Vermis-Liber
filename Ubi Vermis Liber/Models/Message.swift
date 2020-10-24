//
//  Message.swift
//  Ubi Vermis Liber
//
//  Created by Estella Newton on 10/5/20.
//  Copyright © 2020 Estella Newton. All rights reserved.
//

import Foundation

struct Message: Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let sender: String
    let body: String
}
