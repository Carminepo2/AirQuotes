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
    @State private var bookTitle: String
    @State private var showModal = false
    
    init(book: Book) {
        self.book = book
        _bookTitle = State(wrappedValue: book.title ?? "")
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
            
            .navigationTitle(bookTitle)
            .toolbar {
                Button {
                    showModal.toggle()
                } label: {
                    Image(systemName: "plus.circle")
                }
                .sheet(isPresented: $showModal, content: {
                    QuoteForm(showModal: $showModal)
                })
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
