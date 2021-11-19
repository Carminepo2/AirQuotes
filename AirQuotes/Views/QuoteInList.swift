//
//  QuoteInList.swift
//  AirQuotes
//
//  Created by Luca Basile on 19/11/21.
//

import SwiftUI

struct QuoteInList: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("“It is impossible to manufacture or imitate love”")
                .lineLimit(2)
            HStack {
                Text("Horace Slughorn")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                Spacer()
                Text("One hour ago")
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
        QuoteInList()
    }
}
