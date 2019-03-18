//
//  ReviewTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 18/08/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var Dateoftheproduct: UILabel!
    @IBOutlet weak var Timeoftheproduct: UILabel!
    @IBOutlet weak var Rangeoftheproduct: UILabel!
    @IBOutlet weak var Reviewlabel: UILabel!
    
    @IBOutlet weak var upthumbbuttonone: UIButton!
    
    @IBOutlet weak var upthumbbuttontwo: UIButton!
    
    @IBOutlet weak var bottomthumbbuttonone: UIButton!
    
    @IBOutlet weak var bottomthumbbuttontwo: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
