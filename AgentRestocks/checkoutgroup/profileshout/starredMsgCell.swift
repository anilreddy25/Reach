//
//  starredMsgCell.swift
//  AgentRestocks
//
//  Created by apple on 12/24/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class starredMsgCell: UITableViewCell {
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var lblProfileName: UILabel!
    
    @IBOutlet weak var imgRight: UIImageView!
    
    @IBOutlet weak var imgRght: UIImageView!
    
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var lblYou: UILabel!
    
    @IBOutlet weak var txtViewOfData: UITextView!
    
    @IBOutlet weak var dataView: UIView!
    
    @IBOutlet weak var lblTimeView: UILabel!
    
    @IBOutlet weak var imgStar: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
