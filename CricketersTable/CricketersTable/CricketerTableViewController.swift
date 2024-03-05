//
//  TableViewController.swift
//  CricketersTable
//
//  Created by bmiit on 05/03/24.
//

import UIKit

class CricketerTableViewController: UITableViewController {

    @IBOutlet var BTNadd: UIButton!
    
    @IBOutlet var table: UITableView!
    
    @IBOutlet var LBLplayers: UILabel!
    
    @IBOutlet var LBLage: UILabel!
        
    @IBOutlet var LBLmatches: UILabel!
    
    var data = [Cricketer(nam: "MS Dhoni", a: 34, m: 500,inn: 1100, run: 13000, not: 250),Cricketer(nam: "Sachin Tendulkar", a: 38, m: 600,inn: 1230, run: 15000, not: 350),Cricketer(nam: "Yuvraj Singh", a: 30, m: 300, inn: 1100, run: 6000, not: 50),Cricketer(nam: "Suryakumar Yadav", a: 28, m: 230,inn: 150, run: 1000, not: 20)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        
        
        
        LBLplayers.text = "Players : \(data.count)"
        LBLage.text = "Avg Age : \(age)"
        LBLmatches.text = "Avg Matches = "
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath)
        
//        let innings:Double = Double(data[indexPath.row].innings)
//        let runs:Double = Double(data[indexPath.row].runs)
//        let notout:Double = Double(data[indexPath.row].notout)
//        let avg:Double = Double(runs/(innings - notout))
        
        cell.textLabel?.text = " Name : \(data[indexPath.row].name)"
        cell.detailTextLabel?.text = "Average Batting = \(data[indexPath.row].average)"
        
        return cell
    }
    
    @IBAction func add(_ sender: Any) {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Enter Cricketer Details", message: "", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField(configurationHandler: { [self] (textField) -> Void in
            textField.placeholder = "Enter Name"
        })
        
        alert.addTextField(configurationHandler: { [self] (textField) -> Void in
            textField.placeholder = "Enter Age"
        })
        
        alert.addTextField(configurationHandler: { [self] (textField) -> Void in
            textField.placeholder = "Enter Matches "
        })
        
        alert.addTextField(configurationHandler: { [self] (textField) -> Void in
            textField.placeholder = "Enter Innings"
        })

        alert.addTextField(configurationHandler: { [self] (textField) -> Void in
            textField.placeholder = "Enter Runs"
        })
        
        alert.addTextField(configurationHandler: { [self] (textField) -> Void in
            textField.placeholder = "Enter Not Outs"
        })
        
        //3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak alert] (action) -> Void in
            let TXTname = (alert?.textFields![0])!
            let TXTage = (alert?.textFields![1])!
            let TXTmatches = (alert?.textFields![2])!
            let TXTinnings = (alert?.textFields![3])!
            let TXTruns = (alert?.textFields![4])!
            let TXTnotout = (alert?.textFields![5])!
            
            let player = Cricketer(nam:TXTname.text!, a: Int(TXTage.text!)!, m: Int(TXTmatches.text!)!,inn: Int(TXTinnings.text!)!, run: Int(TXTruns.text!)!, not: Int(TXTnotout.text!)!)
            
            self.data.append(player)
            print("Player Inserted")
            self.table.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { [weak alert] (action) -> Void in
            print("Cancelled")
        }))

        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
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
            data.remove(at: indexPath.row)
            table.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Edit Cricketer Details", message: "", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField(configurationHandler: { [self] (textField) -> Void in
            textField.text = data[indexPath.row].name
        })
        
        alert.addTextField(configurationHandler: { [self] (textField) -> Void in
            textField.text = String(data[indexPath.row].age)
        })
        
        alert.addTextField(configurationHandler: { [self] (textField) -> Void in
            textField.text = String(data[indexPath.row].matches)
        })
        
        alert.addTextField(configurationHandler: { [self] (textField) -> Void in
            textField.text = String(data[indexPath.row].innings)
        })

        alert.addTextField(configurationHandler: { [self] (textField) -> Void in
            textField.text = String(data[indexPath.row].runs)
        })
        
        alert.addTextField(configurationHandler: { [self] (textField) -> Void in
            textField.text = String(data[indexPath.row].notout)
        })
        
        //3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { [self, weak alert] (action) -> Void in
            let TXTname = (alert?.textFields![0])!
            let TXTage = (alert?.textFields![1])!
            let TXTmatches = (alert?.textFields![2])!
            let TXTinnings = (alert?.textFields![3])!
            let TXTruns = (alert?.textFields![4])!
            let TXTnotout = (alert?.textFields![5])!
            
            data[indexPath.row].name = TXTname.text!
            data[indexPath.row].matches = Int(TXTmatches.text!)!
            data[indexPath.row].runs = Int(TXTruns.text!)!
            data[indexPath.row].innings = Int(TXTinnings.text!)!
            data[indexPath.row].age = Int(TXTage.text!)!
            data[indexPath.row].notout = Int(TXTnotout.text!)!
            
            print("Player Updated")
            self.table.reloadData()
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
