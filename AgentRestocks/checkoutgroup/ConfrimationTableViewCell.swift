//
//  ConfrimationTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 28/11/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class ConfrimationTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var rupeeslabel: UILabel!
    @IBOutlet weak var quantitylabel: UILabel!
    
    @IBOutlet weak var freeimage: UIImageView!
    
    
    @IBOutlet weak var freebielabel: UILabel!
    @IBOutlet weak var expirelabel: UILabel!

    
  
}
