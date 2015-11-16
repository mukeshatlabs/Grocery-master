//
//  ProductCell.swift
//  Grocery
//
//  Created by Mukesh Jain on 11/5/15.
//  Copyright © 2015 walmart. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var nameLable: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var prodImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
