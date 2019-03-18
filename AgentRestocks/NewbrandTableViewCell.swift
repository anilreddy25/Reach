//
//  NewbrandTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 08/08/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class NewbrandTableViewCell: UITableViewCell {
    @IBOutlet weak var NewBrandview: UIView!
    @IBOutlet weak var NewBrandname: UILabel!
    @IBOutlet weak var addNewbutton: UIButton!
    
    @IBOutlet weak var Newproductoriginalprize: UILabel!
    @IBOutlet weak var NEwBrandimage: UIImageView!
    
    @IBOutlet weak var productsitemcalculation: UILabel!
    
    @IBOutlet weak var productprizelabel: UILabel!
    
    @IBOutlet weak var Productstrucklabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
  
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
