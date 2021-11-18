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
    @Binding var showModal: Bool
    
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
                    Button("Save") {
                        showModal.toggle()
//                        add saveQuote function
                    }
                }
                ToolbarItemGroup(placement: .navigationBarLeading)
                {
                    ScanButton(text: $quote)
                       .frame(width: 100, height: 56, alignment: .leading)
                }
                
            }
        }
    }
}

struct QuoteForm_Previews: PreviewProvider {
    static var previews: some View {
        QuoteForm(showModal: .constant(true))
    }
}
