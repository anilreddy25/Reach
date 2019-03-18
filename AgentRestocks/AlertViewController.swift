//
//  AlertViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 10/10/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
    @IBOutlet weak var middelview: UIView!
    
    @IBOutlet weak var verytopview: UIView!
    var appdelegate = AppDelegate()
    var alertTitleString  = NSString()
    var alertMessageString = NSString()
   
    @IBOutlet weak var alertMessageLabel: UILabel!
    
    @IBOutlet weak var alertTitleLabel: UILabel!

    var valueFinal = NSString()
    
    @IBOutlet weak var alerttotal: UIView!
    
    @IBOutlet weak var singelview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.middelview.layer.addBorder(edge:.bottom, color: UIColor.textfiledbottomcolorside(), thickness: 0.6)
        self.middelview.layer.addBorder(edge:.top, color: UIColor.textfiledbottomcolorside(), thickness: 0.6)
        
        //self.okbutton.layer.addBorder(edge:.top, color: UIColor.textfiledbottomcolorside(), thickness: 0.6)
        self.alertTitleLabel.text = "\(self.alertTitleString)"
        self.alertMessageLabel.text = "\(self.alertMessageString)"
        self.cancelbutton.isHidden = true
        
        alerttotal.roundedButton()
        singelview.layer.cornerRadius = 6.0
        singelview.layer.masksToBounds = true
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    @IBOutlet weak var okbutton: UIButton!
    @IBOutlet weak var cancelbutton: UIButton!
    
    @IBAction func cancelbutton(_ sender: UIButton)
    {
        self.view.removeFromSuperview()
    }
    @IBAction func okbutton(_ sender: UIButton)
    {
        
        if valueFinal == "Cartfianl"
        
        {
            let HomeView = self.storyboard?.instantiateViewController(withIdentifier:"CartViewController")as!CartViewController
            self.present(HomeView, animated:true, completion:nil)
        }
      else {
            
        }
      self.view.removeFromSuperview()
        
     
        
//        self.addChildViewController(popOverVC)
//        popOverVC.view.frame = self.view.frame
//        self.view.addSubview(popOverVC.view)
//        popOverVC.didMove(toParentViewController: self)
        
        
        
       
    }
    
}
