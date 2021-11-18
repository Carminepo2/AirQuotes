//
//  BookModel.swift
//  AirQuotes
//
//  Created by Martina Esposito on 18/11/21.
//

import Foundation
import SwiftUI

struct BookModel/*: Identifiable*/{
   // var id: ObjectIdentifier
    
    var title: String
    var color : Color
    var author: String
    
    static let example = BookModel(title: "Title", color: .gray, author: "Author")
}
