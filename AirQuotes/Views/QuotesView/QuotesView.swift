//
//  QuotesView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 15/11/21.
//

import SwiftUI

struct QuotesView: View {
    
    // Ho marcato questa proprietà come @StateObject in quanto è un'istanza di QuotesViewModel che è un @ObservableObject. Tali oggetti permettono alla view di renderizzare ogni volta che una determinata proprietà marcata con @Published cambia.
    @StateObject private var quotesViewModel = QuotesViewModel()
    
    var body: some View {
        ZStack {
            Color.themeColor
                .ignoresSafeArea()
            
            VStack {
                Picker("How do you want to display the quotes?", selection: $quotesViewModel.actualViewType) {
                    
                    // Swift ha bisogno di un modo riconoscere univocamente tutti gli elementi renderizzati attraverso il ForEach. Quindi il ForEach ha bisogno di una lista di valori confermi al protocollo "Identifiable". Oppure possiamo dire esplicietamente al ForEach quale valore utilizzare come identificativo.
                    // Come un questo nostro caso, dove sto iterando un enum (gli enum possono diventare iterabili se aderiscono al protocollo CaseIterable, attraverso la proprietà "allCases") e sto dicendo al ForEach di utilizzare il valore stesso come identificativo (id:\.self).
                    ForEach(QuotesViewModel.ViewType.allCases, id: \.self) { viewType in
                        Text(viewType.rawValue)
                            .tag(viewType)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                switch(quotesViewModel.actualViewType) {
                    case .tags:
                        TagsListView()
                    default:
                        VStack {
                            Text(quotesViewModel.actualViewType.rawValue)
                            Spacer()
                        }
                }
            }
        }
        
    }
}

struct QuotesView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesView()
    }
}
