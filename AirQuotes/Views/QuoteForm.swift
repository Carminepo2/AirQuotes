//
//  QuoteForm.swift
//  AirQuotes
//
//  Created by Valerio Domenico Conte on 18/11/21.
//

import SwiftUI





struct QuoteForm: View {
    @State private var quote = ""
    @State private var by = ""
    @Binding var showModal: Bool
    @State private var showCreateTags = false
    @State private var selectedTag: Tag = Tag()
    @State private var selectedBook: Book? = nil
    @State var tagName: String = "Prova"
    @State var chosenColor: String = "BookRed"
    @State var chosenTagList: [Tag] = []
    
    
    @State var showTagList: Bool = false
    
    @FetchRequest(
        entity: Tag.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Tag.name, ascending: false)
        ]
    ) var tags: FetchedResults<Tag>
    
    @FetchRequest(
        entity: Book.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Book.title, ascending: false)
        ]
    ) var books: FetchedResults<Book>
    
    
    
    
    private let gridKeyBoardButtonsLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Color.themeColor
                    .ignoresSafeArea()
                
                VStack{
                    
                    Form {
                        Section(header: Text("Quote & Character")) {
                            
                            ZStack(alignment: .leading){
                                if quote.isEmpty {
                                    Text("Quote")
                                        .foregroundColor(.secondary)
                                    
                                }
                                TextEditor(text: $quote)
                            }
                            
                            ZStack(alignment: .leading){
                                if by.isEmpty {
                                    Text("Character")
                                        .foregroundColor(.secondary)
                                }
                                TextEditor(text: $by)
                            }
                        }
                        Section(header: Text("Tags")) {
                            
                            
                            Button("Create a new tag") {
                                showCreateTags.toggle()
                            }
                            .foregroundColor(.primary)
                            .sheet(isPresented: $showCreateTags, content: {
                                CreateTags(showCreateTags: $showCreateTags, chosenTagList: $chosenTagList)
                            })
                            
                            
                            NavigationLink {
                                List {
                                    ForEach(tags) { tag in
                                        MultipleSelectionRow(title: tag.name ?? "Unknown", isSelected: chosenTagList.contains { $0.name == tag.name }) {
                                            if chosenTagList.contains(where: { $0.name == tag.name }) {
                                                chosenTagList.removeAll(where: { $0.name == tag.name })
                                            }
                                            else {
                                                chosenTagList.append(tag)
                                            }
                                        }
                                    }
                                }
                                .listStyle(InsetListStyle())
                            } label: {
                                Text("Choose tag")
                            }
                            .foregroundColor(.primary)
                            
                            if chosenTagList.count > 0 {
                                ScrollView(.horizontal) {
                                    HStack(spacing: 10) {
                                        ForEach(chosenTagList) {
                                            TagView(color: Color($0.color ?? ""), title: $0.name ?? "Unknown")
                                            
                                        }
                                    }
                                    .padding(.vertical)
                                }
                            }
                            
                        }
                        
                        Section(header: Text("Book"))
                        {
                            Picker("Choose book", selection: $selectedBook) {
                                ForEach(books) {
                                    Text($0.title ?? "Unknown").tag($0 as Book?)
                                }
                            }
                            .foregroundColor(.primary)
                        }
                    }
                }
                .navigationTitle("Add a new quote")
                
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        
                        if !quote.isEmpty && selectedBook != nil && !by.isEmpty {
                            Button("Save", action: {
                                PersistenceController.shared.createQuote(quote, by, selectedBook!, chosenTagList)
                                showModal.toggle()
                            })
                            
                        } else {
                            Text("Save")
                                .foregroundColor(.gray)
                        }
                    }
                    
                    ToolbarItemGroup(placement: .keyboard) {
                        LazyVGrid(columns: gridKeyBoardButtonsLayout, content: {
                            Spacer()
                            
                            ScanButton(text: $quote)
                                .frame(width: 100, height: 56, alignment: .leading)
                            
                            Button {
                                hideKeyboard()
                            } label: {
                                Image(systemName: "keyboard.chevron.compact.down")
                                
                            }
                        })
                    }
                }
            }
        }
    }
}

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}



struct QuoteForm_Previews: PreviewProvider {
    static var previews: some View {
        QuoteForm(showModal: .constant(true))
    }
}

