//
//  ComputersViewController.swift
//  external
//
//  Created by bmiit on 27/04/24.
//

import UIKit
import CoreData

class ComputersViewController: UIViewController {

    @IBOutlet var TXTmodel: UITextField!
    
    @IBOutlet var TXTprice: UITextField!
    
    @IBOutlet var TXTmake: UITextField!
    
    @IBOutlet var TXTmemory: UITextField!
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func add(_ sender: Any) {
        guard let model = TXTmodel.text, !model.isEmpty,
              let pricetxt = TXTprice.text, !pricetxt.isEmpty,
              let memory = TXTmemory.text,  let price = Int(pricetxt),!memory.isEmpty,
                let make = TXTmake.text, !make.isEmpty
                else {
                  alert(message: "Please enter all required fields.")
                  return
        }
        addComputer(model: model, price: price, make: make, memory: memory)
    }

    func addComputer(model: String, price: Int, make: String, memory: String) {
        let computer = NSEntityDescription.entity(forEntityName: "Computers", in: managedObjectContext)!
        let property = NSManagedObject(entity: computer, insertInto: managedObjectContext)
        property.setValue(model, forKey: "model")
        property.setValue(price, forKey: "price")
        property.setValue(make, forKey: "make")
        property.setValue(memory, forKey: "memory")
        
        do {
            try managedObjectContext.save()
            alert(message: "Computer Added successfully")
            TXTmake.text = ""
            TXTprice.text = ""
            TXTmodel.text = ""
            TXTmemory.text = ""
        } catch let error as NSError {
            alert(message: "Could not add computer. \(error), \(error.userInfo)")
        }
    }
    
    func alert(message: String) {
            let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
}
