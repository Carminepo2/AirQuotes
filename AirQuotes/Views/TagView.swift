//
//  TagView.swift
//  AirQuotes
//
//  Created by Martina Esposito on 19/11/21.
//

import SwiftUI
import CoreData

struct TagView: View {
    
    let id: NSManagedObjectID?
    let color : Color
    let title : String
    
    init(color: Color, title: String, _ id: NSManagedObjectID? = nil) {
        self.color = color
        self.title = title
        self.id = id
        
    }
     
    var body: some View {
        
        Text(title)
            .padding(.horizontal, 15)
            .padding(.vertical, 5)
            .background(RoundedRectangle(cornerRadius: 20).fill(color))
            .lineLimit(1)
            .frame(maxWidth: 220)
    }
    
    struct TagView_Previews: PreviewProvider {
        static var previews: some View {
            TagView(color: Color.green, title: "Example", NSManagedObjectID())
        }
    }
}
