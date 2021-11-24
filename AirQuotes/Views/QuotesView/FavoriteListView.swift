//
//  FavoriteListView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 24/11/21.
//

import SwiftUI

struct FavoriteListView: View {
    
    @FetchRequest(entity: Quote.entity(), sortDescriptors: []) var quotes : FetchedResults<Quote>
    
    var body: some View {
        List {
            ForEach(quotes.filter { $0.isFavorite }) {
                quote in
                NavigationLink(destination: QuoteView(quote: quote)) {
                    QuoteInList(quote: quote)
                }
            }
            .onDelete(perform: delete)
        }
        
    }
    
    func delete(at offsets: IndexSet) {
        for i in offsets {
            DispatchQueue.main.async {
                PersistenceController.shared.delete(quote: quotes[i])
            }
        }
    }
}

//struct FavoriteListView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteListView()
//    }
//}
