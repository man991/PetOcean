//
//  TrainerDetailView.swift
//  PetOceanV3
//
//  Created by Macbook on 01/08/21.
//

import SwiftUI

struct TrainerDetailView: View {
    
    let trainer: TrainerData
    
    var body: some View {
        ZStack {
            VStack {
                Text(trainer.serviceName ?? "")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)

                Text(trainer.experiences ?? "")
                    .font(.caption2)
                
                
                            ServiceRemoteImage(urlString: trainer.imgURL! )
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 7)
                                .aspectRatio(1, contentMode: .fill)
                                .frame(width: 200 , height: 200)
                
                
                
                VStack(alignment: .leading) {
                    Text("Turtle Rock")
                        .font(.title)
                    
                    HStack {
                        Text("Joshua Tree National Park")
                        Spacer()
                        Text("California")
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    Divider()
                    
                    Text("About Turtle Rock")
                        .font(.title2)
                    Text("Descriptive text goes here.")
                }
                .padding()
                
                Spacer()
            }
        }
        
    }
}

struct TrainerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TrainerDetailView(trainer: TrainerData.dummyData)
//        TrainerDetailView()
    }
}

struct CircleImage: View {
    var body: some View {
        Image("fresh_recipe_1")
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

