//
//  OrderReviewView.swift
//  PetOceanV3
//
//  Created by Macbook on 13/08/21.
//

import SwiftUI

struct OrderReviewView: View {
    @State var isOrdering = false
    var body: some View {
        VStack {
            Form{
                
                Section{
                    VStack(alignment: .leading, spacing: 10){
                        Text("Service Type")
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text("Cage Cleaning")
                            .foregroundColor(.gray)
                        
                    }
                    VStack(alignment: .leading, spacing: 10){
                        Text("Destination")
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text("Ade Putra - 081288908489")
                            .foregroundColor(.gray)
                        Text("Jl Malaka no 9")
                            .foregroundColor(.gray)
                    }
                    VStack(alignment: .leading, spacing: 10){
                        Text("Appoinment Time")
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text("Saturday, 28 August 2021")
                            .foregroundColor(.gray)
                        Text("17:00")
                            .foregroundColor(.gray)
                    }
                    VStack(alignment: .leading, spacing: 10){
                        Text("Order Details")
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Spacer()
                        Text("Cat")
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                        HStack {
                            Text("(<-1 Tahun) Kitten")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("1")
                        }
                        
                        Text("Basic Grooming")
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                        HStack(alignment: .lastTextBaseline) {
                            Text("Full Bath With Shampoo + nail Clip + Toothbrush + Merapihkan bulu di kaki")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("Rp 120.000")
                        }
                    }
                    VStack(alignment: .leading) {
                        HStack{
                            Text("Total")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color("PrimaryColor"))
                            Spacer()
                            Text("Rp 120.000")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color("PrimaryColor"))
                        }
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                        VStack(alignment: .leading, spacing: 15){
                            Text("Payment Method")
                                .font(.title2)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Text("Cash")
                                .foregroundColor(.gray)
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
                               print("Ordering..")
                            self.isOrdering.toggle()
                           }) {
                               Text("Order Now")
                                   .font(.title2)
                                   .bold()
                                   .padding()
                           }
                           .padding()
                           .sheet(isPresented: $isOrdering , content: {
                                SuccessView()
                           })
                       }
                       .frame(height: 50, alignment: .center)
                       .foregroundColor(.white)
                       .background(Color("PrimaryColor"))
        }
        .background(Color("PrimaryColor"))
        .ignoresSafeArea()
    }
}

struct OrderReviewView_Previews: PreviewProvider {
    static var previews: some View {
        OrderReviewView()
    }
}
