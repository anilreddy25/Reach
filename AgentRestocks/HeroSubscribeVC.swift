//
//  HeroSubscribeVC.swift
//  AgentRestocks
//
//  Created by apple on 9/27/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class HeroSubscribeVC: UIViewController, iCarouselDelegate, iCarouselDataSource, UIScrollViewDelegate {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var btnPop: UIButton!
    @IBOutlet weak var btnCart: UIButton!
    @IBOutlet weak var lblHeroSubscription: UILabel!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var lblChooseYour: UILabel!
    
    @IBOutlet weak var carousel: iCarousel!
    
     var viewPlan: UIView!
     var lblPlan: UILabel!
     var lblStrikePrice: UILabel!
     var lblPlanPrice: UILabel!
     var lblSavePrice: UILabel!
     var btnAddtoCart: UIButton!
     var lblStrike: UILabel!
    let cornerRadius: CGFloat = 6.0
    @IBOutlet weak var pageControl: UIPageControl!
//    var imgArr = ["MONTHLY","QUARTERLY","HALF YEARLY","YEARLY"]
//    var strPrice = ["1,100","3,000","6,000","12,000"]
//    var landPrice = ["1,000","2,700","5,000","10,000"]
//    var priceSave = ["100","300","1,000","2,000"]
    var item: [Int] = []
    var frame: CGRect = CGRect(x:0, y:0, width:0, height:0)
    var Schemesarraytotalvalue = NSArray()
    var ShemeHeroId = [String]()
    var ShemeHeadColor = [String]()
    var ShemeValidity = [String]()
    var ShemeAmountOffer = [String]()
    var ShemeAmountActual = [String]()
//    var SchemeSubarray = NSDictionary()
    var SchemeSubarray = NSArray()
    var SchemehubSaveAmount = [NSNumber]()
    var SchemehubofferImage = [String]()
    var coverView = UIView()
    var imageView = UIImageView()
    var useridbilingfinalvalue = String()
    var Myauthorisationstringfinalvalue = String()
    var myagentTotalvalue = String()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in  0 ..< self.ShemeValidity.count {

            item.append(i)
            print(item)
        }
        
    }
    @IBOutlet weak var herosubscribeview: UIView!
    
  
    @IBOutlet weak var mycarttotalbutton: UIButton!
    
    @IBOutlet weak var mycartlabelvalue: UILabel!
    
    var HeroproductidTotalvalueis = String()
    
    var cartcounttotalnumbervalue = NSNumber()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        carousel.type = .rotary
        carousel.contentMode = .scaleAspectFill
        carousel.isPagingEnabled = true
        
        carousel.delegate = self
        carousel.dataSource = self
        carousel.pageControlNormalPageColor = UIColor.white
        carousel.pageControlCurrentPageColor = UIColor(red: 0/255, green: 179/255, blue: 216/255, alpha: 1.0)
        carousel.reloadData()
        carousel.backgroundColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 0.5)

        headerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        headerView.layer.shadowOpacity = 0.3
        headerView.layer.shadowRadius = 1.0
        headerView.layer.borderColor = UIColor.color2().cgColor
        headerView.layer.shadowColor = UIColor.color2().cgColor
        headerView.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        
        DispatchQueue.main.async {
            self.Herosubscribitioncard()
        }
    
      
        let defaults = UserDefaults.standard
        if let Mycartcountvalue:NSNumber = defaults.value(forKey:"Mycartcountstring")as?NSNumber
        {
            self.mycartlabelvalue.text = Mycartcountvalue.stringValue
            self.mycartlabelvalue.isHidden = false
            self.mycartlabelvalue.layer.cornerRadius = self.mycartlabelvalue.frame.size.width / 2
            self.mycartlabelvalue.clipsToBounds = true
            self.mycartlabelvalue.layer.masksToBounds = true
        }
        else{
             self.mycartlabelvalue.isHidden = true
        }

        let cartcounttapvalueis = UITapGestureRecognizer(target: self, action: #selector(self.cartcounttapvalueisTapContactfinalvalue(_:)))
        herosubscribeview.addGestureRecognizer(cartcounttapvalueis)
        herosubscribeview.isUserInteractionEnabled = true
        
        
    }
    @objc func cartcounttapvalueisTapContactfinalvalue(_ sender: UIGestureRecognizer)
    {
        DispatchQueue.main.async {
            let CartViewvalue = self.storyboard?.instantiateViewController(withIdentifier:"CartViewController")as!CartViewController
            self.present(CartViewvalue, animated:true, completion:nil)
        }
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func pageControlAction(_ sender: Any)
    {
 
    }
    
    
    @IBAction func btnCartAction(_ sender: Any)
    {
        DispatchQueue.main.async
            {
                let HeroCartView = self.storyboard?.instantiateViewController(withIdentifier:"CartViewController")as!CartViewController
                self.present(HeroCartView, animated:true, completion:nil)
        }
    }
    
    @IBAction func btnPopAction(_ sender: Any)
    {
    self.dismiss(animated:true, completion:nil)
    }

    func numberOfItems(in carousel: iCarousel) -> Int
    {
        return self.ShemeValidity.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView
    {
        if let view = view {
            viewPlan = view
            lblPlan = viewPlan.viewWithTag(1) as? UILabel
            lblStrike = viewPlan.viewWithTag(2) as? UILabel
            lblStrikePrice = viewPlan.viewWithTag(3) as? UILabel
            lblPlanPrice = viewPlan.viewWithTag(4) as? UILabel
            lblSavePrice = viewPlan.viewWithTag(5) as? UILabel
            btnAddtoCart = viewPlan.viewWithTag(index) as? UIButton
            
        } else {
            viewPlan = UIView(frame: CGRect(x: 0, y:-25, width:240
                , height: 265))
            viewPlan.layer.shadowOffset = CGSize(width: 0, height: 3)
            viewPlan.layer.shadowOpacity = 0.6
            viewPlan.layer.shadowRadius = 3.0
            viewPlan.layer.shadowColor = UIColor.gray.cgColor
            viewPlan.backgroundColor = UIColor.white
            viewPlan.contentMode = .center
            lblPlan = UILabel(frame: CGRect(x: 0, y: 0, width: viewPlan.frame.size.width, height: 65))
            lblPlan.backgroundColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1.0)
            lblPlan.font = UIFont(name: "Arial-BoldMT", size: 15)
            lblPlan.textAlignment = .center
          
            lblStrikePrice = UILabel(frame: CGRect(x: viewPlan.frame.size.width * 35/100, y:70 , width: viewPlan.frame.size.width * 30/100, height: 30))
            lblStrikePrice.textAlignment = .center
            lblStrikePrice.textColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1.0)
            lblStrikePrice.font = UIFont(name: "Arial", size: 12)
            lblStrike = UILabel(frame: CGRect(x: viewPlan.frame.size.width * 35/100-5, y:85, width: viewPlan.frame.size.width * 30/100, height: 1))
            lblStrike.backgroundColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1.0)
            lblPlanPrice = UILabel(frame: CGRect(x: viewPlan.frame.size.width * 25/100+10, y: 100, width: viewPlan.frame.size.width * 40/100, height: 30))
            lblPlanPrice.textAlignment = .center
            lblPlanPrice.font = UIFont(name: "Arial-BoldMT", size: 18)
            lblPlanPrice.textColor = UIColor.black
            
            
            lblSavePrice = UILabel(frame: CGRect(x: viewPlan.frame.size.width * 30/100, y: 135, width: viewPlan.frame.size.width * 45/100, height: 30))
            lblSavePrice.textAlignment = .center
            lblSavePrice.font = UIFont(name: "Arial", size: 12)
            lblSavePrice.textColor = UIColor.white
            lblSavePrice.backgroundColor = UIColor(red: 255/255, green: 120/255, blue:68/255, alpha: 1.0)
            lblSavePrice.layer.cornerRadius = 2.0
            lblSavePrice.clipsToBounds = true
            
            
            btnAddtoCart = UIButton(frame: CGRect(x: 0, y:205, width: viewPlan.frame.size.width, height:65))
            btnAddtoCart.addTarget(self, action: #selector(btnAddtoCartAction), for: .touchUpInside)
            btnAddtoCart.setTitle("Add to Cart", for: .normal)
            btnAddtoCart.backgroundColor = UIColor(red: 232/255, green: 233/255, blue: 233/255, alpha: 1.0)
            btnAddtoCart.setTitleColor(UIColor(red: 0/255, green: 179/255, blue: 216/255, alpha: 1.0), for: .normal)
          
            lblPlan.tag = 1
            lblStrike.tag = 2
            lblStrikePrice.tag = 3
            lblPlanPrice.tag = 4
            lblSavePrice.tag = 5
            btnAddtoCart.tag = index
            viewPlan.addSubview(lblPlan)
            viewPlan.addSubview(lblStrike)
            viewPlan.addSubview(lblStrikePrice)
            viewPlan.addSubview(lblPlanPrice)
            viewPlan.addSubview(lblSavePrice)
            viewPlan.addSubview(btnAddtoCart)
            
        }
            let rupee = "\u{20B9}"
           lblPlan.text = "\(self.ShemeValidity[index])"
            lblStrike.text = ""
            lblStrikePrice.text = "\(rupee)\(self.ShemeAmountActual[index])"
        
        lblPlanPrice.text = "\(rupee)\(self.ShemeAmountOffer[index])"

          //  lblPlanPrice.text = "\(rupee)\(landPrice[index])"
        let Recomendedpopcornimagevalue = self.SchemehubSaveAmount[index]
        let totalvalueis = Recomendedpopcornimagevalue.stringValue
//        lblSavePrice.text = "Save \(rupee)\(priceSave[index])"
        let dotstringvaluetotal = "."
        lblSavePrice.text = "Save \(rupee)\(totalvalueis)\(dotstringvaluetotal)\(00)"
        pageControl.currentPage = index
//        pageControl.numberOfPages = landPrice.count
        pageControl.numberOfPages =  self.ShemeAmountActual.count
        pageControl.currentPageIndicatorTintColor = UIColor.red
        viewPlan.layer.shadowColor = UIColor.black.cgColor
        viewPlan.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        viewPlan.layer.shadowOpacity = 0.2
        viewPlan.layer.shadowRadius = 4.0
        viewPlan.layer.cornerRadius = cornerRadius
        viewPlan.layer.masksToBounds = true
        return viewPlan
    }
    
    
    @objc func btnAddtoCartAction(_ sender: UIButton)
    {
        let btn = sender
        print(btn)
        print("\(btn.tag)")
        
      let valuetotal = self.ShemeHeroId[btn.tag]

        self.HeroproductidTotalvalueis  = String(valuetotal)
        print(self.HeroproductidTotalvalueis)
        print(self.HeroproductidTotalvalueis)

        DispatchQueue.main.async {
            self.singelscribitioncard()
        }
        
        
    }

    func carouselDidEndDecelerating(_ carousel: iCarousel)
    {
        for i in 0 ..< self.ShemeValidity.count
        {
        let pageNumber = i
        pageControl.currentPage = pageNumber
        }
    }
    
    func carouselDidScroll(_ carousel: iCarousel)
    {
        for i in 0 ..< self.ShemeValidity.count
        {
            let pageNumber = i
            pageControl.currentPage = pageNumber
            pageControl.currentPageIndicatorTintColor = UIColor.red
        }
    }
    func Herosubscribitioncard()
    {
        self.showSpinner()
        let dafaults = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = dafaults.value(forKey: "Myuseridfinaltwovalue")as?String
        {
            self.useridbilingfinalvalue = Reviewfinaluseroid
        }
        if let Myauthorisationfinlavalue:String = dafaults.value(forKey: "Myauthorisation")as?String
        {
            self.Myauthorisationstringfinalvalue = Myauthorisationfinlavalue
        }
        if let Myagentidfinlavalue:String = dafaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let postString =  String(format: "method=%@&ActorId=%@","getMemberShipDetails",self.useridbilingfinalvalue,"IOS")
        request.addValue(self.Myauthorisationstringfinalvalue, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        
        request.httpBody = postString.data(using: .utf8)

        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                if let dictfinalvaluefinal:NSDictionary = response.result.value as? NSDictionary
                {
                    self.removeSpinner()
                    if let COD_limitDisctionaryfinal:NSArray = dictfinalvaluefinal.value(forKey: "Schemes") as? NSArray
                    {
                       self.Schemesarraytotalvalue = COD_limitDisctionaryfinal
                        self.ShemeHeroId =   self.Schemesarraytotalvalue.value(forKey:"heroId")as![String]
                        self.ShemeHeadColor =   self.Schemesarraytotalvalue.value(forKey:"HeadColor")as![String]
                        self.ShemeValidity =   self.Schemesarraytotalvalue.value(forKey:"Validity")as![String]
                        self.ShemeAmountOffer =   self.Schemesarraytotalvalue.value(forKey:"AmountOffer")as![String]
                        
                        self.ShemeAmountActual =   self.Schemesarraytotalvalue.value(forKey:"AmountActual")as![String]
                    }
                    print(self.Schemesarraytotalvalue.value(forKey:"SchemeSub"))

                    self.SchemeSubarray =    self.Schemesarraytotalvalue.value(forKey:"SchemeSub")as!NSArray
                    self.SchemehubSaveAmount =   self.SchemeSubarray.value(forKey:"SaveAmount")as![NSNumber]
                    self.SchemehubofferImage =   self.SchemeSubarray.value(forKey:"offerImage")as![String]
                    print(self.SchemehubSaveAmount)
                    print(self.SchemehubofferImage)
                    
                    DispatchQueue.main.async
                        {
                        self.carousel.reloadData()
                    }
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
    
    func singelscribitioncard()
    {
        self.showSpinner()
        let dafaults = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = dafaults.value(forKey: "Myuseridfinaltwovalue")as?String
        {
            self.useridbilingfinalvalue = Reviewfinaluseroid
        }
        if let Myauthorisationfinlavalue:String = dafaults.value(forKey: "Myauthorisation")as?String
        {
            self.Myauthorisationstringfinalvalue = Myauthorisationfinlavalue
        }
        if let Myagentidfinlavalue:String = dafaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
  //      let postString =  String(format: "method=%@&ActorId=%@","getMemberShipDetails",self.useridbilingfinalvalue,"IOS")
        
    let postString =  String(format: "method=%@&userid=%@&HeroProduct=%@&idProductInfo=%@&action=%@","AddToCartDynamic",self.useridbilingfinalvalue,self.HeroproductidTotalvalueis,self.HeroproductidTotalvalueis,"remove")

        print(postString)
        request.addValue(self.Myauthorisationstringfinalvalue, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        
        request.httpBody = postString.data(using: .utf8)
        
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                if let dictfinalvaluefinal:NSDictionary = response.result.value as? NSDictionary
                {
                  
                    if let statusstring:String = dictfinalvaluefinal.value(forKey:"StatusMsg")as?String
                    {
                        print(statusstring)
                        var str2 = statusstring
                        print(str2)
                        
                        if  str2 == "Product added to cart successfully."
                        {
                           self.view.makeToast(str2)
                            self.cartcounttotalnumbervalue = dictfinalvaluefinal.value(forKey:"CartCount")as!NSNumber
                            let defaults = UserDefaults.standard
                            defaults.set( self.cartcounttotalnumbervalue, forKey:"Mycartcountstring")
                            defaults.synchronize()
                            DispatchQueue.main.async
                                {
                                    let CartViewControllerfinalView = self.storyboard?.instantiateViewController(withIdentifier:"CartViewController")as!CartViewController
                                
                                    self.present(CartViewControllerfinalView, animated:true, completion:nil)
                            }
                        }
                    }
               
                }
                break
            case .failure(_):
                break
            }
        }
    }

    func showSpinner()
    {
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.view.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(imageView)
    }
    func removeSpinner()
    {
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()
    }
  
    @IBAction func Mycartbuttontotalvalueis(_ sender: UIButton)
    {
        DispatchQueue.main.async {
            let CartViewvalue = self.storyboard?.instantiateViewController(withIdentifier:"CartViewController")as!CartViewController
            self.present(CartViewvalue, animated:true, completion:nil)
        }
        
    }
}



