//
//  QuotesViewModel.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 15/11/21.
//

import Foundation


final class QuotesViewModel: ObservableObject {
    
    @Published var actualViewType = ViewType.bookshelf
    
    
    enum ViewType: String, CaseIterable {
        case bookshelf = "Bookshelf"
        case tags = "Tags"
        case favorites = "Favorites"
    }
    
}

