//
//  BreederView.swift
//  PetOceanV3
//
//  Created by Macbook on 08/08/21.
//

import SwiftUI

struct BreederView: View {
   
    @State var selected_tab = scroll_tabs[0]
    @StateObject var viewModel = BreederViewModel()
    @Namespace var animation
    var body: some View {
        VStack(spacing: 0){
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(alignment: .leading){
        
                    HStack{
                        Text("\(selected_tab)'s Breeder")
                            .fontWeight(.heavy)
                            .font(.system(size: 25))
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    .padding(.bottom, 10)
                    
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(scroll_tabs, id: \.self){ tab in
                                BreederTabButton(title: tab, selectedTab: $selected_tab, animation: animation)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                    }
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 2), spacing: 15){
                        ForEach(viewModel.breederData, id: \.id){ data in
                            BreederCard(data: data)
                        }
                    }
                    .padding()
                }
            })
        }
        .onAppear(perform: {
            viewModel.getBreeders()
        })
    }
}

struct BreederView_Previews: PreviewProvider {
    static var previews: some View {
        BreederView()
    }
}
