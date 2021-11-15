//
//  BookView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 15/11/21.
//

import SwiftUI

struct BookView: View {
    let color: Color
    let text: String
    
    var body: some View {
        Rectangle()
            .fill(color)
            .cornerRadius(10)
            .aspectRatio(0.625, contentMode: .fit)
            .shadow(color: shadowColor, radius: 15, x: 0, y: 0)
            .overlay {
                VStack {
                    Text(text)
                        .font(.system(size: 60, weight: .heavy))
                        .foregroundColor(.secondary)
                        .lineLimit(4)
                        .padding()
                        
                    Spacer()
                }
            }


    }
    
    private let shadowColor = Color(red: 0, green: 0, blue: 0, opacity: 0.3)
    
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
