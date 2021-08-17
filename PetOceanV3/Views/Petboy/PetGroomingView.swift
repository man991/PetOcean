//
//  PetGroomingView.swift
//  PetOceanV3
//
//  Created by Macbook on 12/08/21.
//

import SwiftUI

struct PetGroomingView: View {
    @State var name = ""
    @State var phone = ""
    @State var address = ""
    
    @State private var selectedSize = ""
    let cageSizes = [
        "Small (60cm x 40cm)",
        "Medium (100cm x 60cm)",
        "Large (>=200cm x 800cm)"
    ]
    
    @State private var selectedPaymentMethod = ""
    let paymentMethods = [
        "Cash",
        "Transfer / M-Banking"
    ]
    
    @State private var selectedQuantity = ""
    let quantities = ["1","2","3","4", "5"]
    
//    private var screenWidth = UIScreen.main.bounds.width
//    private var heightWidth = UIScreen.main.bounds.height
    
    var body: some View {
        //VStack(alignment: .center, spacing: 0){
           
        VStack {
            Form {
                    Section{
                        TextField("Name", text: $name)
                             //.frame(width: 200, height: 50)
                             .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        TextField("Phone", text: $phone)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                            //.frame(width: 200, height: 50)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        VStack (alignment: .center, spacing: 0){

                            TextEditor(text: .constant("Jl Malaka no 9 kelurahan munjul kecamatan cipayung 13850"))
                                .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.gray)
                                .padding()
                            NavigationLink(
                                destination: changeaddress(),
                                label: {
                                   Text("Change Address")
                                })
                                .padding(.all, 20)
                                .padding(.top, -5)
                        }
                        
                    }
                    Section {
                        Picker("Cage Size", selection: $selectedSize) {
                            ForEach(cageSizes, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    Section {
                        Picker("Payment Method", selection: $selectedPaymentMethod) {
                            ForEach(paymentMethods, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    Section {
                        Picker("Quantity", selection: $selectedQuantity) {
                            ForEach(quantities, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                   
                     
            }
            HStack(alignment: .center){
                           Button(action: {
                               print("Bye bye..")
                           }) {
                               Text("Back")
                                   .font(.title2)
                                   .bold()
                                   .padding()
                               
                           }
                           .padding()
                           Spacer()
                           Divider()
                               .background(Color(.black))
                           Spacer()
                           Button(action: {
                               print("Reviewing..")
                           }) {
                               NavigationLink(
                                destination: OrderReviewView(),
                                label: {
                                    Text("Review")
                                        .font(.title2)
                                        .bold()
                                        .padding()
                                })
                           }
                           .padding()
                       }
                       .frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                       
                       .foregroundColor(.white)
                       .background(Color("PrimaryColor"))
        }
        .background(Color("PrimaryColor"))
        .ignoresSafeArea()

    }
}

struct PetGroomingView_Previews: PreviewProvider {
    static var previews: some View {
        PetGroomingView()
    }
}

struct changeaddress: View {
    var body: some View{
        Text("JL malaka")
    }
}
