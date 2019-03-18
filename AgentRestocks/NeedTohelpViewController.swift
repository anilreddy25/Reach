//
//  NeedTohelpViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 23/10/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class NeedTohelpViewController: UIViewController
{
    @IBOutlet weak var myBackbutton: UIButton!
    @IBOutlet weak var Edittopview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Edittopview.layer.addBorder(edge:.bottom, color: UIColor.textfiledbottomcolorside(), thickness:0.6)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func MyBackbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    

}
