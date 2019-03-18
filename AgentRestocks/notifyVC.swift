//
//  notifyVC.swift
//  AgentRestocks
//
//  Created by apple on 2/25/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit

class notifyVC: UIViewController {

    @IBOutlet weak var topView: UIView!
    
    
    @IBOutlet weak var lblFollowingName: UILabel!
    
    @IBOutlet weak var accountView: UIView!
    
    @IBOutlet weak var btnViewSwitch: UISwitch!
    
    var strName = String()
    var notifyValue = String()
    var dictOfValue = [String: Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        topView.layer.shadowOffset = CGSize(width: 0, height: 3)
        topView.layer.shadowOpacity = 0.6
        topView.layer.shadowRadius = 3.0
        topView.layer.shadowColor = UIColor.color2().cgColor
        
        
        self.lblFollowingName.text = strName
        
        if self.notifyValue == "1"{
            btnViewSwitch.isOn = true
        }
        
        if self.notifyValue == "0"{
            btnViewSwitch.isOn = false
        }
        
        
        btnViewSwitch.addTarget(self, action: #selector(followSwitchAction), for: .touchUpInside)
        
    }
    

    @IBAction func btnBackAction(_ sender: Any) {
   
    self.dismiss(animated: true, completion: nil)
    }
    
    
    @objc func followSwitchAction(sender: UISwitch) {
//        btnViewSwitch.isOn = true
    }
    @IBAction func myswitchbutton(_ sender: UISwitch)
    {
        
        if (sender.isOn == true){
            print("on")
        }
        else{
            print("off")
        }
    }
    
}
