//
//  tableListCell.swift
//  AgentRestocks
//
//  Created by apple on 8/6/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class tableListCell: UITableViewCell
{
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
    @IBOutlet weak var Newmarginlabel: UILabel!
    @IBOutlet weak var Wightofproductlabel: UILabel!
    @IBOutlet weak var nintyninestruckfinalvalue: UILabel!
    @IBOutlet weak var outofstocklabel: UIImageView!
    @IBOutlet weak var imgStockOut: UIImageView!
    @IBOutlet weak var cashback_text: UIImageView!
    
    @IBAction func buttonadd(_ sender: UIButton)
    {


    }
  
    @IBOutlet weak var imgExclusive: UIImageView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

    }

    @IBOutlet weak var codView: UIView!
    
    
    @IBOutlet weak var lblCODisplay: UILabel!
    
    
    @IBOutlet weak var btnCODisplay: UIButton!
    
}
