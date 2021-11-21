//
//  BookshelfView.swift
//  AirQuotes
//
//  Created by Luca Basile on 18/11/21.
//

import SwiftUI
import CoreData

struct BookshelfView: View {
    
    // Prende i libri da CoreData e li mette nella variabile "books"
    // Nel LazyVGrid metti il ForEach dandogli questa variabile "books" che è una lista di risultati
    @FetchRequest(
        entity: Book.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Book.title, ascending: true)
        ]
    ) var books: FetchedResults<Book>
    
    
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
       
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(books) { book in
                    NavigationLink {
                        ListQuotesBook()
                    } label: {
                        BookView(book, color: Color(book.color ?? "Background"), text: book.title ?? "Unknown")
                            .padding()
                    }
                }
                
            }.padding()
            Spacer()
            
        
    }
}

struct BookshelfView_Previews: PreviewProvider {
    static var previews: some View {
        BookshelfView()
    }
}



