import UIKit
import CoreData

class ViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context = NSManagedObjectContext()
    
    @IBOutlet var LBLtitle: UILabel!
    @IBOutlet var LBLprice: UILabel!
    @IBOutlet var LBLname: UILabel!
    @IBOutlet var LBLcompany: UILabel!
    @IBOutlet var LBLdark: UILabel!
    @IBOutlet var text: UITextView!
    @IBOutlet var TXTname: UITextField!
    @IBOutlet var TXTcompany: UITextField!
    @IBOutlet var TXTprice: UITextField!
    @IBOutlet var `switch`: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        context = appDelegate.persistentContainer.viewContext
        fetchData()
        fetchTheme()
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
                text.text = "\nCar Company = \(company) \nName = \(name) \nPrice = \(price)"
            }
        }catch{
            debugPrint("Error in Fetch")
            print("Error in Fetch")
        }
    }
    
    func fetchTheme(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Theme")
        request.returnsObjectsAsFaults = false
        do{
            let result = try context.fetch(request)
            for data in result{
                let data = data as AnyObject
                let mode:Int = data.value(forKey: "dark") as! Int
                if(mode == 1){
                    `switch`.isOn = true
                    toggle()
                }
                else{
                    `switch`.isOn = false
                    toggle()
                }
            }
        }catch{
            debugPrint("Error in Fetch")
            print("Error in Fetch")
        }
    }
    
    @IBAction func save(_ sender: Any) {
        let name:String = String(TXTname.text!)
        let company:String = String(TXTcompany.text!)
        let price:Int? = Int(TXTprice.text!)
        
        let entity = NSEntityDescription.entity(forEntityName: "Cars", in: context)
        let car = NSManagedObject(entity: entity!, insertInto: context)
        car.setValue(name, forKey: "name")
        car.setValue(company, forKey: "company")
        car.setValue(price, forKey: "price")
        
        do{
            try context.save()
            fetchData()
        }catch{
            debugPrint("Can't save")
            print("Can't Save")
        }
    }
   
    func toggle(){
        if(`switch`.isOn){
            let screen = NSEntityDescription.entity(forEntityName: "Theme", in: context)
            let theme = NSManagedObject(entity: screen!, insertInto: context)
            theme.setValue(1, forKey: "dark")
            do{
                try context.save()
                print("Theme saved")
            }catch{
                debugPrint("Theme Can't save")
                print("Theme Can't Save")
            }
            
            self.view.backgroundColor = .black
            LBLdark.textColor = .white
            LBLname.textColor = .white
            LBLprice.textColor = .white
            LBLcompany.textColor = .white
            LBLtitle.textColor = .white
        }
        else{
            let screen = NSEntityDescription.entity(forEntityName: "Theme", in: context)
            let theme = NSManagedObject(entity: screen!, insertInto: context)
            theme.setValue(0, forKey: "dark")
            do{
                try context.save()
                print("Theme saved")
            }catch{
                debugPrint("Theme Can't save")
                print("Theme Can't Save")
            }
            
            self.view.backgroundColor = .white
            LBLdark.textColor = .black
            LBLname.textColor = .black
            LBLprice.textColor = .black
            LBLcompany.textColor = .black
            LBLtitle.textColor = .black
        }
    }
    
    @IBAction func dark(_ sender: Any) {
       toggle()
    }
    
}
