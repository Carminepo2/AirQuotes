//
//  HomeView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 15/11/21.
//

import SwiftUI

struct HomeView: View {
    
    @State var CreateBook : Bool = false
    @State private var showModal = false
    @State var isCreateBookModalOpen : Bool = false
    
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
                            .padding(.horizontal)
                        Spacer()
                    }
                    
                    DividerMartina()
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 200)
                            .foregroundColor(Color.gray)
                            .opacity(0.2)
                            .padding()
                        Text("Write your first quote!")
                            .foregroundColor(Color.gray)
                            .opacity(0.5)
                    }
                    Circle()
                        .frame(width: 8, height: 8, alignment: .center)
                        //.position(x: 164, y: -12)
                        .offset(y: -10)
                        .opacity(0.4)
                    
                    
                    Button("Add Quote") {
                        showModal.toggle()
                    }
                    .buttonStyle(RoundedRectangleButtonStyle())
                    .padding()
                    .padding(.bottom, 20)
                    .sheet(isPresented: $showModal, content: {
                        QuoteForm()
                    })
                    
                    HStack {
                        Text("Recent books")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                            .opacity(0.60)
                        Spacer()
                        
                        Button("+ Add Book") {
                            isCreateBookModalOpen.toggle()
                         }
                        .sheet(isPresented: $isCreateBookModalOpen, content: {
                            BookCreationView(book: .example, isCreateBookModalOpen: $isCreateBookModalOpen)
                        })
                    
                    }.padding(.horizontal)
                    
                    DividerMartina()
                    
                    HomeBookList()
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






struct DividerMartina: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(height: 1)
            .foregroundColor(Color.gray)
            .opacity(0.5)
        // .position(x: 166, y:-13)
            .padding(.horizontal)
    }
}
