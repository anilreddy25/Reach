//
//  NewBankViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 17/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class NewBankViewController: UIViewController {

    @IBOutlet weak var middlebankview: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.middlebankview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        
    }
  
    @IBAction func myback(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
        
    }
    @IBAction func Learnmore(_ sender: UIButton)
    {
        
    }
    @IBAction func Myprocessed(_ sender: UIButton)
    {
        DispatchQueue.main.async
            {
                
            let Viewsingel = self.storyboard?.instantiateViewController(withIdentifier:"IcicBankcardViewController")as!
            IcicBankcardViewController
            self.present(Viewsingel, animated: true, completion:nil)
          }
      }
    
}
