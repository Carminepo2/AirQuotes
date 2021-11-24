//
//  NavigationView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 15/11/21.
//

import SwiftUI

struct NavgationView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        
            TabView {
                NavigationView {
                    HomeView()
                        .navigationTitle("Latest")
                }
                .tabItem {
                    Image(systemName: "text.quote")
                    Text("Latest")
                }
                
                NavigationView {
                    QuotesView()
                        .navigationTitle("Collection")
                }
                .tabItem {
                    Image(systemName: "books.vertical.fill")
                    Text("Collection")
                }
                
            }
            .searchable(text: $searchText)
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavgationView()
    }
}
