//
//  PayingusingViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 17/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import Foundation
import UIKit

class PayingusingViewController: UIViewController,UITextFieldDelegate
{

    @IBOutlet weak var viewone: UIView!
    
    @IBOutlet weak var viewimageone: UIImageView!
    
    @IBOutlet weak var viewimagetwo: UIImageView!
    
    @IBOutlet weak var viewtwo: UIView!
    
    @IBOutlet weak var Tickmarkview: UIView!
    
    @IBOutlet weak var tickmarkimageview: UIImageView!
    
    @IBOutlet weak var tetxfiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.viewone.layer.cornerRadius = self.viewone.frame.size.width/2
        self.viewone.clipsToBounds = true
        self.viewone.layer.borderColor = UIColor.white.cgColor
        self.viewone.layer.borderWidth = 1.0
        

        
        self.viewimageone.layer.cornerRadius = self.viewimageone.frame.size.width/2
        self.viewimageone.clipsToBounds = true
        self.viewimageone.layer.borderColor = UIColor.white.cgColor
        self.viewimageone.layer.borderWidth = 1.0
        self.viewimageone.layer.cornerRadius = self.viewone.frame.size.width/2
 
        self.viewtwo.clipsToBounds = true
        self.viewtwo.layer.borderColor = UIColor.white.cgColor
        self.viewtwo.layer.borderWidth = 1.0
        self.viewtwo.layer.cornerRadius = self.viewtwo.frame.size.width/2
        
        
        self.viewimagetwo.clipsToBounds = true
        self.viewimagetwo.layer.borderColor = UIColor.white.cgColor
        self.viewimagetwo.layer.borderWidth = 1.0
        self.viewimagetwo.layer.cornerRadius = self.viewimagetwo.frame.size.width/2

        
        
        self.Tickmarkview.clipsToBounds = true
        self.Tickmarkview.layer.borderColor = UIColor.white.cgColor
        self.Tickmarkview.layer.borderWidth = 1.0
        self.Tickmarkview.layer.cornerRadius = self.Tickmarkview.frame.size.width/2

        self.tickmarkimageview.clipsToBounds = true
        self.tickmarkimageview.layer.borderColor = UIColor.white.cgColor
        self.tickmarkimageview.layer.borderWidth = 1.0
        self.tickmarkimageview.layer.cornerRadius = self.tickmarkimageview.frame.size.width/2

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.TickmarkhandleTap(_:)))
        
        self.tickmarkimageview.addGestureRecognizer(tap)
        
        self.tickmarkimageview.isUserInteractionEnabled = true
        
        tetxfiled.keyboardType = .phonePad
     
    }
    @objc func TickmarkhandleTap(_ sender: UITapGestureRecognizer)
    {
        
        DispatchQueue.main.async
            {
            let upiupin = self.storyboard?.instantiateViewController(withIdentifier:"UPipinViewController")as!UPipinViewController
            self.present(upiupin, animated: true, completion:nil)
        }
    }
  //  UPipinViewController
    
    
    
    @IBAction func Backbuttton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
        
    }
    

}
