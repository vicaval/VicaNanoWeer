//
//  CustomTableViewCell.swift
//  VicaNanoWeer
//
//  Created by vica valencia on 28/04/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var itemsView: UIView!
    @IBOutlet weak var itemsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
