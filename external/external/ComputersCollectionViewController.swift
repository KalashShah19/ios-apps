import UIKit
import CoreData

class ComputersCollectionViewController: UICollectionViewController {
    
    var computers: [Computers] = []
    
    @IBOutlet var CV: UICollectionView!
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchComputers()
        CV.dataSource = self
        CV.delegate = self
    }
    
    func fetchComputers() {
        let fetchRequest: NSFetchRequest<Computers> = Computers.fetchRequest()
        
        do {
            computers = try managedObjectContext.fetch(fetchRequest)
            collectionView.reloadData()
        } catch {
            print("Error fetching computers: \(error.localizedDescription)")
        }
    }
    
    // MARK: - UICollectionViewDataSource Methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return computers.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? ComputersCollectionViewCell else {
            fatalError("Unable to dequeue collectionCell")
        }
        
        let computer = computers[indexPath.item]
        cell.model.text = computer.model!
        cell.photo.image = UIImage(named: "mac")
        debugPrint(computer.model!)
        cell.photo.contentMode = .scaleToFill
        return cell
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let computer = computers[indexPath.item]
        let model:String = String(computer.model!)
        let price:String = String(computer.price)
        let make:String = String(computer.make!)
        let memory:String = String(computer.memory!)
        
        let alert = UIAlertController(title: "Info",
                                      message: "\nModel = \(model)\nPrice = \(price)\nMake = \(make)\nMemory = \(memory)",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)

    }
}
