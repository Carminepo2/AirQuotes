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
    @State var favourite: Bool = false
    @State private var showActionSheet = false
    
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
                            .scaleEffect(2)
                    }
                }
                
                Spacer()
            }
        }
        .toolbar{
            ToolbarItemGroup() {
                Button{
                
                }label:{
                    
                    if favourite{
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                            .padding()
                            .scaleEffect(1.6)
                            .onTapGesture {
                                favourite = false
                            }
                    } else{
                        Image(systemName: "heart")
                            .foregroundColor(.blue)
                            .padding()
                            .scaleEffect(1.6)
                            .onTapGesture {
                                favourite = true
                            }
                    }
                }
            }
            ToolbarItemGroup(placement: .navigationBarTrailing) {
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
                            
                        },
                        .default(Text("Delete quote")) {
                            
                        },
                        .cancel()
                        ])
        })
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(quote: "It is impossible to manufacture or imitate love", author: "Horace Slughorn")
    }
}
