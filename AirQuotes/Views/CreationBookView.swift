//
//  CreationBookView.swift
//  AirQuotes
//
//  Created by Martina Esposito on 18/11/21.
//

import SwiftUI
import CoreData

struct BookCreationView: View {
    
    @State var chosenColor: String = "BookGreen"
    @Binding var isCreateBookModalOpen: Bool
    @State private var author = ""
    @State private var title = ""
    @State private var bookToUpdate: Book? = nil

    init (isCreateBookModalOpen: Binding<Bool>, _ bookToUpdate: Book? = nil) {
        _isCreateBookModalOpen = isCreateBookModalOpen
        
        if let bookToUpdate = bookToUpdate {
                self._bookToUpdate = State(wrappedValue: bookToUpdate)
                self._title = State(wrappedValue: bookToUpdate.title ?? "")
                self._author = State(wrappedValue: bookToUpdate.author ?? "")
                self._chosenColor = State(wrappedValue: bookToUpdate.color ?? "BookGreen")
            }
        
    }
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.themeColor
                    .ignoresSafeArea()
                VStack {
                    BookView(color: Color(chosenColor), text: title)
                        .frame(height: 220)
                    
                    Form {
                        Section(header: Text("New Book")) {
                            TextField("Title", text: $title)
                                .frame(height: 50)
                            TextField("Author", text: $author)
                                .frame(height: 50)
                        }
                        
                        
                        Section(header: Text("Pick a color")) {
                            
                            HStack{
                                ColorButtonPicker(colorName: "BookRed", chosenColor: $chosenColor)
                                ColorButtonPicker(colorName: "BookGreen", chosenColor: $chosenColor)
                                ColorButtonPicker(colorName: "BookPink", chosenColor: $chosenColor)
                                ColorButtonPicker(colorName: "BookLightBlue", chosenColor: $chosenColor)
                            }
                            .padding(.horizontal)
                            .padding(.horizontal)

                        }
                    }
                }
                .offset(y: -20)
                
                .toolbar(content: {
                    if title.isEmpty{
                        Text("Add")
                            .foregroundColor(.gray)
                    } else {
                        if let bookToUpdate = bookToUpdate {
                            Button("Update", action: {
                                PersistenceController.shared.updateBook(bookToUpdate, chosenColor, title, author)
                                isCreateBookModalOpen = false
                            })
                        } else {
                            Button("Add", action: {
                                PersistenceController.shared.createBook(chosenColor, title, author)
                                isCreateBookModalOpen = false
                            })
                        }
                        
                    }
                })
                
            }
        }
    }
}



struct BookCreationView_Previews: PreviewProvider {
    static var previews: some View {
        BookCreationView(isCreateBookModalOpen: .constant(true))
    }
}

struct ColorButtonPicker: View {
    
    let colorName: String
    @Binding var chosenColor: String
    
    private let buttonSize: CGFloat = 40
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color(colorName))
                .frame(width: buttonSize, height: buttonSize)
                .onTapGesture(perform: {
                    withAnimation {
                        chosenColor = colorName
                    }
                    
                })
                .padding(10)
            
            if chosenColor == colorName {
                Circle()
                    .stroke(Color(colorName), lineWidth: 5)
                    .frame(width: buttonSize + 10, height: buttonSize + 10)
            }
        }
    }
}
