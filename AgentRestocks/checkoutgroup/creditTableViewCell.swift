//
//  creditTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 28/11/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class creditTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBOutlet weak var mycheckmarkbutton: UIButton!
    
    @IBOutlet weak var numbernallname: UILabel!
    
    @IBOutlet weak var availabelcreditlabel: UILabel!
    
    @IBOutlet weak var rupesslabel: UILabel!
}
