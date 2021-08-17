//
//  ContentView.swift
//  food
//
//  Created by Abu Anwar MD Abdullah on 25/1/21.
//

import SwiftUI

struct ContentView: View {
    
   
    
    var body: some View {
        
        NavigationView{
           
            CustomTabView()
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
       
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct CustomTabView: View {
    @State var selectedTab = "home"
    @State var edges = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View{
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
            TabView(selection: $selectedTab){
                HomeView()
                    .tag("home")
                EventView()
                    .tag("event-2")
                HistoryView()
                    .tag("history")
                AccountView()
                    .tag("account")
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea(.all, edges: .bottom)
            
            HStack(spacing: 0){
                ForEach(tabs,id: \.self){ image in
                    TabButton(image: image, selectedTab: $selectedTab)
                    
                    if image != tabs.last{
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 5)
            .background(Color(.white))
            .clipShape(Capsule())
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: -5, y: -5)
            .padding(.horizontal)
            
            ///.padding(.bottom, edges!.bottom == 0 ? 20 : 0)
            
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        //.background(Color.black.opacity(0.15).ignoresSafeArea(.all, edges: .all))
        
    }
}

struct TabButton: View {
    var image: String
    @Binding var selectedTab: String
    
    var body: some View{
        Button(action: {selectedTab = image}){
            Image(image)
                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                .foregroundColor(selectedTab == image ? Color("tab") : Color.black.opacity(0.4))
                .padding()
        }
    }
}

var tabs = ["home","event-2", "history", "account"]




struct SectionTabTitleView: View {
    let title: String
    var body: some View {
        HStack{
            Text(title)
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            Spacer()
            
            Text("See All")
                .foregroundColor(Color("PrimaryColor"))
                .onTapGesture {
                    
                }
        }
    }
}


