//
//  BankTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 14/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class BankTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    @IBOutlet weak var Bankimageview: UIImageView!
    
    @IBOutlet weak var BankName: UILabel!
    
    
}
