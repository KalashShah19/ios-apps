//
//  TableViewController.swift
//  table
//
//  Created by Kalash on 04/03/24.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var table: UITableView!
    @IBOutlet var textInput: UITextField!
    
    @IBOutlet var footer: UIStackView!
    
    var data = [Cars(name: "Lamborghini", model: "Aventadar", price: 19000000),Cars(name: "Porche", model: "911 GTR", price: 5100000),Cars(name: "Audi", model: "A8", price: 8100000),Cars(name: "BMW", model: "M4", price: 6800000)]
    
    var arraydata = ["Lamborghini", "BMW", "Porche", "Audi"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
    }
    
   
    @IBAction func add(_ sender: Any) {
        arraydata.append(textInput.text!)
        textInput.text = ""
        table.reloadData()
        //let car = Cars(name: "", model: "", price: 0)
        //data.append(car)
    }
   
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return arraydata.count
        return arraydata.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath)
        cell.textLabel?.text = String(arraydata[indexPath.row])
        //cell.textLabel?.text = data[indexPath.row].CarName
        //cell.detailTextLabel?.text = data[indexPath.row].CarModel + " \n Price = " + data[indexPath.row].CarModel
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            arraydata.remove(at: indexPath.row)
            table.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Edit Car Name", message: "", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField(configurationHandler: { [self] (textField) -> Void in
            textField.text = String(self.arraydata[indexPath.row])
        })

        //3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { [weak alert] (action) -> Void in
            let textField = (alert?.textFields![0])! as UITextField
            let name = textField.text
            self.arraydata[indexPath.row] = name!
            self.table.reloadData()
            print("Data Updated")
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { [weak alert] (action) -> Void in
            print("Cancelled")
        }))

        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footer
    }

    @IBAction func AddAlert(_ sender: Any) {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Edit Car Name", message: "", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField(configurationHandler: { [self] (textField) -> Void in
            
        })

        //3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak alert] (action) -> Void in
            let textField = (alert?.textFields![0])! as UITextField
            self.arraydata.append(textField.text!)
            self.table.reloadData()
            print("Data Inserted")
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { [weak alert] (action) -> Void in
            print("Cancelled")
        }))

        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

