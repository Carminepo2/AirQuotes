//
//  QuotesView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 15/11/21.
//

import SwiftUI

struct QuotesView: View {
    
    // Ho marcato questa proprietà come @StateObject in quanto è un'istanza di QuotesViewModel che è un @ObservableObject. Tali oggetti permettono alla view di renderizzare ogni volta che una determinata proprietà marcata con @Published cambia.
    @StateObject private var quotesViewModel = QuotesViewModel()
    
    var body: some View {
        ZStack {
            Color.themeColor
                .ignoresSafeArea()
            
            GeometryReader { geometry in
                ScrollView {
                    
                    VStack {
                        Section {
                            Picker("How do you want to display the quotes?", selection: $quotesViewModel.actualViewType) {
                                
                                ForEach(QuotesViewModel.ViewType.allCases, id: \.self) { viewType in
                                    Text(viewType.rawValue)
                                        .tag(viewType)
                                }
                            }
                            .pickerStyle(.segmented)
                            .padding(.horizontal)
                        }
                        
                        
                        switch(quotesViewModel.actualViewType) {
                        case .tags:
                            TagsListView()
                            
                        case .bookshelf:
                            BookshelfView()
                        case .favorites:
                            FavoriteListView(geometry: geometry)
                        }
                    }
                }
                
            }
        }
        
        
        
    }
}

struct QuotesView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesView()
    }
}
