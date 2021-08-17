//
//  PetboyView.swift
//  PetOceanV3
//
//  Created by Macbook on 12/08/21.
//

import SwiftUI

struct PetboyView: View {
    var body: some View {
        ZStack{
            VStack(alignment: .center, spacing: 15){
                NavigationLink(
                    destination: CageCleaningView(),
                    label: {
                        Text("Cage Cleaning")
                    })
               
                NavigationLink(
                    destination: PetGroomingView(),
                    label: {
                        Text("Pet Grooming")
                    })
            }
        }
    }
}

struct PetboyView_Previews: PreviewProvider {
    static var previews: some View {
        PetboyView()
    }
}

