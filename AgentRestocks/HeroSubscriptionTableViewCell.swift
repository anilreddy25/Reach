//
//  HeroSubscriptionTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 18/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class HeroSubscriptionTableViewCell: UITableViewCell {
    @IBOutlet weak var HeroName: UILabel!
    @IBOutlet weak var rupeeslabel: UILabel!
    
    @IBOutlet weak var periodlabel: UILabel!
    
    @IBOutlet weak var editcartbutton: UIButton!
    
    @IBOutlet weak var editcartcount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
