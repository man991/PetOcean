//
//  EventView.swift
//  PetOceanV3
//
//  Created by Macbook on 16/08/21.
//

import SwiftUI

struct EventView: View {
    @StateObject var viewModel = EventViewModel()
    //@State var show = false
//    @State var dta: ServiceData
//    @Namespace var animation
//    @State private var navBarHidden = false
    
    var body: some View {
        ZStack {
            List(viewModel.serviceData, id: \.id) { data in
               EventCard(data: data)
                .onTapGesture {
//                    withAnimation(.easeIn){
//                        show.toggle()
//                        navBarHidden.toggle()
//                        dta = data
//                    }
                   
                }
            }
            .onAppear { viewModel.getEventList() }
            //.navigationBarHidden(navBarHidden)
            //.navigationTitle("Petshops")
            
            if  viewModel.isLoading { LoadingView() }
            
//            if show{
//                PetshopDetailView( show: $show, navBarHidden: $navBarHidden, data: dta, animation: _animation)
//            }
            
        }
        .padding(.bottom, 100)
        
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}
