//
//  MycardTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 28/02/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit

class MycardTableViewCell: UITableViewCell {

    @IBOutlet weak var cardviewfinalvalue: CardViewtwo!
    
    @IBOutlet weak var Helporderidvalue: UILabel!
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

    }

}
