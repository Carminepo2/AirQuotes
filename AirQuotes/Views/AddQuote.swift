//
//  AddQuote.swift
//  AirQuotes
//
//  Created by Valerio Domenico Conte on 18/11/21.
//

import SwiftUI

struct AddQuote: View {
    @State private var showModal = false
    
    var body: some View {
        NavigationView{
            Button("Add Quote") {
                showModal.toggle()
            }
            .sheet(isPresented: $showModal, content: {
                QuoteForm()
            })
        }
        
    }
}

struct AddQuote_Previews: PreviewProvider {
    static var previews: some View {
        AddQuote()
    }
}
