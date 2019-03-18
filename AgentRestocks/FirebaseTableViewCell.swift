//
//  FirebaseTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 27/09/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class FirebaseTableViewCell: UITableViewCell {
    @IBOutlet weak var firebaseimage: UIImageView!
    @IBOutlet weak var expiredlabel: UILabel!
    
    @IBOutlet weak var popcornrupesslabel: UILabel!
    @IBOutlet weak var expirelabel: UILabel!
    @IBOutlet weak var Popicorn: UILabel!
    @IBOutlet weak var Youarewon: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
