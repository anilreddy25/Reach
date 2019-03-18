//
//  taxBreakCell.swift
//  AgentRestocks
//
//  Created by apple on 12/14/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class taxBreakCell: UITableViewCell {

    @IBOutlet weak var lblProductName: UILabel!
    
    
    @IBOutlet weak var lblQnty: UILabel!
    
    @IBOutlet weak var lblQprice: UILabel!
    
    
    @IBOutlet weak var btnTaxPrice: UIButton!
    
    @IBOutlet weak var btnUpAndDown: UIButton!
    
    
    @IBOutlet weak var lblHGstValue: UILabel!
    
    @IBOutlet weak var lblHOneVal: UILabel!
    
    @IBOutlet weak var lblTGstValue: UILabel!
    @IBOutlet weak var lblTOneVal: UILabel!
    
    @IBOutlet weak var lblTTsetVal: UILabel!
    
    @IBOutlet weak var lblTTOneVal: UILabel!
    
    @IBOutlet weak var lblFinalValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
