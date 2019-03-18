//
//  editSaveCell.swift
//  AgentRestocks
//
//  Created by apple on 1/21/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit

class editSaveCell: UITableViewCell {

    
    
    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var imgDown: UIImageView!
    
    @IBOutlet weak var lblProfile: UILabel!
    
    @IBOutlet weak var lblSenderTime: UILabel!
    
    @IBOutlet weak var lblDistributor: UILabel!
    
    @IBOutlet weak var lblSenderMsg: UILabel!
    
   @IBOutlet weak var cardviewfinal: CardView!
    
    @IBOutlet weak var lblProductName: UILabel!
    
    @IBOutlet weak var lblMRPPrice: UILabel!
    
    @IBOutlet weak var lblMargin: UILabel!
    
    @IBOutlet weak var lblStrikePrice: UILabel!
    
    @IBOutlet weak var lblOutletBought: UILabel!
    
    @IBOutlet weak var lblDays: UILabel!
    
    @IBOutlet weak var lblRestockOffTime: UILabel!
    
    @IBOutlet weak var lblEndIN: UILabel!
    
    @IBOutlet weak var imgProductShout: UIImageView!
    
    @IBOutlet weak var lblPercentMargin: UILabel!
    
    @IBOutlet weak var lblTimer: UILabel!
    
    @IBOutlet weak var strView: UIView!
    
    @IBOutlet weak var viewButton: UIView!
    
    @IBOutlet weak var btnComment: UIButton!
    
    @IBOutlet weak var lblCommentCount: UILabel!
    
    @IBOutlet weak var btnShout: UIButton!
    
    @IBOutlet weak var lblShoutCount: UILabel!
    
    @IBOutlet weak var btnLikes: UIButton!
    
    @IBOutlet weak var lblLikes: UILabel!
    
    @IBOutlet weak var btnShares: UIButton!
    
    @IBOutlet weak var lblShare: UILabel!
    
    @IBOutlet weak var btnSave: UIButton!
    
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
