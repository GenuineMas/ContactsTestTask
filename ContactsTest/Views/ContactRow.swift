////
////  ContactRow.swift
////  ContactsTest
////
////  Created by Genuine on 28.05.2020.
////  Copyright © 2020 Genuine. All rights reserved.
////
//
//
import SwiftUI

struct ContactRow: View {
    var contact: Contact
   var body: some View {
        
        HStack {
            ImageView(withURL: contact.picture.medium)
              
                .scaledToFit()
                .frame(width: 50, height: 50, alignment: .leading)
                
            
            Text(" \(contact.name.first) \(contact.name.last)")
        }
    }
}
