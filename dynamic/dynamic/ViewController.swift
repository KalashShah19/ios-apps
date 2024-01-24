//
//  ViewController.swift
//  dynamic
//
//  Created by bmiit on 24/01/24.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    var mapView: MKMapView!
     override func loadView() {
         // Create a map view
         mapView = MKMapView()
         // Set it as *the* view of this view controller
         view = mapView
     }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("DONE")
           view = mapView
        let segmentedControl
                = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor
                = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        let topConstraint =
            segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor,
        constant: 8)
        let leadingConstraint
                = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailingConstraint
                = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }
}

