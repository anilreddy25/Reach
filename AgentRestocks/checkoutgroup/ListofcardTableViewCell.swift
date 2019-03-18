//
//  ListofcardTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 19/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class ListofcardTableViewCell: UITableViewCell {

    @IBOutlet weak var deleteiamge: UIImageView!
    @IBOutlet weak var Datelabel: UILabel!
    @IBOutlet weak var unexposedlabel: UILabel!
    @IBOutlet weak var Numbermallimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
