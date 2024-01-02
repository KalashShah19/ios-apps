//
//  ViewController.swift
//  adv quiz
//
//  Created by bmiit on 02/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var LBLquestion: UILabel!
    
    @IBOutlet var LBLresult: UILabel!
    
    @IBOutlet var TXTanswer: UITextField!
    
    @IBOutlet var BTNnext: UIButton!
    
    let questions: [String] = [
            "For which Devices Swift is used?",
            "What is the capital of India?",
            "What is Application made from?"
    ]
    
    let answers: [String] = [
            "ios",
            "delhi",
            "coding"
    ]
    
    var size = 0
    var current = 0
    var question = ""
    var correct = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        size = questions.count
        print("Size = \(size)")
        question = questions[current]
        correct = answers[current]
        LBLquestion.text = question
        BTNnext.isHidden = true
    }
    
    @IBAction func submit(_ sender: UIButton) {
        var input = TXTanswer.text;
        input = input?.lowercased()
        if(input == correct){
            LBLresult.textColor = UIColor.green
            LBLresult.text = "Great! Correct Answer"
            BTNnext.isHidden = false
        }
        else{
            correct = correct.uppercased()
            LBLresult.textColor = UIColor.red
            LBLresult.text = "Wrong Answer. Correct Answer is \n \(correct)"
            BTNnext.isHidden = false
        }
    }
    
    @IBAction func next(_ sender: Any) {
        current+=1
        if(current>=size)
        {
            LBLresult.textColor = UIColor.blue
            LBLresult.text = "Quiz Completed"
            BTNnext.isHidden = true
        }
        else{
            LBLresult.text = ""
            TXTanswer.text = ""
            question = questions[current]
            correct = answers[current]
            LBLquestion.text = question
        }
    }
}

