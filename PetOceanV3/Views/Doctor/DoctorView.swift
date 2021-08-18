//
//  DoctorView.swift
//  PetOceanV3
//
//  Created by Macbook on 18/08/21.
//

import SwiftUI

struct DoctorView: View {
    @StateObject var viewModel = DoctorViewModel()
    
    
    var body: some View {
        ZStack {
            List(viewModel.doctorData, id: \.id) { data in
                DoctorCard(data: data)
                    .onTapGesture {
                        
                    }
            }
            .onAppear { viewModel.getDoctorList() }
            
            
            if  viewModel.isLoading { LoadingView() }
            
        }
        
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

struct DoctorView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorView()
    }
}
