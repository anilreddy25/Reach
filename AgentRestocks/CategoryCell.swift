//
//  CategoryCell.swift
//  loginPageVC
//
//  Created by apple on 8/27/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var dotView: UIView!
    
    @IBOutlet weak var lnView: UIView!
    
    @IBOutlet weak var lblTest: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
