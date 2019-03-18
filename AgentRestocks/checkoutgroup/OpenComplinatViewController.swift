//
//  OpenComplinatViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 20/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class OpenComplinatViewController: UIViewController {
    @IBOutlet weak var compliantnumber: UILabel!
    @IBOutlet weak var compliantlabel: UILabel!
    @IBOutlet weak var stocknotmoving: UILabel!
    
    @IBOutlet weak var messagequantitylabel: UILabel!
    @IBOutlet weak var Brandname: UILabel!
    @IBOutlet weak var parleg: UILabel!
    
    var Stocktitle1 = String()
    var Stockis1 = String()
    var DeliveryorderNumbaer1 = String()
    var DeliveryOpen1 = String()
    var DeliveryDate1 = String()
    
    
    override func viewDidLoad()
        
    {
        super.viewDidLoad()
        self.compliantnumber.text = self.DeliveryorderNumbaer1
        self.stocknotmoving.text = self.Stockis1
        self.compliantlabel.text = self.DeliveryOpen1
    }
    
    @IBAction func Mybackbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    @IBAction func sharebutton(_ sender: UIButton)
    {
        
    }
}
