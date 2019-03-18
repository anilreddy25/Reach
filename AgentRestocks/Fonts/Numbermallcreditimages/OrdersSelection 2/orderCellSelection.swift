//
//  orderCellSelection.swift
//  AgentRestocks
//
//  Created by apple on 12/18/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class orderCellSelection: UITableViewCell {

    @IBOutlet weak var lblProductName: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblQnty: UILabel!
    
    @IBOutlet weak var imgFreebie: UIImageView!
    @IBOutlet weak var lblFreebie: UILabel!
    @IBOutlet weak var lblApplied: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
