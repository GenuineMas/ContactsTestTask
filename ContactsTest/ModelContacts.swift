//
//  ModelContacts.swift
//  ContactsTest
//
//  Created by Genuine on 27.05.2020.
//  Copyright © 2020 Genuine. All rights reserved.
//

import Foundation

struct Contact : Codable,Identifiable {
     
    var id = UUID()
    
 //  let name: String
   let email: String
//    let picture: String
//    let status: Bool
    
    enum CodingKeys: String,CodingKey {
             
      //  case name = "name"
           case email = "email"
//              case picture = "picture"
        
        
           }
    
}
struct Results : Codable {
    let results : [Contact]
}

