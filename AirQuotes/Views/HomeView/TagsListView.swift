//
//  TagsListView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 16/11/21.
//

import SwiftUI


struct TagsListView: View {
    
    @FetchRequest(
        entity: Tag.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Tag.name, ascending: false)
        ]
    ) var tags: FetchedResults<Tag>
    
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(tags) { tag in
                
                HStack {
                    TagView(color: Color(tag.color ?? ""), title: tag.name ?? "Unknown", tag.objectID)
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
    }
}

struct TagsListView_Previews: PreviewProvider {
    static var previews: some View {
        TagsListView()
    }
}
