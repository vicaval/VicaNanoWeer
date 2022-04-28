//
//  CategoryViewController.swift
//  VicaNanoWeer
//
//  Created by vica valencia on 26/04/22.
//

import UIKit

class CategoryViewController: UIViewController {
    
   // custom cell category details
    @IBOutlet weak var itemsView: UITableView!
    @IBOutlet weak var itemsTableView: UITableView!
    
    
    @IBOutlet weak var categoryTitle: UILabel!
    
    var titleLabel = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        categoryTitle.text = titleLabel
        
        // custom table view
        
    }
    
    
}
