//
//  LoyalityTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 26/09/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class LoyalityTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var Mothbutton: UIButton!
    
    
    @IBOutlet weak var earnedbonuslabel: UILabel!
    
    @IBOutlet weak var offerrupeeslabel: UILabel!
    
    @IBOutlet weak var totalrupesslabel: UILabel!
    
    @IBOutlet weak var totalpercentagelabel: UILabel!
    
    @IBOutlet weak var achivedlabel: UILabel!
    
    @IBOutlet weak var targetbonuslabel: UILabel!
    
}
