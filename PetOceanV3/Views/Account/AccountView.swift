//
//  AccountView.swift
//  PetOceanV3
//
//  Created by Macbook on 30/07/21.
//

import SwiftUI

struct AccountView: View {
    
    @State var isLogin = false
    @State var isRegister = false
    @EnvironmentObject var appState: AppState
    
    func getName() -> String {
        return UserDefaults.standard.object(forKey: "usernameKey") as? String ?? ""
    }
    
    
    var body: some View {
        ZStack{
            VStack{
                
                if(getName() != "")
                {
                    Text("Hello \(UserDefaults.standard.object(forKey: "usernameKey") as? String ?? "")")
                    
                    Button(action: {
                        UserDefaults.standard.removeObject(forKey: "usernameKey")
                        appState.reloadDashboard()
                    }) {
                        Text("Logout")
                    }
                }
                else{
                    
                    Button(action: {
                        self.isLogin.toggle()
                    }) {
                        Text("Login")
                    }
                    .sheet(isPresented: $isLogin , content: {
                        LoginView()
                    })

                       
                    Button(action: {
                        self.isRegister.toggle()
                    }) {
                        Text("Register")
                    }
                    .sheet(isPresented: $isRegister , content: {
                        RegisterView()
                    })
                }
               
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
