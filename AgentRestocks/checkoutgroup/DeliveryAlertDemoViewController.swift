//
//  DeliveryAlertDemoViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 28/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class DeliveryAlertDemoViewController: UIViewController,UIScrollViewDelegate
{
    @IBOutlet weak var Deliveryscrollview: UIScrollView!
    @IBOutlet weak var deliverview: UIView!
    @IBOutlet weak var viewsingel: UIView!
    @IBOutlet weak var viewtop: UIView!
    @IBOutlet weak var viewbottom: UIView!
    
    
    @IBOutlet weak var Deliverybottomview: UIView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let bottomSheet = JXBottomSheetView(contentView:Deliveryscrollview as! UIScrollView)
        bottomSheet.defaultMininumDisplayHeight = 300
        bottomSheet.defaultMaxinumDisplayHeight = 676
        bottomSheet.displayState = .maxDisplay
        bottomSheet.frame = self.view.bounds
        self.view.addSubview(bottomSheet)
        
        self.viewbottom.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
         self.viewbottom.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        
    }
    
    @IBAction func Nobutton(_ sender: UIButton)
    {
   
    }
    
}
