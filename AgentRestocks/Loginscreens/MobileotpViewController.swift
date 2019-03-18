//
//  MobileotpViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 28/01/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import CoreLocation
import CoreFoundation
import CoreTelephony
import SystemConfiguration
import Reachability
import Foundation
class MobileotpViewController: UIViewController,UITextFieldDelegate
{
    @IBOutlet weak var resendotp: UIButton!
    @IBOutlet weak var otptextfield: UITextField!
    @IBOutlet weak var myverycontinue: UIButton!
    
    
    var AcessTokenfinalstring = String()
    
    var myagentTotalvalue  = String()
    
    var MobileStringfinalValue = String()
    var Missedcallnumber = String()
    var MissedCalledNumbervalueotp = String()
    var Identificationtwofactorotp = NSNumber()
    var verfyvalue = String()
    var Verificationfinalvalueotpfinal = String()
    var Verificationcallvalue = String()
    var sucesssinglfinal = String()
    var Mobilenumbervalueforgetpassword = String()
    var Missedcallfeaturefinalvalue = String()
    var Missedcallfeaturetwo = String()
    var messagefinalvalue = String()

    @IBOutlet weak var myotp: UIView!
    
    var coverView = UIView()
    var imageView = UIImageView()

    var viewOTP = UIView()
    var btnCancel =  UIButton()
    var btnOK = UIButton()
    var lblTitle = UILabel()
    var lblMessage = UILabel()
    var phonecall = String()
    var timerotpfile = Timer()
    

    
    
    @IBOutlet weak var verfyalertview: UIView!
    
    @IBOutlet weak var verfyalerttop: UIView!
    
    
    @IBOutlet weak var verfyalertmiddelview: UIView!
    
    @IBOutlet weak var okalert: UIButton!
    
    
    @IBOutlet weak var yourmobileniumberverfiedsucessfully: UILabel!
    
    @IBOutlet weak var verfificationtitle: UILabel!
    
    @IBOutlet weak var closebutton: UIButton!
    
    
    
    @IBOutlet weak var missedcallview: UIView!
    
    
   
    @IBOutlet weak var missedcallmiddelview: UIView!
    
    @IBOutlet weak var missedcallbottomview: UIView!
    @IBOutlet weak var missedcalltopview: UIView!
    

    @IBOutlet weak var areyouwantotoLogin: UILabel!
    
    
    @IBOutlet weak var Enterotpsentto: UILabel!
    
    
    
    
    @IBOutlet weak var backalertfinalviewfinal: UIView!
    
    @IBOutlet weak var viewtopalert: UIView!
    
    @IBOutlet weak var viewmiddelviewalert: UIView!
    
    @IBOutlet weak var viewbottomviewalert: UIView!
    var pinfinalvalueis = String()
   
    var appversionName = String()
    var appMODelNumber = String()
    
    var welcomelatitude = NSString()
    var welcomelangitude = NSString()
    var PrivateIpAdress = String()
    var Macid = String()
    var DeviceType = String()
    
    var wifi = String()
    var simtype = String()
    var udidfinal = String()
    var app = UIApplication.shared.delegate as! AppDelegate
    var LoginstartingTime = String()
    var iosversionType = String()
    var Loginstrsucess = String()
    
    
    
    @IBOutlet weak var verifyalertview: UIView!
    
    @IBOutlet weak var verifybottomview: UIView!
    
    @IBOutlet weak var veriybottombuttonok: UIButton!
    
    
    @IBOutlet weak var veiryTopview: UIView!
    
    var str2 = String()
    
    
    var LoginidValue = String()
    var AgentIdValuefinalstring = String()
    
    var btnPWSHtwo = UIButton()
    var timerone = Timer()
    
    var demovalue = String()
    
    var  AgentId = String()
    
    var Kycpending = NSNumber()
    
    var KycpendingRegisteredmessage = String()
    
    
    var defaultscatageoryid = String()
    
    var defaultsBrandsid = String()
    
    var defaultsBrandIdstring = String()
    var defBrandnamestring = String()
    var defBrandpathstring = String()
    var defCatIdstring = String()
    var defCatnamestring = String()
    var defCatpathstring = String()
//    var cartcountstring = NSNumber()
    
    var cartcountstring = NSString()
var cartcountstring1 = NSNumber()
    var Menudictfinalvalue = NSDictionary()
    
    var Profiledictfinalvalue = NSDictionary()
    
    var ProfileDelStatusvalue = String()
    
    var isverystring = String()
    
    var Kyc_statusstring = String()
    var Kyc_status_colorstring = String()
    
    var PinCode = String()
    var User_image = String()
    var User_name = String()
    var rating  = String()
    var rating1  = NSNumber()

    var Hero = String()
    var  navaitemarray = NSArray()
    var  navaitemid = NSArray()
    var  navaitemname = NSArray()
    var  navaitemname2 = NSArray()
    var  navaitemstatus = NSArray()
    var  navaitemsub_value = NSArray()
    var  navaitemsvalue = NSArray()
    
    var cashValuefinalstring = String()
    
    var LoginDicytvalue :[AnyObject] = []
    
    var LoginHeaderDicytvalue :[AnyObject] = []
    var authorisationvalue = NSArray()
    
    var authorisationToken = String()
    
    var demotwovalue  = String()
    
    var navavalueis = NSArray()
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.otptextfield.delegate  = self
        self.otptextfield.MobileuseUnderlinetwo()
        
       self.view.makeToast(messagefinalvalue)
        self.myverycontinue.layer.cornerRadius = 30
        self.myverycontinue.clipsToBounds = true
        myotp.layer.shadowOffset = CGSize(width: 0, height: 3)
        myotp.layer.shadowOpacity = 0.6
        myotp.layer.shadowRadius = 3.0
        myotp.layer.shadowColor = UIColor.color2().cgColor
        otptextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        otptextfield.keyboardType = .numberPad
        
        
        missedcallmiddelview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.4)
        
        missedcallmiddelview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.4)
        
        verfyalertmiddelview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.4)
        
        verfyalertmiddelview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.4)
        
        
            let stringfinalavleu = NSString(format:"%@%@%@%@%@","Enter the OTP sent to"," ","'",MobileStringfinalValue,"'")
        
        
        Enterotpsentto.text = stringfinalavleu as String
        
        viewmiddelviewalert.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.4)
        
        viewmiddelviewalert.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.4)
        
        let stringone = Bundle.main.releaseVersionNumber
        appversionName = Bundle.main.buildVersionNumber!
        print(getVersion())
        let device = UIDevice.current
        let model = device.model
        print(model)
        DeviceType = device.modelName
        let deviceName = device.name
        print(deviceName)
        let systemName = device.systemName
        print(systemName)
        let systemVersion = device.systemVersion
        print(systemVersion)
        iosversionType = systemVersion
        if let identifierForVendor = device.identifierForVendor
        {
            print(identifierForVendor)
            let networkInfo = CTTelephonyNetworkInfo()
            let carrier = networkInfo.subscriberCellularProvider
            print(getCarrierName())
            print(getIPAddress())
            //        PrivateIpAdress = getIPAddress()!
            
            /// Coommand code
            
            print(UIDevice.current.identifierForVendor!.uuidString)
            Macid = UIDevice.current.identifierForVendor!.uuidString
            simtype = getCarrierName()!
        }
        udidfinal =  UIDevice.current.identifierForVendor!.uuidString
        let value = app.getTodayString()
        
    }
    
    
    @objc func textFieldDidChange(_ textField: UITextField)
    {
            if otptextfield.text?.count == 6
            {
                myverycontinue.isUserInteractionEnabled = true
                myverycontinue.backgroundColor = UIColor.buttonbackgroundcolor()
            }
            else
            {
                myverycontinue.isUserInteractionEnabled = false;                 myverycontinue.backgroundColor = UIColor.buttonbackgroundcolor()
                myverycontinue.backgroundColor = UIColor.anotherbuttonbackgroundcolor()
            }
        
    }
    
    @IBAction func Myverycontinue(_ sender: UIButton)
    {
        
        
        if verfyvalue == "true"
        {
            DispatchQueue.main.async {
                self.MissedcallnumberMethod()
            }
        }
            
        else
        {
            if otptextfield.text?.count == 6
            {
                myverycontinue.isUserInteractionEnabled = true
                myverycontinue.backgroundColor = UIColor.buttonbackgroundcolor()
                DispatchQueue.main.async {
                    self.otpmethod()
                }
            }
            else
            {
                myverycontinue.isUserInteractionEnabled = false;                 myverycontinue.backgroundColor = UIColor.buttonbackgroundcolor()
                myverycontinue.backgroundColor = UIColor.anotherbuttonbackgroundcolor()
            }
        }
    }
    @IBAction func Resendotp(_ sender: UIButton)
    {
        self.otptextfield.text = nil
        
        self.otptextfield.resignFirstResponder()
        
        DispatchQueue.main.async
        {
            self.Verifyotpmethod()
        }
    }
    @IBAction func Mygiveacall(_ sender: UIButton)
    {
        DispatchQueue.main.async {
             self.missedcallview.isHidden = false
        }
    }
    @IBAction func Mybackbutton(_ sender: UIButton)
    {
//        self.dismiss(animated:true, completion:nil)
//
//        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BackalertViewController") as! BackalertViewController
//        self.addChildViewController(popOverVC)
//        popOverVC.view.frame = self.view.frame
//        self.view.addSubview(popOverVC.view)
//        popOverVC.didMove(toParentViewController: self)
        self.backalertfinalviewfinal.isHidden = false
    }
    
    func Verifyotpmethod()
    {
        
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        
        
        //        self.showSpinner()
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let postString =  String(format: "method=%@&mobilenumber=%@","resendOTPforVerify",MobileStringfinalValue)
        // 680590
        print(postString)
        
        request.httpBody = postString.data(using: .utf8)
        request.addValue(self.AcessTokenfinalstring, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                print(response.result)
                self.removeSpinner()
           
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    print(dict)
                    
                    self.removeSpinner()
                    
                    if let statusstring:NSNumber = dict.value(forKey:"status")as?NSNumber
                    {
                        print(statusstring)
                        var str2 = statusstring.stringValue
                        print(str2)
                        
                        if  str2 == "2"
                        {
                            let msgvalue  = dict.value(forKey:"msg")as!String
                            
                            
                            DispatchQueue.main.async {
                            
                                
                                self.view.makeToast(msgvalue)
                                
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
    
    func phone(phoneNum: String) {
        if let url = URL(string: "tel://\(phoneNum)") {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                verfyvalue = "true"
                self.myverycontinue.setTitle("VerifiedOTP", for:.normal)
                //                self.MissedcallnumberMethod()
                
            }
            else {
                UIApplication.shared.openURL(url as URL)
                verfyvalue = "false"
                print(verfyvalue)
                
            }
        }
    }
    func otpmethod()
    {
        //         self.showSpinner()
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        //   let postString = "method=landingPage&userid=511111117"
        //  let postString =  String(format: "method=%@&otp=%@&logintype=%@","verifyOTP",txtEnterOTP.text!,"4")
        let defaulst = UserDefaults.standard

        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }

        
        let postString =  String(format: "method=%@&mobilenumber=%@&otp=%@&logintype=%@","verifyOTP",MobileStringfinalValue,otptextfield.text!,"4")
        
        
        // mobilenumber
        request.httpBody = postString.data(using: .utf8)
        request.addValue(self.AcessTokenfinalstring, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                print(response.result)
                self.removeSpinner()
                
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    
                    print(dict)
                    
                    self.removeSpinner()
                    
                    if let statusstring:NSNumber = dict.value(forKey:"status")as?NSNumber
                    {
                        print(statusstring)
                        var str2 = statusstring.stringValue
                        print(str2)
                        
                        if  str2 == "0"
                        {
                            let msgvalue  = dict.value(forKey:"msg")as!String
//                            self.verfyalertview.isHidden = false
                            self.verfificationtitle.text = "Verification  Failure"
                            self.yourmobileniumberverfiedsucessfully.text = msgvalue
                            self.view.makeToast(msgvalue)

//                            self.view.makeToast(msgvalue)
                        }
                    
                        
                        
                        
                        
                        if str2 == "1"
                        {
                            
                            
                            if let pintotal:String = dict.value(forKey: "pin") as? String
                            {
                                self.pinfinalvalueis = pintotal
                                
                                let defaults = UserDefaults.standard
                                defaults.set(self.pinfinalvalueis, forKey:"MypinvaluTotal")
                                defaults.synchronize()
                                
                                
                                if self.pinfinalvalueis.count > 0
                                {
                                    self.serviceResponseLogin()
                                }
                            }
                            else
                            {
                                let msgvalue  = dict.value(forKey:"msg")as!String
                                self.verfyalertview.isHidden = true
                                self.verfificationtitle.text = "Verification  sucess"
                                self.yourmobileniumberverfiedsucessfully.text = msgvalue
                                
                                DispatchQueue.main.async
                                    {
                                        let RegisterOTPVerification = self.storyboard?.instantiateViewController(withIdentifier:"SetupaccountViewController")as!SetupaccountViewController
                                        self.present(RegisterOTPVerification, animated:true, completion:nil)
                                }
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
    
    func showSpinner(){
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.view.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(imageView)
    }
    func removeSpinner(){
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()
        //        self.btnSign.isUserInteractionEnabled = true
    }
    
    @IBAction func okalertview(_ sender: UIButton)
    {
        DispatchQueue.main.async
        {
            self.verfyalertview.isHidden = true
         }
    }
    
    @IBAction func missedcallNobutton(_ sender: Any)
    {
        
        self.missedcallview.isHidden = true

    }
    @IBAction func missedcallyesbutton(_ sender: Any)
    {
        self.missedcallview.isHidden = true
        
        phone(phoneNum:Missedcallfeaturetwo)
        
        
    }
   
    
    func MissedcallnumberMethod()
    {
        //        self.showSpinner()
        
        print(MobileStringfinalValue)
        print(Identificationtwofactorotp)
        let IDentificationNumbervalue:String = String(format:"%d",Identificationtwofactorotp)
        
        
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        
        
        
        
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let postString =  String(format: "method=%@&mobilenumber=%@&otp=%@&Idtwofactorauth=%@& &logintype=%@","getMissedCallStatus",MobileStringfinalValue,"XXXXXX",IDentificationNumbervalue,"4")
        
        request.httpBody = postString.data(using: .utf8)
        request.addValue(self.AcessTokenfinalstring, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                print(response.result)
                self.removeSpinner()
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    print(dict)
                    self.removeSpinner()
                    if let statusstring:String = dict.value(forKey:"Status")as?String
                    {
                        print(statusstring)
                        let str2 = statusstring
                        print(str2)
                        if  str2 == "1"
                        {
                            let msgvalue  = dict.value(forKey:"msg")as!String
                            
                      
                            
                            self.verfyalertview.isHidden = true
                            self.yourmobileniumberverfiedsucessfully.text = "Verification successful"
                            self.verfificationtitle.text = msgvalue
                            self.view.makeToast(msgvalue)

                            self.Verificationfinalvalueotpfinal = "1"
                            DispatchQueue.main.async {
                                let RegisterOTPVerification = self.storyboard?.instantiateViewController(withIdentifier:"OwnerDetailsStepViewController")as!OwnerDetailsStepViewController
                                RegisterOTPVerification.OwnerMissedCalledNumbervalueotp = self.MobileStringfinalValue
                                RegisterOTPVerification.Messagestringfinalvalue = msgvalue
                                self.present(RegisterOTPVerification, animated:true, completion:nil)
                            }
                        }
                        
                        if  str2 == "2"
                        {
                            let msgvalue  = dict.value(forKey:"msg")as!String
                            
                            
                            self.view.makeToast(msgvalue)

                            self.verfyalertview.isHidden = true
                            self.yourmobileniumberverfiedsucessfully.text = "Verification successful"
                            self.verfificationtitle.text = msgvalue
                            self.Verificationfinalvalueotpfinal = "1"
                            DispatchQueue.main.async
                                {
                                let HomeViewVerification = self.storyboard?.instantiateViewController(withIdentifier:"HomeViewController")as!HomeViewController
                                self.present(HomeViewVerification, animated:true, completion:nil)
                            }
                        }
                        if  str2 == "0"
                        {
//                            self.verfyalertview.isHidden = false
                            let msgvalue  = dict.value(forKey:"msg")as!String
                            self.yourmobileniumberverfiedsucessfully.text = "Verification failure"
                            self.verfificationtitle.text = msgvalue
                            self.Verificationfinalvalueotpfinal = "0"
                            self.view.makeToast(msgvalue)
                        }
                    }
                    
                }
                break
            case .failure(_):
                break
            }
          
        }
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        var result = true
        
        if textField == otptextfield {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")
            let characterSet = CharacterSet(charactersIn: string)
            let maxLength = 6
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            
            return allowedCharacters.isSuperset(of: characterSet) && newString.length <= maxLength
        }
        return result
        
    }
    
    
    @IBAction func Nobutton(_ sender: UIButton)
    {
        self.backalertfinalviewfinal.isHidden = true
        
    }
    
    @IBAction func yesbutton(_ sender: UIButton)
    {
      self.backalertfinalviewfinal.isHidden = true
        self.dismiss(animated:true, completion:nil)
    }
    func serviceResponseLogin()
    {
        
        
        
        
        
        self.showSpinner()
        
        
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        
        // var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        
        request.httpMethod = "POST"
        let postString =  String(format: "method=%@&uname=%@&upwd=%@&os=%@&version=%@&appversion=%@&mobilemodelno=%@&mobileuserlat=%@&mobileuserlang=%@&privateIP=%@&macID=%@&deviceType=%@&usertype=%@&Sigstrength=%@&ConnTyp=%@&SimTyp=%@&appType=%@&AndroidId=%@&cseloginenable=%@&appOpenTime=%@&appCloseTime=%@&app=%@","login_new",MobileStringfinalValue,self.pinfinalvalueis,"IOS",iosversionType,"3.0-37",appMODelNumber,welcomelatitude,welcomelangitude,"172.31.0.128",Macid,DeviceType,"1","0",wifi,simtype,"Direct",udidfinal,"0",app.startTime,app.startTime,"IOS")
        //        appversion:2.9-36
        
        //         let postString =  String(format: "method=%@&uname=%@&upwd=%@&os=%@&version=%@&appversion=%@&mobilemodelno=%@&mobileuserlat=%@&mobileuserlang=%@&privateIP=%@&macID=%@&deviceType=%@&usertype=%@&Sigstrength=%@&ConnTyp=%@&SimTyp=%@&appType=%@&AndroidId=%@&cseloginenable=%@&appOpenTime=%@&appCloseTime=%@&app=%@","login_new",mobileNumber.text!,pinNumberTF.text!,"IOS",iosversionType,"2.7-34",appMODelNumber,welcomelatitude,welcomelangitude,PrivateIpAdress,Macid,DeviceType,"1","0",wifi,simtype,"NM",udidfinal,"0",app.startTime,app.startTime,"IOS")
        
        print(postString)
        
        
        request.httpBody = postString.data(using: .utf8)
        request.addValue(self.AcessTokenfinalstring, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        
        
        
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                print("response.response \(response.response)") // HTTP URL response
                
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
                
                
                
                
                
                
                let httpResponse = response as? HTTPURLResponse
                //                let token = httpResponse?.allHeaderFields["SECURITY-TOKEN"] as? String
                ////
                ////                print(token)
                ////
                ////                print(httpResponse)
                print(value)
                
                
                
                
                
                //                self.LoginHeaderDicytvalue = (self.LoginDicytvalue as! AnyObject).value(forKey:"")
                //                print(self.LoginHeaderDicytvalue)
                //                 self.authorisationvalue = self.LoginHeaderDicytvalue.value(forKey:"Authorization")as!NSArray
                //                print(self.authorisationvalue)
                //                self.authorisationToken = self.authorisationvalue[0] as! String
                //                print(self.authorisationToken)
                
                
                
                DispatchQueue.main.async {
                    self.removeSpinner()
                }
                if let dict:NSDictionary = response.result.value as? NSDictionary
                {
                    print(dict)
                  
                    let  statusstring = dict.value(forKey:"Message")
                    self.Loginstrsucess = statusstring as! String
                    if  self.Loginstrsucess == "Success"
                    {
                        let msgvalue  = dict.value(forKey:"Message")as!String
                     
                        self.removeSpinner()
                        
                        let defaults = UserDefaults.standard
                        defaults.set("islogin", forKey: "islogintrue")
                        self.LoginidValue = dict.value(forKey:"UserId")as!String
                        // AgentId = A977;
                        
                        self.AgentId = dict.value(forKey:"AgentId")as!String
                        self.AgentIdValuefinalstring = dict.value(forKey:"UserId")as!String
                        
                        self.cashValuefinalstring = dict.value(forKey:"cash")as!String
                        
                        
                        
                        
                        
                        self.Kycpending = dict.value(forKey:"IsKYCRegistered")as!NSNumber
                        
                        self.KycpendingRegisteredmessage = dict.value(forKey:"IsKYCRegisteredMessage")as!String
                        
                        self.defaultsBrandIdstring = dict.value(forKey:"defBrandId")as!String
                        self.defBrandnamestring = dict.value(forKey:"defBrandname")as!String
                        self.defBrandpathstring = dict.value(forKey:"defBrandpath")as!String
                        self.defCatIdstring = dict.value(forKey:"defCatId")as!String
                        self.defCatnamestring = dict.value(forKey:"defCatname")as!String
                        self.defCatpathstring = dict.value(forKey:"defCatpath")as!String
                        
//                        self.cartcountstring = dict.value(forKey:"CartCount")as!NSString
                        
                        if let cartcounttotal:NSString = dict.value(forKey: "CartCount") as? NSString
                        {
                             self.cartcountstring = cartcounttotal
                            let defaults = UserDefaults.standard
                            
                            defaults.set(self.cartcountstring, forKey: "Mycartcountstring")
                       

                        }
                        if let cartcounttotal:NSNumber = dict.value(forKey: "CartCount") as? NSNumber
                        {
                            self.cartcountstring1 = cartcounttotal
                            defaults.set(self.cartcountstring1, forKey: "Mycartcountstring")
                        }
                        
                        
                        
                        defaults.set(self.defaultsBrandIdstring, forKey: "MydefaultsBrandidstring")
                        defaults.set(self.defBrandnamestring, forKey: "Mydefaultsbarndsname")
                        defaults.set(self.Kycpending, forKey: "MyKycpending")
                        defaults.set(self.defBrandpathstring, forKey: "Mydeafultsbrandspath")
                        defaults.set(self.defBrandpathstring, forKey: "Mydeafultsbrandspath")
                        defaults.set(self.defCatIdstring, forKey: "Mydeafultscatageoryidstring")
                        defaults.set(self.defCatnamestring, forKey: "mydeafultscatageoryname")
                        defaults.set(self.defCatpathstring, forKey: "mydefaultscaatgeorypathstring")
                        
                        defaults.set(self.cashValuefinalstring, forKey: "mycashValuefinalstring")
                        
                        
                        defaults.set(self.AgentIdValuefinalstring, forKey: "Myuseridfinaltwovalue")
                        
                        defaults.set(self.AgentId,forKey: "Myagentidfinalavleu")
                        
                        defaults.set(self.AgentIdValuefinalstring,forKey: "Myuseridfinal")
                        
                        
                        
                        //                            self.AgentId = dict.value(forKey:"AgentId")as!String
                        //                            self.AgentIdValuefinalstring = dict.value(forKey:"UserId")as!String
                        
                        
                        defaults.set(self.Kycpending, forKey: "MyKycpending")
                        defaults.set(self.KycpendingRegisteredmessage, forKey: "MyKycMessagelabel")
                        
                        defaults.set(self.LoginidValue, forKey: "MyLoginfinalvalue")
                        defaults.set(self.MobileStringfinalValue, forKey: "Mymobilenumbervalue")
                        defaults.set(self.AgentIdValuefinalstring, forKey: "myuseridvaluefinal")
                        defaults.set(self.MobileStringfinalValue, forKey: "Myagentidvalue")
                        
                        defaults.set(self.AgentId, forKey: "Myagentid")
                      
                        defaults.synchronize()
                        
//                        self.verifyalertview.isHidden = true
                        self.removeSpinner()
                        
                        if let productrating_graphpreviewfinalvalue:NSDictionary = dict.value(forKey:"menu") as?NSDictionary
                        {
                            
                            self.Menudictfinalvalue = productrating_graphpreviewfinalvalue
                        }
                        
                        if let productrating_graphpreviewfinalvalue:NSDictionary = self.Menudictfinalvalue.value(forKey:"Profile") as?NSDictionary
                        {
                            self.Profiledictfinalvalue = productrating_graphpreviewfinalvalue
                        }
                        if let DelStatusfinalvalue:String = self.Profiledictfinalvalue.value(forKey:"DelStatus") as?String
                        {
                            self.ProfileDelStatusvalue = DelStatusfinalvalue
                            
                        }
                        
                        if let isverystringfinalvalue:String = self.Profiledictfinalvalue.value(forKey:"IsVerify") as?String
                        {
                            self.isverystring = isverystringfinalvalue
                            
                        }
                        
                        if let Kyc_statusstringfinalvalue:String = self.Profiledictfinalvalue.value(forKey:"Kyc_status") as?String
                        {
                            self.Kyc_statusstring = Kyc_statusstringfinalvalue
                            
                        }
                        if let Kyc_status_colorstringfinalvalue:String = self.Profiledictfinalvalue.value(forKey:"Kyc_status_color") as?String
                        {
                            self.Kyc_status_colorstring = Kyc_status_colorstringfinalvalue
                            
                        }
                        
                        if let PinCodestringfinalvalue:String = self.Profiledictfinalvalue.value(forKey:"PinCode") as?String
                        {
                            self.PinCode = PinCodestringfinalvalue
                            
                        }
                        
                        if let User_imagefinalvalue:String = self.Profiledictfinalvalue.value(forKey:"User_image") as?String
                        {
                            self.User_image = User_imagefinalvalue
                            
                        }
                        
                        if let User_namefinalvalue:String = self.Profiledictfinalvalue.value(forKey:"User_name") as?String
                        {
                            self.User_name = User_namefinalvalue
                            
                        }
                        
                        if let ratingfinalvalue:String = self.Profiledictfinalvalue.value(forKey:"rating") as?String
                        {
                            self.rating = ratingfinalvalue
                            
                        }
                        
                        if let rating1finalvalue:NSNumber = self.Profiledictfinalvalue.value(forKey:"rating") as?NSNumber
                        {
                            self.rating1 = rating1finalvalue
                            
                        }
                        
                        if let Herofinalvalue:String = dict.value(forKey:"hero") as?String
                        {
                            self.Hero = Herofinalvalue
                            
                        }
                        
                        if let nav_itemfinalvalue:NSArray =  self.Menudictfinalvalue.value(forKey:"nav_item") as?NSArray
                        {
                            self.navaitemarray = nav_itemfinalvalue
                            
                        }
                        
                        
                        
                        if let navaitemidfinalvalue:NSArray =  self.navaitemarray.value(forKey:"id") as?NSArray
                        {
                            self.navaitemid = navaitemidfinalvalue
                            
                        }
                        
                        if let navaitemnamefinalvalue:NSArray = self.navaitemarray.value(forKey:"name") as?NSArray
                        {
                            self.navaitemname = navaitemnamefinalvalue
                            
                        }
                        
                        if let navaitemname2finalvalue:NSArray = self.navaitemarray.value(forKey:"name2") as?NSArray
                        {
                            self.navaitemname2 = navaitemname2finalvalue
                            
                        }
                        
                        if let navaitemstatusfinalvalue:NSArray = self.navaitemarray.value(forKey:"status") as?NSArray
                        {
                            self.navaitemstatus = navaitemstatusfinalvalue
                            
                        }
                        if let navaitemsub_valuefinalvalue:NSArray = self.navaitemarray.value(forKey:"sub_value") as?NSArray
                        {
                            self.navaitemsub_value = navaitemsub_valuefinalvalue
                            
                        }
                        
                        if let navaitemsub_valuefinalvalue:NSArray = self.navaitemarray.value(forKey:"value") as?NSArray
                        {
                            self.navavalueis = navaitemsub_valuefinalvalue
                            
                        }
                        
                        
                        let defaultsfinal = UserDefaults.standard
                         defaultsfinal.set(self.navavalueis, forKey:"Mynavvaluetotal")
                        defaultsfinal.set(self.ProfileDelStatusvalue, forKey:"ProfileDelStatusvalue")
                        
                        defaultsfinal.set(self.isverystring, forKey:"isverystring")
                        defaultsfinal.set(self.Kyc_statusstring, forKey:"Kyc_statusstring")
                        
                        defaultsfinal.set(self.Kyc_status_colorstring, forKey:"Kyc_status_colorstring")
                        
                        defaultsfinal.set(self.PinCode, forKey:"PinCode")
                        defaultsfinal.set(self.User_image, forKey:"Usertwomage")
                        defaultsfinal.set(self.User_name, forKey:"User_name")
                        defaultsfinal.set(self.rating, forKey:"rating")
                        defaultsfinal.set(self.Hero, forKey:"Hero")
                        
                        defaultsfinal.set(self.Hero, forKey:"Hero")
                        defaultsfinal.set(self.navaitemid, forKey:"navaitemid")
                        defaultsfinal.set(self.navaitemname, forKey:"navaitemname")
                        defaultsfinal.set(self.navaitemname2, forKey:"navaitemname2")
                        defaultsfinal.set(self.navaitemstatus, forKey:"navaitemstatus")
                        defaultsfinal.set(self.navaitemsub_value, forKey:"navaitemTotalvalueis")
                        defaultsfinal.set(self.navaitemsvalue, forKey:"navaitemsvalue")
                        defaultsfinal.synchronize()
                        DispatchQueue.main.async
                            {
                    let HomeView = self.storyboard?.instantiateViewController(withIdentifier:"HomeViewController")as!HomeViewController
                        HomeView.LoginidValuefinal = self.LoginidValue
                             
                                if Int(self.rating1) > 0
                              {
                            HomeView.Homeratingnumber = self.rating1
                                let defaultsvalueis = UserDefaults.standard
                                defaultsvalueis.set(HomeView.Homeratingnumber, forKey:"Myratingnumbervalue")
                                defaultsvalueis.synchronize()
                                }
                              
                                if self.navaitemsub_value.count > 0
                                {
                                    HomeView.Homefreedeliver = self.navaitemsub_value
                                    let defaultsvalueis = UserDefaults.standard
                                 
                                    defaultsvalueis.set(HomeView.Homefreedeliver, forKey:"Myfreedelivery")
                                    defaultsvalueis.synchronize()

                                }

                    
                   
                                
                                
                    self.present(HomeView, animated:true, completion:nil)
                        }
                    }
            
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
    
    func getVersion() -> String {
        guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else {
            return "no version info"
        }
        return version
    }
    func getCarrierName() -> String? {
        
        var carrierName: String?
        
        let typeName: (Any) -> String = { String(describing: type(of: $0)) }
        
        let statusBar = UIApplication.shared.value(forKey: "_statusBar") as! UIView
        
        for statusBarForegroundView in statusBar.subviews {
            if typeName(statusBarForegroundView) == "UIStatusBarForegroundView" {
                for statusBarItem in statusBarForegroundView.subviews {
                    if typeName(statusBarItem) == "UIStatusBarServiceItemView" {
                        carrierName = (statusBarItem.value(forKey: "_serviceString") as! String)
                    }
                }
            }
        }
        return carrierName
    }
    func getIPAddress() -> String? {
        var address: String?
        var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
        if getifaddrs(&ifaddr) == 0 {
            var ptr = ifaddr
            while ptr != nil {
                defer { ptr = ptr?.pointee.ifa_next }
                
                let interface = ptr?.pointee
                let addrFamily = interface?.ifa_addr.pointee.sa_family
                if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                    
                    if let name: String = String(cString: (interface?.ifa_name)!), name == "en0" {
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        getnameinfo(interface?.ifa_addr, socklen_t((interface?.ifa_addr.pointee.sa_len)!), &hostname, socklen_t(hostname.count), nil, socklen_t(0), NI_NUMERICHOST)
                        address = String(cString: hostname)
                    }
                }
            }
            freeifaddrs(ifaddr)
        }
        return address
    }
}
extension UITextField {
    
    func MobileuseUnderlinetwo() {
        let border = CALayer()
        let borderWidth = CGFloat(0.5)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(origin: CGPoint(x: 0,y :self.frame.size.height - borderWidth), size: CGSize(width: self.frame.size.width, height: self.frame.size.height))
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
}
}
