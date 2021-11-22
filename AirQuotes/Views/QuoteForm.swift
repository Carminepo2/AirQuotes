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
    @State private var selectedBook: Book = Book()
    @State var tagName: String = "Prova"
    @State var chosenColor: String = "BookRed"

    
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
                        Section(header: Text("Quote & Author")) {
                            
                            ZStack(alignment: .leading){
                                if quote.isEmpty {
                                    Text("Quote")
                                        .foregroundColor(.secondary)
                                        .opacity(0.5)
                                    
                                }
                                TextEditor(text: $quote)
                            }
                            
                            ZStack(alignment: .leading){
                                if by.isEmpty {
                                    Text("By")
                                        .foregroundColor(.secondary)
                                        .opacity(0.5)
                                }
                                TextEditor(text: $by)
                            }
                        }
                        Section(header: Text("Tags")) {
                            
                            
                                Button("Create a new tag") {
                                    showCreateTags.toggle()
                                }
                                .foregroundColor(.primary)
                                .opacity(0.5)
                                .sheet(isPresented: $showCreateTags, content: {
                                    CreateTags(showCreateTags: $showCreateTags)
                                })
                                                                
                                Picker("Choose from existent ones", selection: $selectedTag) {
                                        ForEach(tags) {
                                            Text($0.name ?? "Unknown")
                                        }
                                    }
                                    .foregroundColor(.primary)
                                    .opacity(0.5)
                            
                            HStack{
                                TagView(color: Color(chosenColor), title: tagName)
                            }
                            .padding(.vertical)
                            .padding(.horizontal, -72.5)
                            
                            
                                
                                
                            
                        }
                        
                        Section(header: Text("Book"))
                        {
                            Picker("Save your quote in a book", selection: $selectedBook) {
                                ForEach(books) {
                                    Text($0.title ?? "Unknown")
                                }
                            }
                            .foregroundColor(.primary)
                            .opacity(0.5)
                        }
                    }
                }
                .navigationTitle("Add a new quote")
                
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        
                        if quote.isEmpty || by.isEmpty {
                            Text("Save")
                                .foregroundColor(.gray)
                        } else {
                            Button("Save", action: {
                                showModal.toggle()
                                // add saveQuote function
                            })
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
