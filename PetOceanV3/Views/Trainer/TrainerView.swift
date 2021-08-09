//
//  TrainerView.swift
//  PetOceanV3
//
//  Created by Macbook on 30/07/21.
//

import SwiftUI

struct TrainerView: View {
    @StateObject var viewModel = TrainerViewModel()
    var body: some View {
        ZStack {
                List(viewModel.trainerData, id: \.id) { data in

                    NavigationLink(destination: TrainerDetailView(trainer: data)) {
                        TrainerCard(data: data)
                    }
                }
                .navigationTitle("Trainer")
                .onAppear { viewModel.getTopTrainer() }
            
            if  viewModel.isLoading { LoadingView() }
        }
        
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

struct TrainerView_Previews: PreviewProvider {
    static var previews: some View {
        TrainerView()
    }
}
