//
//  LandlineViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 28/01/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit

class LandlineViewController: UIViewController {
    @IBOutlet var landlineotpview: UIView!
    @IBOutlet weak var mybackbutton: UIButton!
    
    var MobileStringfinalValue = String()
    var Missedcallnumber = String()
    var MissedCalledNumbervalueotp = String()
    var Identificationtwofactorotp = NSNumber()
    var verfyvalue = String()
    var Verificationfinalvalueotpfinal = String()
    var Verificationcallvalue = String()
    var sucesssinglfinal = String()
    var Mobilenumbervalueforgetpassword = String()
    var Missedcallfeaturefinalvalue = String()
    var Missedcallfeaturetwo = String()
    var messagefinalvalue = String()
    
    @IBOutlet weak var landlinetopview: UIView!
    @IBOutlet weak var landlinetwo: UIView!
    
    @IBOutlet weak var verfylandnumber: UILabel!
    
    @IBOutlet weak var singelview: UIView!
    
    @IBOutlet weak var Enterotpsentto: UILabel!
    
    
    @IBOutlet weak var mybackalertviewfinal: UIView!
    
    @IBOutlet weak var alertviewtop: UIView!
    
    
    @IBOutlet weak var alertviewbottom: UIView!
    
    @IBOutlet weak var alertviewunder: UIView!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        landlinetopview.layer.shadowOffset = CGSize(width: 0, height: 3)
        landlinetopview.layer.shadowOpacity = 0.6
        landlinetopview.layer.shadowRadius = 3.0
        landlinetopview.layer.shadowColor = UIColor.color2().cgColor
        let stringfinalavleu = NSString(format:"%@%@%@%@","Enter the OTP sent to","'",MobileStringfinalValue,"'")
        Enterotpsentto.text = stringfinalavleu as String
        alertviewbottom.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.4)
        alertviewbottom.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.4)
    }
    @IBAction func Mybackbutton(_ sender: UIButton)
    {
//        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BackalertViewController") as! BackalertViewController
//        self.addChildViewController(popOverVC)
//        popOverVC.view.frame = self.view.frame
//        self.view.addSubview(popOverVC.view)
//        popOverVC.didMove(toParentViewController: self)
        self.mybackalertviewfinal.isHidden = false

        
    }
    
    @IBAction func Confirmthroughmisedcall(_ sender: UIButton)
    {
        
    }
    @IBAction func Skipthisversion(_ sender: UIButton)
    {
        DispatchQueue.main.async
            {
                let RegisterOTPVerification = self.storyboard?.instantiateViewController(withIdentifier:"SetupaccountViewController")as!SetupaccountViewController
                self.present(RegisterOTPVerification, animated:true, completion:nil)
        }
    }
    
    @IBAction func Mybacknobutton(_ sender: UIButton)
    {
        self.mybackalertviewfinal.isHidden = true

    }
    
    @IBAction func Mybackyesbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)

    }
    
    
    
}
