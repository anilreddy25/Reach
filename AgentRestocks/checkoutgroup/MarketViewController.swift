//
//  MarketViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 21/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SDWebImage
import Kingfisher


class MarketViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet weak var mymarkettabelview: UITableView!
    var Marketusers = [String]()
    var coverView = UIView()
    var imageView = UIImageView()
    var popcornTopname = [String]()
    var popcornCustomerbname = [String]()
    var popcornDatelabel = [String]()
    
    var Totalpopcornnamelabel = [String]()
    
   // var Totalpopcornrupeeslabel = [NSNumber]()
    
    var Totalpopcornrupeeslabel = [String]()

    var Totalpopcornrupeesmarginlabel = [String]()
    var Totalpopcornpercentagelabel = [String]()
  var TotalpopcornMarginlabel = [String]()
    
//  var TotalpopcornMarginlabel = [NSNumber]()

    var TotalpopcornEndsinlabel = [String]()
    var Totalpopcorndaysinlabel = [String]()
    var TotalpopcornRestokeoffTakelabel = [NSNumber]()
    var Totalpopcornoutletboughtlabel = [String]()
    var shoutNamelabelstring = [String]()
    var percentagelabelstring = [String]()
    var Dictfinal  = NSMutableDictionary()
    var useridbiling = String()
    
    var MArketproductIMagetwo = [String]()
    

    var popcornDictionary = NSArray()
    
    var favpopcornsubject = [String]()

    var Moqstringvalue = [String]()
    
    var Totalpopcorniamgefinalvalue = [String]()

  //  var TotalpopcornCutoffrate = [NSNumber]()

    var TotalpopcornCutoffrate = [String]()

    @IBOutlet weak var myalertviewfinalvalue: UIView!
    
    var Myauthorisationstringfinalvalue = String()

    var myagentTotalvalue = String()
    
    var Marketshoutid = [NSNumber]()
    
    var SingelMarketshoutidvalue = String()


    override func viewDidLoad()
    {
        super.viewDidLoad()
        Marketusers = ["Swift","Python","PHP","Java","JavaScript","C#"]
        mymarkettabelview.dataSource  = self
        mymarkettabelview.delegate  = self
        mymarkettabelview.showsHorizontalScrollIndicator = false
        mymarkettabelview.showsVerticalScrollIndicator = false
        DispatchQueue.main.async
            {
                self.Marketmethod()
           }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.popcornCustomerbname.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell  = mymarkettabelview.dequeueReusableCell(withIdentifier:"MArketTableViewCell", for: indexPath) as! MArketTableViewCell
        cell.mycardviewfinal.layer.cornerRadius = 15.0
        cell.mycardviewfinal.layer.masksToBounds = true
//        cell.mycardviewfinal.layer.shadowOffset = CGSize(width: 0, height: 2)
//        cell.mycardviewfinal.layer.shadowOpacity = 0.3
//        cell.mycardviewfinal.layer.shadowRadius = 1.0
//        cell.mycardviewfinal.layer.borderColor = UIColor.color2().cgColor
//        cell.mycardviewfinal.layer.shadowColor = UIColor.color2().cgColor
         cell.mycardviewfinal.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        cell.mycardviewfinal.layer.borderWidth = 1.0
        
        cell.marketcardviewtwo.layer.cornerRadius = 15.0
        cell.marketcardviewtwo.layer.masksToBounds = true
        cell.marketcardviewtwo.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        cell.marketcardviewtwo.layer.borderWidth = 1.0
        cell.cardviewtwotop.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        cell.Timerview.layer.cornerRadius = 3.0
        cell.selectionStyle = .none
        
   let Marketproductcollection = self.MArketproductIMagetwo[indexPath.row]
// cell.circleimageview.sd_setImage(with: URL(string:Marketproductcollection), placeholderImage:(UIImage(named:"Profile")), options: .refreshCached, completed: nil)
        
//                        let url = URL(string:Marketproductcollection)
//                        let imgURL = Marketproductcollection
//                     cell.circleimageview.setImageFromURl(stringImageUrl: imgURL)

        let url = URL(string:Marketproductcollection)
        let data = try? Data(contentsOf: url!)
        
        if let imageData = data {
            let image = UIImage(data: imageData)
            cell.circleimageview.image = image
        }
        
        
        
        cell.raajagoudnamefinal.text = self.popcornCustomerbname[indexPath.row]
        cell.exlentproduct.text = self.favpopcornsubject[indexPath.row]
        
        cell.moqlabel.text = self.Moqstringvalue[indexPath.row]
        
//     let valuefinal =  self.Totalpopcornrupeeslabel[indexPath.row]
//
//    let str2 = valuefinal.stringValue
//
//        cell.mypopcornnmae.text = str2
        
        
        
        if self.Totalpopcornrupeeslabel.count > 0
        {
            cell.mypopcornnmae.text =  self.Totalpopcornrupeeslabel[indexPath.row]

        }
//        
//        let str2 = valuefinal.stringValue
//        cell.mypopcornnmae.text = str2
    cell.cardviewpopcornlabel.text = self.Totalpopcornnamelabel[indexPath.row]
        cell.exlenttime.text = self.popcornDatelabel[indexPath.row]
        
        
        if self.TotalpopcornRestokeoffTakelabel.count > 0
        {
         let offtakeDayslabelfinalvalue   = self.TotalpopcornRestokeoffTakelabel[indexPath.row]
            cell.mypopocrndayslabel.text = offtakeDayslabelfinalvalue.stringValue
        }
    
        
        cell.mycardviewfinal.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.mycardviewfinal.layer.shadowOpacity = 0.3
        cell.mycardviewfinal.layer.shadowRadius = 1.0
        cell.mycardviewfinal.layer.borderColor = UIColor.color2().cgColor
        cell.mycardviewfinal.layer.shadowColor = UIColor.color2().cgColor
        cell.cardviewtwotop.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        let Newproductcollectiontwo = self.Totalpopcorniamgefinalvalue[indexPath.row]
     cell.popcornimage.sd_setImage(with: URL(string:Newproductcollectiontwo), placeholderImage:(UIImage(named:"Profile")), options: .refreshCached, completed: nil)

        let urltwo = URL(string:Marketproductcollection)
        let datatwo = try? Data(contentsOf: urltwo!)
        
        if let imageData = datatwo {
            let image = UIImage(data: imageData)
            cell.popcornimage.image = image
        }
        
        if self.Totalpopcornnamelabel.count > 0
        {
            cell.mypopcornmarginlabel.text = self.TotalpopcornMarginlabel[indexPath.row]

        }
       
        
        
//        let valueMArginlabel =  self.TotalpopcornMarginlabel[indexPath.row]
//
//        let strtotalMargin = valueMArginlabel.stringValue
//
//
//
//        cell.mypopcornmarginlabel.text = strtotalMargin


        if self.TotalpopcornCutoffrate.count > 0
        {
            let valuefinaltwo =  self.TotalpopcornCutoffrate[indexPath.row]
            
            //        let valuefinaltwo =  self.TotalpopcornCutoffrate[indexPath.row]
            //
            //        let str2total = valuefinaltwo.stringValue
            //
            //
            //
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string:valuefinaltwo)
            attributeString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            cell.popcorncutoffratinglabel.attributedText = attributeString
        }
      
        
        return cell
    }
    
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
 {
    DispatchQueue.main.async
        {
        let shout = self.storyboard?.instantiateViewController(withIdentifier:"ShoutViewController")as!ShoutViewController
            let marketshoutidvaluefinal = self.Marketshoutid[indexPath.row]
            shout.SingelMarketshoutidvalue1 = marketshoutidvaluefinal.stringValue
            
//            let cell  = self.mymarkettabelview.dequeueReusableCell(withIdentifier:"MArketTableViewCell", for: indexPath) as! MArketTableViewCell
//            
//            cell.selectionStyle = .none
//                let Newproductcollectiontwo = self.Totalpopcorniamgefinalvalue[indexPath.row]
//        
//            shout.Shoutimagefinalvalue = cell.popcornimage.image!
            
            self.present(shout, animated: true, completion:nil)
    }
 }
 func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
 {
        return 365
 }

    func Marketmethod()
    {
        self.showSpinner()
        var request = URLRequest(url: URL(string:AgentConstants.MarketFinalvalue)!)
        request.httpMethod = "POST"
        let dafaults = UserDefaults.standard
        if let Reviewfinaluseroid:String = dafaults.value(forKey: "MyLoginfinalvalue")as?String
        {
            self.useridbiling = Reviewfinaluseroid
        }
        if let Myauthorisationfinlavalue:String = dafaults.value(forKey: "Myauthorisation")as?String
        {
            self.Myauthorisationstringfinalvalue = Myauthorisationfinlavalue
        }
        if let Myagentidfinlavalue:String = dafaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
       let postStringfinlavalue =  String(format: "Authorization=%@&AgentID=%@",self.Myauthorisationstringfinalvalue, self.myagentTotalvalue)
        print(postStringfinlavalue)
        let Dictone = ["agentid": self.useridbiling,"type":"market","page":"0"]
        Dictfinal.addEntries(from:Dictone)
        let postStringone =  String(format: "agentid=%@&type=%@&app=%@",self.useridbiling,"market","0")
        print(postStringone)
        
        request.httpBody = postStringone.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        
        
//        request.addValue("Content-Type", forHTTPHeaderField:"application/json")
        request.addValue(self.Myauthorisationstringfinalvalue, forHTTPHeaderField: "Authorization")
        request.addValue(self.useridbiling, forHTTPHeaderField:"AgentID")

        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                print(response.result)
                
                
                let value = response.response
                
                let valuetwo = response.data
                
                
                if let response = response as? HTTPURLResponse {
                    if response.statusCode == 200 {
                        print("Success")
                    }
                }
                if let httpResponse1 = value {
                    if let xDemAuth = httpResponse1.allHeaderFields["Authorization"] as? String {
                        print(xDemAuth)
                        
                        print(httpResponse1)
                        
                        let defaults = UserDefaults.standard
                        defaults.set(xDemAuth, forKey:"Myauthorisation")
                        defaults.synchronize()
                    }
                }
                
                
                
                
                

                self.removeSpinner()
                if let dict:NSArray = response.result.value as? NSArray
                {
                self.popcornCustomerbname = dict.value(forKey:"name")as![String]
                self.MArketproductIMagetwo = dict.value(forKey:"profileImage")as![String]
                self.popcornDatelabel = dict.value(forKey:"time")as![String]
                self.favpopcornsubject = dict.value(forKey:"subject")as![String]
               self.Marketshoutid = dict.value(forKey:"id")as![NSNumber]

                self.popcornDictionary = dict.value(forKey:"shout")as!NSArray
                self.Totalpopcornnamelabel = self.popcornDictionary.value(forKey:"name")as![String]
                    self.Moqstringvalue =  self.popcornDictionary.value(forKey:"moq")as![String]
               //     self.Totalpopcornrupeeslabel =  self.popcornDictionary.value(forKey:"price")as![NSNumber]
                    
                  //  self.Totalpopcornrupeeslabel =  self.popcornDictionary.value(forKey:"price")as![String]
                    
                    if let Totalpopcornrupeeslabelfinal:[String] = dict.value(forKey: "price") as? [String]
                    {
                        
                       self.Totalpopcornrupeeslabel = Totalpopcornrupeeslabelfinal
                    }
                    
                    

                    self.Totalpopcorniamgefinalvalue =  self.popcornDictionary.value(forKey:"image")as![String]

                   // self.TotalpopcornCutoffrate =  self.popcornDictionary.value(forKey:"off_price")as![NSNumber]
                    
                    
                 //   self.TotalpopcornCutoffrate =  self.popcornDictionary.value(forKey:"off_price")as![String]

                    
                      if let TotalpopcornCutoffratefinal:[String] = self.popcornDictionary.value(forKey: "off_price") as? [String]
                    {
                        
                        self.TotalpopcornCutoffrate = TotalpopcornCutoffratefinal
                    }
                    
                    if let TotalpopcornMarginlabelfinal:[String] = self.popcornDictionary.value(forKey: "margin") as? [String]
                    {
                        
                         self.TotalpopcornMarginlabel = TotalpopcornMarginlabelfinal
                    }
                    
                    
             // self.TotalpopcornMarginlabel =  self.popcornDictionary.value(forKey:"margin")as![String]

             //    self.TotalpopcornMarginlabel =  self.popcornDictionary.value(forKey:"margin")as![NSNumber]

                    
                    
                  //  self.TotalpopcornRestokeoffTakelabel =  self.popcornDictionary.value(forKey:"Offtake")as![NSNumber]
                    
                    if let TotalpopcornRestokeoffTakelabelfinalvalue: [NSNumber]  =  self.popcornDictionary.value(forKey: "Offtake") as? [NSNumber]
                    {
                        self.TotalpopcornRestokeoffTakelabel = TotalpopcornRestokeoffTakelabelfinalvalue
                    }
                    
                    
                    
                    DispatchQueue.main.async
                        {
                        self.mymarkettabelview.reloadData()
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
        self.myalertviewfinalvalue.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(imageView)
    }
    func removeSpinner()
    {
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.myalertviewfinalvalue.removeFromSuperview()

        
        self.hideProgressBar()
    }
    
    func handleOperationWithData(data: Data) {
        // Handle operations with data here...
        if let image = UIImage(data: data) {
            // Use image...
        }
    }

}
extension UIImage
{
    var pngRepresentationData: Data?
    {
        return UIImagePNGRepresentation(self)
    }
    
    var jpegRepresentationData: Data?
    {
        return UIImageJPEGRepresentation(self, 1.0)
    }
}
