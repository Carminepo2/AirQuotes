//
//  QuoteSectionPickerView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 24/11/21.
//

import SwiftUI

struct QuoteSectionPickerView: View {
    
    @Binding var section: QuotesViewModel.ViewType
    
    var body: some View {
        Picker("How do you want to display the quotes?", selection: $section) {
            
            ForEach(QuotesViewModel.ViewType.allCases, id: \.self) { viewType in
                Text(viewType.rawValue)
                    .tag(viewType)
            }
        }
        .pickerStyle(.segmented)
        .padding(.horizontal)
    }
}

//struct QuoteSectionPickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuoteSectionPickerView()
//    }
//}
