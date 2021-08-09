//
//  PetshopDetailView.swift
//  PetOceanV3
//
//  Created by Macbook on 30/07/21.
//

import SwiftUI

struct PetshopDetailView: View {
    @Binding var show: Bool
    @Binding var navBarHidden : Bool
    let data: PetshopData
    @Namespace var animation
    var newSafeArea = UIEdgeInsets()
    
    
    var body: some View {
        ZStack {
            
            VStack{
                HStack{
                    VStack(alignment: .leading) {
                        
                        Button(action: {
                            withAnimation(.easeOut){show.toggle()}
                            navBarHidden.toggle()
                            
                        }){
                            Image(systemName: "chevron.left.circle")
                                .font(Font.system(.title))
                                .foregroundColor(.white)
                            
                        }
                        //.position(x: 10, y: 50)
                        //.padding([.leading,.trailing], 8)
                        .padding(.bottom, 200)
                    }
                    Spacer(minLength: 0)
                }
//                .padding(.top, UIApplication.shared.windows.first?
//                            .safeAreaInsets.top)
                .padding()
                .background(
                    ServiceRemoteImage(urlString: data.imageUrl)
                        .scaledToFill()
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .matchedGeometryEffect(id: data.imageUrl, in: animation)
                    
                    
                )
                
                Spacer(minLength: 0)
                
                ZStack (alignment:.topTrailing){
                    VStack{
                        HStack{
                            VStack(alignment: .leading, spacing: 8){
                                Text(data.serviceName ?? "")
                                    .foregroundColor(.black)
                                    .fontWeight(.heavy)
                                    .font(.system(size: 25))
                                HStack(spacing: 2) {
                                    ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                                        Image("star")
                                            .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                            .foregroundColor(Color("PrimaryColor"))
                                    }
                                }
                                Text(data.serviceAddress ?? "")
                                    .font(.caption)
                                
                                HStack(spacing: 15){
                                    Text("vet")
                                    Text("grooming")
                                    Text("hotel")
                                    Text("shop")
                                }
                            }
                            Spacer()
                            
                            Text("Jakarta")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                        
                        Divider()
                        
                        
                        HStack{
                            VStack(alignment: .leading, spacing: 8){
                                Text("Description")
                                    .foregroundColor(.black)
                                    .fontWeight(.heavy)
                                    .font(.system(size: 25))
                                
                                Text(data.serviceDescription ?? "")
                                
                                
                            }
                            Spacer()
                            
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                        
                        
                    }
                    .frame(height: UIScreen.main.bounds.height / 2)
                    .padding()
                    .background(Color.white
                                    .clipShape(CustomShape()))
                }
                .offset(y: -50)
            }
            .background(Color(.white).ignoresSafeArea(.all, edges: .bottom))
        }
        .navigationBarHidden(true)
        
    }
}

struct PetshopDetailView_Previews: PreviewProvider {
    @Namespace private var animation: Namespace.ID
    static var previews: some View {
        
        PetshopDetailView(show: .constant(true), navBarHidden: .constant(false), data: PetshopData.dummyData)
    }
}
