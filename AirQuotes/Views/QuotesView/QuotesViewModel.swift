//
//  QuotesViewModel.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 15/11/21.
//

import Foundation

// Un oggetto ObservableObject può "pubblicare" un cambiamento di una sua proprietà, rendendo l'interfaccia reattiva a tale cambiamento.
// Nel senso che quando una sua proprietà marcata con @Published cambia, allora la View nella quale questo oggetto è instanziato con la keyword @StateObject rirenderizza, mostrando all'utente l'interfaccia aggiornata.
final class QuotesViewModel: ObservableObject {
    
    @Published var actualViewType = ViewType.bookshelf
    
    
    // Tipi di view alla quale è possibile accedere tramite segmented control
    enum ViewType: String, CaseIterable {
        case bookshelf = "Bookshelf"
        case tags = "Tags"
        case favorites = "Favorites"
    }
    
}

