//
//  ListQuotesBook.swift
//  AirQuotes
//
//  Created by Luca Basile on 19/11/21.
//

import SwiftUI

struct ListQuotesBook: View {
    
    
    @FetchRequest var quotes : FetchedResults<Quote>
    let book: Book

    @State private var bookTitle: String
    @State private var showModal = false
    
    init(book: Book) {
        self.book = book
        self._quotes = FetchRequest(entity: Quote.entity(), sortDescriptors: [
            NSSortDescriptor(keyPath: \Quote.createdAt, ascending: true)
        ])
        _bookTitle = State(wrappedValue: book.title ?? "")
    }
    
    var body: some View {
        
        List {
            ForEach(quotes.filter { $0.book?.objectID == self.book.objectID}) {
                quote in
                NavigationLink(destination: QuoteView(quote: quote)) {
                    QuoteInList(quote: quote)
                }
            }
            .onDelete(perform: delete)
            
            
        }
        
        .navigationTitle(bookTitle)
        .toolbar {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image(systemName: "plus.circle")
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

/*
struct ListQuotesBook_Previews: PreviewProvider {
    static var previews: some View {
        ListQuotesBook(quotes: FetchedResults<Quote>())
    }
}
*/
