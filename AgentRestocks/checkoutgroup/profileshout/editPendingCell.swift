//
//  editPendingCell.swift
//  AgentRestocks
//
//  Created by apple on 2/15/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit

class editPendingCell: UITableViewCell {

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
//        self.lblKiranaStore.layer.cornerRadius = 4.0
//         self.lblKiranaStore.layer.masksToBounds = true
//        
//        
//        self.btnFollow.layer.cornerRadius = 30.0
//        self.btnFollow.clipsToBounds = true
//        
//        self.btnRequested.layer.cornerRadius = 30.0
//        self.btnRequested.clipsToBounds = true
//        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
