//
//  BreederCard.swift
//  PetOceanV3
//
//  Created by Macbook on 08/08/21.
//

import SwiftUI

struct BreederCard: View {
    let data : BreederData
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 8){
                HStack {
                    ServiceRemoteImage(urlString: data.imgURL ?? "" )
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 7)
                        .aspectRatio(1, contentMode: .fill)
                        .frame(width: 100 , height: 100)
                    
                    Image("like")
                        .padding(.bottom, 60)
                }
                
                Text(data.breeds ?? "")
                    .font(.caption)
                    .foregroundColor(.green)
                    .lineLimit(3)
                Text(data.serviceName ?? "")
                    .fontWeight(.medium)
                    .lineLimit(3)
                
                HStack(spacing: 2) {
                    ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                        Image("star")
                            .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color("PrimaryColor"))
                    }
                }
                
                Text("120 Calories")
                    .font(.caption)
                    .foregroundColor(Color("PrimaryColor"))
                HStack {
                    Image("time")
                    Text("10 mins")
                        .font(.caption2)
                        .foregroundColor(Color("GrayColor"))
                    
                    Image("serving")
                    Text("1 Serving")
                        .font(.caption2)
                        .foregroundColor(Color("GrayColor"))
                    
                }
            }
            .padding()
            .frame(width: 170)
            .background(Color("LightGrayColor"))
            .cornerRadius(20.0)
            
        }
        .padding(.trailing, 25)
        
    }
    
}

struct BreederCard_Previews: PreviewProvider {
    static var previews: some View {
        BreederCard(data: BreederData.dummyData)
    }
}
