//
//  ListQuotesTag.swift
//  AirQuotes
//
//  Created by Valerio Domenico Conte on 24/11/21.
//

import SwiftUI

struct ListQuotesTag: View {
    

    let tag: Tag
    @FetchRequest(entity: Quote.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Quote.createdAt, ascending: true)
    ]) var quotes : FetchedResults<Quote>

    
    var body: some View {
        
        Group {
            List {
                ForEach(quotes.filter { $0.tags?.contains(self.tag) ?? false }) {
                    quote in
                    NavigationLink(destination: QuoteView(quote: quote)) {
                        QuoteInList(quote: quote)
                    }
                }
                
                
            }
            
            .navigationTitle(tag.name ?? "Unknown")
//            .toolbar {
//                Button {
//                    showModal.toggle()
//                } label: {
//                    Image(systemName: "plus.circle")
//                }
//                .sheet(isPresented: $showModal, content: {
//                    QuoteForm(showModal: $showModal)
//                })
//            }
        }
        
    }
    
    
}
