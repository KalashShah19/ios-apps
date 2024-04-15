import UIKit
import CoreData

class SearchViewController: UIViewController{

    @IBOutlet weak var pickerView: UIPickerView!
   
    @IBOutlet var output: UITextView!
    
    var properties: [String] = []

    // Array to hold city names
    var cities: [String] = [""]

    // Managed object context to interact with Core Data
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
        
        fetchCities()
    }

    func fetchCities() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "City")
        
        do {
            let results = try managedObjectContext.fetch(fetchRequest)
            for result in results as! [NSManagedObject] {
                if let name = result.value(forKey: "name") as? String {
                    cities.append(name)
                }
                          }
            
            pickerView.reloadAllComponents()
        } catch let error as NSError {
            print("Fetch error: \(error), \(error.userInfo)")
        }
    }

    func fetchProperties(forCity city: String) {
        output.text = ""
        properties = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Property")
        fetchRequest.predicate = NSPredicate(format: "city = %@", city)
        do {
            let results = try managedObjectContext.fetch(fetchRequest)
            debugPrint(results.count)
            for result in results as! [NSManagedObject] {
                if let name = result.value(forKey: "name") as? String {
                    properties.append(name)
                    debugPrint(properties.count)
                    let arrayAsString = properties.joined(separator: "\n")

                    output.text = arrayAsString
                }
            }
        } catch let error as NSError {
            print("Fetch error: \(error), \(error.userInfo)")
        }
        print("fetched")
    }
    
}

// MARK: - UIPickerViewDataSource Methods
extension SearchViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
}

// MARK: - UIPickerViewDelegate Methods
extension SearchViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCity = cities[row]
        debugPrint(selectedCity)
        fetchProperties(forCity: selectedCity)
    }
}

