//
//  CheckOut1VC.swift
//  AgentRestocks
//
//  Created by apple on 9/15/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class CheckOut1VC: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var lblCheckOut: UILabel!
    @IBOutlet weak var lblItems: UILabel!
    @IBOutlet weak var lblQty: UILabel!
    
    @IBOutlet weak var lblTotal: UILabel!
    
    @IBOutlet weak var lblTItems: UILabel!
    
    @IBOutlet weak var lblTQty: UILabel!
    
    @IBOutlet weak var lblBillingAddress: UILabel!
    
    @IBOutlet weak var btnBilling: UIButton!
    @IBOutlet weak var lblDeliveryAddress: UILabel!
    @IBOutlet weak var btnDelivery: UIButton!
    
    
    var frist = String()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnBilling.layer.cornerRadius = 5
        btnBilling.layer.borderWidth = 1
        btnBilling.layer.borderColor = UIColor.lightGray.cgColor

        
        btnDelivery.layer.cornerRadius = 5
        btnDelivery.layer.borderWidth = 1
        btnDelivery.layer.borderColor = UIColor.lightGray.cgColor
        
     
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let view: UIView = UIView(frame: CGRect(x: 0, y: 10, width: 100, height: 50))
        self.view.addSubview(view)
    }
    
    @IBAction func btnBillingAddress(_ sender: Any)
    {
        let billingLocation = self.storyboard?.instantiateViewController(withIdentifier: "BillingAddressVC") as! BillingAddressVC
        billingLocation.firsttimesett = "firsttime"
        self.present(billingLocation, animated: true, completion: nil)
    }
    
    @IBAction func btnDeliveryAddress(_ sender: Any)
    {
        let DeliveryAddress =  self.storyboard?.instantiateViewController(withIdentifier: "DeliveryAddressVC") as! DeliveryAddressVC
        DeliveryAddress.firsttimesett = "firsttimeset"
        self.present(DeliveryAddress, animated: true, completion: nil)
    }
}
