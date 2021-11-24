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
    
    let geometry: GeometryProxy
    
    
    var body: some View {
        List{
            
            ForEach(tags) { tag in
                NavigationLink {
                    ListQuotesTag(tag: tag)
                } label: {
                    TagButtons(color: Color(tag.color ?? ""), title: tag.name ?? "Unknown", tag.objectID)
//                        .padding(.horizontal)
                }
            }
            .onDelete(perform: delete)
        }
        .frame(width: geometry.size.width - 5, height: geometry.size.height - 50, alignment: .center)
        .onAppear {
            UITableView.appearance().isScrollEnabled = false
        }
        .onDisappear {
            UITableView.appearance().isScrollEnabled = true
        }
//        .padding(.vertical)
    }
    
    
    func delete(at offsets: IndexSet) {
        for i in offsets {
            DispatchQueue.main.async {
                PersistenceController.shared.delete(tag: tags[i])
            }
        }
    }
}

/*
struct TagsListView_Previews: PreviewProvider {
    static var previews: some View {
        TagsListView()
    }
}
*/
