//
//  BookshelfView.swift
//  AirQuotes
//
//  Created by Luca Basile on 18/11/21.
//

import SwiftUI

struct BookshelfView: View {
    
    // Prende i libri da CoreData e li mette nella variabile "books"
    // Nel LazyVGrid metti il ForEach dandogli questa variabile "books" che è una lista di risultati
    @FetchRequest(
        entity: Book.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Book.title, ascending: false)
        ]
    ) var books: FetchedResults<Book>
    
    var body: some View {
        Group {
            VStack(spacing:20){
                HStack{
                    BookView(color: .bookColorOne, text: "Harry Potter and the Test")
                    
                    BookView(color: .bookColorOne, text: "Harry Potter and the Test")
                }
                
                HStack{
                    BookView(color: .bookColorOne, text: "Harry Potter and the Test")
                    
                    BookView(color: .bookColorOne, text: "Harry Potter and the Test")
                }
                
                
                HStack{
                    BookView(color: .bookColorOne, text: "Harry Potter and the Test")
                    
                    BookView(color: .bookColorOne, text: "Harry Potter and the Test")
                    
                }
            }
            
            
        }.padding()
        
    }
}

struct BookshelfView_Previews: PreviewProvider {
    static var previews: some View {
        BookshelfView()
    }
}



