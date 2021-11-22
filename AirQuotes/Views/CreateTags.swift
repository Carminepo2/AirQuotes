//
//  CreateTags.swift
//  AirQuotes
//
//  Created by Valerio Domenico Conte on 22/11/21.
//

import SwiftUI

struct CreateTags: View {
    @State var chosenColor: String = "BookGreen"
    @Binding var showCreateTags: Bool
    @State private var tag = ""
    @State var tagList: [Tag] = []

    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                Color.themeColor
                    .ignoresSafeArea()
                

                VStack{
                    Form{
                        Section(header: Text("Tag"))
                        {
                            TextField("Eg: happy, motivational...", text: $tag)
                        }
                        Section(header: Text("Color")) {
                            HStack{
                                ColorButtonPicker(colorName: "BookRed", chosenColor: $chosenColor)
                                ColorButtonPicker(colorName: "BookGreen", chosenColor: $chosenColor)
                                ColorButtonPicker(colorName: "BookPink", chosenColor: $chosenColor)
                                ColorButtonPicker(colorName: "BookLightBlue", chosenColor: $chosenColor)
                            }
                            .padding(.horizontal)
                            .padding(.horizontal)
                        }
                        Section(header: Text("Preview"))
                        {
                            ScrollView(.horizontal){
                                LazyHGrid(rows: Array(repeating: GridItem(.flexible()), count: 3)){
                                    ForEach(tagList) {
                                        tag in
                                        TagView(color: Color(tag.color ?? ""), title: tag.name ?? "Unknown")
                                    }
                                    .padding(.vertical)
                                    .padding(.vertical)
                                    .padding(.vertical)
                                    
                                }
                            }

      
                            


                        }

                    }
                }
            }
            .navigationTitle("Create new tags")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    if tag.isEmpty {
                        Text("Save tags")
                            .foregroundColor(.gray)
                    } else {
                        Button("Save tags", action: {
                            showCreateTags.toggle()
                            
                        })
                    }
                }
                ToolbarItemGroup(placement: .bottomBar)
                {
                    Spacer()
                    
                    if tag.isEmpty {
                        Text("Add tag")
                            .foregroundColor(.gray)
                    } else {
                        Button("Add tag", action: {
                            // add saveTags function
                            let newTag = PersistenceController.shared.createTag(chosenColor, tag)
                            tagList.append(newTag)
                            tag = ""
                            
                        })
                    }

 
                
                }
                
                ToolbarItem(placement: .keyboard)
                {
                    Button {
                        hideKeyboard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                }


            
                
            }
        }

        
        
        

    }
}

struct CreateTags_Previews: PreviewProvider {
    static var previews: some View {
        CreateTags(showCreateTags: .constant(true))
    }
}

