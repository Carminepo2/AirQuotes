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
                        Text("Latest quotes")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                            .opacity(0.60)
                            .padding(.horizontal)
                        Spacer()
                    }
                    
                    DividerMartina()
                    
                    QuoteSliderView()
                        .frame(height: 300)
                        .padding(.top, -35)
                        .padding(.bottom, -10)

                    
                    Button("Add Quote") {
                        showModal.toggle()
                    }
                        .buttonStyle(RoundedRectangleButtonStyle())
                        .padding()
                        .padding(.bottom, 20)
                        .sheet(isPresented: $showModal, content: {
                            QuoteForm(showModal: $showModal)
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
                            BookCreationView(isCreateBookModalOpen: $isCreateBookModalOpen)
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
