//
//  handlingCell.swift
//  AgentRestocks
//
//  Created by apple on 12/14/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class handlingCell: UITableViewCell {

    @IBOutlet weak var lblProductName: UILabel!
    
    @IBOutlet weak var lblQnty: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var btnPrice: UIButton!
    
    @IBOutlet weak var btnUpAndDown: UIButton!
    @IBOutlet weak var lblHamaliProdct: UILabel!
    
    @IBOutlet weak var lblHamaliValue: UILabel!
    
    @IBOutlet weak var lblDelivrValue: UILabel!
    
    @IBOutlet weak var lblDelivryProdt: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
