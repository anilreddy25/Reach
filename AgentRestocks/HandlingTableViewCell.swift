//
//  HandlingTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 27/11/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class HandlingTableViewCell: UITableViewCell {
    @IBOutlet weak var productname: UILabel!
    
    @IBOutlet weak var labeltwo: UILabel!
    @IBOutlet weak var labelone: UILabel!
    @IBOutlet weak var smalimagetwo: UIImageView!
    @IBOutlet weak var smallimageone: UIImageView!
    @IBOutlet weak var imageview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
