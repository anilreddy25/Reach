//
//  ForgotPasswordVC.swift
//  AgentRestocks
//
//  Created by apple on 9/3/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import Alamofire
import Foundation
import SystemConfiguration
import IQKeyboardManagerSwift

public class ConnectionCheck {
    
    class func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
}
class ForgotPasswordVC: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var popView: UIButton!
    @IBOutlet weak var lblNavBarTitle: UILabel!
    
    @IBOutlet weak var lblMblNum: UILabel!
    @IBOutlet weak var txtMblNumber: UITextField!
    @IBOutlet weak var lblEnterMobileNumber: UILabel!
    @IBOutlet weak var navBarView: UIView!
    @IBOutlet weak var btnSendOTP: UIButton!
    
    var Mobilenumber = String()
    
    @IBOutlet weak var verifyalertview: UIView!
    
    @IBOutlet weak var verifybottomview: UIView!
    
    @IBOutlet weak var veriybottombuttonok: UIButton!
    
    
    @IBOutlet weak var veiryTopview: UIView!
    
     var str2 = String()
    
    @IBOutlet weak var verificationnotregistred: UILabel!
    
    @IBOutlet weak var verificationMobilenumberregistered: UILabel!
    var coverView = UIView()
    var imageView = UIImageView()
    
    var defaultsforgetpassword = UserDefaults.standard
    
    
    var Missedcallfeature = String()
    var MissedCalledNumbervalue = String()
    var Identificationtwofactor = NSNumber()
    var Verificationfinalvalue = String()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        txtMblNumber.delegate = self
        txtMblNumber.useUnderline()
        txtMblNumber.text = Mobilenumber

        navBarView.layer.shadowOffset = CGSize(width: 0, height: 3)
        navBarView.layer.shadowOpacity = 0.6
        navBarView.layer.shadowRadius = 3.0
        navBarView.layer.shadowColor = UIColor.color2().cgColor

        veiryTopview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        veriybottombuttonok.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)

        txtMblNumber.delegate = self
        txtMblNumber.addTarget(self, action: #selector(ForgotPasswordVC.textFieldDidChange(_:)), for: .editingChanged)
        
         txtMblNumber.tintColor = .black
        txtMblNumber.keyboardType = .numberPad
        txtMblNumber.setLeftPaddingPoints(10)
    }
    @objc func textFieldDidChange(_ textField: UITextField?)
    {
    
        if textField == txtMblNumber
        {
            if (txtMblNumber.text?.count)! > 0
            {
                lblMblNum.isHidden = true
                lblMblNum.text = "enter correct mobile number"
                lblMblNum.textColor = UIColor.red
            }
            else{
                lblMblNum.isHidden = false
                lblMblNum.text = "enter correct mobile number"
                lblMblNum.textColor = UIColor.red
            }
        }
    }
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
  
    @IBAction func forgetback(_ sender: UIButton)
    {
self.dismiss(animated:true, completion:nil)
    }
    
    @IBAction func btnSendOTP(_ sender: Any)
    {
        let defaults = UserDefaults.standard
        defaults.set(self.txtMblNumber.text!, forKey:"Mymobilenumbervaluefinal")
        defaults.synchronize()
        
        
        if (txtMblNumber.text?.count)! < 10{
//            lblMblNum.isHidden = false
            let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
            popOverVC.alertTitleString = "Error"
            popOverVC.alertMessageString = "please enter valid 10 digit mobile number" as NSString
            self.addChildViewController(popOverVC)
            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParentViewController: self)
        }
        if (txtMblNumber.text?.count)! == 10
        {
            lblMblNum.isHidden = true

            if ConnectionCheck.isConnectedToNetwork()
            {
                DispatchQueue.main.async {
                    self.setPin()
                    DispatchQueue.main.async {
                        self.showSpinner()
                    }
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
        if (txtMblNumber.text?.underestimatedCount)! > 10 {
//            lblMblNum.isHidden = false
            let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NoInternetViewcontroller") as! NoInternetViewcontroller
            
            self.addChildViewController(popOverVC)
            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParentViewController: self)
            lblMblNum.text = "Please enter Valid Mobile Number"
        }
        
    }
    
    @IBAction func Verifybuttonok(_ sender: UIButton)
    {
        if str2 == "0"
        {
            self.removeSpinner()
            
           verifyalertview.isHidden = true
        }
        else{
            verifyalertview.isHidden = true
            self.removeSpinner()

            DispatchQueue.main.async {
                
                let view1 = self.storyboard?.instantiateViewController(withIdentifier:"RegisterOTPVerificationViewController")as!RegisterOTPVerificationViewController
                view1.sucesssinglfinal = "sucessforgetverifyed"
                view1.Mobilenumbervalueforgetpassword = self.txtMblNumber.text!
                self.present(view1, animated:true, completion:nil)
                
              
            }
        }
       
    }
    func setPin()
    {
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let postString =  String(format:"method=%@&mobilenumber=%@&logintype=%@","resetPIN",txtMblNumber.text!,"4")
        request.httpBody = postString.data(using: .utf8)
        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
      
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                print(response.result)
                
                DispatchQueue.main.async {
                    self.removeSpinner()
                    
                }
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    
                    print(dict)
                    
                    if let statusstring:NSNumber = dict.value(forKey:"status")as?NSNumber
                    {
                        print(statusstring)
                        self.str2 = statusstring.stringValue
                      
                        if  self.str2 == "0"
                        {
                            let msgvalue  = dict.value(forKey:"msg")as!String
                            self.verificationMobilenumberregistered.text = msgvalue
                            self.verificationnotregistred.text = "Verification Not sucess"
                            self.removeSpinner()
                            self.verifyalertview.isHidden = true
                            self.view.makeToast(msgvalue)
                        }
                        if  self.str2 == "1"
                        {
                            let msgvalue  = dict.value(forKey:"msg")as!String
                            
                            self.verificationMobilenumberregistered.text = msgvalue

                            self.Missedcallfeature  = dict.value(forKey:"MissedCallFeature")as!String
                            self.MissedCalledNumbervalue  = dict.value(forKey:"missedcall_number")as!String
                            self.Identificationtwofactor  = dict.value(forKey:"Idtwofactorauthentication")as!NSNumber
                           
                            let defaults = UserDefaults.standard
                            defaults.set(self.txtMblNumber.text!, forKey:"Mymobilenumbervaluefinal")
                              defaults.set( self.Missedcallfeature, forKey: "Mymissedcallfeature")
                            defaults.synchronize()
//                            self.verifyalertview.isHidden = false
                            self.verificationnotregistred.text = "Verification Successful"
                        DispatchQueue.main.async {
                     let view1 = self.storyboard?.instantiateViewController(withIdentifier:"ForgettwoViewController")as!ForgettwoViewController
                        view1.sucesssinglfinal = "sucessforgetverifyed"
                    view1.messagefinalvalue = msgvalue
                        view1.Mobilenumbervalueforgetpassword = self.txtMblNumber.text!
                        self.present(view1, animated:true, completion:nil)
                            
                            
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
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        if textField == txtMblNumber
        {
            if (textField.text?.count)! > 0
            {
                lblMblNum.isHidden = true
//                if (textField.text?.count)! < 10{
//                    lblMblNum.isHidden = false
//
//                  lblMblNum.text = "Please enter correct mobile number"
//
//                }
//                if (textField.text?.count) == 10{
//                  lblMblNum.isHidden = true
//                }
//
//                if (textField.text?.count)! > 10 {
//                    lblMblNum.isHidden = false
//                   lblMblNum.text = "Please enter Valid Mobile Number"
//                }
    }
            
        }
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var result = true
        
        if textField == txtMblNumber {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")
            let characterSet = CharacterSet(charactersIn: string)
            let maxLength = 10
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            
            return allowedCharacters.isSuperset(of: characterSet) && newString.length <= maxLength
            
            
            
        }
        return result
    }

    func showSpinner()
    {
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.verifyalertview.addSubview(self.coverView)
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


