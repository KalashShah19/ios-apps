//
//  ViewController.swift
//  quiz app
//
//  Created by bmiit on 01/01/24.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet var TXTquestion: UILabel!
    
    @IBOutlet var BTNshow: UIButton!
    
    @IBOutlet var TXTanswer: UILabel!
    
    @IBOutlet var BTNnext: UIButton!
    
    let questions: [String] = [
            "What is Swift?",
            "What is the capital of India?",
            "What is Application made from?"
    ]
    
    let answers: [String] = [
            "Programming Language for IOS",
            "Delhi",
            "Coding"
    ]
    
    var currentQuestionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TXTquestion.text = questions[currentQuestionIndex]
    }

    @IBAction func BTNnext(_ sender: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        let question: String = questions[currentQuestionIndex]
        TXTquestion.text = question
        TXTanswer.text = "Answer"
    }
    
   
    @IBAction func BTNshow(_ sender: UIButton) {
        let answer: String = answers[currentQuestionIndex]
            TXTanswer.text = answer
    }
}

