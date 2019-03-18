//
//  MenuTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 07/08/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    @IBOutlet weak var orderDomain: UILabel!
    @IBOutlet weak var cashlabel: UILabel!
    @IBOutlet weak var Menubarndview: UIView!
    @IBOutlet weak var applaylabel: UIButton!
    
    @IBOutlet weak var menuroundcircleview: UIView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
