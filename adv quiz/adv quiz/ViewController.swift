//
//  ViewController.swift
//  adv quiz
//
//  Created by bmiit on 02/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var img: UIImageView!
    
    @IBOutlet var LBLquestion: UILabel!
    
    @IBOutlet var LBLresult: UILabel!
    
    @IBOutlet var TXTanswer: UITextField!
    
    @IBOutlet var BTNnext: UIButton!
    
    @IBOutlet var LBLcount: UILabel!
    
    @IBOutlet var BTNshow: UIButton!
    
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
    var count = 0
    var question = ""
    var correct = ""
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        img.isHidden = true
        size = questions.count
        //print("Size = \(size)")
        question = questions[current]
        correct = answers[current]
        LBLquestion.text = question
        BTNnext.isHidden = true
        count = current + 1
        LBLcount.text = "\(count)/\(size)"
    }
    
    @IBAction func submit(_ sender: UIButton) {
        BTNshow.isHidden = true
        var input = TXTanswer.text;
        input = input?.lowercased()
        if(input == correct){
            LBLresult.textColor = UIColor.green
            LBLresult.text = "Great! Correct Answer"
            BTNnext.isHidden = false
            score+=1
        }
        else{
            BTNshow.isHidden = true
            correct = correct.uppercased()
            LBLresult.textColor = UIColor.red
            LBLresult.text = "Wrong Answer. Correct Answer is \n \(correct)"
            BTNnext.isHidden = false
        }
    }
    
    @IBAction func next(_ sender: Any) {
        BTNnext.isHidden = true
        BTNshow.isHidden = false
        current+=1
        if(count==size-1)
        {
            LBLresult.text = ""
            TXTanswer.text = ""
            question = questions[current]
            correct = answers[current]
            LBLquestion.text = question
            BTNnext.setTitle("Result", for: .normal)
            count = current + 1
            LBLcount.text = "\(count)/\(size)"
        }
        else if(count==size)
        {
            img.isHidden = false
            LBLresult.textColor = UIColor.blue
            LBLresult.text = "Your Score is \(score) / \(size)"
            LBLquestion.isHidden = true
            BTNshow.isHidden = true
            LBLcount.isHidden = true
            LBLresult.minimumScaleFactor = 1
        }
        else{
            LBLresult.text = ""
            TXTanswer.text = ""
            question = questions[current]
            correct = answers[current]
            LBLquestion.text = question
            count = current + 1
            LBLcount.text = "\(count)/\(size)"
        }
    }
}

