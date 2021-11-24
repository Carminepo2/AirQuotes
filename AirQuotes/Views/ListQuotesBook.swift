//
//  ListQuotesBook.swift
//  AirQuotes
//
//  Created by Luca Basile on 19/11/21.
//

import SwiftUI

struct ListQuotesBook: View {
    

    @FetchRequest var quotes : FetchedResults<Quote>

    
    init(book: Book) {        
        let predicate = NSPredicate(format: "ANY book == %@", book)
        self._quotes = FetchRequest(entity: Quote.entity(), sortDescriptors: [], predicate: predicate)
    }
        
    var body: some View {
        
        Group {
            List {
                ForEach(quotes) {
                    quote in
                    NavigationLink(destination: QuoteView(quote: quote)) {
                        QuoteInList(quote: quote)
                    }
                }
                .onDelete(perform: delete)
                
                
            }
            
            .navigationTitle("Harry Potter")
            .toolbar {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "plus.circle")
                }
            }
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

//struct ListQuotesBook_Previews: PreviewProvider {
//    static var previews: some View {
//        ListQuotesBook(quotes: FetchedResults<Quote>())
//    }
//}
