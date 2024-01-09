//
//  ViewController.swift
//  cars
//
//  Created by bmiit on 08/01/24.
//

import UIKit

struct Cars {
    var Name=""
    var Model=""
    var Price=0
    var image=""
    
    mutating func setter(carName:String, carModel:String, carPrice: Int){
        Name = carName
        Model = carModel
        Price = carPrice
    }
    
    func getter(){
        print("Car Name = \(Name), Model = \(Model) and Price = \(Price)")
    }
    
}

class SportsCar : Equatable {
    var name = ""
    var model = ""
    var price = 0
    
    
    static func == (lhs: SportsCar, rhs: SportsCar) -> Bool {
        return lhs.price == rhs.price
    }
    
    func setter(carName:String, carModel:String, carPrice: Int){
        name = carName
        model = carModel
        price = carPrice
    }
    
    func getter(){
        print("Car Name = \(name), Model = \(model) and Price = \(price)")
    }
}


class ViewController: UIViewController {
    var superCar = Cars()
    var sportsCar1 = SportsCar()
    var sportsCar2 = SportsCar()
    
    @IBOutlet var switchDark: UISwitch!
    @IBOutlet var LBLtitle: UILabel!
    @IBOutlet var TXTinput: UITextField!
    @IBOutlet var image: UIImageView!
    @IBOutlet var LBLdark: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Structure Implementation")
        
        superCar.setter(carName: "Audi", carModel: "R8", carPrice: 5000000)
        superCar.getter()
        
        print("Class Implementation")
        sportsCar1.setter(carName: "Lamboghini", carModel: "URUS", carPrice: 5000000)
        sportsCar1.getter()
        
        sportsCar2.setter(carName: "Lamboghini", carModel: "URUS", carPrice: 5000000)
        
        print("Equatable")
        if(sportsCar1 == sportsCar2){
            print("Same Price")
        }
        
        LBLtitle.text = "Super Cars"
    }

    @IBAction func toggle(_ sender: Any) {
        if(switchDark.isOn){
            view.backgroundColor = UIColor.black
            LBLtitle.textColor = UIColor.white
            LBLdark.textColor = UIColor.white
            TXTinput.backgroundColor = UIColor.white
        }
        else{
            view.backgroundColor = UIColor.white
            LBLtitle.textColor = UIColor.black
            LBLdark.textColor = UIColor.black
            TXTinput.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func audi(_ sender: Any) {
        image.image = UIImage(named:"audi a8")
    }
    
    @IBAction func porche(_ sender: Any) {
        image.image = UIImage(named:"porche 911")
    }
    
    @IBAction func bugatti(_ sender: Any) {
        image.image = UIImage(named:"bugatti chiron")
    }
    
    @IBAction func bmw(_ sender: Any) {
        image.image = UIImage(named:"bmw m2")
    }
    
    @IBAction func typing(_ sender: Any) {
//        let text = TXTinput.text
        
    }
}

