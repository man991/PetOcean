//
//  MenuItemView.swift
//  PetOceanV3
//
//  Created by Macbook on 30/07/21.
//

import SwiftUI

struct MenuItemView: View {
    
        @State private var selectedOption: NavigationViewOptions.Option = (id:UUID(),"", "",.doctor)
        @State private var showDetail: Bool = false
   
        
        var body: some View {
            //NavigationView {
                ScrollView{
                    HStack  {
                        ForEach(NavigationViewOptions.options, id: \.id) { option in
                            VStack{
                                Image(option.imageName)
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: .center)
                                    .padding()
                                    .background(Color("LightGrayColor"))
                                    .cornerRadius(50.0)
                                
                                Text(option.value)
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                            .onTapGesture {
                                selectedOption = option
                                showDetail = true
                            }
                        }
                        Spacer()
                        NavigationLink("", destination: NavigationViewOptions.buildView(for: selectedOption), isActive: $showDetail)
                            .opacity(0)
                    }
                    //.navigationTitle("Options")
                }
                // INITIAL DETAIL VIEW
                //Text("Select option from the left")
            //}
        }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView().previewLayout(.sizeThatFits)
    }
}

struct NavigationViewOptions {
    enum OptionType {
        //case petshop,
             case doctor,
             breeder,
             adoption,
             trainer,
             more
              }
    typealias Option = (id: UUID,imageName: String, value: String, type: Self.OptionType)
    static var options: [Option] = [
        //(UUID(),"shop", "Petshop", .petshop),
        (UUID(),"doctor", "Doctor", .doctor),
        (UUID(),"trainer", "Trainer", .trainer),
        (UUID(),"breeder", "Breeder", .breeder),
        (UUID(),"adoption", "Adopt", .adoption),
        (UUID(),"more", "More", .more),
       
    ]
        
    static func buildView(for option: Option) -> some View {
        switch option.type {
//        case .petshop:
//            return AnyView(PetshopView(dta: PetshopData.dummyData))
        case .trainer:
            return   AnyView(TrainerView())
        case .breeder:
            return   AnyView(BreederView())
        case .adoption:
            return   AnyView(PetboyView())
        case .doctor:
            return   AnyView(DoctorView())
        case .more:
            return   AnyView(Text("Hello More Menu"))
        }
    }
}




struct ProfileView: View {
    var body: some View {
        Text("Hello, Profile!")
            .padding()
    }
}

