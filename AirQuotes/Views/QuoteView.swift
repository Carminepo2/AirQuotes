//
//  QuoteView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 19/11/21.
//

import SwiftUI

struct QuoteView: View {
    
    @ObservedObject var quote: Quote
    
    @State var showActionSheet: Bool = false
    @State var showModal : Bool = false

    
    var body: some View {
        ScrollView{
            VStack{
                ZStack{
                    VStack{
                        HStack{
                            Image("QuoteStart")
                            Spacer()
                        }
                        
                        Text("\(quote.text ?? "Unknown")")
                            .font(.largeTitle)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.gray)
                            .opacity(0.7)
                            .lineLimit(100)
                            .padding(.horizontal)
                        
                        HStack{
                            Spacer()
                            Image("QuoteEnd")
                            
                        }
                    }
                }
                
                Text("\(quote.author ?? "Unknown")")
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
                            .scaleEffect(2)
                    }
                }
                
                Spacer()
            }
        }
        .toolbar{

            ToolbarItemGroup(placement: .navigationBarTrailing) {
                
                Button{
                    
                }label:{
                    
                    if quote.isFavorite {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                            .padding()
                            .scaleEffect(1.2)
                            .onTapGesture {
                                PersistenceController.shared.unfavoriteQuote(quote: quote)
                            }
                    } else{
                        Image(systemName: "heart")
                            .foregroundColor(.blue)
                            .padding()
                            .scaleEffect(1.2)
                            .onTapGesture {
                                PersistenceController.shared.setFavoriteQuote(quote: quote)
                            }
                    }
                }
                Button{
                
                }label:{
                    
                Image(systemName: "ellipsis")
                    .onTapGesture {
                        showActionSheet = true
                    }
                }
            }
        }
        .actionSheet(isPresented: $showActionSheet, content: {
            ActionSheet(title: Text("Choose"), buttons: [
                .default(Text("Edit")) {
                    showModal.toggle()
                },
                .destructive(Text("Delete")) {
                    
                },
                .cancel()
            ])
        })
        .sheet(isPresented: $showModal) {
            QuoteForm(showModal: $showModal)
        }
    }
}

//struct QuoteView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuoteView(quote: "It is impossible to manufacture or imitate love", author: "Horace Slughorn")
//    }
//}
