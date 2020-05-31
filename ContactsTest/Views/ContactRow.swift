//
//  ContactRow.swift
//  ContactsTest
//
//  Created by Genuine on 28.05.2020.
//  Copyright © 2020 Genuine. All rights reserved.
//


import SwiftUI

struct ContactRow: View {
    var contact: Contact
  // @ObservedObject private var networkManager = NetworkManager()
  // static var defaultImage = UIImage(named: "Icon.png")

    var body: some View {
        
        HStack {
            
            ImageViewWidget(imageUrl: contact.picture.large)
              
                .scaledToFit()
                .frame(width: 50, height: 50, alignment: .leading)
                
            
            Text("\(contact.name.title) \(contact.name.first) \(contact.name.last)")
        }
    }
    
}

//struct URLImage:View {
//     @ObservedObject private var imageLoad = ImageLoad(contactPictureURL: String())
//    
//}






