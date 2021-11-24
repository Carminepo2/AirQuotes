//
//  QuoteInList.swift
//  AirQuotes
//
//  Created by Luca Basile on 19/11/21.
//

import SwiftUI

struct QuoteInList: View {
    
    let quote: Quote
    
    private let quoteText: String
    private let quoteAuthor: String
    private let time: String
    
    init(quote: Quote) {
        self.quote = quote
        quoteText = "“\(quote.text ?? "Unknown")”"
        quoteAuthor = "- \(quote.author ?? "Unknown")"
        time = ""
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(quoteText)
                .lineLimit(2)
            HStack {
                Text(quoteAuthor)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                Spacer()
                Text(time)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            } .offset(y: 15)
            Spacer()
        } .padding(.vertical)
            .font(.system(.title2, design: .serif)) //Font new york
        
    }
}

struct QuoteInList_Previews: PreviewProvider {
    static var previews: some View {
        QuoteInList(quote: Quote())
    }
}
