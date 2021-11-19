//
//  BookshelfView.swift
//  AirQuotes
//
//  Created by Luca Basile on 18/11/21.
//

import SwiftUI

struct BookshelfView: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing:20){
                    HStack{
                        BookView(color: .bookColorOne, text: "Harry Potter and the Test")
                        
                        BookView(color: .bookColorOne, text: "Harry Potter and the Test")
                    }
                    
                    HStack{
                        BookView(color: .bookColorOne, text: "Harry Potter and the Test")
                        
                        BookView(color: .bookColorOne, text: "Harry Potter and the Test")
                    }
                    
                    
                    HStack{
                        BookView(color: .bookColorOne, text: "Harry Potter and the Test")
                        
                        BookView(color: .bookColorOne, text: "Harry Potter and the Test")
                            
                    }
                }
                
            }.padding()
            
            
            
        }
        
    }
}

struct BookshelfView_Previews: PreviewProvider {
    static var previews: some View {
        BookshelfView()
    }
}



