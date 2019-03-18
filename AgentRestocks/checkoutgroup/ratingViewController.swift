//
//  ratingViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 27/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class ratingViewController: UIViewController
{
    @IBOutlet weak var mainpopupscrollview: UIScrollView!
    @IBOutlet weak var mainpopview: UIView!
    @IBOutlet weak var ratingtopHome: UIView!
    @IBOutlet weak var floatratingview: FloatRatingView!
    @IBOutlet weak var ratedgivenview: UIView!
    @IBOutlet weak var manimage: UIImageView!
    @IBOutlet weak var ratedeliveryboy: UILabel!
    @IBOutlet weak var freelabel: UILabel!
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var Quantitymismatch: UIButton!
    @IBOutlet weak var Damagedproducts: UIButton!
    @IBOutlet weak var Timetodelivery: UIButton!
    @IBOutlet weak var Productknowledge: UIButton!
    @IBOutlet weak var Goodshandling: UIButton!
    @IBOutlet weak var Unprofessional: UIButton!
    @IBOutlet weak var Packingquality: UIButton!
    @IBOutlet weak var Others: UIButton!
    
    @IBOutlet weak var ratetopview: UIView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 2
        ratetopview.addGestureRecognizer(tap)
        
        
        
        self.ratingtopHome.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        self.submit.layer.cornerRadius = 3.0
        self.submit.layer.masksToBounds = true
        self.submit.clipsToBounds = true
        self.submit.layer.borderWidth  = 1.0
        self.submit.layer.borderColor = UIColor.lightGray.cgColor
        
        
        self.Quantitymismatch.layer.cornerRadius = 15.0
        self.Quantitymismatch.layer.masksToBounds = true
        self.Quantitymismatch.clipsToBounds = true
        self.Quantitymismatch.layer.borderWidth  = 1.0
        self.Quantitymismatch.layer.borderColor = UIColor.lightGray.cgColor
        self.Quantitymismatch.backgroundColor = UIColor.gray
        
        self.Damagedproducts.layer.cornerRadius = 15.0
        self.Damagedproducts.layer.masksToBounds = true
        self.Damagedproducts.clipsToBounds = true
        self.Damagedproducts.layer.borderWidth  = 1.0
        self.Damagedproducts.layer.borderColor = UIColor.lightGray.cgColor
        
        
        self.Timetodelivery.layer.cornerRadius = 15.0
        self.Timetodelivery.layer.masksToBounds = true
        self.Timetodelivery.clipsToBounds = true
        self.Timetodelivery.layer.borderWidth  = 1.0
        self.Timetodelivery.layer.borderColor = UIColor.lightGray.cgColor
        
        
        
        
        self.Productknowledge.layer.cornerRadius = 15.0
        self.Productknowledge.layer.masksToBounds = true
        self.Productknowledge.clipsToBounds = true
        //        self.Productknowledge.layer.borderWidth  = 2.0
        self.Productknowledge.layer.borderWidth  = 1.0
        self.Productknowledge.layer.borderColor = UIColor.lightGray.cgColor
        
        
        
        self.Goodshandling.layer.cornerRadius = 15.0
        self.Goodshandling.layer.masksToBounds = true
        self.Goodshandling.clipsToBounds = true
        self.Goodshandling.layer.borderWidth  = 1.0
        self.Goodshandling.layer.borderColor = UIColor.lightGray.cgColor
        
        
        
        self.Unprofessional.layer.cornerRadius = 15.0
        self.Unprofessional.layer.masksToBounds = true
        self.Unprofessional.clipsToBounds = true
        self.Unprofessional.layer.borderWidth  = 1.0
        self.Unprofessional.layer.borderColor = UIColor.lightGray.cgColor
        
        
        self.Packingquality.layer.cornerRadius = 15.0
        self.Packingquality.layer.masksToBounds = true
        self.Packingquality.clipsToBounds = true
        self.Packingquality.layer.borderWidth  = 1.0
        self.Packingquality.layer.borderColor = UIColor.lightGray.cgColor
        
//        self.mylogyourticket.layer.cornerRadius = 5.0
//        self.mylogyourticket.layer.masksToBounds = true
//        self.mylogyourticket.clipsToBounds = true
//        
        self.Others.layer.cornerRadius = 15.0
        self.Others.layer.masksToBounds = true
        self.Others.clipsToBounds = true
        self.Others.layer.borderWidth  = 1.0
        self.Others.layer.borderColor = UIColor.lightGray.cgColor
        
        
        self.submit.layer.cornerRadius = 5.0
        self.submit.layer.masksToBounds = true
        self.submit.clipsToBounds = true

        
        
        
        
        
        self.floatratingview.backgroundColor = UIColor.clear
        
        // self.floatratingview.editable = true
        
        self.floatratingview.delegate = self as? FloatRatingViewDelegate
        
        self.ratedgivenview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        
        self.ratedgivenview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        
//
//        self.middelviewfinal.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
//        self.middelviewfinal.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.8)

        let bottomSheet = JXBottomSheetView(contentView:mainpopupscrollview as! UIScrollView)
        bottomSheet.defaultMininumDisplayHeight = 250
        bottomSheet.defaultMaxinumDisplayHeight = 450
        bottomSheet.displayState = .minDisplay
        bottomSheet.frame = self.view.bounds
        self.view.addSubview(bottomSheet)
        mainpopupscrollview.slideInFromLeft()
        mainpopview.slideInFromLeft()

        mainpopupscrollview.dropShadow1()
        mainpopview.dropShadow1()
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.3)
//        self.ratetopview.backgroundColor = UIColor.white.withAlphaComponent(0.3)

        //label_view1.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
    }
    
    @IBAction func submit(_ sender: UIButton)
    {
        
    }
    
    
    @IBAction func quantity(_ sender: UIButton)
    {
    
       }
    
    
    @IBAction func Damagedproducts(_ sender: UIButton)
    {
        
    }
    
    

    
    @IBAction func Timedeliver(_ sender: UIButton)
    {
    }
    
    @IBAction func ProductKnowldge(_ sender: UIButton)
    {
    }
    
    @IBAction func GoodHandling(_ sender: UIButton)
    {
    }
    
    @IBAction func unprofessional(_ sender: UIButton)
    {
    }
    
    @IBAction func Packingquality(_ sender: UIButton)
    {
    }
    @IBAction func others(_ sender: UIButton)
    {
        
    }
    @objc func doubleTapped()
    {
        self.view.removeFromSuperview()
    }
}
extension ratingViewController: FloatRatingViewDelegate
{
    func floatRatingView(_ ratingView: FloatRatingView, isUpdating rating: Double)
    {
        //  ratinglabel.text = String(format: "%.2f", self.floatratingview.rating)
        //  self.ratinglabel.isHidden = false
    }
}
