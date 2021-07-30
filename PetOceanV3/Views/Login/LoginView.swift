//
//  LoginView.swift
//  PetOceanV3
//
//  Created by Macbook on 30/07/21.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appState: AppState
    @State var email: String = "putra@yahoo.com"
    @State var pass: String = "Password1!"
    @State var showLoading = false
    @Environment(\.presentationMode) var presentationMode
    
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            VStack{
                
              
                TextField("email", text: $email)
                    .frame(width: 200, height: 50, alignment: .center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
              
                TextField("password", text: $pass)
                    .frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                  
                    viewModel.authenticate(email: email, password: pass)
                    
                    self.appState.reloadDashboard()
                }) {
                    Text("Login")
                }
                if  viewModel.isLoading {ProgressView() }
            }
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
