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
        ZStack{
        
            Text(title)
                .font(.largeTitle)
                .foregroundColor(.clear)
                .background(color)
                .opacity(0.2)
                .lineLimit(1)
                .cornerRadius(20)

            HStack {
                if id == nil {
                    Circle()
                        .fill(color)
                        .frame(width: 10, height: 10)
                        .offset(x: 14)
                        
                } else {
                    Button {
                        print("Delete")
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(color)
                            .frame(width: 15, height: 15)
                            .offset(x: 14)
                            
                    }

                }
                    
                
                Text(title)
                    .font(.title3)
                    .foregroundColor(color)
                    .padding()
                    .lineLimit(1)
                    .padding(.leading, 1)
                    
            }
            
            
        }
        .frame(maxWidth: 250)
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(color: Color.green, title: "Example", NSManagedObjectID())
    }
}
