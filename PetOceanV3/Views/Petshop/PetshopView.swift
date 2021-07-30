//
//  PetshopView.swift
//  PetOceanV3
//
//  Created by Macbook on 30/07/21.
//

import SwiftUI

struct PetshopView: View {
    @StateObject var viewModel = PetshopViewModel()
    var body: some View {
        ZStack {
            //NavigationView {
            List(viewModel.petshopData, id: \.id) { data in
               ServiceCard(data: data)
            }
            .navigationTitle("Petshop")
            //}
            .onAppear { viewModel.getPetshopByCountry() }
            
            if  viewModel.isLoading { LoadingView() }
        }
        
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

struct PetshopView_Previews: PreviewProvider {
    static var previews: some View {
        PetshopView()
    }
}
