//
//  SearchView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 15/11/21.
//

import SwiftUI

struct SearchView: View {
    var searchText: String
    
    var body: some View {
        Text("Search View: \(searchText)")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchText: "Test")
    }
}
