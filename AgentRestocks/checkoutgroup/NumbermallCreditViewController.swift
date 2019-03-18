
//
//  NumbermallCreditViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 18/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//
// https://appdividend.com/2018/03/19/beginners-guide-to-create-react-native-application/
import UIKit
import Alamofire
import AlamofireImage

class NumbermallCreditViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet weak var Topview: UIView!
    @IBOutlet weak var Availablecredit: UIView!
    @IBOutlet weak var avalibalecreditamount: UILabel!
    @IBOutlet weak var duerupees: UILabel!
    @IBOutlet weak var paybutton: UIButton!
    var CODLimitstring = [String]()
    var shopnamestring = [String]()
    var Rupessstring = [String]()
    var RupessTwostring = [String]()
    var ShopNAme = [String]()
    var Ratingstring = [String]()
    var Distancestring = [String]()
    var Locationstring = [String]()
    var Linkstring = [String]()
    var Linkimage = [UIImage]()
    @IBOutlet weak var mydistibutiontabelview: UITableView!
    @IBOutlet weak var middelview: UIView!
    @IBOutlet weak var Linkedbutton: UIButton!
    @IBOutlet weak var creditdrop: UIButton!
    @IBOutlet weak var ownerdropdown: UIButton!
    @IBOutlet weak var salesexcutive: UIButton!
    @IBOutlet weak var duelimitlabel: UILabel!
    @IBOutlet weak var totallimitlabel: UILabel!
    @IBOutlet weak var creditName: UILabel!
 
    @IBOutlet weak var ownerNAme: UILabel!
    @IBOutlet weak var ownertitle: UILabel!
   
    @IBOutlet weak var salesExcutivename: UILabel!
    @IBOutlet weak var salesexcutiverating: UILabel!
    
    @IBOutlet weak var starimage: UIImageView!
    
    @IBOutlet weak var SalesexecutiveType: UILabel!
    
    
    @IBOutlet weak var Editprofileviewfinal: UIView!
    var coverView = UIView()
    var imageView = UIImageView()
    
    var useridbilingfinalvalue = String()
    var Myauthorisationstringfinalvalue = String()
    var myagentTotalvalue = String()
    
    /// CodLimit Creation
    var linked_dc_txt = String()
    var cod_limit_txt = String()
    var other_available_txt = String()
    var Status_txt = NSNumber()

    ///NSDistcionary
    
    var COD_limitDictfinal = NSDictionary()
    var limit_byfinal = NSString()
    var left_value = NSString()
    var left_value_color = NSString()
    var right_value = NSString()


    

    ///NSDistcionary
    
    var linked_dc_patnerDictfinal = NSArray()
    var linked_dc_id = [String]()
    
    var linked_dc_shop_name = [String]()
    var linked_dc_rating_shop = [NSNumber]()
    
    var linked_dc_location = [String]()
    var linked_dc_distance = [String]()
    var linked_dc_sales_executive = [String]()
    var linked_dc_rating_sales = [String]()
    
    var linked_dc_sales_mobNo = [String]()
    var linked_dc_owner_name = [String]()
    var linked_dc_owner_mobilenum = [String]()
    
    var linked_dc_leftvalue = [String]()
    var linked_dc_Rightvalue = [String]()

//    var linked_dc_leftvalue = NSArray()
//    var linked_dc_Rightvalue = NSArray()
    ///NSDistcionary
    
    var other_availableDictfinal = NSDictionary()
   var  other_availablefinalarray = NSArray()
    var other_available_id = [String]()
    var other_available_shop_name = [String]()
    var other_available_rating_shop = [NSNumber]()
    var other_available_location = [String]()
    var other_available_distance = [String]()
    var other_available_AchStatus = [String]()
    var other_available_link_status = [String]()
    var other_available_approval_status = [String]()
    var other_available_approval_warning = [String]()

    
    
    @IBOutlet weak var singeldeliveryviewvalue: UIView!
    
    
    @IBOutlet weak var othervailabelvalue: UILabel!
    
    
    @IBOutlet weak var landingiamgeview: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.Topview.dropShadow()
        self.paybutton.layer.borderColor = UIColor.PayBoradercolor().cgColor
        self.paybutton.layer.borderWidth = 1.0
        self.paybutton.layer.cornerRadius = 2
        
       self.mydistibutiontabelview.dataSource = self
       self.mydistibutiontabelview.delegate = self

        ShopNAme = ["Rathan Enterprises","Kumar Agencies","Pavan Marketing"]
        Ratingstring = ["4.1","4.6","3.9"]
        Locationstring = ["Miyapoor","Uppal","Hayathnagar"]
        Distancestring = ["60m","51m","16m"]
//        Linkstring = ["Link","Link","Link"]
//        Linkstring = ["Link"]

      //  Linkimage = [#imageLiteral(resourceName: "Barnds"),#imageLiteral(resourceName: "Barnds"),#imageLiteral(resourceName: "Barnds")]
        Linkimage = [#imageLiteral(resourceName: "Barnds")]

        self.middelview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
         self.middelview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
         self.Linkedbutton.layer.cornerRadius = 5
        self.middelview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        self.middelview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        self.Editprofileviewfinal.dropShadow()
        self.Editprofileviewfinal.layer.cornerRadius = 2
        self.Editprofileviewfinal.layer.masksToBounds = true
        
        DispatchQueue.main.async
            {
            self.numbermallcreditvalue()
         }
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.view.addGestureRecognizer(tap)
        self.view.isUserInteractionEnabled = true
        
          mydistibutiontabelview.frame = CGRect(x:mydistibutiontabelview.frame.origin.x, y:300, width: mydistibutiontabelview.frame.size.width, height: mydistibutiontabelview.frame.size.height)
        
        }
    @objc func handleTap(_ sender: UITapGestureRecognizer)
    {
        Editprofileviewfinal.isHidden = true

    }
    @IBAction func paybutton(_ sender: UIButton)
    {
        
        
    }
    
    @IBAction func Historybutton(_ sender: UIButton)
    {
        DispatchQueue.main.async {
            let Historyviewfinal = self.storyboard?.instantiateViewController(withIdentifier:"NumberHistoryViewController")as!NumberHistoryViewController
            self.present(Historyviewfinal, animated:true, completion:nil)
            
            
        }
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return other_available_shop_name.count
     
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : DistibutionTableViewCell = mydistibutiontabelview.dequeueReusableCell(withIdentifier: "DistibutionTableViewCell", for: indexPath) as! DistibutionTableViewCell
        if self.Linkimage.count > 0
        {
            
//            if let Linkimagefinal:Image = self.Linkimage[indexPath.row] as? Image {
//
//                  cell.ratingimageview.image = Linkimagefinal
//            }
            
            if let other_available_shop_namefinal:String = self.other_available_shop_name[indexPath.row] as? String {
                
                cell.shopname.text = other_available_shop_namefinal
            }
          
//            cell.shopname.text = self.other_available_shop_name[indexPath.row]
            
            if let other_available_shop_namefinal:String = self.other_available_shop_name[indexPath.row] as? String {
                
                cell.shopname.text = other_available_shop_namefinal
            }
            
            if let other_available_rating_shopfinal:NSNumber = self.other_available_rating_shop[indexPath.row] as? NSNumber {
                
                let numberValue : NSNumber = other_available_rating_shopfinal as NSNumber
                let textfinalvalue : String = numberValue.stringValue
                cell.ratinglabel.text = textfinalvalue
            }
            
            if let other_available_distancefinal:String = self.other_available_distance[indexPath.row] as? String {
                
                cell.Distancelabel.text = other_available_distancefinal
            }
         
//            cell.Distancelabel.text = self.other_available_distance[indexPath.row]
            if let other_availablelocationfinal:String = self.other_available_location[indexPath.row] as? String {
                
               cell.Miyapurlabel.text = other_availablelocationfinal
            }

                   cell.Miyapurlabel.text = "Link"
                   cell.Linklabel.layer.cornerRadius = 8.0
                   cell.Linklabel.layer.masksToBounds = true
                   cell.Linklabel.setTitle("Link", for:.normal)
                   cell.Linklabel.tag = indexPath.row
                    cell.Linklabel.addTarget(self, action: #selector(DistibutioncebterViewController.connectedtwo(sender:)), for: .touchUpInside)
                    cell.Linklabel.layer.cornerRadius = 5.0
        }
        return cell
    }
    
    
    @objc func connectedtwo(sender: UIButton){
     
           self.view.makeToast("Clear the dues to change the delivery partner")
            self.numbermallcreditLinkvalue()
            
            sender.backgroundColor = UIColor(red: 85/255, green:85/255, blue: 85/255, alpha:1.0)
        
       
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 73
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        
    }
    
    
    @IBAction func Linkedbutton(_ sender: UIButton)
    {
        
        
        
    }
    @IBAction func creditdropbutton(_ sender: UIButton)
    {
        if creditdrop.tag == 0
        {
//            Editprofileviewfinal.isHidden = false
            singeldeliveryviewvalue.isHidden = false
            othervailabelvalue.frame = CGRect(x:othervailabelvalue.frame.origin.x, y:350, width:othervailabelvalue.frame.size.width, height: othervailabelvalue.frame.size.height)
            mydistibutiontabelview.frame = CGRect(x:mydistibutiontabelview.frame.origin.x, y:420, width: mydistibutiontabelview.frame.size.width, height: mydistibutiontabelview.frame.size.height)
            creditdrop.tag = 1
        }
        else if creditdrop.tag == 1
        {
//            Editprofileviewfinal.isHidden = true
            singeldeliveryviewvalue.isHidden = true
                 othervailabelvalue.frame = CGRect(x:othervailabelvalue.frame.origin.x, y:250, width:othervailabelvalue.frame.size.width, height: othervailabelvalue.frame.size.height)
            mydistibutiontabelview.frame = CGRect(x:mydistibutiontabelview.frame.origin.x, y:300, width: mydistibutiontabelview.frame.size.width, height: mydistibutiontabelview.frame.size.height)
            

            creditdrop.tag = 0
        }
    }
    
    @IBAction func ownerDropDown(_ sender: UIButton)
    {
        if ownerdropdown.tag == 0
        {
            Editprofileviewfinal.isHidden = false
            ownerdropdown.tag = 1
        }
        else if ownerdropdown.tag == 1
        {
            Editprofileviewfinal.isHidden = true
            ownerdropdown.tag = 0
        }
    }
    @IBAction func SalesExcutive(_ sender: UIButton)
    {
        if salesexcutive.tag == 0
        {
            Editprofileviewfinal.isHidden = false
            salesexcutive.tag = 1
        }
        else if salesexcutive.tag == 1
        {
            Editprofileviewfinal.isHidden = true
            salesexcutive.tag = 0
        }
    }
    
    @IBAction func Backbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
        
    }
    @IBAction func viewprofile(_ sender: UIButton)
    {
        
    }
    @IBAction func Chat(_ sender: UIButton)
    {

    }
    @IBAction func call(_ sender: UIButton)
    {
        
    }
    
//    "method":"distributionCenter","agentid":"127"

    func numbermallcreditvalue()
    {
   self.showSpinner()
        self.landingiamgeview.isHidden = false
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
    let postString =  String(format: "method=%@&agentid=%@","distributionCenter",self.useridbilingfinalvalue,"IOS")
        print(postString)
        
        request.addValue(self.Myauthorisationstringfinalvalue, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        
        request.httpBody = postString.data(using: .utf8)
   
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                if let dict:NSDictionary = response.result.value as? NSDictionary
                {
                    DispatchQueue.main.async {
                        self.removeSpinner()
                    }
                    print(dict)
                    self.landingiamgeview.isHidden = true
                   
                   
            if let linked_dc_txtfinalvalue:String = dict.value(forKey:"linked_dc_txt") as? String
                
               {
                      self.linked_dc_txt = linked_dc_txtfinalvalue
                }
                    self.cod_limit_txt = dict.value(forKey:"cod_limit_txt")as!String

                    self.other_available_txt = dict.value(forKey:"other_available_txt")as!String
                    self.Status_txt = dict.value(forKey:"Status")as!NSNumber
                    
                    if let Descriptionfav:NSDictionary = dict.value(forKey: "COD_limit") as? NSDictionary
                    {
                        self.COD_limitDictfinal = Descriptionfav
                        self.limit_byfinal =  self.COD_limitDictfinal.value(forKey:"limit_by")as!NSString
                        self.left_value =  self.COD_limitDictfinal.value(forKey:"left_value")as!NSString
                        self.right_value =  self.COD_limitDictfinal.value(forKey:"right_value")as!NSString
                    }
   
                    DispatchQueue.main.async
                    {
                        self.avalibalecreditamount.text = self.left_value as String
                        self.duerupees.text = self.right_value as String
                    }
                    self.other_availablefinalarray = dict.value(forKey:"other_available")as!NSArray
                    
                    self.other_available_id =  self.other_availablefinalarray.value(forKey:"id")as![String]
                    self.other_available_shop_name =  self.other_availablefinalarray.value(forKey:"shop_name")as![String]
                    self.other_available_rating_shop =  self.other_availablefinalarray.value(forKey:"rating_shop")as![NSNumber]
                    self.other_available_location =  self.other_availablefinalarray.value(forKey:"location")as![String]
                    self.other_available_distance =  self.other_availablefinalarray.value(forKey:"distance")as![String]

                    if let linked_dc_patnerDictfinalTotalvalue:NSArray = dict.value(forKey: "linked_dc_patner") as? NSArray
                    {
                        self.linked_dc_patnerDictfinal = linked_dc_patnerDictfinalTotalvalue
                        
                        if self.linked_dc_patnerDictfinal.count > 0
                        {
                            self.linked_dc_shop_name =  self.linked_dc_patnerDictfinal.value(forKey:"shop_name")as![String]
                            
                            print(self.linked_dc_shop_name)
                            self.linked_dc_rating_shop =  self.linked_dc_patnerDictfinal.value(forKey:"rating_shop")as![NSNumber]
                            self.linked_dc_location =  self.linked_dc_patnerDictfinal.value(forKey:"location")as![String]
                            
                            self.linked_dc_distance =  self.linked_dc_patnerDictfinal.value(forKey:"distance")as![String]
                            print(self.linked_dc_distance)
                            
                            self.linked_dc_sales_executive =  self.linked_dc_patnerDictfinal.value(forKey:"sales_executive")as![String]
                            print(self.linked_dc_sales_executive)
                            
                            print(self.linked_dc_patnerDictfinal.value(forKey:"left_value"))
                            print(self.linked_dc_patnerDictfinal.value(forKey:"right_value"))
                            
                            self.linked_dc_leftvalue =  self.linked_dc_patnerDictfinal.value(forKey:"left_value")as![String]
                            self.linked_dc_Rightvalue =  self.linked_dc_patnerDictfinal.value(forKey:"right_value")as![String]
                            DispatchQueue.main.async
                                {
                                    self.duelimitlabel.text = self.linked_dc_leftvalue[0]
                                    
                                    self.totallimitlabel.text =  self.linked_dc_Rightvalue[0]
                                    
                                    self.creditName.text =  self.linked_dc_shop_name[0] as String
                            }
                        }
                      
                    }
                    
                    
//                    self.linked_dc_patnerDictfinal = dict.value(forKey:"linked_dc_patner")as!NSArray
                    
                    
                   
                
                   
                    
                    if let salestotalvalue:[String] = dict.value(forKey: "rating_sales") as? [String]
                    {
                        
                        self.linked_dc_rating_sales = salestotalvalue
                    }
                    
                    if let linked_dc_owner_mobilenumtotalvalue:[String] = dict.value(forKey: "owner_mobilenum") as? [String]
                    {
                        
                        self.linked_dc_owner_mobilenum = linked_dc_owner_mobilenumtotalvalue
                    }
                    self.linked_dc_owner_mobilenum =  self.linked_dc_patnerDictfinal.value(forKey:"sales_mobNo")as![String]
                DispatchQueue.main.async
                {
                self.mydistibutiontabelview.reloadData()
                }
                    self.removeSpinner()
                }
                break
            case .failure(_):
                DispatchQueue.main.async
                    {
                    self.removeSpinner()
                    self.landingiamgeview.isHidden = true
                        self.landingiamgeview.isHidden = false

                  }
                break
            }
        }
    }
    func numbermallcreditLinkvalue()
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

//        var request = URLRequest(url: URL(string:"http://172.31.1.156/NumberMall/agent_Gwy.php")!)
  
        request.httpMethod = "POST"
        let postString =  String(format: "method=%@&userid=%@","linkDC",self.useridbilingfinalvalue,"IOS")
        print(postString)
      
        request.httpBody = postString.data(using: .utf8)
        
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                if let dict:NSDictionary = response.result.value as? NSDictionary
                {
                    self.removeSpinner()
                    let defaults = UserDefaults.standard
                    defaults.set("Linkfinalavlue", forKey: "MyLinkfinalavlue")
                    defaults.synchronize()
                    print(dict)
                 }
                break
            case .failure(_):
                DispatchQueue.main.async {
                    self.removeSpinner()
                    
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
        self.hideProgressBar()
    }
}
