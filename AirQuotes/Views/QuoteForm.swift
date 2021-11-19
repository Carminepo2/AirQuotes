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
                        ZStack(alignment: .leading){
                            if quote.isEmpty {
                                Text("Quote")
                                    .foregroundColor(.secondary)
                                    .opacity(0.5)

                            }
                            TextEditor(text: $quote)
                        }
                        
                        
                        ZStack(alignment: .leading){
                            if by.isEmpty {
                                Text("By")
                                    .foregroundColor(.secondary)
                                    .opacity(0.5)
                            }
                            TextEditor(text: $by)
                        }
                }

            .navigationTitle("Add a new quote")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button("Save") {
                        showModal.toggle()
//                        add saveQuote function
                    }
                    
                    
                    
                }

        
                ToolbarItemGroup(placement: .keyboard)
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
