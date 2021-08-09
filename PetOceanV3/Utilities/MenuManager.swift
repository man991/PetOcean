//
//  MenuManager.swift
//  SwiftPetOcean
//
//  Created by Macbook on 19/07/21.
//

import SwiftUI

struct MenuManager {
    
    
    func getMenuSelected(menuSelected: String) -> some View {
        
        // make function ViewBuilder
        @ViewBuilder
        func getActiveView() -> some View {
            switch menuSelected {
            case "1":
                //PetshopView()
                TestView()
            case "2":
                TrainerView()
            case "3":
                TrainerView()
            default:
                AccountView()
            }
        }
        return getActiveView()
        
    }
}

struct TestView: View {
     var body: some View {
        TrainerView()
    }
}
