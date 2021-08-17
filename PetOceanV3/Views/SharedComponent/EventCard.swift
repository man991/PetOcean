//
//  EventCard.swift
//  PetOceanV3
//
//  Created by Macbook on 16/08/21.
//

import SwiftUI

struct EventCard: View {
    let data: ServiceData
    
    var body: some View {
        VStack(alignment: .leading) {
            ServiceRemoteImage(urlString: data.imageUrl ?? "" )
                .aspectRatio(contentMode: .fit)
            HStack(spacing: 0) {
                Image(systemName:"map")
                    .foregroundColor(Color("PrimaryColor"))
                    .font(.caption2)
                Text("Jakarta")
                    .font(.caption2)
                    .foregroundColor(Color("GrayColor"))
            }
          
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text(data.serviceName ?? "")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    HStack {
                        Image(systemName:"calendar")
                            .foregroundColor(.gray)
                        Text("Selasa, 17 Agustus 2021")
                            .font(.caption2)
                            .foregroundColor(Color("GrayColor"))
                    }
                    HStack {
                        Image(systemName:"clock")
                            .foregroundColor(.gray)
                        Text("09:00 - 17:00 WIB")
                            .font(.caption2)
                            .foregroundColor(Color("GrayColor"))
                    }
                }
                .layoutPriority(100)
                
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}

struct EventCard_Previews: PreviewProvider {
    static var previews: some View {
        EventCard(data: ServiceData.dummyData).previewLayout(.sizeThatFits)
    }
}
