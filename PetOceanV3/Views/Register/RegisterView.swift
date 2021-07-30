//
//  RegisterView.swift
//  PetOceanV2
//
//  Created by Macbook on 29/07/21.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var appState: AppState
    @State var name: String = ""
    @State var phone: String = ""
    @State var email: String = ""
    @State var username: String = ""
    @State var pass: String = "Password1!"
    @State var showLoading = false
    @Environment(\.presentationMode) var presentationMode
    
    
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        ZStack {
            VStack{
                
                TextField("name", text: $name)
                    .frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("phone", text: $phone)
                    .frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("email", text: $email)
                    .frame(width: 200, height: 50, alignment: .center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("username", text: $username)
                    .frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("password", text: $pass)
                    .frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    
                    let data = RegisterRequest(
                        countryId: "28BE38BD-DF42-4CE3-97C6-F362D205B57C",
                        name: self.name,
                        phone: self.phone,
                        email: self.email,
                        userName: self.username,
                        password: self.pass)
                    viewModel.register(registerData: data)
                    
                    self.appState.reloadDashboard()
                }) {
                    Text("Register")
                }
                if  viewModel.isLoading {ProgressView() }
            }
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
