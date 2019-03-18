//
//  aagentListCell.swift
//  AgentRestocks
//
//  Created by apple on 2/7/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit

class aagentListCell: UITableViewCell {

    @IBOutlet weak var lblPaidOrder: UILabel!
    
    @IBOutlet weak var lblFreebeAmount: UILabel!
    
    @IBOutlet weak var lblNMorder: UILabel!
    
    @IBOutlet weak var lblDateTime: UILabel!
    
    @IBOutlet weak var lblExpireDetail: UILabel!
    
    @IBOutlet weak var btnUpandDown: UIButton!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
