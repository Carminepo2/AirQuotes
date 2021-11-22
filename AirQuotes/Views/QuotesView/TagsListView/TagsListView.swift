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
        VStack {
            List {
                ForEach(tags) { tag in
                    Text(tag.name ?? "Unknown Tag")
                }
                .listRowBackground(Color.clear)
            }
            .listStyle(.inset)
        }
    }
}

struct TagsListView_Previews: PreviewProvider {
    static var previews: some View {
        TagsListView()
    }
}
