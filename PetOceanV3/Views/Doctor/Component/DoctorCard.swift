//
//  DoctorCard.swift
//  PetOceanV3
//
//  Created by Macbook on 18/08/21.
//

import SwiftUI

struct DoctorCard: View {
    let data: DoctorData
    
    var body: some View {
        HStack{
            VStack {
                Image("doctorplaceholder")
                    .resizable()
                    .clipShape(Circle())
                    //.overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 7)
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 100 , height: 100)
                
            }
            .padding(.bottom, 55)
            
            VStack(alignment: .leading, spacing: 4){
                HStack {
                    Text(data.doctorName ?? "")
                        .fontWeight(.medium)
                    Spacer()
                    Text("Rp 150.000")
                }
                Text("General Practitioner")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                HStack(spacing: 2) {
                    ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                        Image("star")
                            .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color("PrimaryColor"))
                    }
                }
                
                HStack {
                    Image(systemName: "bag")
                        .foregroundColor(.gray)
                        .font(.caption2)
                    Text(data.experience ?? "2")
                        .font(.caption2)
                        .foregroundColor(Color("GrayColor"))
                    
                    Image("serving")
                    Text("95%")
                        .font(.caption2)
                        .foregroundColor(Color("GrayColor"))
                    Spacer()
                }
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Make an Appointment")
                            .font(.system(size: 12))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color("PrimaryColor"))
                                    .shadow(color: .orange, radius: 2, x: 0, y: 2)
                        )
                        .padding()
                }
            }
           
            
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color("LightGrayColor"))
        .cornerRadius(18.0)
    }
}

struct DoctorCard_Previews: PreviewProvider {
    static var previews: some View {
        DoctorCard(data: DoctorData.dummyData)
    }
}
