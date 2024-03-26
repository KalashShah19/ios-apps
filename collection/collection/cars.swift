//
//  cars.swift
//  collection
//
//  Created by bmiit on 26/03/24.
//

import Foundation
import UIKit

struct Cars {
    let company : String
    let name : String
    let image : UIImage
}

let cars : [Cars] = [
    Cars(company: "Lamborghini", name: "Huracan", image: UIImage(named: "huracan")!)
]
