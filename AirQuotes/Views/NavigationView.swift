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
                        .navigationTitle("Home")
                }
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                
                NavigationView {
                    QuotesView()
                        .navigationTitle("Quotes")
                }
                .tabItem {
                    Image(systemName: "text.quote")
                    Text("Quotes")
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
