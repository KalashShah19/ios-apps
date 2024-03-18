//
//  ViewController.swift
//  gestures
//
//  Created by Kalash on 12/03/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(self.swiping))
        self.view.addGestureRecognizer(swipe)
        
        let touch = UITapGestureRecognizer(target: self, action: #selector(self.touching))
        self.view.addGestureRecognizer(touch)
    }
    
    @objc func touching(t: UITapGestureRecognizer){
        print("touching")
        let alert = UIAlertController(title: "Gesture", message: "Touched", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func swiping(g: UISwipeGestureRecognizer){
        print("swiping")
        let alert = UIAlertController(title: "Gesture", message: "Swipped", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
