//
//  secondTableViewCell.swift
//  AgentRestocks
//
//  Created by Azharuddin on 31/10/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class secondTableViewCell: UITableViewCell {

    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
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
    
    @IBOutlet weak var iamgestockout: UIImageView!
    
    @IBAction func buttonadd(_ sender: UIButton)
    {
//        btnFavor.setBackgroundImage(#imageLiteral(resourceName: "favoutires_red"), for:.normal)
    }
    
    @IBOutlet weak var cashback_text: UIImageView!
    
    
    @IBOutlet weak var imgExclusive: UIImageView!
    

    @IBOutlet weak var codView: UIView!
    

    @IBOutlet weak var lblCODValue: UILabel!
    
    @IBOutlet weak var btnCODisplay: UIButton!
    

}
