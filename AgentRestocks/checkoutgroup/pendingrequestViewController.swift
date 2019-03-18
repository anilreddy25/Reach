//
//  pendingrequestViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 22/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class pendingrequestViewController: UIViewController
{
    @IBOutlet weak var pendingrequesttopview: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        pendingrequesttopview.layer.shadowOffset = CGSize(width: 0, height: 3)
        pendingrequesttopview.layer.shadowOpacity = 0.6
        pendingrequesttopview.layer.shadowRadius = 3.0
        pendingrequesttopview.layer.shadowColor = UIColor.color2().cgColor
    }
    
}
