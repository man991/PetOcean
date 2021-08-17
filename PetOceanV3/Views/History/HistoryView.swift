//
//  HistoryView.swift
//  PetOceanV3
//
//  Created by Macbook on 30/07/21.
//

import SwiftUI

struct HistoryView: View {
   
    @State var selected_tab = historyScrollTabs[0]
    @Namespace var animation
    
    var body: some View {
        VStack(spacing: 0){
            ScrollView(.vertical, showsIndicators: false) {
                ScrollView (.horizontal, showsIndicators: false){
                    HStack {
                        ForEach(historyScrollTabs, id: \.self){ tab in
                            BreederTabButton(title: tab, selectedTab: $selected_tab, animation: animation)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                }
                .padding()
                
                SmallRecipeCard(imageName: "reco_1", title: "Asian Glazed Chicken")
                SmallRecipeCard(imageName: "reco_2", title: "French Toast With Berries")
                SmallRecipeCard(imageName: "reco_3", title: "Amuba Meatball Chilli")
            }
           
            
            Spacer()
            
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}

struct SmallRecipeCard: View {
    let imageName: String
    let title: String
    
    var body: some View {
        HStack{
            Image(imageName)
                .aspectRatio(1, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading, spacing: 4){
                Text("Breakfast")
                    .font(.caption)
                    .foregroundColor(.green)
                Text(title)
                    .fontWeight(.medium)
                
                HStack(spacing: 2) {
                    ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                        Image("star")
                            .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color("PrimaryColor"))
                    }
                    Text("120 Calories")
                        .font(.caption)
                        .foregroundColor(Color("PrimaryColor"))
                        .padding(.leading)
                }
                
                HStack {
                    Image("time")
                    Text("10 mins")
                        .font(.caption2)
                        .foregroundColor(Color("GrayColor"))
                    
                    Image("serving")
                    Text("1 Serving")
                        .font(.caption2)
                        .foregroundColor(Color("GrayColor"))
                    Spacer()
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("LightGrayColor"))
        .cornerRadius(18.0)
    }
}
