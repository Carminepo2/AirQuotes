//
//  CreationBookView.swift
//  AirQuotes
//
//  Created by Martina Esposito on 18/11/21.
//

import SwiftUI

struct BookCreationView: View {

//    @State var color: Color
    var book: BookModel
    @Binding var CreateBook : Bool 
    
    var body: some View {
        NavigationView{
            VStack{
                
                Text("New Book")
                    .font(.title2)
                    .fontWeight(.semibold)
                    Spacer()
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 200, height: 300, alignment: .center)
                    .foregroundColor(Color.gray)
                    .opacity(0.4)
                // .position(x: 166, y:-13)
                    .padding(.horizontal)
                    .shadow(color: .black, radius: 2, x: 3.0, y: 3.0)
                    .padding(.bottom, 40)
                    //Spacer()
                
                HStack{
                    Text("\(book.title)")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .opacity(0.7)
                        .padding(.horizontal)
                    Spacer()
                }
                
                DividerMartina()
                    .padding(.vertical)
                HStack{
                    Text("\(book.author)")
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
                    Circle()
                        .frame(width: 50, height: 50, alignment: .center)
                        .opacity(0.4)
                        .foregroundColor(.red)
                        .padding(.horizontal, 10)
                        .overlay(Circle().stroke(Color.black, lineWidth: 0.5))
                    Circle()
                        .frame(width: 50, height: 50, alignment: .center)
                        .opacity(0.4)
                        .foregroundColor(.green)
                        .padding(.horizontal, 10)
                        .overlay(Circle().stroke(Color.black, lineWidth: 0.5))
                    Circle()
                        .frame(width: 50, height: 50, alignment: .center)
                        .opacity(0.4)
                        .foregroundColor(.yellow)
                        .padding(.horizontal, 10)
                        .overlay(Circle().stroke(Color.black, lineWidth: 0.5))
                    Circle()
                        .frame(width: 50, height: 50, alignment: .center)
                        .opacity(0.4)
                        .foregroundColor(.pink)
                        .padding(.horizontal, 10)
                        .overlay(Circle().stroke(Color.black, lineWidth: 0.5))
                    Circle()
                        .frame(width: 50, height: 50, alignment: .center)
                        .opacity(0.4)
                        .foregroundColor(.blue)
                        .padding(.horizontal, 10)
                        .overlay(Circle().stroke(Color.black, lineWidth: 0.5))
                        
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
                
            }
            .navigationBarItems(trailing: Button("Add", action: {CreateBook.toggle()}))
            .foregroundColor(.none)
        }
    }
}

struct BookCreationView_Previews: PreviewProvider {
    static var previews: some View {
        BookCreationView(book: .example, CreateBook: .constant(true))
    }
}
