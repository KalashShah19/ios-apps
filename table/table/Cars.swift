//
//  Cars.swift
//  table
//
//  Created by Kalash on 04/03/24.
//

import Foundation

class Cars {
    var CarName = ""
    var CarModel = ""
    var CarPrice = 0
    
    init(name:String, model:String, price:Int){
        CarName = name
        CarModel = model
        CarPrice = price
    }
    
    func edit(name:String, model:String, price:Int){
        CarName = name
        CarModel = model
        CarPrice = price
    }
}
