//
//  CreationBookView.swift
//  AirQuotes
//
//  Created by Martina Esposito on 18/11/21.
//

import SwiftUI

struct BookCreationView: View {


    var book: BookModel
    
    @State var changeColor: Color = Color.gray
    @Binding var isCreateBookModalOpen : Bool
    @State private var author = ""
    @State private var title = ""
    
    var body: some View {
        
        NavigationView {
            
            VStack{
            
                
                Text("New Book")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                
                BookView(color: changeColor, text: title)
                    .frame(height: 200)
                
                
                Form{
                        TextField("Title", text: $title)
                            .frame(height: 50)
                            //.font(.title2)
                            //.foregroundColor(.gray)
                            //.opacity(0.7)
                           // .padding(.horizontal)
                        TextField("Author", text: $author)
                            .frame(height: 50)
                            //.font(.title2)
                           // .foregroundColor(.gray)
                           // .opacity(0.7)
                            //.padding(.horizontal)

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
                    ColorButton(color: .red, changeColor: $changeColor)
                    ColorButton(color: .green, changeColor: $changeColor)
                    ColorButton(color: .yellow, changeColor: $changeColor)
                    ColorButton(color: .pink, changeColor: $changeColor)
                    ColorButton(color: .blue, changeColor: $changeColor)
                        
                }
                .padding()
                HStack{
                    ColorButton(color: .orange, changeColor: $changeColor)
                    ColorButton(color: .purple, changeColor: $changeColor)
                    ColorButton(color: .white, changeColor: $changeColor)
                    ColorButton(color: .black, changeColor: $changeColor)
                    ColorButton(color: .gray, changeColor: $changeColor)
                }
                .padding(.bottom)
            }
            .navigationBarItems(trailing: Button("Add", action: { isCreateBookModalOpen = false }))
            .foregroundColor(.none)
        }
    }
}

struct BookCreationView_Previews: PreviewProvider {
    static var previews: some View {
        BookCreationView(book: .example, isCreateBookModalOpen: .constant(true))
    }
}

struct ColorButton: View {
    
    let color: Color
    @Binding var changeColor: Color
    
    var body: some View {
        Button {
            changeColor = color
        } label: {
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(color)
                .padding(.horizontal, 10)
                .overlay(Circle().stroke(Color.black, lineWidth: 0.5))
        }
    }
}
