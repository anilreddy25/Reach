//
//  DistibutionTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 26/09/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class DistibutionTableViewCell: UITableViewCell {

    @IBOutlet weak var shopname: UILabel!
    
    @IBOutlet weak var ratinglabel: UILabel!
    
    @IBOutlet weak var ratingimageview: UIImageView!
    
    @IBOutlet weak var Distancelabel: UILabel!
    
    @IBOutlet weak var Miyapurlabel: UILabel!
    
    @IBOutlet weak var Linklabel: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }

}
