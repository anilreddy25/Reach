//
//  productshoutViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 19/02/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

//// Message label


/// https://stackoverflow.com/questions/51765460/ios-how-to-align-labels-like-whatsapp-chat-message-label-and-time-label/52290461

import UIKit
import Alamofire
import AlamofireImage


class productshoutViewController: UIViewController,UITextFieldDelegate
{
    @IBOutlet weak var droptwo: UIButton!
    @IBOutlet weak var topviewfinal: UIView!
    @IBOutlet weak var titlename: UILabel!
    @IBOutlet weak var textlabel: UILabel!
    @IBOutlet weak var popcornnamelabel: UILabel!
    @IBOutlet weak var mrplabel: UILabel!
    @IBOutlet weak var moqlabel: UILabel!
    @IBOutlet weak var Exclusive: UIImageView!
    @IBOutlet weak var new: UIImageView!
    @IBOutlet weak var gift: UIImageView!
    @IBOutlet weak var marginlabel: UILabel!
    @IBOutlet weak var rupesscutoffrate: UILabel!
    @IBOutlet weak var rupeeslabel: UILabel!
    @IBOutlet weak var Timerlabel: UILabel!
    @IBOutlet weak var Endstiminglabel: UIView!
    @IBOutlet weak var sevendayslabel: UILabel!
    @IBOutlet weak var restockoffTakelabel: UILabel!
    @IBOutlet weak var myshoutbuton: UIButton!
    @IBOutlet weak var marketcardviewtwo: CardView!
    /// strings declerations
    var useridbiling1 = String()
    var Myauthorisationstringfinalvalue = String()
    var myagentTotalvalue  = String()
    var ownername = String()
    var productdescriptionuseridbiling  = String()
    var popcornDictionary = NSDictionary()
    var favpopcornsubject = NSArray()
    var Moqstringvalue = NSArray()
    var Totalpopcorniamgefinalvalue = NSArray()
    var TotalpopcornCutoffrate = NSArray()
    var TotalMyauthorisationstringfinalvalue = String()
    var TotalmyagentTotalvalue = String()
    var totalMarketshoutid = [NSNumber]()
    var totalSingelMarketshoutidvalue = String()
    
    
    @IBOutlet weak var myprofileimagetotal: UIImageView!
    
    
    
    @IBOutlet weak var popcornname: UIImageView!
    var subjectstringvalue = String()
    var DealTimeString  = String()
    
    
    @IBOutlet weak var timelabel: UILabel!
    
    var popcornnamefinal  = String()
    
    var profieliamge = String()
    var productiamgetotal = String()
    var popcornmrplabel  = String()
    var Moqstring = String()
    var isnewstring = String()
    var Exclusivefinal = String()
    var OfferstringTotal = String()
    var off_pricestringvalue  = String()
    var marginstringfinalvalue  = String()
    var instacklabelstring  = String()
    var Moqstringfinalvaluetwo = String()
    var statusTotalvalue  = String()
    
    
    @IBOutlet weak var producttotalvalue: UIView!
    
    @IBOutlet weak var shoutwithcomment: UIButton!
    @IBOutlet weak var shouttextfield: UITextField!
    
    var CommentTotalvalueis = String()
    
    var Commenttext = String()

    var CommentTotaltextfield = String()
    var postStringone  = String()

    var profileidstringTotal  = String()

    override func viewDidLoad()
    {
        super.viewDidLoad()

        if self.CommentTotalvalueis == "CommentTotalvalueis"
        {
            self.producttotalvalue.isHidden = false
            self.myshoutbuton.isHidden = true
        }
        else
        {
            self.producttotalvalue.isHidden = true
            self.myshoutbuton.isHidden = false
        }
        myshoutbuton.layer.cornerRadius = 16
        myshoutbuton.layer.masksToBounds = true
        
        topviewfinal.layer.shadowOffset = CGSize(width: 0, height: 3)
        topviewfinal.layer.shadowOpacity = 0.6
        topviewfinal.layer.shadowRadius = 3.0
        topviewfinal.layer.shadowColor = UIColor.color2().cgColor
        
        DispatchQueue.main.async
        {
            self.productMarketmethod()
        }
        self.myprofileimagetotal.layer.cornerRadius =   self.myprofileimagetotal.frame.size.width/2
        self.myprofileimagetotal.clipsToBounds = true
        self.shouttextfield.useUnderline()
        self.shouttextfield.setLeftPaddingPoints(12)
        self.shouttextfield.setRightPaddingPoints(12)
        self.shouttextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        let colo = UIColor.black
        let attributes = [
            NSAttributedStringKey.foregroundColor: colo
        ]
          self.shouttextfield.attributedPlaceholder = NSAttributedString(string:"Comment here", attributes:attributes)
     
        shoutwithcomment.layer.cornerRadius = 16
        shoutwithcomment.layer.masksToBounds = true
        
    }
    @objc func textFieldDidChange(_ textField: UITextField)
    {
        self.CommentTotaltextfield = self.shouttextfield.text!
        self.Commenttext = "Commenttext"
    }
    @IBAction func mybackbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    @IBAction func drop(_ sender: Any)
    {
        
    }
  
    @IBAction func myshoutbutton(_ sender: UIButton)
    {
        DispatchQueue.main.async
            {
            self.shoutwithcommentValue()
        }
    }
    
    func productMarketmethod()
    {
        //        self.showSpinner()
        var request = URLRequest(url: URL(string:AgentConstants.MarketFinalvalue)!)
        request.httpMethod = "POST"
        let dafaults = UserDefaults.standard
        if let Reviewfinaluseroid:String = dafaults.value(forKey:"MyLoginfinalvalue")as?String
        {
            self.useridbiling1 = Reviewfinaluseroid
        }
        if let Reviewfinaluseroid:String = dafaults.value(forKey: "myproductidvalue")as?String
        {
            self.productdescriptionuseridbiling = Reviewfinaluseroid
        }
        
        if let Myauthorisationfinlavalue:String = dafaults.value(forKey: "Myauthorisation")as?String
        {
            self.Myauthorisationstringfinalvalue = Myauthorisationfinlavalue
        }
        if let Myagentidfinlavalue:String = dafaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
      
        let postStringone =  String(format: "method=%@&productId=%@&agentId=%@&shoutcomment=%@&type=%@", "getcreatshout", self.productdescriptionuseridbiling,self.useridbiling1,"","temp")
        print(postStringone)
        request.httpBody = postStringone.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        request.addValue(self.Myauthorisationstringfinalvalue, forHTTPHeaderField: "Authorization")
        request.addValue(self.useridbiling1, forHTTPHeaderField:"AgentID")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                print(response.result)
                let value = response.response
                
                let valuetwo = response.data
                
                if let response = response as? HTTPURLResponse
                {
                    if response.statusCode == 200 {
                    }
                }
                if let httpResponse1 = value
                {
                    if let xDemAuth = httpResponse1.allHeaderFields["Authorization"] as? String {
                       
                        let defaults = UserDefaults.standard
                        defaults.set(xDemAuth, forKey:"Myauthorisation")
                        defaults.synchronize()
                    }
                }
                
                if let dict:NSDictionary = response.result.value as? NSDictionary
                {
                    print(dict)

                    if let popcornCustomerbnamelabelfinal:String = dict.value(forKey: "name") as?String
                    {
                        self.ownername = popcornCustomerbnamelabelfinal
                        DispatchQueue.main.async
                            {
                                self.titlename.text = self.ownername
                        }
                    }
                    
                    if let popcornDictionaryfinal:NSDictionary = dict.value(forKey: "shout") as?NSDictionary
                    {
                        self.popcornDictionary = popcornDictionaryfinal
                    }
                 
                    print(self.popcornDictionary)
                    if let subjectstringvaluefinal:String = dict.value(forKey: "subject") as?String
                    {
                        self.subjectstringvalue = subjectstringvaluefinal
                        DispatchQueue.main.async
                            {
                            self.textlabel.text = self.subjectstringvalue
                        }
                    }
                    
                    if let profileidstringTotalfinal:String = dict.value(forKey: "profileId") as?String
                    {
                        self.profileidstringTotal = profileidstringTotalfinal
                       
                    }
                
                    
                if let DealTimeStringvaluefinal:String = dict.value(forKey: "dealTime") as?String
                    {
                        self.DealTimeString = DealTimeStringvaluefinal
                        DispatchQueue.main.async {
                            if self.DealTimeString == "0"
                            {
                                self.timelabel.isHidden = true
                            }
                            else
                            {
                                self.timelabel.isHidden = false
                                self.timelabel.text = self.DealTimeString
                            }
                        }
                       
                    }
                    
                    if let popcornnamefinal:String =  self.popcornDictionary .value(forKey: "name") as?String
                    {
                        self.popcornnamefinal = popcornnamefinal
                        DispatchQueue.main.async {
                            self.popcornnamelabel.text =  self.popcornnamefinal
                        }
                    }

                    
                    if let Moqstringfinalvaluetwofinal:String =  self.popcornDictionary .value(forKey: "name") as?String
                    {
                        self.Moqstringfinalvaluetwo = Moqstringfinalvaluetwofinal
                        DispatchQueue.main.async {
                            self.rupeeslabel.text =  self.Moqstringfinalvaluetwo
                        }
                    }

                    
                    if let popcornmrplabelfinal:String =  self.popcornDictionary .value(forKey: "mrp") as?String
                    {
                        self.popcornmrplabel = popcornmrplabelfinal
                        DispatchQueue.main.async
                            {
                            self.mrplabel.text =  self.popcornnamefinal
                        }
                    }
                    print(self.popcornmrplabel)

                    if let Moqstringfinal:String =  self.popcornDictionary .value(forKey: "moq") as?String
                    {
                        self.Moqstring = Moqstringfinal
                        DispatchQueue.main.async
                            {
                            self.moqlabel.text =  self.Moqstring
                        }
                    }
                    
    if let isnewstringfinal:String =  self.popcornDictionary .value(forKey: "isnew") as?String
                    {
                        self.isnewstring = isnewstringfinal
                        if self.isnewstring == "1"
                        {
                            self.new.isHidden = false
                        }
                        else
                        {
                            self.new.isHidden = true
                        }
                    }
                    if let ExclusivefinalTotal:String =  self.popcornDictionary .value(forKey: "isExclusive") as?String
                    {
                        self.Exclusivefinal = ExclusivefinalTotal
                        if self.Exclusivefinal == "0"
                        {
                            self.Exclusive.isHidden = true
                        }
                        else
                        {
                            self.Exclusive.isHidden = false
                        }
                    }
                    if let OfferstringTotalfinal:String =  self.popcornDictionary .value(forKey: "Offer") as?String
                    {
                        self.OfferstringTotal = OfferstringTotalfinal
                        if self.OfferstringTotal == "0"
                        {
                            self.gift.isHidden = true
                        }
                        else
                        {
                            self.gift.isHidden = false
                        }
                    }
                    if let popcornnamefinal:String =  self.popcornDictionary.value(forKey: "image") as?String
                    {
                        self.productiamgetotal = popcornnamefinal
                        
                        DispatchQueue.main.async {
                            let url = URL(string: self.productiamgetotal)
                            
                            self.popcornname.sd_setImage(with: url) { (image, error, cache, urls) in
                                if (error != nil) {
                                    //                                self.imageone.image = #imageLiteral(resourceName: "default_img")
                                } else {
                                    self.popcornname.image = image
                                }
                            }
                        }
                    }
                    
                    if let profileimageID : String = dict.value(forKey:"profileImage") as? String {
                         self.profieliamge = profileimageID
                        DispatchQueue.main.async {
                            let url = URL(string: self.profieliamge)
                            
                            self.myprofileimagetotal.sd_setImage(with: url) { (image, error, cache, urls) in
                                if (error != nil) {
                                } else {
                                    DispatchQueue.main.async {
                                        self.myprofileimagetotal.image = image
                                        
                                    }
                                    
                                    
                                }
                            }
                        }
                        
                        
                       
                    }
                    if let off_pricestringvaluefinal:String = self.popcornDictionary.value(forKey: "off_price") as?String
                    {
                        self.off_pricestringvalue = off_pricestringvaluefinal
                        
                        DispatchQueue.main.async {
                            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string:self.off_pricestringvalue)
                            attributeString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
                            self.rupeeslabel.attributedText = attributeString
                            self.rupesscutoffrate.text =     self.off_pricestringvalue
                        }
                     
                    }
                 
                    if let Moqstringfinal:String =  self.popcornDictionary .value(forKey: "margin") as?String
                    {
                        self.marginstringfinalvalue = Moqstringfinal
                        DispatchQueue.main.async {
                            self.marginlabel.text =  self.marginstringfinalvalue
                        }
                    }
                    if let instacklabelstringfinalvalue:String =  self.popcornDictionary .value(forKey: "inStock") as?String
                    {
                        self.instacklabelstring = instacklabelstringfinalvalue
                        DispatchQueue.main.async {
                            self.restockoffTakelabel.text =  self.instacklabelstring

                        }
                    }
                   
                    
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
    func Shoutcretaionvalue()
    {
        //        self.showSpinner()
        var request = URLRequest(url: URL(string:AgentConstants.MarketFinalvalue)!)
        request.httpMethod = "POST"
        let dafaults = UserDefaults.standard
        if let Reviewfinaluseroid:String = dafaults.value(forKey:"MyLoginfinalvalue")as?String
        {
            self.useridbiling1 = Reviewfinaluseroid
        }
        if let Reviewfinaluseroid:String = dafaults.value(forKey: "myproductidvalue")as?String
        {
            self.productdescriptionuseridbiling = Reviewfinaluseroid
        }
        
        if let Myauthorisationfinlavalue:String = dafaults.value(forKey: "Myauthorisation")as?String
        {
            self.Myauthorisationstringfinalvalue = Myauthorisationfinlavalue
        }
        if let Myagentidfinlavalue:String = dafaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        let postStringone =  String(format: "method=%@&productId=%@&agentId=%@&shoutcomment=%@&type=%@&ids=%@", "getcreatshout", self.productdescriptionuseridbiling,self.useridbiling1,"","complete","[]")
        print(postStringone)
        request.httpBody = postStringone.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        request.addValue(self.Myauthorisationstringfinalvalue, forHTTPHeaderField: "Authorization")
        request.addValue(self.useridbiling1, forHTTPHeaderField:"AgentID")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                print(response.result)
                let value = response.response
                
                let valuetwo = response.data
                
                if let response = response as? HTTPURLResponse
                {
                    if response.statusCode == 200 {
                    }
                }
                if let httpResponse1 = value
                {
                    if let xDemAuth = httpResponse1.allHeaderFields["Authorization"] as? String {
                        
                        let defaults = UserDefaults.standard
                        defaults.set(xDemAuth, forKey:"Myauthorisation")
                        defaults.synchronize()
                    }
                }
                
                if let dict:NSDictionary = response.result.value as? NSDictionary
                {
                    print(dict)
                    
                    if let statusTotalvaluefinal:String = dict.value(forKey:"StatusMsg") as?String
                    {
                        self.statusTotalvalue = statusTotalvaluefinal
                        
                        if self.statusTotalvalue == "Success"
                        {
                            DispatchQueue.main.async
                                {
                                    self.dismiss(animated:true, completion:nil)
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
    
    func shoutwithcommentValue()
    {
        //        self.showSpinner()
        var request = URLRequest(url: URL(string:AgentConstants.MarketFinalvalue)!)
        request.httpMethod = "POST"
        let dafaults = UserDefaults.standard
        if let Reviewfinaluseroid:String = dafaults.value(forKey:"MyLoginfinalvalue")as?String
        {
            self.useridbiling1 = Reviewfinaluseroid
        }
        if let Reviewfinaluseroid:String = dafaults.value(forKey: "myproductidvalue")as?String
        {
            self.productdescriptionuseridbiling = Reviewfinaluseroid
        }
        
        if let Myauthorisationfinlavalue:String = dafaults.value(forKey: "Myauthorisation")as?String
        {
            self.Myauthorisationstringfinalvalue = Myauthorisationfinlavalue
        }
        if let Myagentidfinlavalue:String = dafaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
       
        
        
        
        let profileTotalshout = NSString(format:"%@%@%@","[",self.profileidstringTotal,"]")
        
        
//         self.CommentTotaltextfield
        
        if self.Commenttext == "Commenttext"
        {
            
        postStringone =  String(format: "method=%@&productId=%@&agentId=%@&shoutcomment=%@&type=%@&ids=%@", "getcreatshout", self.productdescriptionuseridbiling,self.useridbiling1,self.CommentTotaltextfield,"complete",profileTotalshout)
            print(postStringone)
        }
        else
        {
        postStringone =  String(format: "method=%@&productId=%@&agentId=%@&shoutcomment=%@&type=%@&ids=%@", "getcreatshout", self.productdescriptionuseridbiling,self.useridbiling1,"","complete","[]")
            print(postStringone)
        }
      
        request.httpBody = postStringone.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        request.addValue(self.Myauthorisationstringfinalvalue, forHTTPHeaderField: "Authorization")
        request.addValue(self.useridbiling1, forHTTPHeaderField:"AgentID")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                print(response.result)
                let value = response.response
                
                let valuetwo = response.data
                
                if let response = response as? HTTPURLResponse
                {
                    if response.statusCode == 200 {
                    }
                }
                if let httpResponse1 = value
                {
                    if let xDemAuth = httpResponse1.allHeaderFields["Authorization"] as? String {
                        
                        let defaults = UserDefaults.standard
                        defaults.set(xDemAuth, forKey:"Myauthorisation")
                        defaults.synchronize()
                    }
                }
                
                if let dict:NSDictionary = response.result.value as? NSDictionary
                {
                    print(dict)
                    
                    if let statusTotalvaluefinal:String = dict.value(forKey:"StatusMsg") as?String
                    {
                        self.statusTotalvalue = statusTotalvaluefinal
                        
                        if self.statusTotalvalue == "Success"
                        {
                            DispatchQueue.main.async
                                {
                                    self.dismiss(animated:true, completion:nil)
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
    @IBAction func shoutwithcomment(_ sender: UIButton)
    
    {
        self.shoutwithcommentValue()
    }
    
}
extension UITextField {
    func setLeftPaddingPointsNumbermall(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPointsNumbermall(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
}
}
