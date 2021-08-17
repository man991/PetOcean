//
//  SuccessView.swift
//  PetOceanV3
//
//  Created by Macbook on 17/08/21.
//

import SwiftUI

struct SuccessView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Text("Order Sukses")
            .foregroundColor(.blue)
            .font( .title)
            .onTapGesture {
               print("orderrr..")
               
                presentationMode.wrappedValue.dismiss()
            }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
