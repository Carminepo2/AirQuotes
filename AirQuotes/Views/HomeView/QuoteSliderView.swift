//
//  NoteSliderView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 21/11/21.
//

import SwiftUI

struct QuoteSliderView: View {
    
    
    @FetchRequest(fetchRequest: PersistenceController.shared.getLatestQuotes()) var quotes: FetchedResults<Quote>
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.1)
    }
    
    private let emptyState = "Write your first quote!"
    
    
    var body: some View {
        
        TabView {
            if quotes.count > 0 {
                ForEach(Array(quotes), id: \.self) { quote in
                    NavigationLink {
                        QuoteView(quote: quote)
                    } label: {
                        QuoteSliderItem(text: quote.text ?? "Unknown")
                    }

                }
            } else {
                QuoteSliderItem(text: emptyState)
            }
        }
        .tabViewStyle(.page)
    }
}



struct QuoteSliderView_Previews: PreviewProvider {
    static var previews: some View {
        // 4
        QuoteSliderView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}

struct QuoteSliderItem: View {
    
    let text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 200)
                .foregroundColor(Color.gray)
                .opacity(0.2)
                .padding()
            Text(text)
                .foregroundColor(Color.gray)
                .opacity(0.5)
        }
    }
}
