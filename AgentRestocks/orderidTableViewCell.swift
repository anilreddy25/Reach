//
//  orderidTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 20/09/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class orderidTableViewCell: UITableViewCell {
    @IBOutlet weak var popconname: UILabel!
    
    @IBOutlet weak var quantitylabel: UILabel!
    @IBOutlet weak var sellernamelabel: UILabel!
    @IBOutlet weak var rupeesproduct: UILabel!
    
    @IBOutlet weak var returnedlabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
