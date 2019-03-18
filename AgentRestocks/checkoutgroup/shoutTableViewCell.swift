//
//  shoutTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 21/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class shoutTableViewCell: UITableViewCell
{
    
    
    @IBOutlet weak var shoutimageview: UIImageView!
    
    @IBOutlet weak var shoubutton: UIButton!
    
    
    @IBOutlet weak var shoutName: UILabel!
    
    @IBOutlet weak var shoutTimelabel: UILabel!
    
    
    
    @IBOutlet weak var Kranthikumarlabel: UILabel!
    
    
    @IBOutlet weak var about: UILabel!
    
    
    @IBOutlet weak var chatbutton: UIButton!
    
    
    @IBOutlet weak var shoutbutton: UIButton!
    
    
    @IBOutlet weak var Likebutton: UIButton!
    
    @IBOutlet weak var sahrebutton: UIButton!
    
    @IBOutlet weak var handbutton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
