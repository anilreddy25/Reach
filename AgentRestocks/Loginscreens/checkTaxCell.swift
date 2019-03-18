//
//  checkTaxCell.swift
//  AgentRestocks
//
//  Created by apple on 2/12/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit

class checkTaxCell: UITableViewCell {
    
    @IBOutlet weak var lblProductName: UILabel!
    
    
    @IBOutlet weak var lblQnty: UILabel!
    
    @IBOutlet weak var lblQprice: UILabel!
    
    
    @IBOutlet weak var btnTaxPrice: UIButton!
    
    @IBOutlet weak var btnUpAndDown: UIButton!
    
    @IBOutlet weak var lblText1: UILabel!
    @IBOutlet weak var lblText2: UILabel!

    @IBOutlet weak var lblText3: UILabel!
    
    @IBOutlet weak var lblValText1: UILabel!
    
    @IBOutlet weak var lblValText2: UILabel!
    
    @IBOutlet weak var lblValText3: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
