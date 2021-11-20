//
//  CreationBookView.swift
//  AirQuotes
//
//  Created by Martina Esposito on 18/11/21.
//

import SwiftUI

struct BookCreationView: View {
    
    @State var chosenColor: String = "BookGreen"
    @Binding var isCreateBookModalOpen : Bool
    @State private var author = ""
    @State private var title = ""
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
                        }
                    }
                }
                .offset(y: -20)
                
                .toolbar(content: {
                    if title.isEmpty{
                        Text("Add")
                            .foregroundColor(.gray)
                    } else {
                        Button("Add", action: {
                            PersistenceController.shared.createBook(color: chosenColor, title: title, author: author)
                            isCreateBookModalOpen = false
                        })
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
