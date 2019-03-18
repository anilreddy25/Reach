//
//  MultipleselectionTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 08/10/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class MultipleselectionTableViewCell: UITableViewCell {
    @IBOutlet weak var mutiselectionlabel: UILabel!
       var select_index : Int!
    @IBOutlet weak var mutiselctionimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
