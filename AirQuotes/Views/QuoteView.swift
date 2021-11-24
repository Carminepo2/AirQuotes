//
//  QuoteView.swift
//  AirQuotes
//
//  Created by Carmine Porricelli on 19/11/21.
//

import SwiftUI

struct QuoteView: View {
    
    
    @ObservedObject var quote: Quote
    @State var showActionSheet: Bool = false
    @State var showModal : Bool = false
    
    
    var body: some View {
        ScrollView {
            VStack {
                HStack{
                    Image("QuoteStart")
                    Spacer()
                }
                
                Text("\(quote.text ?? "Unknown")")
                    .font(.system(.title2, design: .serif))
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.black)
                    .lineLimit(100)
                    .padding(.horizontal)
                
                HStack{
                    Spacer()
                    Image("QuoteEnd")
                    
                }
                
                
                Text("- \(quote.author ?? "Unknown")")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                                
                if quote.tags?.count ?? 0 > 0 {
                    
                            TagCloudView(tags: Array(quote.tags! as! Set<Tag>))
                                .padding(.horizontal)
                                .padding(.top)
                    
                }
            }
            .toolbar {
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button{
                        
                    }label:{
                        
                        if quote.isFavorite {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                                .padding()
                                .scaleEffect(1.2)
                                .onTapGesture {
                                    PersistenceController.shared.unfavoriteQuote(quote: quote)
                                }
                        } else{
                            Image(systemName: "heart")
                                .foregroundColor(.blue)
                                .padding()
                                .scaleEffect(1.2)
                                .onTapGesture {
                                    PersistenceController.shared.setFavoriteQuote(quote: quote)
                                }
                        }
                    }
                    Button{
                        
                    }label:{
                        
                        Image(systemName: "ellipsis.circle")
                            .foregroundColor(.blue)
                            .onTapGesture {
                                showActionSheet = true
                            }
                    }
                }
            }
            .actionSheet(isPresented: $showActionSheet, content: {
                ActionSheet(title: Text("Choose"), buttons: [
                    .default(Text("Edit")) {
                        showModal.toggle()
                    },
                    .destructive(Text("Delete")) {
                        PersistenceController.shared.delete(quote: quote)
                    },
                    .cancel()
                ])
            })
            .sheet(isPresented: $showModal) {
                QuoteForm(showModal: $showModal)
            }
        }
    }
}



struct TagCloudView: View {
    var tags: [Tag]
    
    @State private var totalHeight
    = CGFloat.infinity   // << variant for VStack
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(minHeight: 200) // << variant for VStack
    }
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(self.tags) { tag in
                self.item(for: tag)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tag == self.tags.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if tag == self.tags.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }.background(viewHeightReader($totalHeight))
    }
    
    private func item(for tag: Tag) -> some View {
        TagView(color: Color(tag.color ?? ""), title: tag.name ?? "Unknown")
    }
    
    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}




//struct QuoteView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuoteView(quote: "It is impossible to manufacture or imitate love", author: "Horace Slughorn")
//    }
//}
