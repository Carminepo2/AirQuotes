//
//  QuoteForm.swift
//  AirQuotes
//
//  Created by Valerio Domenico Conte on 18/11/21.
//

import SwiftUI



struct QuoteForm: View {
    @State private var quote = ""
    @State private var by = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Quote", text: $quote)
                    .frame(height: 150)
                TextField("By", text: $by)
                    .frame(height: 50)
            }
            .navigationTitle("Add a new quote")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Text("Save")        //Button
                    
                    
                }
            }
        }
    }
}

struct QuoteForm_Previews: PreviewProvider {
    static var previews: some View {
        QuoteForm()
    }
}
