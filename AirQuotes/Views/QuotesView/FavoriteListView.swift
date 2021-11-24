//
//  FavoriteListView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 24/11/21.
//

import SwiftUI

struct FavoriteListView: View {
    
    @FetchRequest(entity: Quote.entity(), sortDescriptors: []) var quotes : FetchedResults<Quote>
    let geometry: GeometryProxy
    
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
        .frame(width: geometry.size.width - 5, height: geometry.size.height - 50, alignment: .center)
        .onAppear {
            UITableView.appearance().isScrollEnabled = false
        }
        .onDisappear {
            UITableView.appearance().isScrollEnabled = true

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
