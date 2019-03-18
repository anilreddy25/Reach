//
//  SELECTBANKViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 14/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import FullMaterialLoader
class SELECTBANKViewController: UIViewController {
    var indicator: MaterialLoadingIndicator!

    @IBOutlet weak var parentview: UIView!
    var SELECTBANKtimertwo = Timer()

    var SELECTBANKVorderView = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configViews()
    }
    @objc func SELECTBANKtimerAction()
    {
        indicator.stopAnimating()
        indicator.isHidden = true
    }
    func configViews()
    {
        indicator = MaterialLoadingIndicator(frame: CGRect(x:250, y:0, width: 30, height: 30))
        indicator.indicatorColor = [UIColor.red.cgColor]
//        indicator.center = self.view.center
        self.parentview.addSubview(indicator)
        indicator.startAnimating()
        SELECTBANKtimertwo = Timer.scheduledTimer(timeInterval:8.0, target: self, selector: #selector(SELECTBANKtimerAction), userInfo: nil, repeats: false)

    }
    @IBAction func start(_ sender: UIButton)
    {
        indicator.isHidden = false
        indicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
            
            self.indicator.isHidden = true
            self.indicator.stopAnimating()
        })
    }
    @IBAction func stop(_ sender: UIButton)
    {
        indicator.stopAnimating()
        indicator.isHidden = true
    }
    
    
    
    
    
}
