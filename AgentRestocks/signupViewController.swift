//
//  signupViewController.swift
//  loginPageVC
//
//  Created by apple on 8/16/18.
//  Copyright © 2018 apple. All rights reserved.
//

// http://172.31.0.70/phpmyadmin/adminer.php?server=172.31.0.15&username=dev&db=nm_Actors&select=TwoFactorAuthentication&columns%5B0%5D%5Bfun%5D=&columns%5B0%5D%5Bcol%5D=&where%5B0%5D%5Bcol%5D=&where%5B0%5D%5Bop%5D=%3D&where%5B0%5D%5Bval%5D=&order%5B0%5D=idTwoFactorAuthentication&desc%5B0%5D=1&order%5B01%5D=&limit=50&text_length=100

import UIKit
import Alamofire
import IQKeyboardManagerSwift

class signupViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var lblMblNum: UILabel!
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var imgNMT: UIImageView!
    
    
    @IBOutlet weak var txtMblnum: UITextField!
    
    @IBOutlet weak var lblSignUp: UILabel!
    
    @IBOutlet weak var lblCommunication: UILabel!
    
    @IBOutlet weak var imgInfo: UIImageView!
    
    @IBOutlet weak var btnSign: UIButton!
    
    @IBOutlet weak var lblAlready: UILabel!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet weak var mblView: UIView!
    
    
    @IBOutlet weak var shadowView: UIView!
    
    var timersignup = Timer()

    var Missedcallfeature = String()
    var MissedCalledNumbervalue = String()
    var Identificationtwofactor = NSNumber()
    var Verificationfinalvalue = String()
    
    
    @IBOutlet weak var verifyalertview: UIView!
    
    @IBOutlet weak var alereadyregistered: UIButton!
    @IBOutlet weak var verifytopview: UIView!
    
    var Loginstr = String()

    var coverView = UIView()
    var imageView = UIImageView()
    
    
    @IBOutlet weak var yourmobilenumber: UILabel!
    
    
    @IBOutlet weak var Topheaderimage: UIImageView!
    
    @IBOutlet weak var verfytopview: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        shadowView.layer.shadowOffset = CGSize(width: 0, height: 3)
        shadowView.layer.shadowOpacity = 0.6
        shadowView.layer.shadowRadius = 3.0
        shadowView.layer.shadowColor = UIColor.color3().cgColor

        txtMblnum.delegate = self

     //   self.attributedTextField(textField: txtMblnum)
        
//        txtMblnum.leftViewMode = UITextFieldViewMode.always
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
//        imageView.image = #imageLiteral(resourceName: "mobile_grey-2")
//        txtMblnum.leftView = imageView
//        txtMblnum.useUnderline()
        alereadyregistered.addBordertwo(side:.Top, color:UIColor.bottomnavigationtitile(),width:0.6)
        verifytopview.layer.addBorder(edge:.bottom, color: UIColor.bottomnavigationtitile(), thickness:0.6)
        
      //  IQKeyboardManager.sharedManager().enable = true
        
//        IQKeyboardManager.sharedManager().enableAutoToolbar = false
        

        
        let iconWidthlogin = 20;
        let iconHeightLogin = 20;
        let imageViewlogin = UIImageView()
        let imageEmailLogin = UIImage(named:"mobile_grey-2")
        imageViewlogin.image = imageEmailLogin
        imageViewlogin.frame = CGRect(x:0, y:10, width: iconWidthlogin, height: iconHeightLogin)
        let paddingViewLogin = UIView(frame: CGRect(x: 0, y: 0, width:30, height: self.txtMblnum.frame.size.height))
        txtMblnum.leftViewMode = UITextFieldViewMode.always
        txtMblnum.addSubview(imageViewlogin)
        txtMblnum.leftView = paddingViewLogin
        txtMblnum.useUnderline()
        txtMblnum.tintColor = .black

        
        
        IQKeyboardManager.sharedManager().shouldShowTextFieldPlaceholder = false
        
        txtMblnum.keyboardType = .numberPad
        
        
        let singupHeadervalue = UITapGestureRecognizer(target: self, action: #selector(self.handlenumberimagevalue(_:)))
        
        verfytopview.addGestureRecognizer(singupHeadervalue)
        
        verfytopview.isUserInteractionEnabled = true

    }
   @objc func handlenumberimagevalue(_ sender: UITapGestureRecognizer)
   {
    let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BackalertViewController") as! BackalertViewController
    self.addChildViewController(popOverVC)
    popOverVC.view.frame = self.view.frame
    self.view.addSubview(popOverVC.view)
    popOverVC.didMove(toParentViewController: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Editchanged(_ sender: UITextField) {
        self.lblMblNum.isHidden = true
        self.verifyalertview.isHidden = true

    }
    
    
    
    func signuppage()
    {
        
        DispatchQueue.main.async {
            self.showSpinner()
            
        }
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        //   let postString = "method=landingPage&userid=511111117"
        
        let postString =  String(format: "method=%@&mobilenumber=%@&logintype=%@&appios=%@","checkAgentMobileNo",txtMblnum.text!,"4","1")
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
                        
//                         {
//                            Idtwofactorauthentication = 753;
//                            MissedCallFeature = 1;
//                            "missedcall_number" = 9642866415;
//                            msg = "OTP Sent Successfully";
//                            "msg_flag" = 0;
//                            status = 1;
//                        }
                        
                        
                        if  str2 == "1"
                        {
                           // self.btnSign.isUserInteractionEnabled = false

                            
                            
                            let msgvalue  = dict.value(forKey:"msg")as!String
                            print(msgvalue)
                            
                            self.Missedcallfeature  = dict.value(forKey:"MissedCallFeature")as!String
                            self.MissedCalledNumbervalue  = dict.value(forKey:"missedcall_number")as!String
                            self.Identificationtwofactor  = dict.value(forKey:"Idtwofactorauthentication")as!NSNumber

                            self.yourmobilenumber.text = msgvalue
                            let defaults = UserDefaults.standard
                            defaults.set(self.txtMblnum.text!, forKey: "Mymobilenumbervalue")
                             defaults.set( self.Missedcallfeature, forKey: "Mymissedcallfeature")
                            
                              defaults.set(self.MissedCalledNumbervalue, forKey: "MyMissedCalledNumbervalue")
                            defaults.synchronize()
                            

                    // self.Verificationfinalvalue = "1"
                            
                            let RegisterOTPVerification = self.storyboard?.instantiateViewController(withIdentifier:"RegisterOTPVerificationViewController")as!RegisterOTPVerificationViewController
                            RegisterOTPVerification.MobileStringfinalValue = self.txtMblnum.text!
                            RegisterOTPVerification.Missedcallnumber = self.Missedcallfeature
                            RegisterOTPVerification.MissedCalledNumbervalueotp = self.txtMblnum.text!
                            RegisterOTPVerification.messagefinalvalue = msgvalue
                            RegisterOTPVerification.Missedcallfeaturetwo = self.MissedCalledNumbervalue

                            RegisterOTPVerification.Identificationtwofactorotp = self.Identificationtwofactor
                            self.present(RegisterOTPVerification, animated: true, completion:nil)
                            
                            
                            self.view.makeToast(msgvalue)

//                            self.verifyalertview.isHidden = true
                            
                        }
                        if  str2 == "0"
                        {
                            //self.btnSign.isUserInteractionEnabled = false
                            
                            
                            let msgvalue  = dict.value(forKey:"msg")as!String
                            self.Missedcallfeature  = dict.value(forKey:"MissedCallFeature")as!String

                            self.Verificationfinalvalue = "0"
                            self.yourmobilenumber.text = msgvalue
                            self.verifyalertview.isHidden = false
                            let defaults = UserDefaults.standard
                            defaults.set(self.txtMblnum.text!, forKey: "Mymobilenumbervalue")
                            defaults.set( self.Missedcallfeature, forKey: "Mymissedcallfeature")

                            defaults.synchronize()
                            
                        let loginPageVCViewControllerfinalvalue = self.storyboard?.instantiateViewController(withIdentifier:"loginPageVC")as!loginPageVC
                      loginPageVCViewControllerfinalvalue.demotwovalue = msgvalue
                self.present(loginPageVCViewControllerfinalvalue, animated: true, completion:nil)
                        }
                        if  str2 == "2"
                        {
                            self.btnSign.isUserInteractionEnabled = false
//                            DispatchQueue.main.async {
//                                self.verifyalertview.isHidden = false
//                            }
                            let msgvalue  = dict.value(forKey:"msg")as!String
                            self.Missedcallfeature  = dict.value(forKey:"MissedCallFeature")as!String
                            self.Verificationfinalvalue = "2"
                            self.yourmobilenumber.text = msgvalue
//                            self.timersignup = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.signuptimerAction), userInfo: nil, repeats: false)
                            let defaults = UserDefaults.standard
                            defaults.set(self.txtMblnum.text!, forKey: "Mymobilenumbervalue")
                            defaults.set( self.Missedcallfeature, forKey: "Mymissedcallfeature")
                            defaults.set(self.MissedCalledNumbervalue, forKey: "MyMissedCalledNumbervalue")
                            defaults.synchronize()
                            let RegisterOTPVerification = self.storyboard?.instantiateViewController(withIdentifier:"RegisterOTPVerificationViewController")as!RegisterOTPVerificationViewController
                            RegisterOTPVerification.MobileStringfinalValue = self.txtMblnum.text!
                            RegisterOTPVerification.Missedcallnumber = self.Missedcallfeature
                            RegisterOTPVerification.MissedCalledNumbervalueotp = self.txtMblnum.text!
                            RegisterOTPVerification.Identificationtwofactorotp = self.Identificationtwofactor
                            RegisterOTPVerification.messagefinalvalue = msgvalue
   RegisterOTPVerification.Missedcallfeaturetwo = self.MissedCalledNumbervalue
                            self.present(RegisterOTPVerification, animated: true, completion:nil)
                            
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
    @objc func signuptimerAction() {
        
       
        if Verificationfinalvalue == "2"
        {
             let view = self.storyboard?.instantiateViewController(withIdentifier:"RegisterOTPVerificationViewController")as!RegisterOTPVerificationViewController
            view.MobileStringfinalValue = txtMblnum.text!
            view.Missedcallnumber = Missedcallfeature
            view.MissedCalledNumbervalueotp = txtMblnum.text!
            view.Identificationtwofactorotp = self.Identificationtwofactor
            
            print(self.Identificationtwofactor)
            
            self.present(view, animated:true, completion:nil)

        }
         if Verificationfinalvalue == "0"
         {
    
             let view = self.storyboard?.instantiateViewController(withIdentifier:"RegisterOTPVerificationViewController")as!loginPageVC
        }
     

        
        
    }
    
    
    @IBAction func ButtonLogin(_ sender: UIButton)
    {
        let loginPageVCvalue = self.storyboard?.instantiateViewController(withIdentifier:"loginPageVC")as! loginPageVC
        self.present(loginPageVCvalue, animated: true, completion:nil)
    }
    
    
    
    
    
    @IBAction func AlredayRegistered(_ sender: UIButton)
    {
        print(self.Verificationfinalvalue)
        
        if self.Verificationfinalvalue == "2"
        {
            let RegisterOTPVerification = self.storyboard?.instantiateViewController(withIdentifier:"RegisterOTPVerificationViewController")as!RegisterOTPVerificationViewController
            RegisterOTPVerification.MobileStringfinalValue = txtMblnum.text!
            RegisterOTPVerification.Missedcallnumber = Missedcallfeature
            RegisterOTPVerification.MissedCalledNumbervalueotp = txtMblnum.text!
            RegisterOTPVerification.Identificationtwofactorotp = self.Identificationtwofactor
            self.present(RegisterOTPVerification, animated: true, completion:nil)
        }
        if self.Verificationfinalvalue == "0"
        {
            let loginPageVCfinalvalue = self.storyboard?.instantiateViewController(withIdentifier:"loginPageVC")as!loginPageVC
            self.present(loginPageVCfinalvalue, animated: true, completion:nil)
        }
        if self.Verificationfinalvalue == "1"
        {
            let RegisterOTPVerification = self.storyboard?.instantiateViewController(withIdentifier:"RegisterOTPVerificationViewController")as!RegisterOTPVerificationViewController
            RegisterOTPVerification.MobileStringfinalValue = txtMblnum.text!
            RegisterOTPVerification.Missedcallnumber = Missedcallfeature
            RegisterOTPVerification.MissedCalledNumbervalueotp = txtMblnum.text!
            RegisterOTPVerification.Identificationtwofactorotp = self.Identificationtwofactor
            self.present(RegisterOTPVerification, animated: true, completion:nil)
        }
 
    }
    
    @IBAction func ButtonCancel(_ sender: UIButton)
    {
        let finalvalue = self.storyboard?.instantiateViewController(withIdentifier:"OwnerDetailsStepViewController")as!OwnerDetailsStepViewController
        self.present(finalvalue, animated: true, completion:nil)
    }
    
    
    
    @IBAction func btnSign(_ sender: UIButton)
    {
    
        let defaults = UserDefaults.standard
        defaults.set(txtMblnum.text, forKey:"Mymobilenumber")
        defaults.synchronize()
        
            if (txtMblnum.text?.underestimatedCount)! < 10
            {
//                lblMblNum.isHidden = false
                
                let isValid = isValidPhone(phone: txtMblnum.text!)
                if isValid == true{
                    lblMblNum.isHidden = true
                }else{
                    lblMblNum.text = "Enter Valid Mobile Number"
                    lblMblNum.textColor = UIColor.red
                    lblMblNum.isHidden = false
                }
                
                
                lblMblNum.textColor = UIColor.red

//                lblMblNum.text = "Please enter correct mobile number"
                let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
                popOverVC.alertTitleString = "Error"
                popOverVC.alertMessageString = "please enter valid 10 digit mobile number" as NSString
                self.addChildViewController(popOverVC)
                popOverVC.view.frame = self.view.frame
                self.view.addSubview(popOverVC.view)
                popOverVC.didMove(toParentViewController: self)
            }
            if (txtMblnum.text?.underestimatedCount) == 10
            {
//                self.txtMblnum.becomeFirstResponder()

                let isValid = isValidPhone(phone: txtMblnum.text!)
                if isValid == true{
                    lblMblNum.isHidden = true
                    self.verifyalertview.isHidden = true
//                    IQKeyboardManager.sharedManager().enable = false
//                    IQKeyboardManager.sharedManager().enableAutoToolbar = false
//                    IQKeyboardManager.sharedManager().shouldShowToolbarPlaceholder = true
                    self.signuppage()

                }else{
                    lblMblNum.text = "Enter Valid Mobile Number"
                    lblMblNum.textColor = UIColor.red
                    lblMblNum.isHidden = false
                }
                
                
                
            }
            
            if (txtMblnum.text?.underestimatedCount)! > 10
            {
//                lblMblNum.isHidden = false
//                lblMblNum.textColor = UIColor.red
//                lblMblNum.text = "Please enter correct mobile number"
                let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
                popOverVC.alertTitleString = "Error"
                popOverVC.alertMessageString = "please enter valid 10 digit mobile number" as NSString
                self.addChildViewController(popOverVC)
                popOverVC.view.frame = self.view.frame
                self.view.addSubview(popOverVC.view)
                popOverVC.didMove(toParentViewController: self)
            }
            
       
}

//    func textFieldDidBeginEditing(_ textField: UITextField)
//{
//    if textField == txtMblnum
//    {
//        if (textField.text?.count)! > 0
//        {
//            lblMblNum.text = "Please enter correct mobile number"
//
//            if (textField.text?.underestimatedCount)! < 10{
////                lblMblNum.text = "Please enter correct mobile number"
//                let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
//                
//                self.addChildViewController(popOverVC)
//                popOverVC.view.frame = self.view.frame
//                self.view.addSubview(popOverVC.view)
//                popOverVC.didMove(toParentViewController: self)
//            }
//            if (textField.text?.underestimatedCount) == 10{
//                lblMblNum.isHidden = true
//                
//                let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NoInternetViewcontroller") as! NoInternetViewcontroller
////
////                self.addChildViewController(popOverVC)
////                popOverVC.view.frame = self.view.frame
////                self.view.addSubview(popOverVC.view)
////                popOverVC.didMove(toParentViewController: self)
//                
//                popOverVC.view.removeFromSuperview()
//                popOverVC.removeFromParentViewController()
//            }
//            
//            if (textField.text?.underestimatedCount)! > 10 {
//                //lblMblNum.text = "Please enter Valid Mobile Number"
//                let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
//                
//                self.addChildViewController(popOverVC)
//                popOverVC.view.frame = self.view.frame
//                self.view.addSubview(popOverVC.view)
//                popOverVC.didMove(toParentViewController: self)
//            }
//        }
//        
//    }
//   
//}
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        txtMblnum.resignFirstResponder()
        return true
    }
    
    @IBAction func Cancelbutton(_ sender: UIButton)
    {
        DispatchQueue.main.async {
            self.verifyalertview.isHidden = true
        }
    }
    func isValidPhone(phone: String) -> Bool {
        let phoneNumberRegex = "^[6-9]\\d{9}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        let isValidPhone = phoneTest.evaluate(with: phone)
        return isValidPhone
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var result = true

        if textField == txtMblnum {
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
       return result
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
//        self.btnSign.isUserInteractionEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.verifyalertview.isHidden  = true
    }

}
