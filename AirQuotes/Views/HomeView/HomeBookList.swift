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
        
        if !books.isEmpty {
            TabView {
                
                ForEach(Array(books).chunked(into: 2), id: \.first) { bookPair in
                    HStack {
                        NavigationLink {
                            ListQuotesBook(book: bookPair[0])
                        } label: {
                            BookView(bookPair[0], color: Color(bookPair[0].color ?? "Background"), text: bookPair[0].title ?? "Unknown")
                        }
                        Spacer()
                        if bookPair.indices.contains(1) {
                            NavigationLink {
                                ListQuotesBook(book: bookPair[1])
                            } label: {
                                BookView(bookPair[1], color: Color(bookPair[1].color ?? "Background"), text: bookPair[1].title ?? "Unknown")
                            }
                        }
                        
                    }
                    .frame(height: 240)
                    .offset(y: -20)
                    .padding(.horizontal)
                }
            }
            .frame(height: 310)
            .tabViewStyle(.page)
            
            
        } else {
            Group {
                Text("No books.")
                    .foregroundColor(.secondary)
            }
            .frame(height: 200)
            .padding(.top, -20)
            
        }
        
    }
}

struct HomeBookList_Previews: PreviewProvider {
    static var previews: some View {
        HomeBookList()
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] where Element: Identifiable {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)]) }
    }
}
