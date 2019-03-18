//
//  CahtingTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 17/10/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class CahtingTableViewCell: UITableViewCell {
    @IBOutlet weak var Popcorniamge: UIImageView!
    
    @IBOutlet weak var popcornmessage: UILabel!
    @IBOutlet weak var popcornname: UILabel!
    
    @IBOutlet weak var Timinglabel: UILabel!
    
    @IBOutlet weak var Mesagenumberlabel: UILabel!
    
    @IBOutlet weak var Tickimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
