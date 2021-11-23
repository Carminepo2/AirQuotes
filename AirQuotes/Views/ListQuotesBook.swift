//
//  ListQuotesBook.swift
//  AirQuotes
//
//  Created by Luca Basile on 19/11/21.
//

import SwiftUI

struct ListQuotesBook: View {
    

    let book: Book
    @State private var quotes: [Quote] = []
    
    init(book: Book) {
        self.book = book
        if let quotes = PersistenceController.shared.getBooksQuotes(book) {
            _quotes = State(wrappedValue: quotes)
        }
    }
    
    var body: some View {
        
        Group {
            List {
                ForEach(quotes) {
                    quote in
                    NavigationLink(destination: QuoteView(quote: quote.text ?? "Unknown", author: quote.author ?? "Unknown")) {
                        QuoteInList(quote: quote)
                    }
                }
                
                
            }
            
            .navigationTitle("Harry Potter")
            .toolbar {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "plus.circle")
                }
            }
        }
        
    }
    
    
}

//struct ListQuotesBook_Previews: PreviewProvider {
//    static var previews: some View {
//        ListQuotesBook(quotes: FetchedResults<Quote>())
//    }
//}
