//
//  HomeView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 15/11/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.themeColor
                .ignoresSafeArea()
            
            ScrollView {
                VStack{
                    HStack {
                        Text("Latest quote")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                            .opacity(0.60)
                        // .position(x: 60, y: 20)
                            .padding(.horizontal)
                        Spacer()
                    }
                    
                    DividerMartina()
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 200)
                            .foregroundColor(Color.gray)
                            .opacity(0.2)
                            .padding(.horizontal, 30)
                            .padding(.vertical)
                        Text("Write your first quote!")
                            .foregroundColor(Color.gray)
                            .opacity(0.5)
                    }
                    Circle()
                        .frame(width: 8, height: 8, alignment: .center)
                    //.position(x: 164, y: -12)
                        .offset(y: -10)
                        .opacity(0.4)
                        .padding(.bottom, 20)
                    
                    
                    HStack {
                        Text("Recent books")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                            .opacity(0.60)
                        //.position(x: 60, y: 20)
                        //.padding()
                        Spacer()
                        
                        Button(action: {}) {
                            Text("+ Add book")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.black)
                        }
                        
                        /*Text("+ Add book")
                         .font(.headline)
                         .fontWeight(.semibold)
                         .foregroundColor(Color.black)
                         //.position(x: 250, y:-43)
                         //.padding()*/
                    }.padding(.horizontal)
                    //.offset(y: 20)
                    
                    
                    DividerMartina()
                    //padding(.vertical)
                    
                    
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        HomeView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
    }
}






struct DividerMartina: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: .infinity, height: 1, alignment: .center)
            .foregroundColor(Color.gray)
            .opacity(0.5)
        // .position(x: 166, y:-13)
            .padding(.horizontal)
    }
}
