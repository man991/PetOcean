//
//  CageCleaningView.swift
//  PetOceanV3
//
//  Created by Macbook on 12/08/21.
//

import SwiftUI

struct CageCleaningView: View {
    @State private var enableLogging = false
        @State private var selectedColor = "Red"
        @State private var colors = ["Red", "Green", "Blue"]
    @State private var date = Date()


        var body: some View {
            VStack(alignment: .center) {
                Image("PetGroomingLogo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 400, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    //.edgesIgnoringSafeArea(.all)
                Text("We provide all the ✂️ tools you just need to have 💧water and 🔌 electricity")
                    .padding()
                    
                List {

                    Section() {

                        DatePicker(
                               "Booking Date",
                               selection: $date,
                               displayedComponents: [.date]
                        )
                        .environment(\.locale, Locale.init(identifier: "us"))
                      
                    }
                    Section{
                        DatePicker(
                               "Booking Time (9am - 5pm)",
                               selection: $date,
                               displayedComponents: [.hourAndMinute]
                        )
                        .environment(\.locale, Locale.init(identifier: "us"))
                        //.listStyle(InsetGroupedListStyle())

                    }

                }
                .listStyle(InsetGroupedListStyle())

                
                NavigationLink(
                    destination: PetGroomingView(),
                    label: {
                        Text("Next")
                            .font(.title2)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    })
                    //.background(Color(.red))
            }
            .background(Color("default"))
        }
}

struct CageCleaningView_Previews: PreviewProvider {
    static var previews: some View {
        CageCleaningView()
    }
}
