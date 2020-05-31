//
//  ContentView.swift
//  ContactsTest
//
//  Created by Genuine on 27.05.2020.
//  Copyright © 2020 Genuine. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var contact: Contact?
     @ObservedObject private var networkManager = NetworkManager()
    
     var body: some View {
          NavigationView {
            
            List (networkManager.contactBook) { contact in
                
          
             ContactRow(contact: contact)
            }.navigationBarTitle(Text("Contacts"))
         }
     }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView() 
    }
}
