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

    var body: some View {
        
        VStack(alignment: .leading) {
            Text(contact.email)
        }
    }
}


