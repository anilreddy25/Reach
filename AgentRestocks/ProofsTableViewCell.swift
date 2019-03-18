//
//  ProofsTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 25/08/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class ProofsTableViewCell: UITableViewCell {
    @IBOutlet weak var businesslabel: UILabel!
    
    @IBOutlet weak var businesstwo: UIView!
    @IBOutlet weak var businessone: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
