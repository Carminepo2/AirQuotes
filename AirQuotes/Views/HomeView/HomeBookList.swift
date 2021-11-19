//
//  HomeBookList.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 19/11/21.
//

import SwiftUI

struct HomeBookList: View {
    
    @FetchRequest(
        entity: Book.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Book.title, ascending: false)
        ]
    ) var books: FetchedResults<Book>
    
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 25) {
                ForEach(books) { book in
                    BookView(book.objectID, color: Color(book.color ?? "Background"), text: book.title ?? "Unknown")
                }
            }.padding(35)
        }
        .padding(-35)
        .padding()
        .frame(height: 240, alignment: .trailing)
    }
}

struct HomeBookList_Previews: PreviewProvider {
    static var previews: some View {
        HomeBookList()
    }
}
