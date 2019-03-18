//
//  MenutwoTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 29/11/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class MenutwoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var walletlabel: UILabel!
    
    @IBOutlet weak var rupeeslabel: UILabel!
    
    @IBOutlet weak var freebeeexpire: UIButton!
    
    @IBOutlet weak var menuviewfinal: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.menuviewfinal.layer.cornerRadius = self.menuviewfinal.frame.height/2
         self.menuviewfinal.clipsToBounds = true
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
