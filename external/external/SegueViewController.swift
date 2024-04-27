//
//  SegueViewController.swift
//  external
//
//  Created by bmiit on 27/04/24.
//

import UIKit
import CoreData

class SegueViewController: UIViewController {
    
    @IBOutlet var details: UITextView!
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var make = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func filter(make: String) {
        let fetchRequest: NSFetchRequest<Computers> = Computers.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "make == %@", make)

        do {
            let computers = try managedObjectContext.fetch(fetchRequest)
            
            for computer in computers {
                debugPrint("Model: \(computer.model!), Price: \(computer.price)")
                details.text += "Model: \(computer.model!), Price: \(computer.price)"
            }
            
        } catch {
            print("Error fetching computers: \(error.localizedDescription)")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
