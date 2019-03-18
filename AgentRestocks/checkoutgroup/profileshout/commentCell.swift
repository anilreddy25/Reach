//
//  commentCell.swift
//  AgentRestocks
//
//  Created by apple on 12/26/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class commentCell: UITableViewCell {

    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var lblProfileName: UILabel!
    
    @IBOutlet weak var lblTimeAgo: UILabel!
    
    @IBOutlet weak var imgDown: UIImageView!
    
    @IBOutlet weak var txtViewData: UITextView!
    
    @IBOutlet weak var viewButton: UIView!
    
    @IBOutlet weak var lblComment: UILabel!
    @IBOutlet weak var lblNameComment: UILabel!
    
    @IBOutlet weak var btnComment: UIButton!
    
    @IBOutlet weak var btnShout: UIButton!
    @IBOutlet weak var btnLike: UIButton!
    
    @IBOutlet weak var btnShare: UIButton!
    
    @IBOutlet weak var btnSave: UIButton!
    
    @IBOutlet weak var lblCommentCount: UILabel!
    
    @IBOutlet weak var lblShoutCout: UILabel!
    
    @IBOutlet weak var lblShareCount: UILabel!
    
    @IBOutlet weak var lblLikeCount: UILabel!
    
    @IBOutlet weak var lblSaveCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
