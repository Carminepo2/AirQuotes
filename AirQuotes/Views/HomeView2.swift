import SwiftUI

struct HomeView2: View {
    var body: some View {
        ZStack {
            Color.themeColor
                .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    SectionSeparator(title: "Latest quote")
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 250, alignment: .center)
                            .foregroundColor(Color.gray)
                            .opacity(0.2)
                            .padding(.bottom)
                        Text("Write your first quote!")
                            .foregroundColor(Color.gray)
                            .opacity(0.5)
                    }
                    
                    
                    Circle()
                        .frame(width: 8, height: 8, alignment: .center)
                        .opacity(0.4)
                    
                    
                    SectionSeparator(title: "Recent books")
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 25) {
                            BookView(color: .bookColorOne, text: "Harry Potdwddqwdwqdwqdwqdwqd wqddqwd qwd qw wq wqdwdwqdqw wter")
                            BookView(color: .bookColorOne, text: "Harry Potter")
                            BookView(color: .bookColorOne, text: "Harry Pottdwddwdwdwer")
                            BookView(color: .bookColorOne, text: "Harry Potter")
                            
                            
                        }.padding(35)
                    }
                    .padding(-35)
                    
                    .frame(height: 240, alignment: .trailing)
                    
                    
                    
                }.padding(.horizontal)
            }
        }
    }
}

struct HomeView2_Previews: PreviewProvider {
    static var previews: some View {
        HomeView2()
    }
}

struct SectionSeparator: View {
    
    let title: String
    
    var body: some View {
        Group {
            HStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                
            }
            
            Divider()
                .offset(y: -8)
        }
        
    }
}
