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
        VStack{
            ForEach(tags) { tag in
                
                TagView(color: Color(tag.color ?? ""), title: tag.name ?? "Unknown", tag.objectID)
            }
            .listRowBackground(Color.clear)
        }
    }
}

struct TagsListView_Previews: PreviewProvider {
    static var previews: some View {
        TagsListView()
    }
}
