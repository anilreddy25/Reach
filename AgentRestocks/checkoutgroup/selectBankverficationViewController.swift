//
//  selectBankverficationViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 14/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import FullMaterialLoader
import QuartzCore
import Foundation

class selectBankverficationViewController: UIViewController
{
    @IBOutlet weak var Topview: UIView!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var diferntnumber: UIButton!
    @IBOutlet weak var totalviewfinal: UIView!
    @IBOutlet weak var popupview: UIView!
    @IBOutlet weak var popcontactview: UIView!
    @IBOutlet weak var viewone: UIView!
    @IBOutlet weak var viewtwo: UIView!
    @IBOutlet weak var viewthree: UIView!
    var indicator: MaterialLoadingIndicator!
    var SELECTBANKtimertwo = Timer()
    var SELECTBANKVorderView = Timer()
    @IBOutlet weak var firstcircle: UIView!
    @IBOutlet weak var secondcircle: UIView!
    @IBOutlet weak var thirdcircle: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        Topview.layer.shadowOffset = CGSize(width: 0, height: 2)
        Topview.layer.shadowOpacity = 0.3
        Topview.layer.shadowRadius = 1.0
        Topview.layer.borderColor = UIColor.color2().cgColor
        Topview.layer.shadowColor = UIColor.color2().cgColor
        
        self.popcontactview.layer.cornerRadius = 6.0
        self.popcontactview.layer.masksToBounds = true
        self.popcontactview.clipsToBounds = true
        
        firstcircle.layer.cornerRadius = firstcircle.frame.size.width/2
        firstcircle.clipsToBounds = true
        
        secondcircle.layer.cornerRadius = secondcircle.frame.size.width/2
        secondcircle.clipsToBounds = true
        
        thirdcircle.layer.cornerRadius = thirdcircle.frame.size.width/2
        thirdcircle.clipsToBounds = true
        
        self.ConfirmconfigViewsSelectBank()
        
       

    }
    
    @IBAction func Backbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    @IBAction func usedifferentnumber(_ sender: UIButton)
    {
    }
    @IBAction func Cancelbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    @IBAction func Okbutton(_ sender: UIButton)
    {
        DispatchQueue.main.async
            {
            let NewBankViewverfication = self.storyboard?.instantiateViewController(withIdentifier:"NewBankViewController")as!NewBankViewController
            self.present(NewBankViewverfication, animated:true, completion:nil)
          }
    }
    func ConfirmconfigViewsSelectBank()
    {
        indicator = MaterialLoadingIndicator(frame: CGRect(x:12, y:20, width: 30, height: 30))
        indicator.indicatorColor = [UIColor.red.cgColor]
        self.viewone.addSubview(indicator)
        indicator.startAnimating()
        SELECTBANKVorderView = Timer.scheduledTimer(timeInterval:5.0, target: self, selector: #selector(ConfirmconfigViewsSelectBanktwo), userInfo: nil, repeats: false)
    }
   
    @objc func ConfirmconfigViewsSelectBanktwo()
    {
        indicator.stopAnimating()
        indicator.isHidden = true
        firstcircle.isHidden = true
        indicator.isHidden = false
        indicator = MaterialLoadingIndicator(frame: CGRect(x:12, y:15, width: 30, height: 30))
        indicator.indicatorColor = [UIColor.red.cgColor]
        self.viewtwo.addSubview(indicator)
        indicator.startAnimating()
        SELECTBANKVorderView = Timer.scheduledTimer(timeInterval:5.0, target: self, selector: #selector(ConfirmconfigViewsSelectBankthree), userInfo: nil, repeats: false)
    }
    @objc func ConfirmconfigViewsSelectBankthree()
    {
        indicator.stopAnimating()
        indicator.isHidden = true
        secondcircle.isHidden = true
        indicator = MaterialLoadingIndicator(frame: CGRect(x:12, y:20, width: 30, height: 30))
        indicator.indicatorColor = [UIColor.red.cgColor]
        self.viewthree.addSubview(indicator)
        indicator.startAnimating()
        SELECTBANKVorderView = Timer.scheduledTimer(timeInterval:5.0, target: self, selector: #selector(ConfirmthisorderViewtimeactionfioinal), userInfo: nil, repeats: false)
    }
    @objc func ConfirmthisorderViewtimeactionfioinal()
    {
        indicator.stopAnimating()
        indicator.isHidden = true
        thirdcircle.isHidden = true
        self.popupview.isHidden = false
        self.popcontactview.isHidden = false
    }
}
