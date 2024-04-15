import UIKit
import CoreData

class CollectionViewController: UICollectionViewController {
    
    // Array to hold fetched properties
    var properties: [Property] = []
    
    // Managed object context to interact with Core Data
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetch properties from Core Data
        fetchProperties()
    }
    
    func fetchProperties() {
        let fetchRequest: NSFetchRequest<Property> = Property.fetchRequest()
        
        do {
            properties = try managedObjectContext.fetch(fetchRequest)
            collectionView.reloadData()
        } catch {
            print("Error fetching properties: \(error.localizedDescription)")
        }
    }
    
    // MARK: - UICollectionViewDataSource Methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return properties.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let property = properties[indexPath.item]
            displayAlert(for: property)
        }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else {
            fatalError("Unable to dequeue PropertyCell")
        }
        
        let property = properties[indexPath.item]
        cell.name.text = property.name
        cell.city.text = property.city

        return cell
    }
    
    func displayAlert(for property: Property) {
        debugPrint(property)
            let alertController = UIAlertController(title: "Property Details", message: "Name: \(property.name)\nSQF: \(property.sqf)\nType: \(property.type)\nCity: \(property.city)", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 20 // Adjust for spacing
        return CGSize(width: width, height: 100) // Adjust height as needed
    }
    
    func search(forCity city: String) {
           let fetchRequest: NSFetchRequest<Property> = Property.fetchRequest()
           fetchRequest.predicate = NSPredicate(format: "city == %@", city)
           
           do {
               properties = try managedObjectContext.fetch(fetchRequest)
               collectionView.reloadData()
           } catch {
               print("Error fetching properties: \(error.localizedDescription)")
           }
       }
    
    
}
