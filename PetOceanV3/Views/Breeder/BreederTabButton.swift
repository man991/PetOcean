//
//  BreederTabButton.swift
//  PetOceanV3
//
//  Created by Macbook on 08/08/21.
//

import SwiftUI

struct BreederTabButton: View {
    var title: String
    @Binding var selectedTab: String
    var animation : Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()){
                selectedTab = title
            }
        }, label: {
            VStack(alignment: .leading, spacing: 6, content: {
                Text(title)
                    .fontWeight(.heavy)
                    .foregroundColor(selectedTab == title ? .black : .gray)
                if selectedTab == title{
                    Capsule()
                        .fill()
                        .frame(width: 40, height: 4)
                        .matchedGeometryEffect(id: "BreederTab", in: animation)
                }
            })
            .frame(width: 100)
        })
    }
}

