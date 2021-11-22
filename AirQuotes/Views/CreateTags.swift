//
//  CreateTags.swift
//  AirQuotes
//
//  Created by Valerio Domenico Conte on 22/11/21.
//

import SwiftUI

struct CreateTags: View {
    @Binding var showCreateTags: Bool
    @State private var tagName = ""
    @State private var chosenColor = "BookRed"
    @State var tagList: [Tag] = []
    
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                Color.themeColor
                    .ignoresSafeArea()
            
                VStack{
                    Form{
                        Section(header: Text("Tag")) {
                            TextField("Eg: happy, motivational...", text: $tagName)
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
                    }
                }
            }
            .navigationTitle("New tag")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    if tagName.isEmpty {
                        Text("Save tag")
                            .foregroundColor(.gray)
                    } else {
                        Button("Save tag", action: {

                            showCreateTags.toggle()
                            let newTag = PersistenceController.shared.createTag(chosenColor, tagName)
                            tagList.append(newTag)
                            tagName = ""
                            
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

