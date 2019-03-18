//
//  NotificationsTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 21/01/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit

class NotificationsTableViewCell: UITableViewCell {

    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

    }
    
    @IBOutlet weak var Roundimagefinal: UIImageView!
    
    @IBOutlet weak var NumberMalloffered: UILabel!
    
    @IBOutlet weak var Newoffer: UILabel!
    
    @IBOutlet weak var LoremIpsum: UITextView!
}
