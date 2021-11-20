//
//  QuoteView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 19/11/21.
//

import SwiftUI

struct QuoteView: View {
    
    let quote: String
    let author: String
    var body: some View {
        ScrollView{
            VStack{
                Text("Quote")
                    .font(.system(size: 30))
                    .fontWeight(.semibold)
                ZStack{
                    VStack{
                        HStack{
                            Image("QuoteStart")
                            Spacer()
                        }
                        Text("\(quote)")
                            .font(.largeTitle)
                            .fontWeight(.regular)
                            .frame(width: 220, height: 250)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: 410, maxHeight: 500)
                            .foregroundColor(Color.gray)
                            .opacity(0.7)
                            //.lineLimit(700)
                        HStack{
                            Spacer()
                            Image("QuoteEnd")
                            
                        }
                    }
                }
                
                Text("\(author)")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                Spacer()
                
                HStack{
                    
                    Text("Tags")
                        .font(.title)
                        .padding(.horizontal)
                    Spacer()
                    
                }
                
                HStack{
                    
                    TagView(color: Color.green, title: "Funny")
                        //.padding(.horizontal, 7)
                    
                    Button {
                        
                    } label: {
                        
                        Image(systemName: "plus.circle")
                            .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                        
                    }
                    
                }
            }
        }
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(quote: "It is impossible to manufacture or imitate love", author: "Horace Slughorn")
    }
}
