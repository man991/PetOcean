//
//  ServiceCard.swift
//  PetOceanV3
//
//  Created by Macbook on 30/07/21.
//

import SwiftUI

struct ServiceCard: View {
   
    let data: PetshopData
    
    var body: some View {
        HStack{
            ServiceRemoteImage(urlString: data.imageUrl )
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 7)
                .aspectRatio(1, contentMode: .fill)
                .frame(width: 100 , height: 100)
            
            VStack(alignment: .leading, spacing: 4){
                Text(data.serviceDescription ?? "")
                    .font(.caption)
                    .foregroundColor(.green)
                Text(data.serviceName ?? "")
                    .fontWeight(.medium)
                
                HStack(spacing: 2) {
                    ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                        Image("star")
                            .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color("PrimaryColor"))
                    }
                    Text("120 Calories")
                        .font(.caption)
                        .foregroundColor(Color("PrimaryColor"))
                        .padding(.leading)
                }
                
                HStack {
                    Image("time")
                    Text("10 mins")
                        .font(.caption2)
                        .foregroundColor(Color("GrayColor"))
                    
                    Image("serving")
                    Text("1 Serving")
                        .font(.caption2)
                        .foregroundColor(Color("GrayColor"))
                    Spacer()
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("LightGrayColor"))
        .cornerRadius(18.0)
    }
}


struct ServiceCard_Previews: PreviewProvider {
    static var previews: some View {
        ServiceCard(data: PetshopData.dummyData).previewLayout(.sizeThatFits)
    }
}
