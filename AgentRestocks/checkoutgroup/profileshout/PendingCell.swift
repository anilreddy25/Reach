//
//  PendingCell.swift
//  AgentRestocks
//
//  Created by apple on 12/21/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class PendingCell: UITableViewCell {

    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var btnDecline: UIButton!
    
    @IBOutlet weak var btnAccept: UIButton!
    
    @IBOutlet weak var lblSenderName: UILabel!
    
    @IBOutlet weak var lblStoreName: UILabel!
    
    @IBOutlet weak var lblKiranaStore: UILabel!
    
    @IBOutlet weak var lblLocation: UILabel!
    
    @IBOutlet weak var btnFollow: UIButton!
    
    @IBOutlet weak var btnCross: UIButton!
    
    
    @IBOutlet weak var btnRequested: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
