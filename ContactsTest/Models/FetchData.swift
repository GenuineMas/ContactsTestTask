//
//  FetchData.swift
//  ContactsTest
//
//  Created by Genuine on 27.05.2020.
//  Copyright © 2020 Genuine. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class NetworkManager: ObservableObject {
    
     private let contactResults = "https://randomuser.me/api/?results=500"
    private let urlToImage = "https://stevebloor.files.wordpress.com/2014/05/wpid-wp-1399192634866.jpeg"
    var didChange = PassthroughSubject<NetworkManager,Never>()
  
    init() {
        loadData()
        
    }
    
    @Published var contactBook = [Contact]()
        {
        didSet {
            didChange.send(self)
        }
    }
    

    func loadData() {
        
        guard let url = URL(string: contactResults) else { return }
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            guard let data = data else { return }
            let contactsJSON = try! JSONDecoder().decode(Results.self, from: data)
            
            DispatchQueue.main.async {
                self.contactBook = contactsJSON.results
               // print(self.contactBook)
            }
        }.resume()
        

    }
    

}
