//
//  shoutOffCell.swift
//  AgentRestocks
//
//  Created by apple on 12/24/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class shoutOffCell: UITableViewCell {

    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var lblProfileName: UILabel!
    
    @IBOutlet weak var lblComentShare: UILabel!
    
    @IBOutlet weak var lblDesignation: UILabel!
    
    @IBOutlet weak var shareView: UIView!
    
    @IBOutlet weak var imgNew: UIImageView!
    
    @IBOutlet weak var imgOffer: UIImageView!
    
    @IBOutlet weak var lblProductTitle: UILabel!
    
    @IBOutlet weak var lblMRPandMOQ: UILabel!
    
    @IBOutlet weak var imgProduct: UIImageView!
    
    @IBOutlet weak var lblFinalPrice: UILabel!
    
    @IBOutlet weak var lblStrikePrice: UILabel!
    
    @IBOutlet weak var lblPercentage: UILabel!
    
    @IBOutlet weak var imgDayShot: UIImageView!
    
    @IBOutlet weak var lblDaysRestock: UILabel!
    
    @IBOutlet weak var lblInstock: UILabel!
    
    @IBOutlet weak var viewButton: UIView!
    
    @IBOutlet weak var btnSave: UIButton!
    
    @IBOutlet weak var lblSaveCount: UILabel!
    
    @IBOutlet weak var btnLikes: UIButton!
    
    @IBOutlet weak var lblLikesCount: UILabel!
    
    @IBOutlet weak var btnShouts: UIButton!
    
    @IBOutlet weak var lblShoutCount: UILabel!
    
    @IBOutlet weak var btnShare: UIButton!
    
    @IBOutlet weak var lblShareCount: UILabel!
    
    @IBOutlet weak var btnComment: UIButton!
    
    @IBOutlet weak var btnCommentCount: UIButton!
    
    @IBOutlet weak var lblCommentCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
