//
//  TicketDetailModel.swift
//  Bubilet
//
//  Created by Hilal Akgül on 15.02.2022.
//

import Foundation

 struct TicketModel {
     var date: String
     var time: String
     var locationFrom: String
     var locationTo: String
     var logo: String
     var price: Int
     var pnr : Int
     var soldSeats = [String]()
     
     init(date: String = "a", time: String = "a", locationfrom: String = "a", locationto: String = "a",logo: String = "a", price: Int = 0 , pnr : Int = 0 , soldSeats: [String] = [""]){
         self.date = date
         self.time = time
         self.locationFrom = locationfrom
         self.locationTo = locationto
         self.logo = logo
         self.price = price
         self.pnr = pnr
         self.soldSeats = soldSeats

     }
     

 }
