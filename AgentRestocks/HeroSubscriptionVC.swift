//
//  HeroSubscriptionVC.swift
//  AgentRestocks
//
//  Created by apple on 9/26/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import Kingfisher
class HeroSubscriptionVC: UIViewController,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var lblHeroSubscription: UILabel!
    @IBOutlet weak var btnPop: UIButton!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var imgNMHero: UIImageView!
    
    @IBOutlet weak var lblUnlimited: UILabel!
    
    @IBOutlet weak var lblSubscription: UILabel!
    
    @IBOutlet weak var btnSubscriptionHero: UIButton!
    
    @IBOutlet weak var lblPeriodSubscription: UILabel!
    
    @IBOutlet weak var btnNumberTC: UIButton!
    
    @IBOutlet weak var lblBenefit: UILabel!
    
    @IBOutlet weak var imgBenefit: UIImageView!
    
    @IBOutlet weak var lblFreeDeliveries: UILabel!
    
    @IBOutlet weak var lblNoWorries: UILabel!

    @IBOutlet weak var lblGetEligibility: UILabel!
    
    @IBOutlet weak var lblHeroSubscriptionVale: UILabel!
    
    @IBOutlet weak var imgEarlyDeal: UIImageView!
    @IBOutlet weak var lblEarlydeal: UILabel!
    
    @IBOutlet weak var lblEarlyDealSubscription: UILabel!
    
    @IBOutlet weak var imgCashBack: UIImageView!
    
    @IBOutlet weak var lblMarginCashback: UILabel!
    
    @IBOutlet weak var lblExtraMargin: UILabel!
    
    @IBOutlet weak var btnSubscribeHero: UIButton!
  
    @IBOutlet weak var Membershipinfo: UIView!
    
    @IBOutlet weak var boarderviewsubscription: UIView!
    
    @IBOutlet weak var Membersincedtae: UILabel!
    
    @IBOutlet weak var membershipExpire: UILabel!
    
    
    @IBOutlet weak var Yourlastmembership: UIView!
    
    @IBOutlet weak var tabelviewfinal: UIView!
    
    
    @IBOutlet weak var LAstmembershiptabelview: UITableView!
    
    var MemebrshipstringName = [String]()
    var Membershipdate = [String]()
    
    var useridbilingfinalvalue = String()
    var Myauthorisationstringfinalvalue = String()
    
    var myagentTotalvalue = String()
    
    var coverView = UIView()
    var imageView = UIImageView()
    
    var COD_limitDisctionary = NSArray()
    var COD_limitKey = [String]()
    var COD_limitValue = [String]()

    @IBOutlet weak var membersince: UILabel!
    
    @IBOutlet weak var membersincedate: UILabel!
    @IBOutlet weak var yourmembership: UILabel!
    
    @IBOutlet weak var yourmembershipexpire: UILabel!
    
    
    
    /////// Hero scubscription labels
    
    
    @IBOutlet weak var benfitlab: UILabel!
    @IBOutlet weak var benfitimage: UIImageView!
    
    @IBOutlet weak var labelfreedeliverys: UILabel!
    
    @IBOutlet weak var labelnoworries: UILabel!
    
    
    @IBOutlet weak var egligibilityimageview: UIImageView!
    
    
    
    
    @IBOutlet weak var geteligibilitytext: UILabel!
    
    
    
    @IBOutlet weak var starimageview: UIImageView!
    
    @IBOutlet weak var getexcitimng: UILabel!
    
    
    
//// Benfits array
    
    
    var Benfitsarray = NSArray()
    var Benfitstitle = [String]()
    var Benfitsimage = [String]()
    var Benfitscontent = [String]()

    
    //// Previous membership Deatils
    
    
    var previousmembershipdetails = NSArray()
    var previousmembershipdetailsfinalarray = NSArray()

    var previousmembershipsubdetails = NSArray()
    var previousmembershipKeystring = [String]()
    var previousmembershipValuestring = [String]()

    
    
    var previousmembershipKeytwostring = [String]()
    var previousmembershipValueTwostring = [String]()
    @IBOutlet weak var scrollviewfinal: UIScrollView!
    
    @IBOutlet weak var subscribetwo: UIButton!
    @IBOutlet weak var subscribebutton: UIButton!
    
    
    
    
    @IBOutlet weak var Herosubscriptiontotalview: UIView!
    
    
    @IBOutlet weak var buttoncarttotal: UIButton!
    
    @IBOutlet weak var labelcarttaotal: UILabel!
    
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        subscribebutton.layer.masksToBounds = false
        subscribebutton.layer.cornerRadius = 5
        subscribebutton.layer.borderWidth = 1
        subscribetwo.layer.masksToBounds = false
        subscribetwo.layer.cornerRadius = 5
        subscribetwo.layer.borderWidth = 1
        subscribetwo.layer.borderColor = UIColor.clear.cgColor
        subscribebutton.layer.borderColor = UIColor.clear.cgColor

        shadowView.layer.shadowOffset = CGSize(width: 0, height: 3)
        shadowView.layer.shadowOpacity = 0.6
        shadowView.layer.shadowRadius = 3.0
        shadowView.layer.shadowColor = UIColor.color2().cgColor
        headerView.layer.shadowOffset = CGSize(width: 0, height: 3)
        headerView.layer.shadowOpacity = 0.6
        headerView.layer.shadowRadius = 3.0
        headerView.layer.shadowColor = UIColor.color2().cgColor
        scrollView.backgroundColor = UIColor.clear
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        btnSubscribeHero.layer.cornerRadius = 5
        btnSubscribeHero.clipsToBounds = true
        btnSubscriptionHero.layer.cornerRadius = 5
        btnSubscriptionHero.clipsToBounds = true

        if self.view.frame.size.height < 800
        {
            scrollView.contentInset = UIEdgeInsetsMake(0, 0, 1200, 0)
            scrollView.isScrollEnabled = true
            scrollView.showsVerticalScrollIndicator = false
        }
        if self.view.frame.size.height < 800
        {
            scrollviewfinal.contentInset = UIEdgeInsetsMake(0, 0,1200, 0)
            scrollviewfinal.isScrollEnabled = true
            scrollView.showsVerticalScrollIndicator = false
        }
        headerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        headerView.layer.shadowOpacity = 0.3
        headerView.layer.shadowRadius = 1.0
        headerView.layer.borderColor = UIColor.color2().cgColor
        headerView.layer.shadowColor = UIColor.color2().cgColor

        self.boarderviewsubscription.layer.borderWidth = 1.0
        self.boarderviewsubscription.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        MemebrshipstringName  = ["Member since","Your membership will expire on"]
        Membershipdate  = ["1 Jan 2017","30 Mar 2017"]
        self.LAstmembershiptabelview.dataSource  = self
        self.LAstmembershiptabelview.delegate  = self
        self.tabelviewfinal.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        DispatchQueue.main.async
            {
            self.Herosubscribefinalavlue()
         }

        
        
        let defaults = UserDefaults.standard
        if let Mycartcountvalue:NSNumber = defaults.value(forKey:"Mycartcountstring")as?NSNumber
        {
            self.labelcarttaotal.text = Mycartcountvalue.stringValue
            self.labelcarttaotal.isHidden = false
            self.labelcarttaotal.layer.cornerRadius = self.labelcarttaotal.frame.size.width / 2
            self.labelcarttaotal.clipsToBounds = true
            self.labelcarttaotal.layer.masksToBounds = true
            
        }
        else{
            self.labelcarttaotal.isHidden = true
        }
        
        let cartcounttapvalueis = UITapGestureRecognizer(target: self, action: #selector(self.HerosubscriptiontotalviewTapContactfinalvalue(_:)))
        Herosubscriptiontotalview.addGestureRecognizer(cartcounttapvalueis)
        Herosubscriptiontotalview.isUserInteractionEnabled = true
    }
    
    @objc func HerosubscriptiontotalviewTapContactfinalvalue(_ sender: UIGestureRecognizer)
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
    @IBAction func btnSubscribeHeroAction(_ sender: Any)
    {
        self.dismiss(animated:true, completion:nil)
    }
    
    @IBAction func btnNumberMallTermandConditionAction(_ sender: Any)
    {
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.previousmembershipKeystring.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell  = LAstmembershiptabelview.dequeueReusableCell(withIdentifier:"MembershipTableViewCell", for: indexPath) as! MembershipTableViewCell
        cell.selectionStyle = .none
        cell.mebershipname.text = self.previousmembershipKeystring[indexPath.row] as? String
        cell.membershipdate.text = self.previousmembershipValuestring[indexPath.row] as? String
        
        cell.membershipnametwo.text = self.previousmembershipKeytwostring[indexPath.row] as? String
        cell.membershipdtatetwo.text = self.previousmembershipValueTwostring[indexPath.row] as? String
         cell.mymbershipviewfinalview.layer.cornerRadius = 5.0
         cell.mymbershipviewfinalview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
         cell.mymbershipviewfinalview.layer.borderWidth  = 1.0
        cell.mymbershipviewfinalview.layer.masksToBounds = true
        
          return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 125
    }

    @IBAction func btnPopAction(_ sender: Any)
    {
        self.dismiss(animated:true, completion:nil)
    }

    @IBAction func viewHistoryvalue(_ sender: UIButton)
    {
    DispatchQueue.main.async
            {
            let HeroSubscribeVCfinal = self.storyboard?.instantiateViewController(withIdentifier:"HeroSubscribeVC")as!HeroSubscribeVC
            self.present(HeroSubscribeVCfinal, animated:true, completion:nil)
        }
    }
    func Herosubscribefinalavlue()
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
        //        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
      //  request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                if let dictfinalvaluefinal:NSDictionary = response.result.value as? NSDictionary
                {
                    
                    self.removeSpinner()
                    DispatchQueue.main.async
                    {
                        self.scrollView.isHidden = false
                        self.scrollviewfinal.isHidden = true
                    }
              if let COD_limitDisctionaryfinal:NSArray = dictfinalvaluefinal.value(forKey: "MembershipInfo") as? NSArray
                    {
                    self.COD_limitDisctionary = COD_limitDisctionaryfinal
                    if  self.COD_limitDisctionary.count > 0
                    {
                        self.COD_limitKey =  self.COD_limitDisctionary.value(forKey:"Key")as![String]
                        self.COD_limitValue =  self.COD_limitDisctionary.value(forKey:"Value")as![String]
                    }
                    self.Benfitsarray = dictfinalvaluefinal.value(forKey:"Benefits")as!NSArray
                    self.Benfitstitle =  self.Benfitsarray.value(forKey:"title")as![String]
                    self.Benfitsimage =  self.Benfitsarray.value(forKey:"image")as![String]
                    
                    self.Benfitscontent =  self.Benfitsarray.value(forKey:"content")as![String]
                    
                    if let pervioesDetaiks: NSArray =  dictfinalvaluefinal.value(forKey:"PreviousMemberShipDetails")as? NSArray{
                            self.previousmembershipdetails = pervioesDetaiks
                        }

                        for i in 0..<self.previousmembershipdetails.count
                        {
                        let arraysingel = self.previousmembershipdetails[i] as! NSArray
                    self.previousmembershipdetailsfinalarray = arraysingel
                                            
                     let valuefinal =  self.previousmembershipdetailsfinalarray[0] as!NSDictionary
                    let textone =  valuefinal.value(forKey:"Key") as!String
                    let textwo =  valuefinal.value(forKey:"Value") as!String
                    let valuefinaltwo =  self.previousmembershipdetailsfinalarray[1] as!NSDictionary
                    let textthree =  valuefinaltwo.value(forKey:"Key") as!String
                    let texfour =  valuefinaltwo.value(forKey:"Value") as!String
        
                        self.previousmembershipKeytwostring.append(textthree)
                        self.previousmembershipValueTwostring.append(texfour)
                                            
                        self.previousmembershipKeystring.append(textone)
                        self.previousmembershipValuestring.append(textwo)
                    }
                        DispatchQueue.main.async
                            {
                                self.membersince.text = self.COD_limitKey[0]
                                self.yourmembership.text = self.COD_limitKey[1]
                                self.membersincedate.text = self.COD_limitValue[0]
                                self.yourmembershipexpire.text = self.COD_limitValue[1]
                                self.labelnoworries.text =    self.Benfitscontent[0]
                                self.geteligibilitytext.text =    self.Benfitscontent[0]
                                self.lblExtraMargin.text =    self.Benfitscontent[0]
                        }
                    }
                  
                  else
                  {
                
                    DispatchQueue.main.async {
                        self.scrollView.isHidden = true
                         self.scrollviewfinal.isHidden = false
                    }
                
                    }
                    print(self.previousmembershipKeystring)
                    print(self.previousmembershipValuestring)
                    print(self.previousmembershipKeytwostring)
                    print(self.previousmembershipValueTwostring)
                    DispatchQueue.main.async {
                       self.LAstmembershiptabelview.reloadData()
                    }
                   }
                break
            case .failure(_):
                break
            }
    }
    
    }
    func Numbermallcreditcard()
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
        print(self.myagentTotalvalue)
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
     let postString =  String(format: "method=%@&agentid=%@","distributionCenter",self.useridbilingfinalvalue,"IOS")
        request.addValue(self.Myauthorisationstringfinalvalue, forHTTPHeaderField: "Authorization")
        print(postString)

        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        request.httpBody = postString.data(using: .utf8)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                
                if let dictfinalvaluefinal:NSDictionary = response.result.value as? NSDictionary
                {
                    self.COD_limitDisctionary = dictfinalvaluefinal.value(forKey:"COD_limit")as!NSArray
                    print(self.COD_limitDisctionary)
                    self.removeSpinner()
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
   
    @IBAction func numberamlltermsconditions(_ sender: UIButton)
    {
        let WebViewControllerVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        self.present(WebViewControllerVc, animated:true, completion:nil)
    }
    
    @IBAction func subscribebutton(_ sender: UIButton)
    {
     DispatchQueue.main.async
        {
        let HeroSubscribeVCfinal = self.storyboard?.instantiateViewController(withIdentifier:"HeroSubscribeVC")as!HeroSubscribeVC
            self.present(HeroSubscribeVCfinal, animated:true, completion:nil)
        }
    }
  
    @IBAction func subscribebuttontwo(_ sender: UIButton)
    {
        DispatchQueue.main.async
            {
                let HeroSubscribeVCfinal = self.storyboard?.instantiateViewController(withIdentifier:"HeroSubscribeVC")as!HeroSubscribeVC
                self.present(HeroSubscribeVCfinal, animated:true, completion:nil)
        }
    }
 }
