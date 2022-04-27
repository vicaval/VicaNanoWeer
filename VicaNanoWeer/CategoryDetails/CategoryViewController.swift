//
//  CategoryViewController.swift
//  VicaNanoWeer
//
//  Created by vica valencia on 26/04/22.
//

import UIKit

class CategoryViewController: UIViewController {
   
    @IBOutlet weak var categoryTitle: UILabel!
    
    var titleLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        categoryTitle.text = titleLabel
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
