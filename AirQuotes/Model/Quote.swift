//
//  Quote.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 15/11/21.
//

import Foundation

// Identifiable is a protocol that makes each Quote instance "identifiable".
// Meaning that they can be uniquely identified trought the property "id".
struct Quote: Identifiable {
    // "UUID().uuidString" generates a unique random id
    let id = UUID().uuidString
    
    var text: String
    let createdAt: Date
}
