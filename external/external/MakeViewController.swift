//
//  MakeViewController.swift
//  external
//
//  Created by bmiit on 27/04/24.
//

import UIKit
import CoreData

class MakeViewController: UIViewController {

    @IBOutlet var TV: UITableView!
    var makes:[Computers] = []
    var details : String = ""
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TV.delegate = self
        TV.dataSource = self
        fetchMakes()
//        deleteData()
    }
    
    func deleteData() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Computers")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try managedObjectContext.execute(deleteRequest)
        } catch {
            
        }
    }
    
    func fetchMakes() {
        let fetchRequest: NSFetchRequest<Computers> = Computers.fetchRequest()
        fetchRequest.returnsDistinctResults = true
        do {
            makes = try managedObjectContext.fetch(fetchRequest)
//            debugPrint(makes)
        } catch {
            print("Error fetching computers: \(error.localizedDescription)")
        }
    }
}

extension MakeViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return makes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell")
        cell?.textLabel!.text = makes[indexPath.row].make
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let make = makes[indexPath.row].make!
        filter(make: make)
        
    }

    func filter(make: String) {
        let fetchRequest: NSFetchRequest<Computers> = Computers.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "make == %@", make)

        do {
            let computers = try managedObjectContext.fetch(fetchRequest)
            
            for computer in computers {
                debugPrint("Model: \(computer.model!), Price: \(computer.price) Memory: \(computer.memory!)")
                details += "Model: \(computer.model!), Price: \(computer.price) Memory: \(computer.memory!)\n"
            }
            alert(message: details)
            details = ""
        } catch {
            print("Error fetching computers: \(error.localizedDescription)")
        }
    }

    func alert(message: String) {
            let alertController = UIAlertController(title: "Make wise Computers", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Back", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }

   
}
