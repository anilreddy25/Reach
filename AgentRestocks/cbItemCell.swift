//
//  cbItemCell.swift
//  AgentRestocks
//
//  Created by apple on 12/14/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class cbItemCell: UITableViewCell {

    
    @IBOutlet weak var lblProductName: UILabel!
    
    @IBOutlet weak var lblQnty: UILabel!
    
    @IBOutlet weak var lblPriceQnty: UILabel!
    @IBOutlet weak var cbItemValue: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
