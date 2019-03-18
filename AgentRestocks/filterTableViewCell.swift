//
//  filterTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 31/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class filterTableViewCell: UITableViewCell {

    @IBOutlet weak var checkmarkbutton: UIButton!
    
    @IBOutlet weak var chackmarkListtabelviewcell: UILabel!
    
    @IBOutlet weak var acessorymarkbutton: UIButton!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }

}
