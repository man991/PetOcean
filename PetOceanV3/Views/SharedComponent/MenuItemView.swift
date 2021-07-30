//
//  MenuItemView.swift
//  PetOceanV3
//
//  Created by Macbook on 30/07/21.
//

import SwiftUI

struct MenuItemView: View {
    // State variables to leep track of what option has been tapped on and when to navigate to new view
        @State private var selectedOption: NavigationViewOptions.Option = (id:UUID(),"", "",.petshop)
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
    enum OptionType { case petshop, trainer, adoption, more }
    typealias Option = (id: UUID,imageName: String, value: String, type: Self.OptionType)
    static var options: [Option] = [
        (UUID(),"shop", "Petshop", .petshop),
        (UUID(),"trainer", "Trainer", .trainer),
        (UUID(),"adoption", "Adoption", .adoption),
        (UUID(),"more", "More", .more),
       
    ]
        
    static func buildView(for option: Option) -> some View {
        switch option.type {
        case .petshop:
            return AnyView(PetshopView())
        case .trainer:
            return   AnyView(TrainerView())
        case .adoption:
            return   AnyView(TrainerView())
        case .more:
            return   AnyView(TrainerView())
        }
    }
}




struct ProfileView: View {
    var body: some View {
        Text("Hello, Profile!")
            .padding()
    }
}

