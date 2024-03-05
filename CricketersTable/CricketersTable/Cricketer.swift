//
//  Cricketer.swift
//  CricketersTable
//
//  Created by bmiit on 05/03/24.
//

import Foundation

class Cricketer {
    var name:String
    var age:Int
    var matches:Int
    var innings:Int
    var runs:Int
    var notout:Int
    var average:Double {
        get {
            let value = Double(self.runs) / (Double(self.innings - self.notout))
            return value
        }
    }
    
    init(nam:String, a:Int, m:Int, inn:Int, run:Int, not:Int){
        name = nam
        age = a
        matches = m
        innings = inn
        runs = run
        notout = not
    }
}
