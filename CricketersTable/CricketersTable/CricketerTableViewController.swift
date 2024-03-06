//
//  TableViewController.swift
//  CricketersTable
//
//  Created by Kalash on 05/03/24.
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
        display()
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
        let alert = UIAlertController(title: "Enter Cricketer Details", message: "Name, Age, Matches, Innings, Runs, Not Outs", preferredStyle: .alert)

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
            self.display()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { [weak alert] (action) -> Void in
            print("Cancelled")
        }))

        self.present(alert, animated: true, completion: nil)
        
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            data.remove(at: indexPath.row)
            display()
            table.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Edit Cricketer Details", message: "Name, Age, Matches, Innings, Runs, Not Outs", preferredStyle: .alert)

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
            display()
            self.table.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { [weak alert] (action) -> Void in
            print("Cancelled")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }

    func display(){
        LBLplayers.text = "Cricketers : \(data.count)"
        
        let age:Double = Double(data.lazy.compactMap{ $0.age }.reduce(0, +) / data.count)
        LBLage.text = "Age : \(age)"
        
        let match:Double = Double(data.lazy.compactMap{ $0.matches }.reduce(0, +) / data.count)
        LBLmatches.text = "Matches : \(match)"
    }
        
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let alert = UIAlertController(title: "Cricketer Details", message: "Name, Age, Matches, Innings, Runs, Not Outs", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: { [self] (textField) -> Void in
            textField.text = data[indexPath.row].name
            textField.isUserInteractionEnabled = false
        })
        
        alert.addTextField(configurationHandler: { [self] (textField) -> Void in
            textField.text = String(data[indexPath.row].age)
            textField.isUserInteractionEnabled = false
        })
        
        alert.addTextField(configurationHandler: { [self] (textField) -> Void in
            textField.text = String(data[indexPath.row].matches)
            textField.isUserInteractionEnabled = false
        })
        
        alert.addTextField(configurationHandler: { [self] (textField) -> Void in
            textField.text = String(data[indexPath.row].innings)
            textField.isUserInteractionEnabled = false
        })

        alert.addTextField(configurationHandler: { [self] (textField) -> Void in
            textField.text = String(data[indexPath.row].runs)
            textField.isUserInteractionEnabled = false
        })
        
        alert.addTextField(configurationHandler: { [self] (textField) -> Void in
            textField.text = String(data[indexPath.row].notout)
            textField.isUserInteractionEnabled = false
        })
        
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { [weak alert] (action) -> Void in
            print("Showed")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
