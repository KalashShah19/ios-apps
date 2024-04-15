import UIKit
import CoreData

class PropertyVC: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sqfTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    
    // Array to hold fetched names from Core Data
    var names: [String] = [""]
    var vcity:String = ""
    
    // Managed object context to interact with Core Data
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        fetchNames()
//        deleteAllData("Property")
    }

    func fetchNames() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "City")
        
        do {
            let results = try managedObjectContext.fetch(fetchRequest)
            for result in results as! [NSManagedObject] {
                if let name = result.value(forKey: "name") as? String {
                    names.append(name)
                }
            }
            
            pickerView.reloadAllComponents()
        } catch let error as NSError {
            print("Fetch error: \(error), \(error.userInfo)")
        }
    }
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let name = nameTextField.text, !name.isEmpty,
              let sqfString = sqfTextField.text, let sqf = Double(sqfString),
              let type = typeTextField.text, !type.isEmpty
                else {
                  alert(message: "Please enter all required fields.")
                  return
        }
        let city = names[pickerView.selectedRow(inComponent: 0)]
        debugPrint(city)
        saveProperty(name: name, sqf: sqf, type: type, city: city)
    }

    func saveProperty(name: String, sqf: Double, type: String, city: String) {
        let propertyEntity = NSEntityDescription.entity(forEntityName: "Property", in: managedObjectContext)!
        let property = NSManagedObject(entity: propertyEntity, insertInto: managedObjectContext)
        property.setValue(name, forKey: "name")
        property.setValue(sqf, forKey: "sqf")
        property.setValue(type, forKey: "type")
        property.setValue(city, forKey: "city")
        
        do {
            try managedObjectContext.save()
            alert(message: "Property saved successfully")
        } catch let error as NSError {
            alert(message: "Could not save property. \(error), \(error.userInfo)")
        }
    }
    
    func alert(message: String) {
            let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    
}



// MARK: - UIPickerViewDataSource Methods
extension PropertyVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return max(names.count, 1) // At least one row to show "No Entry"
    }
}

// MARK: - UIPickerViewDelegate Methods
extension PropertyVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if names.isEmpty {
            return "No Entry"
        } else {
            return names[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if !names.isEmpty {
            let vcity = names[row]
            print("Selected name: \(vcity)")
            
        } else {
            print("No names available")
        }
    }

    
    func deleteAllData(_ entity:String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try managedObjectContext.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                managedObjectContext.delete(objectData)
            }
        } catch let error {
            debugPrint("Detele all data in \(entity) error :", error)
        }
    }
}
