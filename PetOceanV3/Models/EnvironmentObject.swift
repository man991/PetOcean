//
//  EnvironmentObject.swift
//  SwiftPetOcean
//
//  Created by Macbook on 23/07/21.
//

import Foundation

class GlobalData: ObservableObject {
    @Published var selectedTab : String = "home"
    @Published var token: String = ""
}
