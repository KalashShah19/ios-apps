//
//  ViewController.swift
//  collection
//
//  Created by bmiit on 20/03/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var CollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CollectionView.dataSource = self
    }


}

extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}

