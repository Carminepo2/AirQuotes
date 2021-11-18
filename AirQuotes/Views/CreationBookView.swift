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
        
        NavigationView{
            VStack{

                Text("New Book")
                    .font(.title2)
                    .fontWeight(.semibold)
                    Spacer()
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 200, height: 300, alignment: .center)
                    .foregroundColor(changeColor)
                    .padding(.horizontal)
                    .shadow(color: .black, radius: 2, x: 3.0, y: 3.0)
                    .padding(.bottom, 40)
                    //Spacer()
                
                HStack{
                    TextField("Title", text: $title)
                        .font(.title2)
                        .foregroundColor(.gray)
                        .opacity(0.7)
                        .padding(.horizontal)
                    Spacer()
                }
                
                DividerMartina()
                    .padding(.vertical)
                HStack{
                    TextField("Author", text: $author)
                        .font(.title2)
                        .foregroundColor(.gray)
                        .opacity(0.7)
                        .padding(.horizontal)
                    Spacer()
                }
                
                DividerMartina()
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
                    Circle()
                        .frame(width: 50, height: 50, alignment: .center)
                        .opacity(0.4)
                        .foregroundColor(.orange)
                        .padding(.horizontal, 10)
                        .overlay(Circle().stroke(Color.black, lineWidth: 0.5))
                    Circle()
                        .frame(width: 50, height: 50, alignment: .center)
                        .opacity(0.4)
                        .foregroundColor(.purple)
                        .padding(.horizontal, 10)
                        .overlay(Circle().stroke(Color.black, lineWidth: 0.5))
                    Circle()
                        .frame(width: 50, height: 50, alignment: .center)
                        .opacity(0.4)
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .overlay(Circle().stroke(Color.black, lineWidth: 0.5))
                    Circle()
                        .frame(width: 50, height: 50, alignment: .center)
                        .opacity(0.4)
                        .foregroundColor(.black)
                        .padding(.horizontal, 10)
                        .overlay(Circle().stroke(Color.black, lineWidth: 0.5))
                    Circle()
                        .frame(width: 50, height: 50, alignment: .center)
                        .opacity(0.4)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 10)
                        .overlay(Circle().stroke(Color.black, lineWidth: 0.5))
                        
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
