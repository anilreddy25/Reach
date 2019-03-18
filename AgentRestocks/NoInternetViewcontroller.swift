//
//  NoInternetViewcontroller.swift
//  NumberMall
//
//  Created by Azharuddin on 23/05/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
import Foundation
import SystemConfiguration
class NoInternetViewcontroller: UIViewController {
    
    
    
    @IBOutlet weak var oopsNameLbl: UILabel!
    
    @IBOutlet weak var pleaseCheckInternetNameLBl: UILabel!
    
    
    @IBOutlet weak var gotoSettingsBtnOutlet: UIButton!
    
    
    @IBOutlet weak var tryAgainBtnOutlet: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

 
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func tryAgainAction(_ sender: Any) {
        
        
        if ConnectionCheck.isConnectedToNetwork()
        {
            self.view.removeFromSuperview()

        }
        else{
//            let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NoInternetViewcontroller") as! NoInternetViewcontroller
//            self.addChildViewController(popOverVC)
//            popOverVC.view.frame = self.view.frame
//            self.view.addSubview(popOverVC.view)
//            popOverVC.didMove(toParentViewController: self)
        }
        
//        if Reachability.isConnectedToNetwork() == false{
//            let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NoInternetViewcontroller") as! NoInternetViewcontroller
//            self.addChildViewController(popOverVC)
//            popOverVC.view.frame = self.view.frame
//            self.view.addSubview(popOverVC.view)
//            popOverVC.didMove(toParentViewController: self)
//
//        }
//         if Reachability.isConnectedToNetwork() == true
//        {
//            self.view.removeFromSuperview()
//        }
    }
    
    @IBAction func gotosettingsAction(_ sender: Any)
    {
        guard let profileUrl = URL(string:
            "App-Prefs:root=Settings") else {
                return
        }
        
        if UIApplication.shared.canOpenURL(profileUrl) {
            
            UIApplication.shared.open(profileUrl, completionHandler: { (success) in
                
                print("  Settings opened: \(success)")
                
            })
        }

//                    let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddPopviewViewController") as! AddPopviewViewController
//
//                    self.addChildViewController(popOverVC)
//                    popOverVC.view.frame = self.view.frame
//                    self.view.addSubview(popOverVC.view)
//                    popOverVC.didMove(toParentViewController: self)
        
        
    }
    
  

}
