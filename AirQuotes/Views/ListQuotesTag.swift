//
//  ListQuotesTag.swift
//  AirQuotes
//
//  Created by Valerio Domenico Conte on 24/11/21.
//

import SwiftUI

struct ListQuotesTag: View {
    

    let tag: Tag
    @State private var quotes: [Quote] = []
    @State private var tagName: String
    @State private var showModal = false
    
    init(tag: Tag) {
        self.tag = tag
        _tagName = State(wrappedValue: tag.name ?? "")
        if let quotes = PersistenceController.shared.getTagsQuotes(tag) {
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
            
            .navigationTitle(tagName)
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
