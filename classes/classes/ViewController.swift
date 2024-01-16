//
//  ViewController.swift
//  classes
//
//  Created by bmiit on 09/01/24.
//

import UIKit

class Cars{
    var name = ""
    var model = ""
    var color = ""
    
    func setter(carName: String, carModel: String, carColor: String){
        name = carName
        model = carModel
        color = carColor
    }
}

class ViewController: UIViewController {
    var car = Cars()
   
    @IBOutlet var output: UITextView!
    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtColor: UITextField!
    @IBOutlet var txtModel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.text = "Name | Model | Color \n"
    }
    
    @IBAction func submit(_ sender: Any) {
        let name = txtName.text
        let model = txtModel.text
        let color = txtColor.text
        
        car.setter(carName: name!, carModel: model!, carColor: color!)
        
        output.text += "\(car.name) \(car.model) \(car.color) \n"
        
        txtName.text = ""
        txtColor.text = ""
        txtModel.text = ""
    }

    
    @IBAction func search(_ sender: Any) {
        let name = txtName.text
        let model = txtModel.text
        let color = txtColor.text
        
        searchAndMakeBold(searchText: "\(name!) \(model!) \(color!) \n")
    }
    
    func searchAndMakeBold(searchText: String) {
           // Get the text from the UITextView
           let attributedText = NSMutableAttributedString(string: output.text)

           // Create a font with bold style
           let boldFont = UIFont.boldSystemFont(ofSize: output.font?.pointSize ?? UIFont.systemFontSize)

           // Search for the searchText in the text
           if let range = attributedText.string.range(of: searchText, options: .caseInsensitive) {
               // If found, apply bold font to the matching range
               let nsRange = NSRange(range, in: attributedText.string)
               attributedText.addAttribute(.font, value: boldFont, range: nsRange)
               // Update the attributedText of the UITextView
               output.attributedText = attributedText
           } else {
               // If not found, you can choose to do nothing or handle it as per your specific requirement
               // In this example, I'll simply clear the bold formatting
               output.attributedText = NSAttributedString(string: output.text)
           }
       }
    
    func removeText(searchText: String) {
        // Get the text from the UITextView
                var newText = output.text

                // Search for the searchText in the text
                if let range = newText!.range(of: searchText, options: .caseInsensitive) {
                    // If found, replace the matching text with an empty string
                    newText = newText!.replacingOccurrences(of: searchText, with: "", options: .caseInsensitive, range: range)
                    // Update the text of the UITextView
                    output.text = newText
                }
       }
    
    @IBAction func deleteText(_ sender: Any) {
        let name = txtName.text
        let model = txtModel.text
        let color = txtColor.text
       
        removeText(searchText: "\(name!) \(model!) \(color!) \n")
    }
}

