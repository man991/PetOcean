//
//  HomeView.swift
//  food
//
//  Created by Macbook on 17/07/21.
//

import SwiftUI

struct HomeView: View {
    @State private var searchString: String = ""
    
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        
        ZStack {
            Color.white.ignoresSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    HomeNavbarView()
                    Text("Halo \(UserDefaults.standard.object(forKey: "usernameKey") as? String ?? "")")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(Color("GrayColor"))
                    
                    Text("What are you looking for today ?")
                        .font(.title)
                        .fontWeight(.bold)
                    MenuItemView()
                    SectionTabTitleView(title: "Top Petshop")
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 10){
                            ForEach(viewModel.serviceData, id: \.id) { option in
                                PetshopCard(data: option)
                            }
                        }
                        .onAppear(perform: {
                            viewModel.getPetshopByCountry()
                        })
                        if  viewModel.isLoading {ProgressView() }
                    }
                    SectionTabTitleView(title: "Recomended")
                    SmallRecipeCard(imageName: "reco_1", title: "Asian Glazed Chicken")
                    SmallRecipeCard(imageName: "reco_2", title: "French Toast With Berries")
                    SmallRecipeCard(imageName: "reco_3", title: "Amuba Meatball Chilli")
                    
                }
                .padding(.bottom, 100)
            }
            
            .padding()
            
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
    
    struct HomeNavbarView: View {
        var body: some View {
            HStack {
                Image("filter")
                Spacer()
                Image("notifications")
            }
        }
    }
    
    struct SearchandFilterView: View {
        
        @Binding var search: String
        var body: some View {
            HStack(spacing: 16) {
                HStack {
                    Image("search")
                    TextField("Search For Reciepe", text: $search)
                }
                .padding()
                .background(Color("LightGrayColor"))
                .cornerRadius(8.0)
                
                Image("filter")
                    .padding()
                    .background(Color("LightGrayColor"))
                    .cornerRadius(8.0)
                    .onTapGesture {
                        
                    }
                
                
            }
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
    
}
