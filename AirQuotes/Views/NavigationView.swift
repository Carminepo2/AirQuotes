//
//  NavigationView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 15/11/21.
//

import SwiftUI

struct ContentView: View {
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
