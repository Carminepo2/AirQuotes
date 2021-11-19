//
//  ListQuotesBook.swift
//  AirQuotes
//
//  Created by Luca Basile on 19/11/21.
//

import SwiftUI

struct ListQuotesBook: View {
    
    
    var body: some View {
        
        NavigationView {
            VStack(spacing:30) {
                VStack{
                    Divider()
                    Text("“It is impossible to manufacture or imitate love”")
                    
                    Spacer()
                        Text("Horace Slughorn.")
                        Spacer()
                    } .padding(.horizontal)
                    
                
            }
            .navigationTitle("Harry Potter")
            .toolbar {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "plus.circle")
                }
            }
        }
        
    }
    
    
}

struct ListQuotesBook_Previews: PreviewProvider {
    static var previews: some View {
        ListQuotesBook()
    }
}
