//
//  ActiveKYCViewController.swift
//  AgentRestocks
//
//  Created by apple on 9/25/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class ActiveKYCViewController: UIViewController {
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var btnPop: UIButton!
    @IBOutlet weak var lblActiveKYC: UILabel!
    @IBOutlet weak var lblKYCPending: UILabel!
    @IBOutlet weak var shadowView: UIView!
    
    @IBOutlet weak var imgKYC: UIImageView!
    @IBOutlet weak var lblYourKYCPending: UILabel!
    @IBOutlet weak var lblSubmitActive: UILabel!
    
    @IBOutlet weak var btnSubmit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        shadowView.layer.shadowOffset = CGSize(width: 0, height: 3)
        shadowView.layer.shadowOpacity = 0.6
        shadowView.layer.shadowRadius = 3.0
        shadowView.layer.shadowColor = UIColor.color2().cgColor
        
        
        headerView.layer.shadowOffset = CGSize(width: 0, height: 3)
        headerView.layer.shadowOpacity = 0.6
        headerView.layer.shadowRadius = 3.0
        headerView.layer.shadowColor = UIColor.color2().cgColor
        
        
        
//        btnSubmit.layer.cornerRadius = 5
//        btnSubmit.clipsToBounds = true
        self.btnSubmit.layer.cornerRadius = 6
       self.btnSubmit.clipsToBounds = true

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    @IBAction func btnSubmitAction(_ sender: Any)
    {
        DispatchQueue.main.async {
        let EditAccountView = self.storyboard?.instantiateViewController(withIdentifier:"EditAccountViewController")as!EditAccountViewController
            self.present(EditAccountView, animated: true, completion:nil)
        }
    }
    @IBAction func btnPopAction(_ sender: Any)
    {
    self.dismiss(animated:true, completion:nil)
    }
}
