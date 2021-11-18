//
//  BookshelfView.swift
//  AirQuotes
//
//  Created by Luca Basile on 18/11/21.
//

import SwiftUI

struct BookshelfView: View {
    var body: some View {
        ZStack {
            Color.themeColor
                .ignoresSafeArea()
            ScrollView {
                VStack{
                HStack{
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("+")
                        .frame(width: 100.0)
                    .overlay(Circle().stroke(.black))
                }
                    
                }
                Divider()
                    .padding(.horizontal)
                HStack{
                    BookView(color: .bookColorOne, text: "Harry Potter and the Test")
                    .frame(width: 200.0, height: 200.0)
                    
                    BookView(color: .bookColorOne, text: "Harry Potter and the Test")
                    .frame(width: 200.0, height: 200.0)
                }
                
                HStack{
                    BookView(color: .bookColorOne, text: "Harry Potter and the Test")
                    .frame(width: 200.0, height: 200.0)
                    
                    BookView(color: .bookColorOne, text: "Harry Potter and the Test")
                    .frame(width: 200.0, height: 200.0)
                } .padding()
                    .offset(y: +10)
                
                HStack{
                    BookView(color: .bookColorOne, text: "Harry Potter and the Test")
                    .frame(width: 200.0, height: 200.0)
                    
                    BookView(color: .bookColorOne, text: "Harry Potter and the Test")
                    .frame(width: 200.0, height: 200.0)
                } .padding()
                    .offset(y: +10)
                }
            }
            
            
        
        }
        
    }
}

struct BookshelfView_Previews: PreviewProvider {
    static var previews: some View {
        BookshelfView()
    }
}



