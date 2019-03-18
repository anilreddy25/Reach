//
//  CheckoutTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 18/09/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class CheckoutTableViewCell: UITableViewCell {
    @IBOutlet weak var shopName: UILabel!
    @IBOutlet weak var itemslabel: UILabel!
    @IBOutlet weak var quantitylabel: UILabel!
    
    @IBOutlet weak var checknmark: UIButton!
    
    @IBOutlet weak var rupeeslabel: UILabel!
    
    @IBOutlet weak var chekmarkimageview: UIImageView!
       var select_index : Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBAction func checkMarkbutton(_ sender: UIButton)
    {
        
    }
    
}
