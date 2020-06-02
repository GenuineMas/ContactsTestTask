//
//  ContactDetailView.swift
//  ContactsTest
//
//  Created by Genuine on 27.05.2020.
//  Copyright © 2020 Genuine. All rights reserved.
//

import SwiftUI

struct ContactDetail: View {
    
    var contact: Contact?
    var body: some View {
        VStack {

            CircleImage(contact: contact!)
                .offset(x: 0, y: 130)
                .padding(.bottom, 200)
            
            VStack(alignment: .leading) {
                Text("\(contact?.name.last ?? "Tom Lee")")
                    .font(.title)
                HStack(alignment: .top) {
                    Text("\(contact?.email ?? "Tom Lee")")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

struct CircleImage: View {
    var contact: Contact?
    init(contact:Contact) {
        self.contact = contact
        
    }
    private let urlToImage = "https://stevebloor.files.wordpress.com/2014/05/wpid-wp-1399192634866.jpeg"
    var body: some View {
        ImageView(withURL: contact?.picture.large ?? urlToImage)
            .clipShape(Circle())
            .frame(width: 300, height: 300)
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
        
    }
}

struct ContactDetail_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetail()
    }
}
