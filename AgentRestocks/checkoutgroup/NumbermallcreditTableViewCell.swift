//
//  NumbermallcreditTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 19/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class NumbermallcreditTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var numbermallimage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productrupess: UILabel!
    @IBOutlet weak var expirelabel: UILabel!
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

    }

}
