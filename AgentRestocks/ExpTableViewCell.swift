//
//  ExpTableViewCell.swift
//  ecom
//
//  Created by Prasad Rao on 20/9/18.
//  Copyright © 2018 Antza Technologies. All rights reserved.
//

import UIKit

class ExpTableViewCell: UITableViewCell {

    @IBOutlet var descp: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var name: UILabel!
    
    @IBOutlet weak var quantitylabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
