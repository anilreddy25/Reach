
//
//  freebieCellAgent.swift
//  AgentRestocks
//
//  Created by apple on 2/8/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit

class freebieCellAgent: UITableViewCell {


    @IBOutlet weak var btnScratch: UIButton!
    
    @IBOutlet weak var lblCbAmount: UILabel!
    @IBOutlet weak var lblOwnVal: UILabel!
    
    @IBOutlet weak var lblWalletDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
