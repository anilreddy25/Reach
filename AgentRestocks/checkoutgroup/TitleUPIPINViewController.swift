

//
//  TitleUPIPINViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 27/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class TitleUPIPINViewController: UIViewController {
    @IBOutlet weak var createupipin: UIButton!
    
    @IBOutlet weak var upidlabel: UILabel!
    @IBOutlet weak var savingaccountNAme: UILabel!
    @IBOutlet weak var BankNAme: UILabel!
    
    @IBOutlet weak var upidname: UILabel!
    
    @IBOutlet weak var Topview: UIView!
    
    @IBOutlet weak var sugesstionview: UIView!
    @IBOutlet weak var Bankimage: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       self.Topview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        self.sugesstionview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
    }
    @IBAction func createupipin(_ sender: UIButton)
    {
        DispatchQueue.main.async
            {
                let viewone = self.storyboard?.instantiateViewController(withIdentifier:"createupipinViewController")as!createupipinViewController
                self.present(viewone, animated: true, completion:nil)
           }
    }
    
    @IBAction func Backbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
        
    }
    @IBAction func Mylearnbutton(_ sender: UIButton)
    {
        
    }
    
}
