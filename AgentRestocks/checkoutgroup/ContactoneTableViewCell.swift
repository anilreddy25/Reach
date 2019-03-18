//
//  ContactoneTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 07/01/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit

class ContactoneTableViewCell: UITableViewCell {

    @IBOutlet weak var phonenumebrnamelabel: UILabel!
    @IBOutlet weak var phonenumberlabel: UILabel!
    
    
    @IBOutlet weak var contactimage: UIImageView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

    }

}
