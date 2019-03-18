
//
//  TrackTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 26/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class TrackTableViewCell: UITableViewCell {

    @IBOutlet weak var tarckiamge: UIImageView!
    @IBOutlet weak var ReceivedName: UILabel!
    @IBOutlet weak var Donelabel: UIButton!
    
    
    
    @IBOutlet weak var SelforderbyKamalesh: UILabel!
    @IBOutlet weak var datelaebl: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }

}
