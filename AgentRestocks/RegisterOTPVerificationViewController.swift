//
//  RegisterOTPVerificationViewController.swift
//  loginPageVC
//
//  Created by apple on 8/17/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
import Alamofire

class RegisterOTPVerificationViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var lblSuccess: UILabel!
    @IBOutlet weak var verifyAlert: UIView!
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var lblOTPNum: UILabel!
    
    @IBOutlet weak var otpView: UIView!
    
    @IBOutlet weak var lblMobileverify: UILabel!
    
    
    @IBOutlet weak var imgNMT: UIImageView!
    
    @IBOutlet weak var lblNotgetOTP: UILabel!
    @IBOutlet weak var lblConfirm: UILabel!
    
    @IBOutlet weak var verifyOTP: UIButton!
    
    @IBOutlet weak var lblAutomatically: UILabel!
    
    @IBOutlet weak var btnCall: UIButton!
    
    @IBOutlet weak var txtEnterOTP: UITextField!
    
    @IBOutlet weak var imgMbl: UIImageView!
    
    @IBOutlet weak var viewSuccess: UIView!
    var viewOTP = UIView()
    var btnCancel =  UIButton()
    var btnOK = UIButton()
    var lblTitle = UILabel()
    var lblMessage = UILabel()
    var phonecall = String()
    @IBOutlet weak var shadowView: UIView!
     var timerotpfile = Timer()
    @IBOutlet weak var verificationsucessfullview: UIView!
    
    @IBOutlet weak var verificatyionsucessview: UIView!
    
    var coverView = UIView()
    var imageView = UIImageView()
    
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

    
//     defaults.set( self.Missedcallfeature, forKey: "Mymissedcallfeature")
    
    
    var messagefinalvalue = String()
    
    
    @IBOutlet weak var missedcallview: UIView!
    
    
    @IBOutlet weak var missedcalltopview: UIView!
    
    @IBOutlet weak var missedcallmiddelview: UIView!
    
    
    @IBOutlet weak var missedcallbottomview: UIView!
    
    
    
    @IBOutlet weak var headertwo: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

//        headView.layer.shadowOffset = CGSize(width: 0, height: 2)
//        headView.layer.shadowOpacity = 0.3
//        headView.layer.shadowRadius = 1.0
//        headView.layer.borderColor = UIColor.black.cgColor
//        headView.layer.shadowColor = UIColor.black.cgColor
        self.view.makeToast(messagefinalvalue)
   
        txtEnterOTP.delegate = self
        phonecall = "8955595551"
        
//        txtEnterOTP.leftViewMode = UITextFieldViewMode.always
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
//        imageView.image = #imageLiteral(resourceName: "mobiletick")
//        txtEnterOTP.leftView = imageView
//
//        txtEnterOTP.useUnderline()
        
        
        let iconWidthlogin = 20;
        let iconHeightLogin = 20;
        let imageViewlogin = UIImageView()
        let imageEmailLogin = UIImage(named:"mobile_grey-2")
        imageViewlogin.image = imageEmailLogin
        imageViewlogin.frame = CGRect(x:0, y:10, width: iconWidthlogin, height: iconHeightLogin)
        let paddingViewLogin = UIView(frame: CGRect(x: 0, y: 0, width:26, height: self.txtEnterOTP.frame.size.height))
        txtEnterOTP.leftViewMode = UITextFieldViewMode.always
        txtEnterOTP.addSubview(imageViewlogin)
        txtEnterOTP.leftView = paddingViewLogin
        txtEnterOTP.useUnderline()
        txtEnterOTP.tintColor = .black
        
        
        
        
        lblAutomatically.lineBreakMode = NSLineBreakMode.byWordWrapping
        lblAutomatically.numberOfLines = 3
        
        verificationsucessfullview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.4)
        
        verificatyionsucessview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.4)

        lblMobileverify.textColor = UIColor.bottomnavigationtitile()
        
        
        let progressBar = LinearProgressBar()
        self.coverView.addSubview(progressBar)
        
        progressBar.startAnimating()
        
        if Missedcallnumber == "1"
        {
            btnCall.isHidden = false
        }
        
        if sucesssinglfinal == "sucessforgetverifyed" {
            btnCall.isHidden = false
        }
    
        txtEnterOTP.delegate = self
    txtEnterOTP.addTarget(self, action: #selector(RegisterOTPVerificationViewController.textFieldDidChange(_:)), for: .editingChanged)
        txtEnterOTP.keyboardType = .numberPad
     
        let defaults = UserDefaults.standard
        
        if let statusstring:String = defaults.value(forKey:"Mymissedcallfeature")as?String
        {
         self.Missedcallfeaturefinalvalue  = statusstring
        }
    
        let singupHeadervalue = UITapGestureRecognizer(target: self, action: #selector(self.handlenumberimagevalue(_:)))
        headertwo.addGestureRecognizer(singupHeadervalue)
        headertwo.isUserInteractionEnabled = true
        
        
      //  txtEnterOTP.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClickedtwo))
        
      self.missedcallmiddelview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        
        self.missedcallmiddelview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        
        print(self.Missedcallfeaturefinalvalue)
        print(self.Missedcallfeaturetwo)
        
        

    }
    @objc func doneButtonClickedtwo(_ sender: Any)
    {
//        if txtEnterOTP.text?.count == 0
//        {
//            lblOTPNum.text = "enter OTP number"
//            lblOTPNum.textColor = UIColor.red
//            lblOTPNum.isHidden = false
//        }
         if (txtEnterOTP.text?.count)! < 6
        {
//            lblOTPNum.isHidden = false
//            lblOTPNum.text = "enter correct OTP number"
//            lblOTPNum.textColor = UIColor.red
            
                                            let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
                                            popOverVC.alertMessageString = "Error"
                                            popOverVC.alertTitleString = "please enter OTP"
                                            self.addChildViewController(popOverVC)
                                            popOverVC.view.frame = self.view.frame
                                            self.view.addSubview(popOverVC.view)
                                            popOverVC.didMove(toParentViewController: self)
            
            
        }
        else if (txtEnterOTP.text?.count)! > 6
        {
            lblOTPNum.isHidden = false
            lblOTPNum.text = "enter correct OTP number"
            lblOTPNum.textColor = UIColor.red
            
            
            
        }else if (txtEnterOTP.text?.count)! == 6
        {
            lblOTPNum.isHidden = true
        }
    }
    
    @objc func handlenumberimagevalue(_ sender: UITapGestureRecognizer)
    {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BackalertViewController") as! BackalertViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }

    @objc func textFieldDidChange(_ textField: UITextField?) {
        
        lblOTPNum.isHidden = true

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: UIButton Actions
    
    
    
    @IBAction func btnVerifyOTP(_ sender: Any)
    {
       
        
        if verfyvalue == "true"
        {
            DispatchQueue.main.async {
                self.MissedcallnumberMethod()
            }
        }
       
        else
        {
         if txtEnterOTP.text?.count == 0
         {
//           self.Verificationfinalvalueotpfinal = "108"
//            let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
//            popOverVC.alertTitleString = ""
//            popOverVC.alertMessageString = "" as NSString
//            popOverVC.alertTitleString = "Error"
//            popOverVC.alertMessageString = "Please enter OTP" as NSString
//            self.addChildViewController(popOverVC)
//            popOverVC.view.frame = self.view.frame
//            self.view.addSubview(popOverVC.view)
//            popOverVC.didMove(toParentViewController: self)
            
            self.verifyAlert.isHidden = false
            self.lblSuccess.isHidden = false
            self.lblMobileverify.isHidden = false
            self.lblSuccess.textAlignment = .center
            self.lblSuccess.text = "Error"
            self.lblMobileverify.text = "Please enter  OTP"
            
           }
           // if ((txtEnterOTP.text?.count)! < 6) ||  ((txtEnterOTP.text?.count)!  0) {

            
             if ((txtEnterOTP.text?.count)! > 1)
            
            {

//                let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
//                popOverVC.alertTitleString = ""
//                popOverVC.alertMessageString = "" as NSString
//                popOverVC.alertTitleString = "Error"
//                popOverVC.alertMessageString = "Please enter valid OTP" as NSString
//                self.addChildViewController(popOverVC)
//                popOverVC.view.frame = self.view.frame
//                self.view.addSubview(popOverVC.view)
//                popOverVC.didMove(toParentViewController: self)

//                self.Verificationfinalvalueotpfinal = "108"
                self.verifyAlert.isHidden = false
                self.lblSuccess.isHidden = false
                self.lblMobileverify.isHidden = false
                self.lblSuccess.textAlignment = .center
                self.lblSuccess.text = "Error"
                self.lblMobileverify.text = "Please enter valid OTP"
            }
            if (txtEnterOTP.text?.underestimatedCount)! == 6{
                
//                 let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
//
//                popOverVC.willMove(toParentViewController: nil)
//                popOverVC.view.removeFromSuperview()
//                popOverVC.removeFromParentViewController()
//
               
                
                
                lblOTPNum.isHidden = true
            verifyAlert.isHidden = true
                self.lblSuccess.text = ""
                self.lblMobileverify.text = ""
                if sucesssinglfinal == "sucessforgetverifyed"
                {
                    self.forgetpinmethod()
                }
                else
                {
                        self.otpmethod()
                }
                
                
                
            }
            
            if (txtEnterOTP.text?.underestimatedCount)! > 6 {
//                lblOTPNum.text = "Please enter Valid OTP Number"
//                lblOTPNum.textColor = UIColor.red
//                lblOTPNum.isHidden = false
                let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
                popOverVC.alertTitleString = "Error"
                popOverVC.alertMessageString = "Please enter OTP" as NSString
                self.addChildViewController(popOverVC)
                popOverVC.view.frame = self.view.frame
                self.view.addSubview(popOverVC.view)
                popOverVC.didMove(toParentViewController: self)
            }
        }
     
    }
    
    @IBAction func btnCall(_ sender: Any) {
     
//      MobileStringfinalValue.makeAColl()
        
       
//        DispatchQueue.main.async {
//            self.MissedcallnumberMethod()
//        }
        self.missedcallview.isHidden = false

    }
    func phone(phoneNum: String) {
        if let url = URL(string: "tel://\(phoneNum)") {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                verfyvalue = "true"
            self.verifyOTP.setTitle("VerifiedOTP", for:.normal)
//                self.MissedcallnumberMethod()

            }
            else {
                UIApplication.shared.openURL(url as URL)
                verfyvalue = "false"
                print(verfyvalue)

            }
        }
    }
    
    @IBAction func btnResendOTP(_ sender: UIButton)
    
    {
        self.txtEnterOTP.text = nil
        
        self.txtEnterOTP.resignFirstResponder()
        
        DispatchQueue.main.async {
            self.Verifyotpmethod()
        }
    }

    @IBAction func btnClosed(_ sender: Any)
    {
        verifyAlert.removeFromSuperview()
    }
    
    @IBAction func btnOK(_ sender: Any)
    {
        verifyAlert.removeFromSuperview()
        let OwnerDetailsStep = self.storyboard?.instantiateViewController(withIdentifier: "OwnerDetailsStepViewController") as! OwnerDetailsStepViewController
        OwnerDetailsStep.OwnerMissedCalledNumbervalueotp = self.MissedCalledNumbervalueotp
        self.present(OwnerDetailsStep, animated: true, completion: nil)
    }
   
    
//
//    //MARK: UITextField Delegates
//
//    func attributedTextField(textField: UITextField){
//
//        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: textField.frame.size.height))
//
//        textField.leftView = paddingView
//        textField.leftViewMode = .always
//        textField.addSubview(paddingView)
//
//        let border = CALayer()
//        let width = CGFloat(1.0)
//        border.borderColor = UIColor(red: 217/255, green: 218/255, blue: 218/255, alpha: 1).cgColor
//        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width: textField.frame.size.width, height: textField.frame.size.height)
//
//        border.borderWidth = width
//        textField.layer.addSublayer(border)
//        textField.layer.masksToBounds = true
//    }
//
//
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//
//        textField.keyboardType = UIKeyboardType.numberPad
//
//    }
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if textField == txtEnterOTP
//        {
//            if txtEnterOTP.text?.count == 0
//            {
//                lblOTPNum.text = "Please enter OTP number"
//                lblOTPNum.textColor = UIColor.red
//            }
//            else if (txtEnterOTP.text?.count)! < 6
//            {
//                lblOTPNum.text = "Please enter correct OTP number"
//                lblOTPNum.textColor = UIColor.red
//            }
//            else if (txtEnterOTP.text?.count)! > 6
//            {
//                lblOTPNum.text = "Please enter correct OTP number"
//                lblOTPNum.textColor = UIColor.red
//            }else if (txtEnterOTP.text?.count)! == 6
//            {
//                lblOTPNum.isHidden = true
//            }
//            
//        }
//        
//    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        var result = true
        
        if textField == txtEnterOTP {
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
func otpmethod()
    {
//         self.showSpinner()
    var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
    request.httpMethod = "POST"
    //   let postString = "method=landingPage&userid=511111117"
  //  let postString =  String(format: "method=%@&otp=%@&logintype=%@","verifyOTP",txtEnterOTP.text!,"4")
        
        let postString =  String(format: "method=%@&mobilenumber=%@&otp=%@&logintype=%@","verifyOTP",MobileStringfinalValue,txtEnterOTP.text!,"4")

        
       // mobilenumber
    request.httpBody = postString.data(using: .utf8)
    request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
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
      self.verifyAlert.isHidden = true
        self.lblSuccess.text = "Verification  Failure"
        self.lblMobileverify.text = msgvalue
//        self.Verificationfinalvalueotpfinal = "0"
        
        //                 let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
        //
        //                popOverVC.willMove(toParentViewController: nil)
        //                popOverVC.view.removeFromSuperview()
        //                popOverVC.removeFromParentViewController()
        //
//        let alert = AlertViewController()
//
//        alert.willMove(toParentViewController: nil)
//        alert.view.removeFromSuperview()
//        alert.removeFromParentViewController()
     self.view.makeToast(msgvalue)

    }
        if str2 == "1"
        {
        let msgvalue  = dict.value(forKey:"msg")as!String
//        self.verifyAlert.isHidden = false
            self.verifyAlert.isHidden = true
            self.lblSuccess.text = "Verification successful"
            self.lblMobileverify.text = msgvalue
//            self.Verificationfinalvalueotpfinal = "1"
//            self.view.makeToast(msgvalue)

            DispatchQueue.main.async {
                let RegisterOTPVerification = self.storyboard?.instantiateViewController(withIdentifier:"OwnerDetailsStepViewController")as!OwnerDetailsStepViewController
                RegisterOTPVerification.OwnerMissedCalledNumbervalueotp = self.MobileStringfinalValue
                RegisterOTPVerification.Messagestringfinalvalue = msgvalue
                self.present(RegisterOTPVerification, animated:true, completion:nil)
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
    
    
    
    func Verifyotpmethod()
    {
//        self.showSpinner()
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let postString =  String(format: "method=%@&mobilenumber=%@","resendOTPforVerify",MobileStringfinalValue)
       // 680590
        print(postString)
        
        request.httpBody = postString.data(using: .utf8)
        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                print(response.result)
                
                
                self.removeSpinner()
                
                ///{"msg_flag":0,"status":1,"msg":"OTP Sent Successfully","Idtwofactorauthentication":756,"missedcall_number":"9642866415","MissedCallFeature":"1"}
                
                
                
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
                            
                           // self.view.makeToast(msgvalue)

                            DispatchQueue.main.async {
//                                self.verifyAlert.isHidden = false
//                                self.timerotpfile = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.OTPtimerAction), userInfo: nil, repeats: false)
//
//                                SUCCESS
//                                    {
//                                        msg = "Resend-OTP successfully sent to the mobile number";
//                                        status = 2;
//                                }
                                
//                                msg = "Resend-OTP successfully sent to the mobile number";
//                                status = 2;
                                
                                
                                self.view.makeToast(msgvalue)
                                
//                                let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
//                                popOverVC.alertMessageString = msgvalue as NSString
//                                popOverVC.alertTitleString = "Verification Sucessfull"
//                                self.addChildViewController(popOverVC)
//                                popOverVC.view.frame = self.view.frame
//                                self.view.addSubview(popOverVC.view)
//                                popOverVC.didMove(toParentViewController: self)
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
    func MissedcallnumberMethod()
    {
//        self.showSpinner()

        print(MobileStringfinalValue)
        print(Identificationtwofactorotp)
        let IDentificationNumbervalue:String = String(format:"%d",Identificationtwofactorotp)

        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let postString =  String(format: "method=%@&mobilenumber=%@&otp=%@&Idtwofactorauth=%@& &logintype=%@","getMissedCallStatus",MobileStringfinalValue,"XXXXXX",IDentificationNumbervalue,"4")
     
        request.httpBody = postString.data(using: .utf8)
        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
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
                            self.verifyAlert.isHidden = false
                            self.lblSuccess.text = "Verification successful"
                            self.lblMobileverify.text = msgvalue
                            self.Verificationfinalvalueotpfinal = "1"
                            DispatchQueue.main.async {
                                let RegisterOTPVerification = self.storyboard?.instantiateViewController(withIdentifier:"OwnerDetailsStepViewController")as!OwnerDetailsStepViewController
                                RegisterOTPVerification.OwnerMissedCalledNumbervalueotp = self.MobileStringfinalValue
                                RegisterOTPVerification.Messagestringfinalvalue = msgvalue
                                self.present(RegisterOTPVerification, animated:true, completion:nil)
                            }
                        }
                        if  str2 == "0"
                        {
                            let msgvalue  = dict.value(forKey:"msg")as!String
                            self.verifyAlert.isHidden = false

                            self.lblSuccess.text = "Verification failure"
                            self.lblMobileverify.text = msgvalue
                            self.Verificationfinalvalueotpfinal = "0"

                        }
                     
                    }
                    
                }
                break
            case .failure(_):
                break
            }
            
            
            
        }
        
    }
    func VerifynumberMethod()
    {
//        self.showSpinner()
      
        let IDentificationNumbervalue:String = String(format:"%d",Identificationtwofactorotp)
        
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let postString =  String(format: "method=%@&mobilenumber=%@&otp=%@&logintype=%@","verifyOTP",MobileStringfinalValue,"XXXXXX","4")
        request.httpBody = postString.data(using: .utf8)
        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                print(response.result)
                
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
                            
                        //    self.view.makeToast(msgvalue)
                            self.Verificationfinalvalueotpfinal = "3"

                            DispatchQueue.main.async {
                                self.verifyAlert.isHidden = false
                                //self.timerotpfile = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.OTPtimerAction), userInfo: nil, repeats: false)
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
    func forgetpinmethod()
    {
//        self.showSpinner()
     
        let textenterfinalvaluefinal = txtEnterOTP.text
        let defaultssingelvalue = UserDefaults.standard
        defaultssingelvalue.set(textenterfinalvaluefinal, forKey:"textenterotpfinalvalue")
        defaultssingelvalue.synchronize()
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let postString =  String(format: "method=%@&mobilenumber=%@&otp=%@&logintype=%@","verifyResetPinOTP",Mobilenumbervalueforgetpassword,textenterfinalvaluefinal!,"4")
        print(postString)
        request.httpBody = postString.data(using: .utf8)
        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
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
                            
                            //    self.view.makeToast(msgvalue)
//                            self.Verificationfinalvalueotpfinal = "4"
                            self.lblSuccess.text = "Verification Failure"
                            self.lblMobileverify.text = msgvalue

                            DispatchQueue.main.async {
                                self.verifyAlert.isHidden = false
                                //self.timerotpfile = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.OTPtimerAction), userInfo: nil, repeats: false)
                            }
                            let defaultssingelvalue = UserDefaults.standard
                            defaultssingelvalue.set(self.txtEnterOTP.text!, forKey:"textenterotpfinalvalue")
                            defaultssingelvalue.synchronize()
                        }
                        if  str2 == "1"
                        {
                            let msgvalue  = dict.value(forKey:"msg")as!String
                            
                            //    self.view.makeToast(msgvalue)
//                            self.Verificationfinalvalueotpfinal = "4"
                            DispatchQueue.main.async {
//                                self.verifyAlert.isHidden = false
        
                                self.lblSuccess.text = "Verification Successfully"
                                self.lblMobileverify.text = msgvalue
                                
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
        self.verifyAlert.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(imageView)
    }
    func removeSpinner(){
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()
        
    }
    
    @objc func OTPtimerAction() {
        
        let view = self.storyboard?.instantiateViewController(withIdentifier:"RegisterOTPVerificationViewController")as!RegisterOTPVerificationViewController
        self.present(view, animated:true, completion:nil)
    }
    
    @IBAction func okotpveryview(_ sender: UIButton)
    {
        print(self.Verificationfinalvalueotpfinal)
        self.removeSpinner()

        verifyAlert.isHidden = true
        
        
//        if self.Verificationfinalvalueotpfinal == "0"
//        {
//            verifyAlert.isHidden = true
//            self.removeSpinner()
//
//        }
//        if self.Verificationfinalvalueotpfinal == "1"
//        {
//            self.removeSpinner()
//
//            verifyAlert.isHidden = false
//
//            DispatchQueue.main.async {
//                let RegisterOTPVerification = self.storyboard?.instantiateViewController(withIdentifier:"OwnerDetailsStepViewController")as!OwnerDetailsStepViewController
//             RegisterOTPVerification.OwnerMissedCalledNumbervalueotp = self.MobileStringfinalValue
//                self.present(RegisterOTPVerification, animated:true, completion:nil)
//              //  965105
//            }
//        }
        if self.Verificationfinalvalueotpfinal == "3"
        {
            
            self.removeSpinner()
            verifyAlert.isHidden = true

        }
        if self.Verificationfinalvalueotpfinal == "4"
        {
            self.removeSpinner()

            verifyAlert.isHidden = true
            DispatchQueue.main.async {
                let ResetpinViewController = self.storyboard?.instantiateViewController(withIdentifier:"ResetpinViewController")as!ResetpinViewController
                self.present(ResetpinViewController, animated:true, completion:nil)
                //  965105
            }
            
        }
        if self.Verificationfinalvalueotpfinal == "108"
        {
            self.removeSpinner()
            verifyAlert.isHidden = true
        }

    }
    
    @IBAction func buttonclosefinal(_ sender: UIButton)

    {
        DispatchQueue.main.async {
            self.verifyAlert.isHidden = true
        }

    }
    
    @IBAction func myregisterbutton(_ sender: UIButton)
    {
        DispatchQueue.main.async {
            self.verifyAlert.isHidden = true
        }
    }
    
    @IBAction func YESBUTTON(_ sender: UIButton)
    {
        self.missedcallview.isHidden = true
        
        phone(phoneNum:Missedcallfeaturetwo)


    }
    
    @IBAction func NOBUTTON(_ sender: UIButton)
    {
        self.missedcallview.isHidden = true
    }
    
}








