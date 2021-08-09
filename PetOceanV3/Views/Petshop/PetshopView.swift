//
//  PetshopView.swift
//  PetOceanV3
//
//  Created by Macbook on 30/07/21.
//

import SwiftUI

struct PetshopView: View {
    @StateObject var viewModel = PetshopViewModel()
    @State var show = false
    @State var dta: PetshopData
    @Namespace var animation
    @State private var navBarHidden = false
    
    var body: some View {
        ZStack {
            List(viewModel.petshopData, id: \.id) { data in
               ServiceCard(data: data)
                .onTapGesture {
                    withAnimation(.easeIn){
                        show.toggle()
                        navBarHidden.toggle()
                        dta = data
                    }
                   
                }
            }
            .onAppear { viewModel.getPetshopByCountry() }
            .navigationBarHidden(navBarHidden)
            .navigationTitle("Petshops")
            
            if  viewModel.isLoading { LoadingView() }
            
            if show{
                PetshopDetailView( show: $show, navBarHidden: $navBarHidden, data: dta, animation: _animation)
            }
            
        }
        
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

struct PetshopView_Previews: PreviewProvider {
    static var previews: some View {
        PetshopView(dta: PetshopData.dummyData)
    }
}
