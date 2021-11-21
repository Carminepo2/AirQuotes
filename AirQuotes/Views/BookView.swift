//
//  BookView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 15/11/21.
//

import SwiftUI
import CoreData

struct BookView: View {
    let book: Book?
    let color: Color
    let text: String
    
    @State private var showActionSheet = false
    @State private var showEditSheet = false
    
    init(_ book: Book? = nil, color: Color, text: String) {
        self.book = book
        self.color = color
        self.text = text
    }
    
    var body: some View {
        if let book = book {
            BookRectangle(color: color, text: text)
                .contextMenu {
                    VStack {
                        Button() {
                            showEditSheet = true
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                        
                        Button(role: .destructive) {
                            PersistenceController.shared.delete(book: book)
                            
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
                .sheet(isPresented: $showEditSheet) {
                    BookCreationView(isCreateBookModalOpen: $showEditSheet, book)
                }
            
        } else {
            BookRectangle(color: color, text: text)
        }
        
        
    }
    
    
}

struct BookRectangle: View {
    
    let color: Color
    let text: String
    
    var body: some View {
        Rectangle()
            .fill(color)
            .cornerRadius(10)
            .shadow(color: shadowColor, radius: 5, x: 0, y: 0)
            .overlay {
                VStack {
                    Text(text)
                        .font(.system(size: 40, weight: .heavy))
                        .foregroundColor(.secondary)
                        .lineLimit(5)
                        .padding()
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }
            }
            .aspectRatio(0.695, contentMode: .fit)
    }
    
    private let shadowColor = Color(red: 0, green: 0, blue: 0, opacity: 0.1)
    
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(color: .bookColorOne, text: "Harry Potter and the Test")
            .padding()
    }
}



// Carmine: Ho provato a mettere un'ombreggiatura interna nel testo del libro per simulare un testo inciso.. Non mi ha convinto.
// https://www.youtube.com/watch?v=ndDmoXbNZvA
private extension Text {
    func innerShadow<V: View>(_ background: V, radius: CGFloat = 5, opacity: Double = 0.7) -> some View {
        self
            .foregroundColor(.clear)
            .overlay(background.mask(self))
            .overlay(
                ZStack {
                    self.foregroundColor(Color(white: 1 - opacity))
                    self.foregroundColor(.white).blur(radius: radius)
                }
                    .mask(self)
                    .blendMode(.multiply)
            )
    }
}
