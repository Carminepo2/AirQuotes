//
//  TagButtons.swift
//  AirQuotes
//
//  Created by Valerio Domenico Conte on 24/11/21.
//

import SwiftUI
import CoreData

struct TagButtons: View {
    let id: NSManagedObjectID?
    let color : Color
    let title : String
    
    init(color: Color, title: String, _ id: NSManagedObjectID? = nil) {
        self.color = color
        self.title = title
        self.id = id
    }
     
    var body: some View {
        
        
        HStack{
            Text(title)
            .lineLimit(1)
            .frame(maxWidth: 300, minHeight: 50, alignment: .leading)
            .padding(.horizontal)
            .foregroundColor(.primary)
            
            Image(systemName: "chevron.forward")
                .padding(.horizontal)
                .foregroundColor(.primary)
        }
        .background(RoundedRectangle(cornerRadius: 10).fill(color))
        .padding(.vertical, 4)

        
        
    }
}


struct TagButtons_Previews: PreviewProvider {
    static var previews: some View {
        TagButtons(color: Color.yellow, title: "Example", NSManagedObjectID())
    }
}

