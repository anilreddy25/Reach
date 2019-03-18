//
//  BackalertViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 15/10/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class BackalertViewController: UIViewController {

    @IBOutlet weak var verybottomview: UIView!
    @IBOutlet weak var verfymiddleview: UIView!
    @IBOutlet weak var verytopview: UIView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
   verybottomview.layer.addBorder(edge:.top, color: UIColor.textfiledbottomcolorside(), thickness:0.6)
    verfymiddleview.layer.addBorder(edge:.top, color: UIColor.textfiledbottomcolorside(), thickness:0.6)
        verfymiddleview.layer.addBorder(edge:.bottom, color: UIColor.textfiledbottomcolorside(), thickness:0.6)
    verytopview.layer.addBorder(edge:.top, color: UIColor.textfiledbottomcolorside(), thickness:0.6)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    
    @IBAction func Cancelbutton(_ sender: UIButton)
    {
        self.view.removeFromSuperview()
    }
    @IBAction func okbutton(_ sender: UIButton)
    {
//        DispatchQueue.main.async {
//            let codefinalvalue = self.storyboard?.instantiateViewController(withIdentifier:"loginPageVC")as!loginPageVC
//            self.present(codefinalvalue, animated: true, completion:nil)
//        }
        self.dismiss(animated:true, completion:nil)

    }
}
