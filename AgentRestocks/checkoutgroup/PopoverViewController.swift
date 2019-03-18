//
//  PopoverViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 24/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class PopoverViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
//        popoverviewfinal.layer.cornerRadius = 5.0
//        popoverviewfinal.layer.borderWidth = 2.0
//        popoverviewfinal.layer.borderColor = UIColor.black.cgColor
    }
    @IBOutlet weak var fifthorderplaced: UILabel!
    @IBOutlet weak var achivedlabel: UILabel!
    @IBOutlet weak var singeloderlabel: UILabel!
    @IBOutlet weak var secondorderlabel: UILabel!
    @IBOutlet weak var targetlabel: UILabel!
    @IBOutlet weak var singeltagrget: UILabel!
    @IBOutlet weak var secondtarget: UILabel!
    @IBOutlet weak var januarylabel: UILabel!
    @IBOutlet weak var twofiftylabel: UILabel!
    @IBOutlet weak var popoverviewfinal: UIView!
    @IBAction func Popoverbutton(_ sender: UIButton)
    {
        let LtsViewControfinal = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"comboViewController") as! comboViewController
        self.addChildViewController(LtsViewControfinal)
        LtsViewControfinal.view.frame = CGRect(x: 0, y:0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.addSubview(LtsViewControfinal.view)
        LtsViewControfinal.didMove(toParentViewController: self)
    }
}
