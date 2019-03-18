//
//  CompliantTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 20/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class CompliantTableViewCell: UITableViewCell {

    @IBOutlet weak var myHelpbutton: UIButton!
    @IBOutlet weak var Stockisnotmoving: UILabel!
    @IBOutlet weak var opnelabel: UILabel!
    @IBOutlet weak var ordernumberlabel: UILabel!
    @IBOutlet weak var stocklabel: UILabel!
    
    @IBOutlet weak var orderdatelabel: UILabel!
    
    @IBOutlet weak var compliantimagefinalvalue: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
