//
//  checkouttabelviewtwoTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 19/09/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import LocalAuthentication

class checkouttabelviewtwoTableViewCell: UITableViewCell {
    @IBOutlet weak var codviefinal: UIView!
    
    @IBOutlet weak var shopName: UILabel!
    @IBOutlet weak var itemslabel: UILabel!
    @IBOutlet weak var quantitylabel: UILabel!
    @IBOutlet weak var rupeeslabel: UILabel!
    
    @IBOutlet weak var chekmarkimageview: UIImageView!
    
    
    @IBOutlet weak var codLimitlabel: UILabel!
    
    @IBOutlet weak var ExedLimitrupes: UILabel!
    var select_index : Int!

    @IBOutlet weak var chekcoutfinaltwo: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
