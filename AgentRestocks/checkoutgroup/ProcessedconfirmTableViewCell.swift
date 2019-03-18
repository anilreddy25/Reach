//
//  ProcessedconfirmTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 28/11/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class ProcessedconfirmTableViewCell: UITableViewCell {

    @IBOutlet weak var productname: UILabel!
    
    @IBOutlet weak var productamount: UILabel!
    
    @IBOutlet weak var stockoutlabel: UILabel!
    
    @IBOutlet weak var itemslabel: UILabel!
    
    @IBOutlet weak var quantitylabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
