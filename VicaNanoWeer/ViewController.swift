//
//  ViewController.swift
//  VicaNanoWeer
//
//  Created by vica valencia on 26/04/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    // reference managed object contect
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items:[StorageCategory]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.dataSource = self
        tableView.delegate = self
            
        fetchStorageCategory()
    }
    
    func fetchStorageCategory() {
        
        // Fetch the data from Core Data to display in the tableView
        do {
            self.items = try context.fetch(StorageCategory.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print(error)
        }
    }
        
    @IBAction func addTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Add Storage Category", message: "Customize based on your storage", preferredStyle: .alert)
        alert.addTextField()
        
        // Configure button handler
        let submitButton = UIAlertAction(title: "Add", style: .default) { (action) in
            
            // Get the textField for the alert
            let textField = alert.textFields![0]
            
            // Create object
            let newCategory = StorageCategory(context: self.context)
            newCategory.name = textField.text
            
            // Save data
            do {
                try self.context.save()
            } catch {
                print(error)
            }
            
            // Re-fetch the data
            self.fetchStorageCategory()
        }
        
        // Add button
        alert.addAction(submitButton)
        
        // Show alert
        self.present(alert, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return the number of StorageCategory
        return self.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StorageCategoryCell", for: indexPath)
        
        // Get StorageCategory from array and set the label
        let StorageCategory = self.items![indexPath.row]
        
        cell.textLabel?.text = StorageCategory.name
        
        return cell
    }
    
    // prepare segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toCategoryDetailsView" {
                if let indexpath = tableView.indexPathForSelectedRow{
                    
                    // manggil screen2
                    let detailVC = segue.destination as? CategoryViewController
                    detailVC?.titleLabel = items![indexpath.row].name!
                }
               
            }
        }
    
    // SELECT ROW
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        // pindah segue
        performSegue(withIdentifier: "toCategoryDetailsView", sender: self)
        
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // Create swipe action
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            
            // Which Storage Category to remove
            let storagecategoryToRemove = self.items![indexPath.row]
            
            // Remove the Storage Category
            self.context.delete(storagecategoryToRemove)
            
            // Save data
            do {
                try self.context.save()
            } catch {
                
            }
            
            // Re-fetch the data
            self.fetchStorageCategory()
        }
        
        // Create edit swipe action
        let action2 = UIContextualAction(style: .normal, title: "Edit") { (action, view, completionHandler) in
            
            // Selected StorageCategory
            let StorageCategory = self.items![indexPath.row]
            
            // Create alert -> move to next page
            let alert = UIAlertController(title: "Edit Storage Category", message: "Edit storage name", preferredStyle: .alert)
            alert.addTextField()
            
            let textField = alert.textFields![0]
            textField.text = StorageCategory.name
            
            // Configure button handler
            let saveButton = UIAlertAction(title: "Save", style: .default) { (action) in
                
                // Get the textfield for the alert
                let textField = alert.textFields![0]
                
                // Edit name property of StorageCategory object
                StorageCategory.name = textField.text
                
                // Save the data
                do {
                    try self.context.save()
                } catch {
                    
                }
                
                // Re-fetch the data
                self.fetchStorageCategory()
                
            }
            
            // Add button
            alert.addAction(saveButton)
            
            // Show alert
            self.present(alert, animated: true)
        }
        
        action2.backgroundColor = UIColor.orange
        
        // Return swipe actions
        return UISwipeActionsConfiguration(actions: [action, action2])
    }
}
