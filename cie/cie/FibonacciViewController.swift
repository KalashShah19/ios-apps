//
//  FibonacciViewController.swift
//  cie
//
//  Created by bmiit on 15/04/24.
//

import UIKit

class FibonacciViewController: UIViewController {
    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet var results: UILabel!
    
       override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
       }
       
       // Function to check if a number is a Fibonacci number
       func isFibonacciNumber(_ number: Int) -> Bool {
           var a = 0
           var b = 1
           
           while b < number {
               let temp = b
               b += a
               a = temp
           }
           
           return b == number
       }
       
       @IBAction func checkButtonTapped(_ sender: UIButton) {
           guard let text = numberTextField.text, let number = Int(text) else {
               print("Invalid input")
               return
           }
           
           if isFibonacciNumber(number) {
               results.textColor = .green
               results.text = "YES"
           } else {
               results.textColor = .red
               results.text = "NO"
           }
       }
   }
