//
//  ViewallBrandTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 20/08/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class ViewallBrandTableViewCell: UITableViewCell {

    @IBOutlet weak var lblStrick: UILabel!
    
    @IBOutlet weak var lblRate: UILabel!
    
    @IBOutlet weak var btnAdd: UIButton!
    
    @IBOutlet weak var lblMRP: UILabel!
    @IBOutlet weak var lblStock: UILabel!
    
    @IBOutlet weak var lblDays: UILabel!
    @IBOutlet weak var imgArrow: UIImageView!
    @IBOutlet weak var imgOffer: UIImageView!
    @IBOutlet weak var imgProduct: UIImageView!
    
    @IBOutlet weak var cashbacklabel: UILabel!
    @IBOutlet weak var lblProduct: UILabel!
    @IBOutlet weak var btnFavor: UIButton!
    @IBOutlet weak var imgNew: UIImageView!
    
    @IBOutlet weak var NewBrandlabel: UILabel!
    
   
    @IBOutlet weak var imgExclusive: UIImageView!
    
    @IBOutlet weak var Percentagelabel: UILabel!

    
    @IBOutlet weak var imgStockOut: UIImageView!
    
    @IBOutlet weak var cashback_text: UIImageView!
    
    
    @IBOutlet weak var TotalBrandview: UIView!
    
    
    @IBOutlet weak var dayslabel: UILabel!
    
    @IBOutlet weak var labeltimerlabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    
    @IBAction func buttonadd(_ sender: UIButton)
    {
//      btnFavor.setBackgroundImage(#imageLiteral(resourceName: "favoutires_red"), for:.normal)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
