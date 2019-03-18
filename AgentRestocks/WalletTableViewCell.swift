//
//  WalletTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 25/09/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class WalletTableViewCell: UITableViewCell {
    
    @IBOutlet weak var walletimageview: UIImageView!
    
    @IBOutlet weak var wallettimelabel: UILabel!
    @IBOutlet weak var walletrupeeslabel: UILabel!
    @IBOutlet weak var walletName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
