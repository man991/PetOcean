//
//  API.swift
//  SwiftPetOcean
//
//  Created by Macbook on 21/07/21.
//

import Foundation

struct Api {
    
    //Production
    var baseURL = "https://petoceanapi.azurewebsites.net/api/"
    
    var getPetshopByCountry: String {
        return "\(baseURL)Petshop/GetPethopByCountry?countryid=28BE38BD-DF42-4CE3-97C6-F362D205B57C"
                          
    }
    
    var getTrainerByCountry: String {
        return "\(baseURL)Trainer/GetTrainerByCountry?countryid=28BE38BD-DF42-4CE3-97C6-F362D205B57C"
    }
    
    var getDoctorByCountry: String{
        return "\(baseURL)Doctor/GetDoctorByCountryID?countryid=28BE38BD-DF42-4CE3-97C6-F362D205B57C"
    }
    
    var authenticate: String{
        return "\(baseURL)User/Authenticate"
    }
    
    var getTopPetshop: String{
        return "\(baseURL)Petshop/GetTopPetshops?countryid=28BE38BD-DF42-4CE3-97C6-F362D205B57C"
    }
    
    var getTopTrainer: String{
        return "\(baseURL)Trainer/GetTopTrainer?countryid=28BE38BD-DF42-4CE3-97C6-F362D205B57C"
    }
    
    var getBreederList: String{
        return "\(baseURL)Breeder/GetBreederList?countryId=28BE38BD-DF42-4CE3-97C6-F362D205B57C"
    }
    
    var getRatingByServiceID: String{
        return "\(baseURL)Service/GetRatingList"
    }
    
    var register: String{
        return "\(baseURL)User/CreateUser"
    }
   
}
