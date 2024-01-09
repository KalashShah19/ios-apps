//
//  ViewController.swift
//  classes
//
//  Created by bmiit on 09/01/24.
//

import UIKit

class Cars{
    var name = ""
    var model = ""
    var color = ""
    
    func setter(carName: String, carModel: String, carColor: String){
        name = carName
        model = carModel
        color = carColor
    }
}

class ViewController: UIViewController {
    var car = Cars()
   
    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtColor: UITextField!
    @IBOutlet var txtModel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func submit(_ sender: Any) {
        let name = txtName.text
        let model = txtModel.text
        let color = txtColor.text
        
//        car.name = name!
//        car.model = model!
//        car.color = color!
        
        car.setter(carName: name!, carModel: model!, carColor: color!)
        
    }
    
}

