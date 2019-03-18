
//
//  MenuViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 07/08/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import QuartzCore
class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate
{
    @IBOutlet weak var roundcircleview: UIView!
    @IBOutlet weak var Menuview: UIView!
    @IBOutlet weak var btnLoginName: UIButton!
    @IBOutlet weak var ratinglabel: UILabel!
    @IBOutlet weak var Kycpending: UILabel!
    @IBOutlet weak var slidetabelview: UITableView!
    var emomerce_details = [String]()
    @IBOutlet weak var demoscrollview: UIScrollView!

    var User_image1 = String()
    var User_name1 = String()
    var User_rating1 = String()
    var isverystring1 = String()
    var navaitemname2value = [String]()
    var navaitemsub_valuemenu = [String]()
    @IBOutlet weak var uploadimage: UIImageView!
    @IBOutlet weak var ratingview: UIView!
    @IBOutlet weak var slidetabeltwo: UITableView!
    var cashvaluestring = String()
   var stringvalue = String()
    @IBOutlet weak var Heroboarderview: UIView!
    @IBOutlet weak var progressabrview: UIView!
    @IBOutlet weak var singellineview: UIView!
    @IBOutlet weak var agustbutton: UIButton!
    @IBOutlet weak var twentyfiveRupeesalbel: UILabel!
    @IBOutlet weak var fourtyonerupesslabel: UIView!
    @IBOutlet weak var fiftythousandrupeeslabel: UILabel!
    @IBOutlet weak var percentagelabel: UILabel!
    var TabelCashLabelstringfinalavlue = [String]()
    @IBOutlet weak var myLoyalitybonusviewfinal: UIView!
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
 var MenuappDelegate = String()
    
    var SwipeLeftone = UISwipeGestureRecognizer()

    
    var Menu_vc:MenuViewController!

    
    @IBOutlet weak var Totalbackbutton: UIButton!
    
    
    @IBOutlet weak var mainviewfinal: UIView!
    
    
    
    @IBOutlet weak var totalviewfinal: UIView!
    
    @IBOutlet weak var menuviewsingel: UIView!
    var  menunavaitemsub_value = [String]()
    var menusubarraytotalvalue = String()

    
    var menunavitemrupeestotalvalue = [String]()
    var menunavitemrupeesubvalue = String()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        let defaultsmenu = UserDefaults.standard
        if let navaitemsub_one:[String] = defaultsmenu.value(forKey:"Myfreedelivery") as?[String]
        {
            self.menunavaitemsub_value = navaitemsub_one
        }
        if let navaitemsub_valueTotal:[String] = defaultsmenu.value(forKey:"Mynavvaluetotal") as?[String]
        {
            self.menunavitemrupeestotalvalue = navaitemsub_valueTotal
        }
        if let navaitemname2valuefinal:[String] = defaultsmenu.value(forKey:"navaitemname") as? [String]
        {
            self.navaitemname2value = navaitemname2valuefinal
        }
        self.navaitemname2value = [""]
          self.navaitemname2value = ["NumberMall Wallet","Orders","Invite Business Friends","Help","Language","Logout"]
        if let mycashValuefinalstringmenufinal:String = defaultsmenu.value(forKey:"mycashValuefinalstring") as? String
        {
            self.cashvaluestring = mycashValuefinalstringmenufinal
        }
       self.roundcircleview.layer.cornerRadius = self.roundcircleview.frame.size.width/2
      emomerce_details = ["NumberMall Wallet","NumberMall Credit", "Orders","Invite business friends","Help","Language","Logout"]
        slidetabelview.isScrollEnabled = false
        let tapmenu = UITapGestureRecognizer(target: self, action: #selector(self.handleMenuTaptwo(_:)))
        roundcircleview.addGestureRecognizer(tapmenu)
        roundcircleview.isUserInteractionEnabled = true
        if self.view.frame.size.height < 800
        {
            demoscrollview.contentInset = UIEdgeInsetsMake(0, 0,self.demoscrollview.frame.size.height, 0)
            demoscrollview.isScrollEnabled = true
            demoscrollview.showsVerticalScrollIndicator = false
        }
        
        if let User_image1finalvalue:String = defaultsmenu.value(forKey:"Usertwomage") as? String
        {
            self.User_image1 = User_image1finalvalue
            if self.User_image1 != ""
            {
                uploadimage.isHidden = false
                uploadimage.layer.borderWidth=0.0
                uploadimage.layer.masksToBounds = false
                uploadimage.layer.cornerRadius = uploadimage.frame.size.height/2
                uploadimage.clipsToBounds = true
                uploadimage.sd_setImage(with: URL(string:self.User_image1), placeholderImage:(UIImage(named:"")), options: .refreshCached, completed: nil)
            }
            else
                {
                     uploadimage.isHidden = true
                }
        }
        
        if let User_name1finalvalue:String = defaultsmenu.value(forKey:"User_name") as? String
        {
            self.User_name1 = User_name1finalvalue
            self.btnLoginName.isHidden = false
            self.btnLoginName.setTitle(self.User_name1, for: .normal)
        }
        if let User_rating1finalvalue:NSNumber = defaultsmenu.value(forKey:"Myratingnumbervalue") as? NSNumber
        {
            self.User_rating1 = User_rating1finalvalue.stringValue
            print(self.User_rating1)
            self.ratingview.isHidden = false
             self.ratinglabel.isHidden  = false
            
            self.ratinglabel.text = self.User_rating1
            self.ratingview.frame = CGRect(x:self.ratingview.frame.origin.x, y:  self.ratingview.frame.origin.y, width: self.ratingview.frame.size.width, height: self.ratingview.frame.size.height)
            self.Kycpending.frame = CGRect(x:self.Kycpending.frame.origin.x, y:  self.Kycpending.frame.origin.y, width: self.Kycpending.frame.size.width, height: self.Kycpending.frame.size.height)
        }
        if let User_rating1finalvaluetwo:String = defaultsmenu.value(forKey:"Myratingnumbervalue") as? String
        {
            self.User_rating1 = User_rating1finalvaluetwo
            print(self.User_rating1)
            self.ratinglabel.isHidden  = false
            self.ratinglabel.text = self.User_rating1
            self.ratingview.frame = CGRect(x:self.ratingview.frame.origin.x, y:  self.ratingview.frame.origin.y, width: self.ratingview.frame.size.width, height: self.ratingview.frame.size.height)
            self.Kycpending.frame = CGRect(x:self.Kycpending.frame.origin.x, y:  self.Kycpending.frame.origin.y, width: self.Kycpending.frame.size.width, height: self.Kycpending.frame.size.height)
        }
       
        if self.User_rating1 == ""
        {
            self.ratingview.isHidden = true
            self.ratingview.isHidden = false
        self.Kycpending.frame = CGRect(x:self.Kycpending.frame.origin.x, y:  self.Kycpending.frame.origin.y, width: self.Kycpending.frame.size.width, height: self.Kycpending.frame.size.height)
        }
        
        if let isverystring1finalvalue:String = defaultsmenu.value(forKey:"isverystring") as? String
        {
            self.isverystring1 = isverystring1finalvalue
            
//            self.slidetabelview.isHidden  = false
//            self.slidetabeltwo.isHidden  = true

        }
            print(self.isverystring1)
        
           if self.isverystring1 != ""
           {

           }

        self.Heroboarderview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.7)
        self.progressabrview.layer.cornerRadius = 8.0
        self.singellineview.layer.cornerRadius = 8.0
        self.agustbutton.layer.cornerRadius = 4.0
        self.progressabrview.layer.masksToBounds = true
        self.singellineview.layer.masksToBounds = true
        self.agustbutton.layer.masksToBounds = true
        TabelCashLabelstringfinalavlue = ["₹ 0.00","₹1,000","","","English",""]
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.Loaylitybonus(_:)))
        myLoyalitybonusviewfinal.addGestureRecognizer(tap)
        myLoyalitybonusviewfinal.isUserInteractionEnabled = true
        let taptwo = UITapGestureRecognizer(target: self, action: #selector(self.MyHeroboarderview(_:)))
        Heroboarderview.addGestureRecognizer(taptwo)
        Heroboarderview.isUserInteractionEnabled = true
        let defaultsfinalavlueis = UserDefaults.standard
        if let MyKycpendingfinalavlue:String = defaultsfinalavlueis.value(forKey:"isverystring")as?String
        {
            print(MyKycpendingfinalavlue)
            if MyKycpendingfinalavlue == "1"
            {
                self.slidetabelview.isHidden = false
                self.slidetabeltwo.isHidden = true
                self.Kycpending.text = "Approved"
                self.Kycpending.isHidden = true
            }
            if MyKycpendingfinalavlue == "2"
            {
                self.slidetabeltwo.isHidden = false
                self.slidetabelview.isHidden = true
                self.Kycpending.text = "Pending"

            }
            if MyKycpendingfinalavlue == "4"
            {
                self.slidetabelview.isHidden = false
                self.slidetabeltwo.isHidden = true
                self.Kycpending.text = "Pending"
                //self.Kycpending.text = "Cancelled"

            }
            if MyKycpendingfinalavlue == "3"
            {
                self.slidetabelview.isHidden = true
                self.slidetabeltwo.isHidden = false
                self.Kycpending.text = "Pending"
                //self.Kycpending.text = "Rejected"

            }
        }
        let taptotal = UITapGestureRecognizer(target: self, action: #selector(self.MyTaptotalfinalavlue(_:)))
        Menuview.addGestureRecognizer(taptotal)
        Menuview.isUserInteractionEnabled = true
        
        let taptotalMenu = UITapGestureRecognizer(target: self, action: #selector(self.MyTaptotalfinalavlueMenu(_:)))
        mainviewfinal.addGestureRecognizer(taptotalMenu)
        mainviewfinal.isUserInteractionEnabled = true
        
        let taptotalMenutwo = UITapGestureRecognizer(target: self, action: #selector(self.MyTaptotalfinalavlueMenu(_:)))
        btnLoginName.addGestureRecognizer(taptotalMenu)
        btnLoginName.isUserInteractionEnabled = true
        
        let taptotalMenuratinglabel = UITapGestureRecognizer(target: self, action: #selector(self.MyTaptotalfinalavlueMenu(_:)))
        ratinglabel.addGestureRecognizer(taptotalMenuratinglabel)
        ratinglabel.isUserInteractionEnabled = true
        let taptotalMenuKycpending  = UITapGestureRecognizer(target: self, action: #selector(self.MyTaptotalfinalavlueMenu(_:)))
        Kycpending.addGestureRecognizer(taptotalMenuKycpending)
        Kycpending.isUserInteractionEnabled = true
  Heroboarderview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.7)
        Heroboarderview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.7)
        totalviewfinal.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.7)
        slidetabelview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.7)
        slidetabelview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.7)
        self.menuviewsingel.layer.cornerRadius = self.menuviewsingel.frame.height/2
        self.menuviewsingel.clipsToBounds = true
        
    }
    @objc func MyTaptotalfinalavlue(_ sender: UITapGestureRecognizer)
    {
      self.view.removeFromSuperview()
        AppDelegate.menu_bool = true
    }
    @objc func MyTaptotalfinalavlueMenu(_ sender: UITapGestureRecognizer)
    {
        DispatchQueue.main.async
        {
        let Edittotal = self.storyboard?.instantiateViewController(withIdentifier:"EditAccountViewController")as!EditAccountViewController
        self.present(Edittotal, animated: true, completion:nil)
        }
    }

    @objc func Loaylitybonus(_ sender: UITapGestureRecognizer)
    {
     let LoyalitybonausViewControllerCreditView = self.storyboard?.instantiateViewController(withIdentifier:"LoyalitybonausViewController")as!LoyalitybonausViewController
        self.present(LoyalitybonausViewControllerCreditView, animated:true, completion:nil)
    }
    @objc func MyHeroboarderview(_ sender: UITapGestureRecognizer)
    {
        let HeroSubscriptionVCfinalvalue = self.storyboard?.instantiateViewController(withIdentifier:"HeroSubscriptionVC")as!HeroSubscriptionVC
        self.present(HeroSubscriptionVCfinalvalue, animated: true, completion:nil)
    }
    
    @objc func handleMenuTaptwo(_ sender: UITapGestureRecognizer)
    {
        DispatchQueue.main.async
            {
            let EditprofileView = self.storyboard?.instantiateViewController(withIdentifier:"EditprofileViewController")as!EditprofileViewController
            self.present(EditprofileView, animated: true, completion:nil)
         }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == slidetabeltwo
        {
            return navaitemname2value.count
        }
        else
        {
            return emomerce_details.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == slidetabeltwo
        {
            let cell = slidetabeltwo.dequeueReusableCell(withIdentifier: "MenutwoTableViewCell", for: indexPath) as! MenutwoTableViewCell
            cell.walletlabel.text = self.navaitemname2value[indexPath.row]
            cell.selectionStyle = .none
            if self.navaitemname2value.count > 0
            {
                stringvalue = self.navaitemname2value[indexPath.row]
            }
//            cell.freebeeexpire.setTitle(stringvalue, for:.normal)
//            cell.freebeeexpire.setTitleColor(UIColor.red, for:.normal)
            cell.freebeeexpire.addTarget(self, action: #selector(freebeeexpiremenutrendingAction), for: .touchUpInside)
            cell.freebeeexpire.tag = indexPath.row
            
            cell.menuviewfinal.layer.cornerRadius =  cell.menuviewfinal.frame.height/2
             cell.menuviewfinal.clipsToBounds = true
            
            
            if stringvalue == "NumberMall Wallet"
            {
                cell.rupeeslabel.isHidden = false
                let finalvalue = NSString(format:"%@",self.cashvaluestring)
                cell.rupeeslabel.text = finalvalue as String 
            }
            
            if stringvalue == "Language"
            {
                cell.rupeeslabel.isHidden = false

                cell.rupeeslabel.text = "English"
                
            }
          
            cell.selectionStyle = .none
          
            return cell
        }
        else
        {
            if indexPath.row == 0
            {
                let cell = slidetabelview.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
                cell.orderDomain.text = self.emomerce_details[indexPath.row]
                cell.selectionStyle = .none
                cell.applaylabel.isHidden = true
//                if self.menunavaitemsub_value.count > 0
//                {
//                    self.menusubarraytotalvalue =  self.menunavaitemsub_value[1] as! String
//
//                    var eventStr: NSAttributedString? = nil
//
//                    if let anEncoding = self.menusubarraytotalvalue.data(using: .utf8) {
//                        eventStr = try? NSAttributedString(data: anEncoding, options: [.documentType: NSAttributedString.DocumentType.html.rawValue, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
//                    }
//
//                    cell.applaylabel.setAttributedTitle(eventStr, for:.normal)
//                }
                
                if self.menunavitemrupeestotalvalue.count > 0
                {
                    self.menunavitemrupeesubvalue =  self.menunavitemrupeestotalvalue[1] as! String
                    
                    var eventStr: NSAttributedString? = nil
                    
                    if let anEncoding = self.menunavitemrupeesubvalue.data(using: .utf8) {
                        eventStr = try? NSAttributedString(data: anEncoding, options: [.documentType: NSAttributedString.DocumentType.html.rawValue, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
                    }
                    cell.cashlabel.isHidden = false
                    cell.cashlabel.attributedText = eventStr
                }
             
                cell.selectionStyle = .none
                cell.menuroundcircleview.layer.cornerRadius =  cell.menuroundcircleview.frame.height/2
                cell.menuroundcircleview.clipsToBounds = true
                cell.orderDomain.frame = CGRect(x: 26, y:self.view.frame.origin.y+15, width:200, height:13)
                cell.applaylabel.frame = CGRect(x:30, y:cell.orderDomain.frame.size.height+18, width:200, height:16)
                cell.cashlabel.frame = CGRect(x: cell.cashlabel.frame.origin.x+20, y: self.view.frame.origin.y+15, width:100, height:16)
                return cell
            }
            else if indexPath.row == 1
            {
                let cell = slidetabelview.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
                cell.orderDomain.text = self.emomerce_details[indexPath.row]
                cell.applaylabel.isHidden = false
                cell.cashlabel.isHidden = false
                let rupee = "\u{20B9}"
                let rupeeTwo = "0.00"
                let finalvalue = NSString(format:"%@%@",rupee,rupeeTwo)
                cell.menuroundcircleview.layer.cornerRadius =  cell.menuroundcircleview.frame.height/2
                cell.menuroundcircleview.clipsToBounds = true
                
                if self.menunavaitemsub_value.count > 0
                {
                    self.menusubarraytotalvalue =  self.menunavaitemsub_value[1] as! String
                    
                    var eventStr: NSAttributedString? = nil
                    
                    if let anEncoding = self.menusubarraytotalvalue.data(using: .utf8) {
                        eventStr = try? NSAttributedString(data: anEncoding, options: [.documentType: NSAttributedString.DocumentType.html.rawValue, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
                    }
                    
                    cell.applaylabel.setAttributedTitle(eventStr, for:.normal)
                }
                
                
                
                
                if self.menunavitemrupeestotalvalue.count > 1
                {
                    self.menunavitemrupeesubvalue =  self.menunavitemrupeestotalvalue[2]
                    var eventStrtwo: NSAttributedString? = nil
                    if let anEncoding = self.menunavitemrupeesubvalue.data(using: .utf8) {
                        eventStrtwo = try? NSAttributedString(data: anEncoding, options: [.documentType: NSAttributedString.DocumentType.html.rawValue, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
                    }
                    cell.cashlabel.isHidden = false
                    cell.cashlabel.attributedText = eventStrtwo
                }
                
                cell.selectionStyle = .none
                cell.orderDomain.frame = CGRect(x: 26, y:self.view.frame.origin.y+15, width:200, height:13)
                cell.applaylabel.frame = CGRect(x:30, y:cell.orderDomain.frame.size.height+3, width:200, height:16)
                cell.cashlabel.frame = CGRect(x: cell.cashlabel.frame.origin.x+5, y: self.view.frame.origin.y+15, width:100, height:16)
//                cell.cashlabel.textAlignment = .left
                return cell
            }
            else if indexPath.row == 2
            {
                let cell = slidetabelview.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
                cell.orderDomain.text = self.emomerce_details[indexPath.row]
                cell.orderDomain.frame = CGRect(x: 26, y:self.view.frame.origin.y+15, width:140, height:13)
                cell.applaylabel.frame = CGRect(x:30, y:cell.orderDomain.frame.size.height+15, width:140, height:16)
                cell.applaylabel.isHidden = false
                cell.cashlabel.text = self.TabelCashLabelstringfinalavlue[indexPath.row]
                cell.applaylabel.isHidden = true
                cell.selectionStyle = .none
                cell.menuroundcircleview.layer.cornerRadius =  cell.menuroundcircleview.frame.height/2
                cell.menuroundcircleview.clipsToBounds = true
//                cell.cashlabel.frame = CGRect(x: cell.cashlabel.frame.origin.x, y: self.view.frame.origin.y, width:100, height:16)

                return cell
            }
            else if indexPath.row == 3
            {
                let cell = slidetabelview.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
                // cell.cashlabel.text = "English"
                cell.orderDomain.text = self.emomerce_details[indexPath.row]
                cell.cashlabel.isHidden = false
                cell.cashlabel.text = "English"
                cell.orderDomain.frame = CGRect(x: 26, y:self.view.frame.origin.y+15, width:200, height:13)
                cell.applaylabel.frame = CGRect(x:30, y:cell.orderDomain.frame.size.height+15, width:200, height:16)
                cell.cashlabel.text = self.TabelCashLabelstringfinalavlue[indexPath.row]
                cell.applaylabel.isHidden = true
                cell.selectionStyle = .none
                cell.menuroundcircleview.layer.cornerRadius =  cell.menuroundcircleview.frame.height/2
                cell.menuroundcircleview.clipsToBounds = true
//                   cell.cashlabel.frame = CGRect(x: cell.cashlabel.frame.origin.x, y: self.view.frame.origin.y, width:100, height:16)

                return cell
            }
            else if indexPath.row == 4
            {
                let cell = slidetabelview.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
                // cell.cashlabel.text = "English"
                cell.orderDomain.text = self.emomerce_details[indexPath.row]
//                cell.cashlabel.isHidden = false
//                cell.cashlabel.text = "English"
//                cell.cashlabel.text = self.TabelCashLabelstringfinalavlue[indexPath.row]
                cell.orderDomain.frame = CGRect(x: 26, y:self.view.frame.origin.y+15, width:200, height:13)
                cell.applaylabel.frame = CGRect(x:30, y:cell.orderDomain.frame.size.height+15, width:200, height:16)
                cell.applaylabel.isHidden = true
                cell.selectionStyle = .none
                cell.menuroundcircleview.layer.cornerRadius =  cell.menuroundcircleview.frame.height/2
                cell.menuroundcircleview.clipsToBounds = true
                return cell
            }
                
            else if indexPath.row == 5
            {
                let cell = slidetabelview.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
                cell.orderDomain.text = self.emomerce_details[indexPath.row]
                cell.cashlabel.isHidden = false
                cell.cashlabel.text = "English"
                cell.applaylabel.isHidden = true
                cell.selectionStyle = .none
                cell.menuroundcircleview.layer.cornerRadius =  cell.menuroundcircleview.frame.height/2
                cell.menuroundcircleview.clipsToBounds = true
                 cell.cashlabel.textColor = UIColor.black
                cell.orderDomain.frame = CGRect(x: 26, y:self.view.frame.origin.y+15, width:200, height:13)
                cell.applaylabel.frame = CGRect(x:30, y:cell.orderDomain.frame.size.height+30, width:200, height:16)
                cell.cashlabel.frame = CGRect(x: cell.cashlabel.frame.origin.x+33, y: self.view.frame.origin.y+15, width:100, height:16)
                if self.menunavitemrupeestotalvalue.count > 1
                {
                    self.menunavitemrupeesubvalue =  self.menunavitemrupeestotalvalue[5]
                    
                    var eventStrtwo: NSAttributedString? = nil
                    
                    if let anEncoding = self.menunavitemrupeesubvalue.data(using: .utf8) {
                        eventStrtwo = try? NSAttributedString(data: anEncoding, options: [.documentType: NSAttributedString.DocumentType.html.rawValue, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
                    }
                    cell.cashlabel.isHidden = false
                    cell.cashlabel.attributedText = eventStrtwo
                }
//                cell.cashlabel.textAlignment = .left

                return cell
            }
            else
            {
                let cell = slidetabelview.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
                cell.orderDomain.text = self.emomerce_details[indexPath.row]
                cell.applaylabel.isHidden = true
                cell.selectionStyle = .none
                cell.orderDomain.frame = CGRect(x: 26, y:self.view.frame.origin.y+15, width:200, height:13)
                cell.applaylabel.frame = CGRect(x: 30, y:cell.orderDomain.frame.size.height+15, width:200, height:16)
                cell.menuroundcircleview.layer.cornerRadius =  cell.menuroundcircleview.frame.height/2
                cell.menuroundcircleview.clipsToBounds = true
                return cell
            }
        }
    }
    
    @objc func freebeeexpiremenutrendingAction(sender: UIButton)
    {
        DispatchQueue.main.async
            {
            let view = self.storyboard?.instantiateViewController(withIdentifier:"WalletViewController")as!WalletViewController
            self.present(view, animated: true, completion:nil)
        }
    }
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if tableView == slidetabeltwo
        {
            return 55

        }
        else
        {
            return 55

        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if tableView == slidetabeltwo
        {
            
            stringvalue = self.navaitemname2value[indexPath.row]

      //      self.navaitemname2value = ["NumberMall Wallet","Orders","Invite Business Friends","Help","Language","Logout"]

            
            
            if stringvalue == "NumberMall Wallet"
            {
                DispatchQueue.main.async {
                    let view = self.storyboard?.instantiateViewController(withIdentifier:"WalletViewController")as!WalletViewController
                    self.present(view, animated: true, completion:nil)
                }
            }
            
            if stringvalue == "Orders"
            {
                DispatchQueue.main.async
                    {
                        let OrdersVCfinal = self.storyboard?.instantiateViewController(withIdentifier:"OrdersVC")as!OrdersVC
                        self.present(OrdersVCfinal, animated: true, completion:nil)
                }
            }
            
            if stringvalue == "Invite Business Friends"
            {
                self.invitefriendsValue()

            }
            if stringvalue == "Language"
            {
                DispatchQueue.main.async
                    {
                        let LanguageView = self.storyboard?.instantiateViewController(withIdentifier:"LanguageViewController")as!LanguageViewController
                        self.present(LanguageView, animated: true, completion:nil)
                }
            }
            if stringvalue == "Help"
            {
                DispatchQueue.main.async
                    {
                        let LanguageView = self.storyboard?.instantiateViewController(withIdentifier:"HelpViewController")as!HelpViewController
                        self.present(LanguageView, animated: true, completion:nil)
                }
            }
            if stringvalue == "Logout"
            {
                DispatchQueue.main.async
                    {
                        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LogoutViewController") as! LogoutViewController
                        self.addChildViewController(popOverVC)
                        popOverVC.view.frame = self.view.frame
                        self.view.addSubview(popOverVC.view)
                        popOverVC.didMove(toParentViewController: self)
                        
                }
            }
           
        }
        else
        {
            print(indexPath.row)
            if indexPath.row == 0
            {
             
                DispatchQueue.main.async {
                    let WalletView = self.storyboard?.instantiateViewController(withIdentifier:"WalletViewController")as!WalletViewController
                    self.present(WalletView, animated:true, completion:nil)
                }
            }
            else if indexPath.row == 1
            {
                DispatchQueue.main.async
                    {
                    let NumbermallCreditView = self.storyboard?.instantiateViewController(withIdentifier:"NumbermallCreditViewController")as!NumbermallCreditViewController
                    self.present(NumbermallCreditView, animated:true, completion:nil)
                }
                
            }
            else if indexPath.row == 2
            {
                DispatchQueue.main.async
                {
                    let OrdersVCfinalvalue = self.storyboard?.instantiateViewController(withIdentifier:"OrdersVC")as!OrdersVC
                    self.present(OrdersVCfinalvalue, animated: true, completion:nil)
                }
            }
            else if indexPath.row == 3
            {
                invitefriendsValue()

            }
            else if indexPath.row == 4
            {
                DispatchQueue.main.async
                    {
                        let LanguageView = self.storyboard?.instantiateViewController(withIdentifier:"HelpViewController")as!HelpViewController
                        self.present(LanguageView, animated: true, completion:nil)
                }
            }
            else if indexPath.row == 5
            {
                DispatchQueue.main.async
                    {
                        let LanguageView = self.storyboard?.instantiateViewController(withIdentifier:"LanguageViewController")as!LanguageViewController
                        self.present(LanguageView, animated: true, completion:nil)
                        
                }
            }
            else if indexPath.row == 6
            {
              
                DispatchQueue.main.async
                    {
                        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LogoutViewController") as! LogoutViewController
                        self.addChildViewController(popOverVC)
                        popOverVC.view.frame = self.view.frame
                        self.view.addSubview(popOverVC.view)
                        popOverVC.didMove(toParentViewController: self)
                }
            }
          
        }
    }
    
    func invitefriendsValue()
    {
        let text = "Hey,NumberMall App is the best app for all companies direct supplies at lowest prices with great margins, its fast and simple app that I use for all my restocking needs for my business. I strongly recommend for your business. Get it for free at https://play.google.com/store/apps/details?id=com.pop.numbermall"
        let image = UIImage(named: "Image")
        let myWebsite = NSURL(string:"https://iosdevcenters.blogspot.com")
        let shareAll = [text]
        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
      activityViewController.title = "Invite business friends via"

        
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func btnLoginAction(_ sender: Any)
    {
        DispatchQueue.main.async
            {
                let EditprofileView = self.storyboard?.instantiateViewController(withIdentifier:"EditprofileViewController")as!EditprofileViewController
                self.present(EditprofileView, animated: true, completion:nil)
        }
        }
    
    @IBAction func Totalbackbuttontotal(_ sender: UIButton)
    {
        self.view.removeFromSuperview()
        self.Totalbackbutton.isHidden = true
        AppDelegate.menu_bool = false
    }
    
}
