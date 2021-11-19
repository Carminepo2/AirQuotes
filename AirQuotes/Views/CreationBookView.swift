//
//  CreationBookView.swift
//  AirQuotes
//
//  Created by Martina Esposito on 18/11/21.
//

import SwiftUI

struct BookCreationView: View {
    
    
    var book: BookModel
    
    @State var chosenColor: String = "BookGreen"
    @Binding var isCreateBookModalOpen : Bool
    @State private var author = ""
    @State private var title = ""
    @Environment(\.managedObjectContext) var managedObjectContext
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                BookView(color: Color(chosenColor), text: title)
                    .frame(height: 200)
                
                Form {
                    TextField("Title", text: $title)
                        .frame(height: 50)
                    TextField("Author", text: $author)
                        .frame(height: 50)
                }
                .padding(.vertical)
                
                HStack{
                    Text("Choose a Color")
                        .font(.title2)
                        .foregroundColor(.black)
                        .opacity(0.8)
                        .padding(.horizontal)
                    Spacer()
                }
                
                HStack{
                    ColorButton(color: "BookRed", chosenColor: $chosenColor)
                    ColorButton(color: "BookGreen", chosenColor: $chosenColor)
                    ColorButton(color: "BookPink", chosenColor: $chosenColor)
                    ColorButton(color: "BookLightBlue", chosenColor: $chosenColor)
                }
                .padding()
            }
            .toolbar(content: {
                Button("Add", action: {
                    PersistenceController.shared.createBook(color: chosenColor, title: title, author: author)
                    isCreateBookModalOpen = false
                })
            })
        }
    }
}

struct BookCreationView_Previews: PreviewProvider {
    static var previews: some View {
        BookCreationView(book: .example, isCreateBookModalOpen: .constant(true))
    }
}

struct ColorButton: View {
    
    let color: String
    @Binding var chosenColor: String
    
    var body: some View {
        Button {
            chosenColor = color
        } label: {
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(Color(color))
                .padding(.horizontal, 10)
                .overlay(Circle().stroke(Color.black, lineWidth: 0.5))
        }
    }
}
