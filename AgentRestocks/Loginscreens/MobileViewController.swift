//
//  MobileViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 28/01/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class MobileViewController: UIViewController,UITextFieldDelegate
{
    @IBOutlet weak var Continuebutton: UIButton!
    @IBOutlet weak var mobiletextfield: UITextField!
    @IBOutlet weak var mybackbuttonfinalavlue: UIButton!
    @IBOutlet weak var shadowView: UIView!
    
    var coverView = UIView()
    var imageView = UIImageView()
    var timersignup = Timer()
    
    var Missedcallfeature = String()
    var MissedCalledNumbervalue = String()
    var Identificationtwofactor = NSNumber()
    var Verificationfinalvalue = String()
    
    @IBOutlet weak var mobileview: UIView!
    @IBOutlet weak var landlineview: UIView!
    @IBOutlet weak var mobilebutton: UIButton!
    
    @IBOutlet weak var landlinebutton: UIButton!
    
    
    @IBOutlet weak var mobilelabel: UILabel!
    
    @IBOutlet weak var landlinealbel: UILabel!
    
    
    @IBOutlet weak var Mymobilenumber: UILabel!
    
    var clickedfinalvalue = String()
    var typestringfinalavalue = String()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        shadowView.layer.shadowOffset = CGSize(width: 0, height: 3)
        shadowView.layer.shadowOpacity = 0.6
        shadowView.layer.shadowRadius = 3.0
        shadowView.layer.shadowColor = UIColor.color2().cgColor
        
        mobiletextfield.delegate = self
        mobiletextfield.MobileuseUnderline()
        mobiletextfield.setLeftPaddingPoints(29)
        
        Continuebutton.layer.cornerRadius = 30
        Continuebutton.clipsToBounds = true
        
//        mobiletextfield.addTarget(self, action: #selector(myTargetFunction), for: UIControlEvents.touchDown)
    mobiletextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        mobiletextfield.keyboardType = .numberPad
        
        let tapTwo = UITapGestureRecognizer(target: self, action: #selector(self.MobilehandleTaptwo(_:)))
        
        mobilelabel.addGestureRecognizer(tapTwo)
        
        mobilelabel.isUserInteractionEnabled = true
        
        
        let tapThree = UITapGestureRecognizer(target: self, action: #selector(self.MobilehandleTapthree(_:)))
        
        landlinealbel.addGestureRecognizer(tapThree)
        
        landlinealbel.isUserInteractionEnabled = true
        
//        @IBOutlet weak var mobilelabel: UILabel!
//
//        @IBOutlet weak var landlinealbel: UILabel!
        typestringfinalavalue = "Mobile"
        
    }
    @objc func MobilehandleTaptwo(_ sender: UITapGestureRecognizer)
    {
        typestringfinalavalue = "Mobile"

        mobilebutton.setBackgroundImage(#imageLiteral(resourceName: "Radioon"), for:.normal)
        landlinebutton.setBackgroundImage(#imageLiteral(resourceName: "Radiooff"), for:.normal)
        clickedfinalvalue = "1"
        
    }
    
    @objc func MobilehandleTapthree(_ sender: UITapGestureRecognizer)
    {
        typestringfinalavalue = "Landline"

        landlinebutton.setBackgroundImage(#imageLiteral(resourceName: "Radioon"), for:.normal)
        mobilebutton.setBackgroundImage(#imageLiteral(resourceName: "Radiooff"), for:.normal)
        clickedfinalvalue = "2"

    }
    @objc func textFieldDidChange(_ textField: UITextField)
    {
        print(typestringfinalavalue)
        
        if typestringfinalavalue == "Mobile"
        {
            print(mobiletextfield.text?.count as Any)
            
            if mobiletextfield.text?.count == 10
            {
                Continuebutton.isUserInteractionEnabled = true
                Continuebutton.backgroundColor = UIColor.buttonbackgroundcolor()
                Mymobilenumber.text = "Mobile Number"
//                Mymobilenumber.textColor = UIColor.black
                Mymobilenumber.isHidden = false
            }
            else
            {
                // Continuebutton.isUserInteractionEnabled = false;
                Continuebutton.backgroundColor = UIColor.buttonbackgroundcolor()
                
                Continuebutton.backgroundColor = UIColor.anotherbuttonbackgroundcolor()
                
                Mymobilenumber.text = "Mobile Number"
//                Mymobilenumber.textColor = UIColor.black
                Mymobilenumber.isHidden = false
            }
        }
        else
        {
            print(mobiletextfield.text?.count as Any)
            
            if mobiletextfield.text?.count == 13
            {
                Continuebutton.isUserInteractionEnabled = true
                Continuebutton.backgroundColor = UIColor.buttonbackgroundcolor()
                Mymobilenumber.text = "Mobile Number"
                Mymobilenumber.textColor = UIColor.black
                Mymobilenumber.isHidden = false
            }
            else
            {
                // Continuebutton.isUserInteractionEnabled = false;
                Continuebutton.backgroundColor = UIColor.buttonbackgroundcolor()
                
                Continuebutton.backgroundColor = UIColor.anotherbuttonbackgroundcolor()
                
                Mymobilenumber.text = "Mobile Number"
                Mymobilenumber.textColor = UIColor.black
                Mymobilenumber.isHidden = false
            }
        }
        
    }
//    @objc func myTargetFunction(textField: UITextField) {
//

//    }
    @IBAction func Mybackbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    
    @IBAction func Mycontinuebutton(_ sender: UIButton)
    {
        
        
        if typestringfinalavalue == "Mobile"
        {
            let defaults = UserDefaults.standard
            defaults.set(mobiletextfield.text, forKey:"Mymobilenumber")
            defaults.synchronize()
            
            if (mobiletextfield.text?.underestimatedCount)! < 10
            {
                let isValid = isValidPhone(phone: mobiletextfield.text!)
                if isValid == true
                {
                    Mymobilenumber.text = "Mobile Number"
                    Mymobilenumber.textColor = UIColor.red
                    Mymobilenumber.isHidden = false
                    
                }else{
                    Mymobilenumber.text = "Enter Valid Mobile Number"
                    Mymobilenumber.textColor = UIColor.red
                    Mymobilenumber.isHidden = false
                }
                
            }
            if (mobiletextfield.text?.underestimatedCount) == 10
            {
                let isValid = isValidPhone(phone: mobiletextfield.text!)
                if isValid == true
                {
                    self.signuppage()
                }
                else
                {
                    let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
                    popOverVC.alertTitleString = "Error"
                    popOverVC.alertMessageString = "please enter valid 10 digit mobile number" as NSString
                    self.addChildViewController(popOverVC)
                    popOverVC.view.frame = self.view.frame
                    self.view.addSubview(popOverVC.view)
                    popOverVC.didMove(toParentViewController: self)
                }
            }
        }
      
        if typestringfinalavalue == "Landline"
        {
            let defaults = UserDefaults.standard
            defaults.set(mobiletextfield.text, forKey:"Mymobilenumber")
            defaults.synchronize()
            
            if (mobiletextfield.text?.underestimatedCount)! < 13
            {
               
                    Mymobilenumber.text = "Enter Valid Landline Number"
                    Mymobilenumber.textColor = UIColor.red
                    Mymobilenumber.isHidden = false
               
            }
            if (mobiletextfield.text?.underestimatedCount) == 13
            {
                    self.signuppage()
            }
        }
        
      
    }
    func isValidPhone(phone: String) -> Bool
    {
        let phoneNumberRegex = "^[6-9]\\d{9}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        let isValidPhone = phoneTest.evaluate(with: phone)
        return isValidPhone
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
         let result = true
        if textField == mobiletextfield
        {
            
           if  self.typestringfinalavalue == "Mobile"
           {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")
            let characterSet = CharacterSet(charactersIn: string)
            //            return allowedCharacters.isSuperset(of: characterSet)
            
            let maxLength = 10
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            //            return newString.length <= maxLength
            
            return allowedCharacters.isSuperset(of: characterSet) && newString.length <= maxLength
            }
           else{
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")
            let characterSet = CharacterSet(charactersIn: string)
            //            return allowedCharacters.isSuperset(of: characterSet)
            
            let maxLength = 13
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            //            return newString.length <= maxLength
            
            return allowedCharacters.isSuperset(of: characterSet) && newString.length <= maxLength
            }
         
        }
        return result
    }
    func signuppage()
    {
        
        DispatchQueue.main.async {
            self.showSpinner()
            
        }
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        //   let postString = "method=landingPage&userid=511111117"
        
        let postString =  String(format: "method=%@&mobilenumber=%@&logintype=%@&appios=%@&type=%@","checkAgentMobileNo",self.mobiletextfield.text!,"4","1",typestringfinalavalue)
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
                     
                        if  str2 == "1"
                        {
                            
                            if self.typestringfinalavalue == "Mobile"
                            {
                                let msgvalue  = dict.value(forKey:"msg")as!String
                                print(msgvalue)
                                self.Missedcallfeature  = dict.value(forKey:"MissedCallFeature")as!String
                                self.MissedCalledNumbervalue  = dict.value(forKey:"missedcall_number")as!String
                                self.Identificationtwofactor  = dict.value(forKey:"Idtwofactorauthentication")as!NSNumber
                                let defaults = UserDefaults.standard
                                defaults.set(self.mobiletextfield.text!, forKey: "Mymobilenumbervalue")
                                defaults.set( self.Missedcallfeature, forKey: "Mymissedcallfeature")
                                
                                defaults.set(self.MissedCalledNumbervalue, forKey: "MyMissedCalledNumbervalue")
                                defaults.synchronize()
                                
                                let RegisterOTPVerification = self.storyboard?.instantiateViewController(withIdentifier:"MobileotpViewController")as!MobileotpViewController
                        
                                RegisterOTPVerification.MobileStringfinalValue = self.mobiletextfield.text!
                                RegisterOTPVerification.Missedcallnumber = self.Missedcallfeature
                                RegisterOTPVerification.MissedCalledNumbervalueotp = self.mobiletextfield.text!
                                RegisterOTPVerification.messagefinalvalue = msgvalue
                                RegisterOTPVerification.Missedcallfeaturetwo = self.MissedCalledNumbervalue
                                
                                RegisterOTPVerification.Identificationtwofactorotp = self.Identificationtwofactor
                                self.present(RegisterOTPVerification, animated: true, completion:nil)
                                self.view.makeToast(msgvalue)
                            }
                            
                            else
                            {
                                let msgvalue  = dict.value(forKey:"msg")as!String
                                print(msgvalue)
                                self.Missedcallfeature  = dict.value(forKey:"MissedCallFeature")as!String
                                self.MissedCalledNumbervalue  = dict.value(forKey:"missedcall_number")as!String
                                self.Identificationtwofactor  = dict.value(forKey:"Idtwofactorauthentication")as!NSNumber
                                let defaults = UserDefaults.standard
                                defaults.set(self.mobiletextfield.text!, forKey: "Mymobilenumbervalue")
                                defaults.set( self.Missedcallfeature, forKey: "Mymissedcallfeature")
                                
                                defaults.set(self.MissedCalledNumbervalue, forKey: "MyMissedCalledNumbervalue")
                                defaults.synchronize()
                                
                                let RegisterOTPVerification = self.storyboard?.instantiateViewController(withIdentifier:"LandlineViewController")as!LandlineViewController
                                
                                //                                let RegisterOTPVerification = self.storyboard?.instantiateViewController(withIdentifier:"RegisterOTPVerificationViewController")as!RegisterOTPVerificationViewController
                                
                                RegisterOTPVerification.MobileStringfinalValue = self.mobiletextfield.text!
                                RegisterOTPVerification.Missedcallnumber = self.Missedcallfeature
                                RegisterOTPVerification.MissedCalledNumbervalueotp = self.mobiletextfield.text!
                                RegisterOTPVerification.messagefinalvalue = msgvalue
                                RegisterOTPVerification.Missedcallfeaturetwo = self.MissedCalledNumbervalue
                                
                                RegisterOTPVerification.Identificationtwofactorotp = self.Identificationtwofactor
                                self.present(RegisterOTPVerification, animated: true, completion:nil)
                                self.view.makeToast(msgvalue)
                            }
                        }
                        if  str2 == "0"
                        {
                            let msgvalue  = dict.value(forKey:"msg")as!String
                            self.view.makeToast(msgvalue)
                            if let Misseedcallvaluetotalis:String = dict.value(forKey:"MissedCallFeature") as? String
                            {
                                if Misseedcallvaluetotalis.count > 0
                                {
                                    self.Missedcallfeature  = dict.value(forKey:"MissedCallFeature")as!String
                                    self.Verificationfinalvalue = "0"
                                    
                                    let defaults = UserDefaults.standard
                                    defaults.set(self.mobiletextfield.text!, forKey: "Mymobilenumbervalue")
                                    defaults.set( self.Missedcallfeature, forKey: "Mymissedcallfeature")
                                    defaults.synchronize()
                                    
                                    let loginPageVCViewControllerfinalvalue = self.storyboard?.instantiateViewController(withIdentifier:"loginPageVC")as!loginPageVC
                                    loginPageVCViewControllerfinalvalue.demotwovalue = msgvalue
                                    self.present(loginPageVCViewControllerfinalvalue, animated: true, completion:nil)
                                }
                              
                            }
                           
                        }
                        if  str2 == "2"
                        {
                            if self.typestringfinalavalue == "Mobile"
                            {
                                self.Continuebutton.isUserInteractionEnabled = false
                                let msgvalue  = dict.value(forKey:"msg")as!String
                                self.Missedcallfeature  = dict.value(forKey:"MissedCallFeature")as!String
                                self.Verificationfinalvalue = "2"
                                //                            self.yourmobilenumber.text = msgvalue
                                let defaults = UserDefaults.standard
                                defaults.set(self.mobiletextfield.text!, forKey: "Mymobilenumbervalue")
                                defaults.set( self.Missedcallfeature, forKey: "Mymissedcallfeature")
                                defaults.set(self.MissedCalledNumbervalue, forKey: "MyMissedCalledNumbervalue")
                                defaults.synchronize()
                                let RegisterOTPVerification = self.storyboard?.instantiateViewController(withIdentifier:"MobileotpViewController")as!MobileotpViewController
                                
                                RegisterOTPVerification.MobileStringfinalValue = self.mobiletextfield.text!
                                RegisterOTPVerification.Missedcallnumber = self.Missedcallfeature
                                RegisterOTPVerification.MissedCalledNumbervalueotp = self.mobiletextfield.text!
                                RegisterOTPVerification.Identificationtwofactorotp = self.Identificationtwofactor
                                RegisterOTPVerification.messagefinalvalue = msgvalue
                                RegisterOTPVerification.Missedcallfeaturetwo = self.MissedCalledNumbervalue
                                self.present(RegisterOTPVerification, animated: true, completion:nil)
                                
                                self.view.makeToast(msgvalue)
                                
                            }
                            
                        
                            else
                            {
                                self.Continuebutton.isUserInteractionEnabled = false
                                let msgvalue  = dict.value(forKey:"msg")as!String
                                self.Missedcallfeature  = dict.value(forKey:"MissedCallFeature")as!String
                                self.Verificationfinalvalue = "2"
                                //                            self.yourmobilenumber.text = msgvalue
                                let defaults = UserDefaults.standard
                                defaults.set(self.mobiletextfield.text!, forKey: "Mymobilenumbervalue")
                                defaults.set( self.Missedcallfeature, forKey: "Mymissedcallfeature")
                                defaults.set(self.MissedCalledNumbervalue, forKey: "MyMissedCalledNumbervalue")
                                defaults.synchronize()
                                let RegisterOTPVerification = self.storyboard?.instantiateViewController(withIdentifier:"LandlineViewController")as!LandlineViewController
                                
                                RegisterOTPVerification.MobileStringfinalValue = self.mobiletextfield.text!
                                RegisterOTPVerification.Missedcallnumber = self.Missedcallfeature
                                RegisterOTPVerification.MissedCalledNumbervalueotp = self.mobiletextfield.text!
                                RegisterOTPVerification.Identificationtwofactorotp = self.Identificationtwofactor
                                RegisterOTPVerification.messagefinalvalue = msgvalue
                                RegisterOTPVerification.Missedcallfeaturetwo = self.MissedCalledNumbervalue
                                self.present(RegisterOTPVerification, animated: true, completion:nil)
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
        //        self.btnSign.isUserInteractionEnabled = true
    }
    
    
    @IBAction func Mobilebutton(_ sender: UIButton)
    {
        typestringfinalavalue = "Mobile"
        mobilebutton.setBackgroundImage(#imageLiteral(resourceName: "Radioon"), for:.normal)
        landlinebutton.setBackgroundImage(#imageLiteral(resourceName: "Radiooff"), for:.normal)
        clickedfinalvalue = "1"

    }
    @IBAction func Landlinebutton(_ sender: UIButton)
    {
        typestringfinalavalue = "Landline"
              landlinebutton.setBackgroundImage(#imageLiteral(resourceName: "Radioon"), for:.normal)
        mobilebutton.setBackgroundImage(#imageLiteral(resourceName: "Radiooff"), for:.normal)
        clickedfinalvalue = "2"
    }
 
}
extension UITextField
{
    func MobileuseUnderline()
    {
        let border = CALayer()
        let borderWidth = CGFloat(0.5)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(origin: CGPoint(x: 0,y :self.frame.size.height - borderWidth), size: CGSize(width: self.frame.size.width, height: self.frame.size.height))
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
