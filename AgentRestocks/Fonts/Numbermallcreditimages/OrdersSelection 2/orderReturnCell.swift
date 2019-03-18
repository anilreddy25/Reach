//
//  orderReturnCell.swift
//  AgentRestocks
//
//  Created by apple on 12/18/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class orderReturnCell: UITableViewCell {

   
    @IBOutlet weak var lblProductName: UILabel!
    
    @IBOutlet weak var lblQnty: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblApplied: UILabel!
    
    @IBOutlet weak var lblFreebie: UILabel!
    @IBOutlet weak var lblReturnReq: UILabel!
    
    @IBOutlet weak var imgFreebie: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
