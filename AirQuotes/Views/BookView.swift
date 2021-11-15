//
//  BookView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 15/11/21.
//

import SwiftUI

struct BookView: View {
    var body: some View {
        Rectangle()
            .fill(Color.bookColorOne)
            .cornerRadius(10)
            .aspectRatio(0.625, contentMode: .fit)
            .shadow(color: shadowColor, radius: 15, x: 0, y: 0)
            .overlay {
                VStack {
                    Text("Harry Potter And Thedsadsad sadsadsadsad sadsadsadsadsadds sdewjn")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding()
                        .lineLimit(4)
                        
                    Spacer()
                }
            }


    }
    
    private let shadowColor = Color(red: 0, green: 0, blue: 0, opacity: 0.3)
    
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView()
            .padding()
    }
}
