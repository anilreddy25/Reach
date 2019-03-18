//
//  editFollowingCell.swift
//  AgentRestocks
//
//  Created by apple on 2/15/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit

class editFollowingCell: UITableViewCell {
    
    
    @IBOutlet weak var btnImgProfile: UIButton!
    
    
    @IBOutlet weak var lblProfileName: UILabel!
    
    
    @IBOutlet weak var lblReqMsg: UILabel!
    
    @IBOutlet weak var lblReqType: UILabel!
    
    
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var btnTypeAction: UIButton!
    
    @IBOutlet weak var btnNotifyme: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
