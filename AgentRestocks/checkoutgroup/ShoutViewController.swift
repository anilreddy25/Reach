//
//  ShoutViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 21/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

/// walletileframeworks
// https://lottiefiles.com/1801-fireworks
/// https://github.com/airbnb/lottie-ios


import UIKit
import Alamofire
import AlamofireImage
class ShoutViewController: UIViewController
{
    @IBOutlet weak var shouttopviewtwo: UIView!
    @IBOutlet weak var shouttopview: UIView!
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var scrollTopview: UIView!
    @IBOutlet weak var mycardviewfinalvalue: CardView!
    @IBOutlet weak var boarderviewabovevalue: UIView!
    @IBOutlet weak var shoutviewcartbelow: UIView!
    @IBOutlet weak var reeshoutedlabel: UILabel!
    @IBOutlet weak var shoutnamelabel: UILabel!
    @IBOutlet weak var mycustomerrealluylovethis: UILabel!
    @IBOutlet weak var popcornpirimasala: UILabel!
   
    @IBOutlet weak var restocklabel: UILabel!
    @IBOutlet weak var mycart: UIImageView!
    @IBOutlet weak var othersbought: UILabel!
    
    @IBOutlet weak var shoutman: UIImageView!
    
    @IBOutlet weak var addtocart: UIButton!
    
    var ShoutViewLogoimagevalue = [UIImage]()

    var ShoutName = [String]()
    var ShoutTitle = [String]()

    var ShoutTimelabel = [String]()

    
    var ShoutCommentlabel = [String]()

   
    var coverView = UIView()
    var imageView = UIImageView()
   
   
    var Myauthorisationstringfinalvalue = String()
    
    var myagentTotalvalue = String()
    
    var Dictfinal  = NSMutableDictionary()

    var useridbilingShout = String()
    
    var SingelMarketshoutidvalue1 = String()

    var MAindictfinalvalue = NSDictionary()

    
    var ComboDict = NSDictionary()

    
    var combotextstring = [String]()
    
    var combohasofftakestring = [String]()
    
    var combohasimagestring = [String]()
    var combohasisDelasstring = NSString()

    var combohasisExclusivestring = NSString()
    var combohasisnewtring = NSString()
    var combohasismargintring = NSArray()
    var combohasmargincolortring = NSArray()
    var combohasmoqtring = NSArray()

    var combomrp = NSArray()

    var comboname = NSArray()
    var combooff_price = NSArray()

    var comboofftale_color = NSArray()

    var comboprice = NSArray()

    var combosave_amount = NSArray()

    var combotime = NSArray()

    var Comment = NSArray()
    var data = NSArray()
    var hasbroughtby = NSArray()
    var id1 = [NSNumber]()
    var isShout = NSArray()
    var isShouted = NSArray()
    var isliked = NSArray()
    var isuserlike = NSArray()
    var likes = [NSNumber]()
    var message = NSArray()
    var name = NSArray()
    var profileImage = NSArray()
    var saved = [NSNumber]()
    var shoutText = NSArray()
    var shoutType = NSArray()
    var shoutimage = NSArray()
    var shouts = [NSNumber]()

    @IBOutlet weak var manimage: UIImageView!
    
    
    @IBOutlet weak var subjectlabel: UILabel!
    
    
    @IBOutlet weak var timinglabel: UILabel!
    
    var Shoutimagefinalvalue = Image()
    
    var  Shoutproductdescriptionid = String()
    
    
    //// Shout decleration
    var maindictTotal = NSDictionary()
    var Myshoutnamestringvalue  = NSArray()
    
    var subject = String()
    var time = String()
    var myname = String()
    var broughtBy = String()
    
    var broughtByImagesarray = NSArray()

    
    
    var ShoutListarayfinal = NSDictionary()

    
    @IBOutlet weak var imageview: UIImageView!
    
    
    @IBOutlet weak var arrowviewtwo: UIView!
    
    
    
    
    @IBOutlet weak var myexclusivetotal: UIImageView!
    
    
    @IBOutlet weak var mynewimage: UIImageView!
    
    @IBOutlet weak var mygift: UIImageView!
    
    
    @IBOutlet weak var Mrplabel: UILabel!
    
    @IBOutlet weak var moqlabel: UILabel!
    
    
    
    @IBOutlet weak var mypopproductName: UIImageView!
    @IBOutlet weak var productrupesslabel: UILabel!
    @IBOutlet weak var rupeslabel: UILabel!
    @IBOutlet weak var marginlabe: UILabel!
    @IBOutlet weak var outletsbought: UILabel!
    @IBOutlet weak var stockimage: UIImageView!
    
    @IBOutlet weak var sevendayslabel: UILabel!
    
    
    @IBOutlet weak var Endsinlabel: UILabel!
    
    
    @IBOutlet weak var boughtlabel: UILabel!
    
    @IBOutlet weak var rajagoud: UILabel!
    
    
    @IBOutlet weak var boughtimageone: UIImageView!
    
    @IBOutlet weak var boughtimagetwo: UIImageView!
    
    @IBOutlet weak var boughtimagethree: UIImageView!
    
    var profileiamgeTotalvalue = String()
    var popcornpirimasalastring = String()
    var mrpastring = String()
    var moqlabeltring  = String()
    var  popcorniamgestring  = String()
    var productrupesslabelstring  = String()
    var rupeslabelstring  = String()
    var marginstring = String()
    var inStocklabelstring  = String()
    var shoutTextByvalue = String()
    var shoutimagefinal = String()
    
    var tabelnamearray = [String]()
    var tabelTextarray = [String]()
    var tabeliamgearray = [String]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        shouttopviewtwo.layer.shadowOffset = CGSize(width: 0, height: 3)
        shouttopviewtwo.layer.shadowOpacity = 0.6
        shouttopviewtwo.layer.shadowRadius = 3.0
        shouttopviewtwo.layer.shadowColor = UIColor.color2().cgColor
        if self.view.frame.size.height < 800
        {
            scrollview.contentInset = UIEdgeInsetsMake(0, 0,1300, 0)
            scrollview.isScrollEnabled = true
            scrollview.showsVerticalScrollIndicator = false
        }

        mycardviewfinalvalue.layer.cornerRadius = 15.0

        Endsinlabel.layer.cornerRadius = 15.0


        self.Endsinlabel.layer.cornerRadius = 5.0
      
        DispatchQueue.main.async
          {
            self.ShoutmethodFinalvalue()
           }
    
         self.manimage.layer.cornerRadius =  self.manimage.frame.height/2
         self.manimage.clipsToBounds = true
         self.manimage.backgroundColor = UIColor.gray
        
        self.boughtimageone.layer.cornerRadius =  self.boughtimageone.frame.height/2
        self.boughtimageone.clipsToBounds = true
        self.boughtimageone.backgroundColor = UIColor.gray
        
        self.boughtimagetwo.layer.cornerRadius =  self.boughtimageone.frame.height/2
        self.boughtimagetwo.clipsToBounds = true
        self.boughtimagetwo.backgroundColor = UIColor.gray
        
        self.boughtimagethree.layer.cornerRadius =  self.boughtimageone.frame.height/2
        self.boughtimagethree.clipsToBounds = true
        self.boughtimagethree.backgroundColor = UIColor.gray
     
    }
    @IBAction func backbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
        
    }
    
    @IBAction func shoutbutton(_ sender: UIButton)
    {
    }
    
    @IBAction func addtocartbutton(_ sender: UIButton)
    {
        DispatchQueue.main.async
            {
            let cartfinalvaluetotal = self.storyboard?.instantiateViewController(withIdentifier:"CartViewController")as!CartViewController
            self.present(cartfinalvaluetotal, animated:true, completion:nil)
        }
    }
    

    func ShoutmethodFinalvalue()
    {
        DispatchQueue.main.async
        {
            self.arrowviewtwo.isHidden = false
        }
        var request = URLRequest(url: URL(string:"http://172.31.0.13/NumberMall/market_library.php")!)
        request.httpMethod = "POST"
        let dafaults = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = dafaults.value(forKey: "myuseridvaluefinal")as?String
        {
            self.Shoutproductdescriptionid = Reviewfinaluseroid
        }
        
        
        if let Myauthorisationfinlavalue:String = dafaults.value(forKey: "Myauthorisation")as?String
        {
            self.Myauthorisationstringfinalvalue = Myauthorisationfinlavalue
        }
        if let Myagentidfinlavalue:String = dafaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        
        if let useridbilingShoutfinalvalue:String = dafaults.value(forKey: "MyLoginfinalvalue")as?String
        {
            self.useridbilingShout = useridbilingShoutfinalvalue
        }
        if SingelMarketshoutidvalue1 != ""
        {
        }
        else
        {
        SingelMarketshoutidvalue1 = "72"
        }
     let postStringone =  String(format:"method=%@&agentid=%@&shoutId=%@","marketsingleview",self.useridbilingShout,SingelMarketshoutidvalue1)
        
        request.httpBody = postStringone.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        request.addValue(self.Myauthorisationstringfinalvalue, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
          
                if let dict:NSDictionary = response.result.value as? NSDictionary
                {
                    DispatchQueue.main.async
                        {
                        self.arrowviewtwo.isHidden = true
                    }
                    if let maindictTotalfinalvalue:NSDictionary = dict.value(forKey:"main") as? NSDictionary
                    {
                        self.maindictTotal = maindictTotalfinalvalue
                    }
                    if let ShoutListarayfinalvalue:NSDictionary =  self.maindictTotal.value(forKey:"shout") as? NSDictionary
                    {
                        self.ShoutListarayfinal = ShoutListarayfinalvalue
                    }
                    
                    if let popcornpirimasalastringlvalue:String =  self.ShoutListarayfinal.value(forKey:"name") as? String
                    {
                        self.popcornpirimasalastring = popcornpirimasalastringlvalue
                        self.popcornpirimasala.text =  self.popcornpirimasalastring
                    }
                    
                    if let mrpastringlvalue:String =  self.ShoutListarayfinal.value(forKey:"mrp") as? String
                    {
                        self.mrpastring = mrpastringlvalue
                        self.Mrplabel.text =  self.mrpastring
                    }
                    
                    if let moqlabeltringvalue:String =  self.ShoutListarayfinal.value(forKey:"moq") as? String
                    {
                        self.moqlabeltring = moqlabeltringvalue
                        self.moqlabel.text =  self.moqlabeltring
                    }
                    
                    if let productrupesslabelstringvalue:String =  self.ShoutListarayfinal.value(forKey:"off_price") as? String
                    {
                        self.productrupesslabelstring = productrupesslabelstringvalue
                        self.productrupesslabel.text =  self.productrupesslabelstring
                    }
                    
                    if let rupeslabelstringvalue:String =  self.ShoutListarayfinal.value(forKey:"off_price") as? String
                    {
                        self.rupeslabelstring = rupeslabelstringvalue
                        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string:self.rupeslabelstring)
                    attributeString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
                        
                          self.rupeslabel.attributedText =  attributeString
                    }
                    if let marginstringvalue:String =  self.ShoutListarayfinal.value(forKey:"margin") as? String
                    {
                        self.marginstring = marginstringvalue
                        self.marginlabe.text =  self.marginstring
                    }
                    if let inStocklabelstringvalue:String =  self.ShoutListarayfinal.value(forKey:"inStock") as? String
                    {
                        self.inStocklabelstring = inStocklabelstringvalue
                        self.restocklabel.text =  self.inStocklabelstring
                        self.outletsbought.text =  self.inStocklabelstring
                    }
                    
                    if let popcorniamgestringvalue:String =  self.ShoutListarayfinal.value(forKey:"image") as? String
                    {
                        self.popcorniamgestring = popcorniamgestringvalue
                        
                        let url = URL(string:self.popcorniamgestring)
                        self.mypopproductName.sd_setImage(with: url) { (image, error, cache, urls) in
                            if (error != nil) {
                               self.mypopproductName.image = #imageLiteral(resourceName: "default_img")
                            } else {
                                self.mypopproductName.image = image
                            }
                        }
                    }
                 
                    if let mynamefinalvalue:String =  self.maindictTotal.value(forKey:"name") as? String
                    {
                        self.myname = mynamefinalvalue
                        self.shoutnamelabel.text = self.myname
//                        self.tabelnamearray.append(self.myname)
                    }
                   
                    if let subjectfinalvalue:String =  self.maindictTotal.value(forKey:"subject") as? String
                    {
                        self.subject = subjectfinalvalue
                        self.subjectlabel.text =  self.subject
                    }
                    
                    if let timefinalvalue:String =  self.maindictTotal.value(forKey:"time") as? String
                    {
                        self.time = timefinalvalue
                        self.timinglabel.text = self.time
                    }
                    
                    if let timefinalvalue:String =  self.maindictTotal.value(forKey:"profileImage") as? String
                    {
                        self.profileiamgeTotalvalue = timefinalvalue
                        
                        let url = URL(string:self.profileiamgeTotalvalue)
                        
                        
                        self.manimage.sd_setImage(with: url) { (image, error, cache, urls) in
                            if (error != nil) {
                            
                            } else {
                                self.manimage.image = image
                            }
                        }
                        
                    }
                    if let broughtByfinalvalue:String =  self.maindictTotal.value(forKey:"broughtBy") as? String
                    {
                        self.broughtBy = broughtByfinalvalue
                        self.boughtlabel.text =    self.broughtBy
                    }
                    
                    if let broughtByImagesarrayfinal:NSArray =  self.maindictTotal.value(forKey:"broughtByImages") as? NSArray
                    {
                        self.broughtByImagesarray = broughtByImagesarrayfinal
                        
                        
                        if self.broughtByImagesarray.count > 0
                        {
                            if self.broughtByImagesarray.count == 0
                        {
                            let url = URL(string: self.broughtByImagesarray [0] as! String)
                            self.boughtimageone.sd_setImage(with: url) { (image, error, cache, urls) in
                                if (error != nil) {
                                    self.boughtimageone.image = #imageLiteral(resourceName: "default_img")
                                } else {
                                    self.boughtimageone.image = image
                                }
                            }
                            }
                            if   self.broughtByImagesarray.count == 1
                            {
                                let url = URL(string: self.broughtByImagesarray [0] as! String)
                                
                                
                                self.boughtimageone.sd_setImage(with: url) { (image, error, cache, urls) in
                                    if (error != nil) {
                                    } else {
                                        self.boughtimageone.image = image
                                    }
                                }
                            }
                            if   self.broughtByImagesarray.count == 2
                            {
                                let url = URL(string: self.broughtByImagesarray [1] as! String)
                                self.boughtimagetwo.sd_setImage(with: url) { (image, error, cache, urls) in
                                    if (error != nil) {
                                    } else {
                                        self.boughtimagetwo.image = image
                                    }
                                }
                            }
                            
                        }
                    }
                    if let shoutTextByvaluefinalvalue:String =  self.maindictTotal.value(forKey:"shoutText") as? String
                    {
                        self.shoutTextByvalue = shoutTextByvaluefinalvalue
//                        self.tabelTextarray.append(self.shoutTextByvalue)
                    }
                    if let shoutimagefinalvalue:String =  self.maindictTotal.value(forKey:"shoutimage") as? String
                    {
                        self.shoutimagefinal = shoutimagefinalvalue
//                        self.tabeliamgearray.append(self.shoutimagefinal)
                    }

                    }
                
                break
            case .failure(_):
                DispatchQueue.main.async
                    {
                        DispatchQueue.main.async
                            {
                                self.arrowviewtwo.isHidden = true
//                                self.removeSpinner()

                        }
                }
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
        self.view.removeFromSuperview()
        self.hideProgressBar()
    }
}
extension UIImageView
{
   func setImageFromURl(stringImageUrl url: String)
    {
        if let url = NSURL(string: url)
        {
            if let data = NSData(contentsOf: url as URL)
            {
                self.image = UIImage(data: data as Data)
            }
        }
    }
}
