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
    
 //   private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
//    private var symbols = ["", "hifispeaker.fill", "printer.fill"]
    
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
                            .scaleEffect(2)
                    }
                }
                
                Spacer()
                
               /* HStack{
                    if favourite{
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                            .padding()
                            .scaleEffect(1.9)
                            .onTapGesture {
                                favourite = false
                            }
                    } else{
                        Image(systemName: "heart")
                            .foregroundColor(.red)
                            .padding()
                            .scaleEffect(1.9)
                            .onTapGesture {
                                favourite = true
                            }
                    }
                }*/
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
        }
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(quote: "It is impossible to manufacture or imitate love", author: "Horace Slughorn")
    }
}
