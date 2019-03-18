//
//  ViewController.swift
//  AgentRestock
//
//  Created by apple on 1/17/18.
//  Copyright © 2018 apple. All rights reserved.
//
//// https://stackoverflow.com/questions/52287882/right-way-to-refresh-the-token
import UIKit
import Alamofire
import CoreLocation
import CoreFoundation
import CoreTelephony
import SystemConfiguration
import Reachability
import Foundation
import IQKeyboardManagerSwift

//public class ConnectionCheck {
//
//    class func isConnectedToNetwork() -> Bool {
//
//        var zeroAddress = sockaddr_in()
//        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
//        zeroAddress.sin_family = sa_family_t(AF_INET)
//
//        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
//            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
//                SCNetworkReachabilityCreateWithAddress(nil, $0)
//            }
//        }) else {
//            return false
//        }
//
//        var flags: SCNetworkReachabilityFlags = []
//        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
//            return false
//        }
//
//        let isReachable = flags.contains(.reachable)
//        let needsConnection = flags.contains(.connectionRequired)
//
//        return (isReachable && !needsConnection)
//    }
//}
class loginPageVC: UIViewController,UITextFieldDelegate,UIGestureRecognizerDelegate,CLLocationManagerDelegate {

    @IBOutlet weak var lblMblNum: UILabel!
    
    @IBOutlet weak var lblPassword: UILabel!
    
    
    @IBOutlet weak var imgNMLogo: UIImageView!
    
 
    @IBOutlet weak var viewBtn: UIView!
    
    @IBOutlet weak var lblLoginMobile: UILabel!
    
    @IBOutlet weak var mobileNumber: UITextField!
    
  
    @IBOutlet weak var btnPWSH: UIButton!
  
    @IBOutlet weak var pinNumberTF: UITextField!
    var locationManager = CLLocationManager()

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
    
    @IBOutlet weak var verificationnotregistred: UILabel!
    
    @IBOutlet weak var verificationMobilenumberregistered: UILabel!
    var coverView = UIView()
    var imageView = UIImageView()
    
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
    var cartcountstring = NSNumber()
    
    
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

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let reachability = Reachability()!
        
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
                self.wifi = "WIFI"
            } else
            {
                print("Reachable via Cellular")
            }
        }
        
        reachability.whenUnreachable = { _ in
            print("Not reachable")
//            let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NoInternetViewcontroller") as! NoInternetViewcontroller
//            
//            self.addChildViewController(popOverVC)
//            popOverVC.view.frame = self.view.frame
//            self.view.addSubview(popOverVC.view)
//            popOverVC.didMove(toParentViewController: self)
//            
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
   
        viewBtn.layer.borderColor = UIColor(red: 79/255, green: 169/255, blue: 227/255, alpha: 1).cgColor
        viewBtn.layer.borderWidth = 1
        let iconWidthlogin = 20;
        let iconHeightLogin = 20;
        let imageViewlogin = UIImageView()
        let imageEmailLogin = UIImage(named:"mobile_grey-2")
        imageViewlogin.image = imageEmailLogin
        imageViewlogin.frame = CGRect(x:0, y:10, width: iconWidthlogin, height: iconHeightLogin)
        let paddingViewLogin = UIView(frame: CGRect(x: 0, y: 0, width:25, height: self.mobileNumber.frame.size.height))
        mobileNumber.leftViewMode = UITextFieldViewMode.always
        mobileNumber.addSubview(imageViewlogin)
        mobileNumber.leftView = paddingViewLogin
       
        let imageViewpassword = UIImageView()
        let imagepassword = UIImage(named:"lock-2")
        imageViewpassword.image = imagepassword
        imageViewpassword.frame = CGRect(x:0, y:10, width: iconWidthlogin, height: iconHeightLogin)
        let paddingViewPAssword = UIView(frame: CGRect(x: 0, y: 0, width:25, height: self.pinNumberTF.frame.size.height))
        pinNumberTF.leftViewMode = UITextFieldViewMode.always
        pinNumberTF.addSubview(imageViewpassword)
        pinNumberTF.leftView = paddingViewPAssword
        
        
        let iconWidthlogintwo = 25;
        let iconHeightLogintwo = 25;
        let imagepasswordtwo = UIImage(named:"eye_close-22")
        btnPWSHtwo.setBackgroundImage(imagepasswordtwo, for:.normal)
        btnPWSHtwo.frame = CGRect(x:275, y:10, width: iconWidthlogintwo, height: iconHeightLogintwo)
        let paddingViewpintwo = UIView(frame: CGRect(x: 0, y: 0, width:25, height:25))
        pinNumberTF.rightViewMode = UITextFieldViewMode.always
        pinNumberTF.addSubview(btnPWSHtwo)
        pinNumberTF.rightView = paddingViewpintwo
        btnPWSHtwo.addTarget(self, action:#selector(self.buttonClicked(_:)), for: .touchUpInside)

       
        mobileNumber.useUnderline()
        pinNumberTF.useUnderline()
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
        veiryTopview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        veriybottombuttonok.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        IQKeyboardManager.sharedManager().shouldShowTextFieldPlaceholder = false
        
        pinNumberTF.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClicked))

        mobileNumber.keyboardType = .numberPad
        pinNumberTF.keyboardType = .numberPad
        verifyalertview.isHidden = true
        mobileNumber.tintColor = .black
        pinNumberTF.tintColor = .black
        
        

        if demovalue == "123456"
        {
            self.view.makeToast("All set, you can login now")
        }

        if demotwovalue.count > 0
        {
            self.view.makeToast(demotwovalue)

        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    @objc func doneButtonClicked(_ sender: Any)
    {
        
    }
    
    @objc func buttonClicked(_ sender: UIButton) {
        if btnPWSHtwo.tag == 0
        {
            pinNumberTF.isSecureTextEntry = true
            btnPWSHtwo.setBackgroundImage(#imageLiteral(resourceName: "eye_close-22"), for:.normal)
            
            btnPWSHtwo.tag = 1
            
        }
        else if btnPWSHtwo.tag == 1
        {

            pinNumberTF.isSecureTextEntry = false
            btnPWSHtwo.setBackgroundImage(#imageLiteral(resourceName: "eye_op-22"), for:.normal)
            btnPWSHtwo.tag = 0
        }    }
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
    
 
    @IBOutlet weak var forgotPinAction: UIButton!
   
    @IBAction func forgotPinAction(_ sender: Any)
    {
        let forgotVC = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        self.present(forgotVC, animated: true, completion: nil)
    }
    
    @IBAction func btnLogin(_ sender: Any) {

        
        if mobileNumber.text?.count == 0
        {
            self.verifyalertview.isHidden = false
            self.verificationMobilenumberregistered.text = "please enter 10 digit mobile number"
            self.verificationnotregistred.text = "Error"
        }
        
        else{
            if (mobileNumber.text?.count)! < 10
            {
               // self.lblMblNum.isHidden = false
                //            self.lblMblNum.text = "Please Enter VlaidMobileNumber"
                self.verifyalertview.isHidden = false
                self.verificationMobilenumberregistered.text = "please enter 10 digit mobile number"
                self.verificationnotregistred.text = "Error"
            }
            if (mobileNumber.text?.count)! > 10
            {
               // self.lblMblNum.isHidden = false
                //            self.lblMblNum.text = "Please Enter VlaidMobileNumber"
                self.verifyalertview.isHidden = false
                self.verificationMobilenumberregistered.text = "please enter 10 digit mobile number"
                self.verificationnotregistred.text = "Error"
            }
            if mobileNumber.text?.count == 10
            {
                self.lblMblNum.text = "Please Enter VlaidMobileNumber"
                
                self.lblMblNum.isHidden = true
                         if (pinNumberTF.text?.isEmpty)!
                        {
                            self.verifyalertview.isHidden = false
                            self.verificationMobilenumberregistered.text = "please enter valid pin"
                            self.verificationnotregistred.text = "Error"
                        }
                         if(pinNumberTF.text?.count)! < 6
                        {
                            self.lblPassword.isHidden = false
                            self.verifyalertview.isHidden = false
                            self.verificationMobilenumberregistered.text = "please enter valid pin"
                            self.verificationnotregistred.text = "Error"
                        }
                         if (pinNumberTF.text?.count)! > 6
                        {
                            self.lblPassword.isHidden = false
                            self.verifyalertview.isHidden = false
                            self.verificationMobilenumberregistered.text = "please enter valid pin"
                            self.verificationnotregistred.text = "Error"
                        }
                        if pinNumberTF.text?.count == 6
                        {
//                            self.lblPassword.isHidden = true
//                            self.lblPassword.text = "Please Valid PAssword"
                            if mobileNumber.text?.count == 10 && pinNumberTF.text?.count == 6
                            {
                                
                                let defaults = UserDefaults.standard
                                defaults.set(self.pinNumberTF.text!, forKey:"Mypinvalue")
                                defaults.synchronize()

                              
                                if ConnectionCheck.isConnectedToNetwork()
                                {
                                    print("Method Called")
                                    self.determineMyCurrentLocation()
                                }
                                else{
                                    self.removeSpinner()
                                    let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NoInternetViewcontroller") as! NoInternetViewcontroller
                                    
                                    self.addChildViewController(popOverVC)
                                    popOverVC.view.frame = self.view.frame
                                    self.view.addSubview(popOverVC.view)
                                    popOverVC.didMove(toParentViewController: self)
                                }
                            }
                           
                        }
                
                
            }
           
        }
        
        
//        if (mobileNumber.text?.isEmpty)!
//        {
//         //   self.lblMblNum.isHidden = false
////            self.lblMblNum.text = "Please Enter MobileNumber"
//            self.verifyalertview.isHidden = false
//            self.verificationMobilenumberregistered.text = "please enter 10 digit mobile number"
//            self.verificationnotregistred.text = "Error"
//        }
//
//         if mobileNumber.text?.count == 0
//        {
//        //    self.lblMblNum.isHidden = false
////            self.lblMblNum.text = "Please Enter VlaidMobileNumber"
//            self.verifyalertview.isHidden = false
//            self.verificationMobilenumberregistered.text = "please enter 10 digit mobile number"
//            self.verificationnotregistred.text = "Error"
//
//        }
        
        
      

      
    }
    
  
    @IBAction func btnSignup(_ sender: Any)
    {
        
        DispatchQueue.main.async
            {
            let AnimationLoginViewControllerfinal = self.storyboard?.instantiateViewController(withIdentifier: "AnimationLoginViewController") as! AnimationLoginViewController
            self.present(AnimationLoginViewControllerfinal, animated: true, completion: nil)
        }
    
    }
    
    @IBAction func btnPwHS(_ sender: Any) {

        if btnPWSH.tag == 0
        {
            pinNumberTF.isSecureTextEntry = true
            btnPWSH.setBackgroundImage(#imageLiteral(resourceName: "eye_close-22"), for:.normal)
            
            btnPWSH.tag = 1
            
        }
        else if btnPWSH.tag == 1
        {
            pinNumberTF.isSecureTextEntry = false
            btnPWSH.setBackgroundImage(#imageLiteral(resourceName: "eye_op-22"), for:.normal)
            btnPWSH.tag = 0
            
        }
    
    }
    func serviceResponseLogin()
    {
      self.showSpinner()
       // var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)

        request.httpMethod = "POST"
         let postString =  String(format: "method=%@&uname=%@&upwd=%@&os=%@&version=%@&appversion=%@&mobilemodelno=%@&mobileuserlat=%@&mobileuserlang=%@&privateIP=%@&macID=%@&deviceType=%@&usertype=%@&Sigstrength=%@&ConnTyp=%@&SimTyp=%@&appType=%@&AndroidId=%@&cseloginenable=%@&appOpenTime=%@&appCloseTime=%@&app=%@","login_new",mobileNumber.text!,pinNumberTF.text!,"IOS",iosversionType,"3.0-37",appMODelNumber,welcomelatitude,welcomelangitude,"172.31.0.128",Macid,DeviceType,"1","0",wifi,simtype,"Direct",udidfinal,"0",app.startTime,app.startTime,"IOS")
//        appversion:2.9-36

//         let postString =  String(format: "method=%@&uname=%@&upwd=%@&os=%@&version=%@&appversion=%@&mobilemodelno=%@&mobileuserlat=%@&mobileuserlang=%@&privateIP=%@&macID=%@&deviceType=%@&usertype=%@&Sigstrength=%@&ConnTyp=%@&SimTyp=%@&appType=%@&AndroidId=%@&cseloginenable=%@&appOpenTime=%@&appCloseTime=%@&app=%@","login_new",mobileNumber.text!,pinNumberTF.text!,"IOS",iosversionType,"2.7-34",appMODelNumber,welcomelatitude,welcomelangitude,PrivateIpAdress,Macid,DeviceType,"1","0",wifi,simtype,"NM",udidfinal,"0",app.startTime,app.startTime,"IOS")
        
        print(postString)
        
        
        request.httpBody = postString.data(using: .utf8)
        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
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
                            self.verificationMobilenumberregistered.text = self.Loginstrsucess
                            self.verificationnotregistred.text = "Login Sucess"
                            self.verifyalertview.isHidden = false
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
                     
                               self.cartcountstring = dict.value(forKey:"CartCount")as!NSNumber
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
                            defaults.set(self.mobileNumber.text!, forKey: "Mymobilenumbervalue")
                            defaults.set(self.AgentIdValuefinalstring, forKey: "myuseridvaluefinal")
                            defaults.set(self.mobileNumber.text!, forKey: "Myagentidvalue")

                            defaults.set(self.AgentId, forKey: "Myagentid")
                            defaults.set(self.cartcountstring, forKey: "Mycartcountstring")
                            defaults.synchronize()
                            
                            self.verifyalertview.isHidden = true
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
                        
                            let defaultsfinal = UserDefaults.standard
                            
                            defaultsfinal.set(self.ProfileDelStatusvalue, forKey:"ProfileDelStatusvalue")
                            defaultsfinal.set(self.isverystring, forKey:"isverystring")
                            defaultsfinal.set(self.Kyc_statusstring, forKey:"Kyc_statusstring")

                            defaultsfinal.set(self.Kyc_status_colorstring, forKey:"Kyc_status_colorstring")

                            defaultsfinal.set(self.PinCode, forKey:"PinCode")
                            defaultsfinal.set(self.User_image, forKey:"User_image")
                            defaultsfinal.set(self.User_name, forKey:"User_name")
                            defaultsfinal.set(self.rating, forKey:"rating")
                            defaultsfinal.set(self.Hero, forKey:"Hero")

                            defaultsfinal.set(self.Hero, forKey:"Hero")
                            defaultsfinal.set(self.navaitemid, forKey:"navaitemid")
                            defaultsfinal.set(self.navaitemname, forKey:"navaitemname")
                            defaultsfinal.set(self.navaitemname2, forKey:"navaitemname2")
                            defaultsfinal.set(self.navaitemstatus, forKey:"navaitemstatus")
                            defaultsfinal.set(self.navaitemsub_value, forKey:"navaitemsub_value")
                            defaultsfinal.set(self.navaitemsvalue, forKey:"navaitemsvalue")
                            defaultsfinal.synchronize()
                        
                            DispatchQueue.main.async {
                                let HomeView = self.storyboard?.instantiateViewController(withIdentifier:"HomeViewController")as!HomeViewController
                                HomeView.LoginidValuefinal = self.LoginidValue
                                
                                self.present(HomeView, animated:true, completion:nil)
                            }
                            
                            
                            
                        }

                        if  self.Loginstrsucess == "Invalid login credentials"
                        {
                            let msgvalue  = dict.value(forKey:"Message")as!String
                            self.verificationMobilenumberregistered.text = self.Loginstrsucess
                            self.verifyalertview.isHidden = false
                            self.verificationnotregistred.text = "Login Failure"
                        }
                }
                break
            case .failure(_):
                DispatchQueue.main.async {
                    self.removeSpinner()
                    self.verifyalertview.isHidden = true

                }
                
                
                break
            }
            
            
            
        }
        
    }
    
    

    @IBAction func Verifybuttonok(_ sender: UIButton)
    {
        if Loginstrsucess == "Success"
        {
         
//            verifyalertview.isHidden = true
//            self.removeSpinner()
//
//            DispatchQueue.main.async {
//                let HomeView = self.storyboard?.instantiateViewController(withIdentifier:"HomeViewController")as!HomeViewController
//                HomeView.LoginidValuefinal = self.LoginidValue
//
//                self.present(HomeView, animated:true, completion:nil)
//            }
        }
        else{
            self.removeSpinner()
            
            verifyalertview.isHidden = true
        }
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        if textField == mobileNumber
        {
            lblMblNum.isHidden = true

            if textField.text?.count == 0
            {
                lblMblNum.isHidden = true
                lblMblNum.text = "Please enter mobile number"
                lblPassword.isHidden = true

            }
            if (textField.text?.count)! > 0
            {
                lblMblNum.isHidden = true
                
        lblPassword.isHidden = true
//                lblMblNum.text = "Please enter correct mobile number"
                
                if (textField.text?.count)! < 10{
//                    lblMblNum.isHidden = false
//                    lblPassword.isHidden = true
//                    lblMblNum.text = "Please enter correct mobile number"
                }
                if (textField.text?.count) == 10{
                    lblMblNum.isHidden = true
                     lblPassword.isHidden = false
                }
                
                if (textField.text?.count)! > 10 {
//                    lblMblNum.isHidden = false
//                    lblPassword.isHidden = true
//                    lblMblNum.text = "Please enter Valid Mobile Number"
                }
            }
            
        }
        else {
            
            if textField == pinNumberTF
            {
                if textField.text?.count == 0
                {
//                    lblPassword.isHidden = true
//                    lblPassword.text = "Please enter mobile number"
//                    self.btnPWSH.isEnabled = false
//                    btnPWSHtwo.isEnabled = false

                    
                }
                
                lblPassword.isHidden = true
                if (pinNumberTF.text?.count)! > 0
                {
                   // self.btnPWSH.isEnabled = true

                    if (textField.text?.underestimatedCount)! < 6{
//                        lblPassword.text = "Please enter valid Passowrd"
//                        lblPassword.isHidden = false
//                        btnPWSHtwo.isEnabled = false


                    }
                    if (pinNumberTF.text?.count) == 6{
                        lblPassword.isHidden = true
//                        btnPWSHtwo.isEnabled = false
//                        if mobileNumber.text?.count == 10 && pinNumberTF.text?.count == 6
//                        {
//                            pinNumberTF.resignFirstResponder()
//                            mobileNumber.resignFirstResponder()
//
//                            print("Method Called")
//                            self.determineMyCurrentLocation()
//
//                        }
                        
                        
                        
                    }
                    
                    if (pinNumberTF.text?.count)! > 6 {
//                        lblPassword.text = "Please enter Valid PAssword"
//                        lblPassword.isHidden = false
//                        btnPWSHtwo.isEnabled = false


                    }
                }
            }
        }
        
    }
     func getVersion() -> String {
        guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else {
            return "no version info"
        }
        return version
    }

    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        locationManager.startUpdatingLocation()
        //  locationManager.stopUpdatingLocation()
        welcomelatitude = String(userLocation.coordinate.latitude) as NSString
        
        welcomelangitude  = String(userLocation.coordinate.longitude)as NSString
        
        DispatchQueue.main.async {
         
            
            
            if ConnectionCheck.isConnectedToNetwork()
            {
                DispatchQueue.main.async {
                    self.serviceResponseLogin()
                    
                }
            }
            else{
                self.removeSpinner()
                let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NoInternetViewcontroller") as! NoInternetViewcontroller
                
                self.addChildViewController(popOverVC)
                popOverVC.view.frame = self.view.frame
                self.view.addSubview(popOverVC.view)
                popOverVC.didMove(toParentViewController: self)
            }
        }
        self.locationManager.stopUpdatingLocation()
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var result = true
        
        if textField == mobileNumber {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")
            let characterSet = CharacterSet(charactersIn: string)
            let maxLength = 10
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return allowedCharacters.isSuperset(of: characterSet) && newString.length <= maxLength
        }
        if textField == pinNumberTF {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")
            let characterSet = CharacterSet(charactersIn: string)
            let maxLength = 6
            let currentString: NSString = textField.text! as NSString
            if self.pinNumberTF.text?.count == 5{
                
                
                timerone = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(self.timerFunc1), userInfo: nil, repeats: false)
                
            }
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return allowedCharacters.isSuperset(of: characterSet) && newString.length <= maxLength
            
            
        }
       
//        else if ((textField.text?.count)! >= 1) && (string.count == 0)
//        {
//            return false
//
//    }
//        else if (textField.text?.count)! >= 1
//        {
//            textField.text = string
//            return false
//        }
        
        return result
    }
    @objc func timerFunc1(){
        
        if self.pinNumberTF.text?.count == 6{
            if mobileNumber.text?.count == 10 && pinNumberTF.text?.count == 6
            {
                
                let defaults = UserDefaults.standard
                defaults.set(self.pinNumberTF.text!, forKey:"Mypinvalue")
                defaults.synchronize()
                print(self.pinNumberTF.text)
                self.pinNumberTF.resignFirstResponder()
                
                print("Method Called")
//                self.determineMyCurrentLocation()
            }
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus)
    {
        switch status {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
            break
        case .authorizedWhenInUse:
            manager.startUpdatingLocation()
            break
        case .authorizedAlways:
            manager.startUpdatingLocation()
            break
        case .restricted:
            break
        case .denied:
            break
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
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
    func showSpinner(){
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.verifyalertview.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(imageView)
    }
    func removeSpinner(){
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()
    }
    
}

extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
extension UIDevice {
    
    var modelName: String {
        
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
            
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad6,11", "iPad6,12":                    return "iPad 5"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,3", "iPad6,4":                      return "iPad Pro 9.7 Inch"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro 12.9 Inch"
        case "iPad7,1", "iPad7,2":                      return "iPad Pro 12.9 Inch 2. Generation"
        case "iPad7,3", "iPad7,4":                      return "iPad Pro 10.5 Inch"
        case "AppleTV5,3":                              return "Apple TV"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }
}


