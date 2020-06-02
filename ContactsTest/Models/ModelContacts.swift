//
//  ModelContacts.swift
//  ContactsTest
//
//  Created by Genuine on 27.05.2020.
//  Copyright © 2020 Genuine. All rights reserved.
//

import Foundation
import SwiftUI

struct Contact : Codable,Identifiable {
    
    struct Name : Codable {
        let title: String
        let first : String
        let last: String
    }
    struct Picture : Codable {
        
        let large : String
        let medium : String
        let thumbnail : String
    
    }
   
    var id = UUID()   //Using JSON with Custom Types
    let email: String
    let picture: Picture
    let name : Name
    //    let status: Bool
    enum CodingKeys: String,CodingKey {
        case name = "name"
        case email = "email"
        case picture = "picture"
    }
}

struct Results : Codable {
    let results : [Contact]
}

