//
//  QuotesView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 15/11/21.
//

import SwiftUI

struct QuotesView: View {
    
    @StateObject private var quotesViewModel = QuotesViewModel()
    
    var body: some View {
        ZStack {
            Color.themeColor
                .ignoresSafeArea()
            
            VStack {
                Picker("How do you want to display the quotes?", selection: $quotesViewModel.actualViewType) {
                    ForEach(QuotesViewModel.ViewType.allCases, id: \.self) { viewType in
                        Text(viewType.rawValue).tag(viewType)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                Spacer()
                
                Text("\(quotesViewModel.actualViewType.rawValue)")
                
                Spacer()
            }
        }
        
    }
}

struct QuotesView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesView()
    }
}
