import UIKit
import CoreData

class ViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context = NSManagedObjectContext()
    
    @IBOutlet var text: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Cars", in: context)
        let car = NSManagedObject(entity: entity!, insertInto: context)
        car.setValue("Aventadar", forKey: "name")
        car.setValue("Lamborghini", forKey: "company")
        car.setValue(1900000, forKey: "price")
        
        do{
            try context.save()
            fetchData()
        }catch{
            debugPrint("Can't save")
            print("Can't Save")
        }
    }
    func fetchData(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Cars")
        request.returnsObjectsAsFaults = false
        do{
            let result = try context.fetch(request)
            for data in result{
                let data = data as AnyObject
                let name = data.value(forKey: "name") ?? ""
                let price = data.value(forKey: "price") ?? 0
                let company = data.value(forKey: "company") ?? ""
                text.text = "Car name = \(name) \n Company = \(company) \n Price = \(price)"
            }
        }catch{
            debugPrint("Error in Fetch")
            print("Error in Fetch")
        }
    }
}
