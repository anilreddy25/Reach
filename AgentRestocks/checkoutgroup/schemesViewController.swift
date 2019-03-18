//
//  schemesViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 02/01/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit




class schemesViewController: UIViewController,ScrollPagerDelegate,ScrollPagerDelegateThree,ScrollPagerDelegatefinal
{
    @IBOutlet weak var favouritescrollviewfinalvalue: ScrollPagerfour!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        favouritescrollviewfinalvalue.delegate  = self

    }
    @IBOutlet weak var schemeTotalview: UIView!
    
    @IBOutlet weak var middelview: UIView!
    @IBOutlet weak var WantaddNow: UIButton!
    
    
    @IBAction func WantaddNow(_ sender: UIButton)
    {
//   let oldViewController = self.storyboard?.instantiateViewController(withIdentifier:"schemesViewController")as!schemesViewController
//  let Homeviewcontrolelr = self.storyboard?.instantiateViewController(withIdentifier:"HomeViewController")as!HomeViewController
//        oldViewController.view.removeFromSuperview()
//        oldViewController.removeFromParentViewController()
//        Homeviewcontrolelr.didMove(toParentViewController: self)
        self.view.removeFromSuperview()
        
//        favouritescrollviewfinalvalue.setSelectedIndex(index:0, animated: true)

    }
    
    
    

    
    
}
