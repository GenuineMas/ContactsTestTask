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
    var didChange = PassthroughSubject<NetworkManager,Never>()
    
    @Published var contactBook = [Contact]() {
        didSet {
            didChange.send(self)
        }
    }
    
    private let contactResults = "https://randomuser.me/api/?results=500"
    
    func loadData() {
        
        guard let url = URL(string: contactResults) else { return }
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            guard let data = data else { return }
            let contactsJSON = try! JSONDecoder().decode(Results.self, from: data)
            
            DispatchQueue.main.async {
                self.contactBook = contactsJSON.results
                print(self.contactBook)
            }
        }.resume()
    }
}
