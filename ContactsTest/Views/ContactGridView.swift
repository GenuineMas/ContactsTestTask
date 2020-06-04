//
//  GridUIView.swift
//  ContactsTest
//
//  Created by Genuine on 03.06.2020.
//  Copyright © 2020 Genuine. All rights reserved.
//

import SwiftUI



struct ContactGridView: View {
  //  var networkManager : NetworkManager
      @ObservedObject private var networkManager = NetworkManager()
  //  let rows = Row.all()
    
    init(networkManager:NetworkManager) {
        self.networkManager = networkManager
    }
    
    var body: some View {
           
        let chunkedDishes = networkManager.contactBook.chunked(into: 6)
         //  print(chunkedDishes)
           return NavigationView {
            List {
               
               ForEach(0..<chunkedDishes.count) { index in
                   HStack {
                   ForEach(chunkedDishes[index]) { contact in 
                          ContactCell(contact: contact)
                   }
               }
                   
               }
               
           }.edgesIgnoringSafeArea([.leading, .trailing])
           .padding(EdgeInsets(top: 0, leading: -10, bottom: 0, trailing: -10))
           
           }.navigationBarTitle(Text("Contacts"))
            .onAppear(perform: networkManager.loadData)
    
}
}



extension Array {
    func chunked(into size:Int) -> [[Element]] {
        
        var chunkedArray = [[Element]]()
        
        for index in 0...self.count {
            if index % size == 0 && index != 0 {
                chunkedArray.append(Array(self[(index - size)..<index]))
            } else if(index == self.count) {
                chunkedArray.append(Array(self[index - 1..<index]))
            }
        }
        
        return chunkedArray
    }
}



//struct ContactGridView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContactGridView(networkManager: n)
//    }
//}
