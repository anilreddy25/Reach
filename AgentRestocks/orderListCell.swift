//
//  orderListCell.swift
//  AgentRestocks
//
//  Created by apple on 9/19/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class orderListCell: UITableViewCell {

    @IBOutlet weak var lblDeliveryOn: UILabel!
   
    
    @IBOutlet weak var lblOrderNumber: UILabel!
    
    @IBOutlet weak var lblStoreName: UILabel!
    
    @IBOutlet weak var lblQuantityList: UILabel!
    
    @IBOutlet weak var lblDue: UILabel!
    
    
    @IBOutlet weak var lblValueOfOrder: UILabel!
    
    
    @IBOutlet weak var ordersvcfinal: UIView!
    
    
    @IBOutlet weak var numbermalltotal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
