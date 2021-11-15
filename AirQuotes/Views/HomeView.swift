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
                        Text("Latest quote")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                            .opacity(0.60)
                            .position(x: 60, y: 20)
                            .padding()
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 300, height: 1, alignment: .center)
                            .foregroundColor(Color.gray)
                            .opacity(0.5)
                            .position(x: 166, y:-13)
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 300, height: 200, alignment: .center)
                                .foregroundColor(Color.gray)
                                .opacity(0.2)
                                .padding()
                            Text("Write your first quote!")
                                .foregroundColor(Color.gray)
                                .opacity(0.5)
                        }
                        Circle()
                            .frame(width: 8, height: 8, alignment: .center)
                            .position(x: 164, y: -12)
                            .opacity(0.4)
                        Text("Recent books")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                            .opacity(0.60)
                            .position(x: 60, y: 20)
                            .padding()
                        Text("+ Add book")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                            .position(x: 250, y:-43)
                            .padding()
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 300, height: 1, alignment: .center)
                            .foregroundColor(Color.gray)
                            .opacity(0.5)
                            .position(x: 148, y:-90)
                            .padding()
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 120, height: 170, alignment: .center)
                            .foregroundColor(Color.white)
                            //.opacity(0.5)
                            //.border(Color.gray)
                            .position(x: 70, y:-20)
                            .padding()
                            .shadow(radius: /*@START_MENU_TOKEN@*/4/*@END_MENU_TOKEN@*/)
                        
                    }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
