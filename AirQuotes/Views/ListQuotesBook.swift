//
//  ListQuotesBook.swift
//  AirQuotes
//
//  Created by Luca Basile on 19/11/21.
//

import SwiftUI

struct ListQuotesBook: View {
    
    
    @FetchRequest(entity: Quote.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Quote.createdAt, ascending: true)
    ]) var quotes : FetchedResults<Quote>
    let book: Book

    @State private var showCreateQuoteModal = false
    
    
    var body: some View {
        
        List {
            ForEach(quotes.filter { $0.book?.objectID == self.book.objectID }) {
                quote in
                NavigationLink(destination: QuoteView(quote: quote)) {
                    QuoteInList(quote: quote)
                }
            }
            .onDelete(perform: delete)
            
        }
        .navigationTitle(book.title ?? "")
        .toolbar {
            Button(action: { showCreateQuoteModal.toggle() }) {
                Image(systemName: "plus.circle")
            }
        }
        .sheet(isPresented: $showCreateQuoteModal, content: {
            QuoteForm(showModal: $showCreateQuoteModal, book: book)
        })
        
        
        
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
