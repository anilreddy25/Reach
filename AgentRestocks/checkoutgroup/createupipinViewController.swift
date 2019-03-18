//
//  createupipinViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 17/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class createupipinViewController: UIViewController {
    @IBOutlet weak var rightview: UIView!
    
    @IBOutlet weak var leftview: UIView!
    @IBOutlet weak var topview: UIView!
    var createupipinViewtimerTwo = Timer()
    var Inndex = Int()
    let loadingBar: LoadingView = LoadingView()
    var createupipinVorderView = Timer()

    @IBOutlet weak var mybackbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.leftview.layer.addBorder(edge:.top, color:UIColor.gray, thickness:0.6)
        
        
        topview.layer.shadowOffset = CGSize(width: 0, height: 2)
        topview.layer.shadowOpacity = 0.3
        topview.layer.shadowRadius = 1.0
        topview.layer.borderColor = UIColor.color2().cgColor
        loadingBar.startAnimating()
        
     createupipinVorderView = Timer.scheduledTimer(timeInterval:10.0, target: self, selector: #selector(createupipinViewControlleroutvalue), userInfo: nil, repeats: false)
        
    }
    
    @objc func createupipinViewControlleroutvalue()
    {
//        loadingBar.stopAnimation()

        
        DispatchQueue.main.async
            {
            let Enterotpview = self.storyboard?.instantiateViewController(withIdentifier:"EnterotpViewController")as!EnterotpViewController
             self.present(Enterotpview, animated:true, completion:nil)
        }
    }
    
    
    
    @IBAction func mybackbutton(_ sender: UIButton)
    {
        
        self.dismiss(animated:true, completion:nil)
        
    }
    
    
    
   
}
