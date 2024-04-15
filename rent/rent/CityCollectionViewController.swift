import UIKit
import CoreData

class CityCollectionViewController: UICollectionViewController {
    
    var cities: [City] = []
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCities()
    }
    
    func fetchCities() {
        let fetchRequest: NSFetchRequest<City> = City.fetchRequest()
        
        do {
            cities = try managedObjectContext.fetch(fetchRequest)
            collectionView.reloadData()
        } catch {
            print("Error fetching cities: \(error.localizedDescription)")
        }
    }
    
    // MARK: - UICollectionViewDataSource Methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cities", for: indexPath) as? CityCollectionViewCell else {
            fatalError("Unable to dequeue CityCell")
        }
        
        let city = cities[indexPath.item]
        cell.cityname.text = city.name
        cell.statename.text = city.state
        
        return cell
    }
}
