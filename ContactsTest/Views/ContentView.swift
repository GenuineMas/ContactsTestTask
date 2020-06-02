//
//  ContentView.swift
//  ContactsTest
//
//  Created by Genuine on 27.05.2020.
//  Copyright © 2020 Genuine. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selectorIndex = 0
      @State private var numbers = ["List","Grid"]
    
     @ObservedObject private var networkManager = NetworkManager()
     var body: some View {

          NavigationView {
            VStack{
                Picker("Numbers", selection: self.$selectorIndex) {
                                      ForEach(0 ..< self.numbers.count) { index in
                                                     Text(self.numbers[index]).tag(index)
                                                 }
                                             }
                                             .pickerStyle(SegmentedPickerStyle())

            List (networkManager.contactBook) { contact in
       
                 NavigationLink(destination: ContactDetail(contact: contact)) {
                  
                    ContactRow(contact: contact)
                }
            }.navigationBarTitle(Text("Contacts")).id(UUID())
          
         }
     }
}
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

