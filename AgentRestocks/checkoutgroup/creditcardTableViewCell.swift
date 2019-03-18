//
//  creditcardTableViewCell.swift
//  ecom
//
//  Created by Azharuddin on 18/12/18.
//  Copyright © 2018 Antza Technologies. All rights reserved.
//

import UIKit

class creditcardTableViewCell: UITableViewCell {

    @IBOutlet weak var Venkataramana: UILabel!
    @IBOutlet weak var order: UILabel!
    @IBOutlet weak var ClosingBalance: UILabel!
    
    @IBOutlet weak var rupeeslabel: UILabel!
    @IBOutlet weak var creditcardusedfor: UILabel!
    @IBOutlet weak var timinglabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
