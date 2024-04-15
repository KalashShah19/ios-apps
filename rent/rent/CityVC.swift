import UIKit
import CoreData

class CityVC: UIViewController {

    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var stateNameTextField: UITextField!
    
    // Managed object context to interact with Core Data
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let cityName = cityNameTextField.text, !cityName.isEmpty,
              let stateName = stateNameTextField.text, !stateName.isEmpty else {
            // Show alert or handle empty fields
            return
        }
        
        saveCity(cityName: cityName, stateName: stateName)
    }
    
    func saveCity(cityName: String, stateName: String) {
        let cityEntity = NSEntityDescription.entity(forEntityName: "City", in: managedObjectContext)!
        let city = NSManagedObject(entity: cityEntity, insertInto: managedObjectContext)
        city.setValue(cityName, forKey: "name")
        city.setValue(stateName, forKey: "state")
        
        do {
            try managedObjectContext.save()
            alert(message: "City saved successfully")
            cityNameTextField.text = ""
            stateNameTextField.text = ""
            
        } catch let error as NSError {
            alert(message: "Could not save city. \(error), \(error.userInfo)")
        }
    }
    
    func alert(message: String) {
            let alertController = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
}
