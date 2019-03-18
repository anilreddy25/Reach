//
//  ResetpinViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 03/10/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import Alamofire

class ResetpinViewController: UIViewController,UITextFieldDelegate
{
    @IBOutlet weak var pinone: UIView!
    @IBOutlet weak var pintwo: UIView!
    @IBOutlet weak var resetpinview: UIView!
    @IBOutlet weak var viewone: UIView!
    @IBOutlet weak var textfiledone: UITextField!
    @IBOutlet weak var viewtwo: UIView!
    @IBOutlet weak var textfiledtwo: UITextField!
    @IBOutlet weak var viewthree: UIView!
    @IBOutlet weak var textfiledthree: UITextField!
    @IBOutlet weak var viewfour: UIView!
    @IBOutlet weak var textfiledfour: UITextField!
    @IBOutlet weak var viewfive: UIView!
    @IBOutlet weak var textfiledfive: UITextField!
    @IBOutlet weak var viewsix: UIView!
    @IBOutlet weak var textfiledsix: UITextField!
    @IBOutlet weak var viewseven: UIView!
    @IBOutlet weak var textfiledseven: UITextField!
    @IBOutlet weak var viewEight: UIView!
    @IBOutlet weak var textfiledEight: UITextField!
    @IBOutlet weak var viewnine: UIView!
    @IBOutlet weak var textfilednine: UITextField!
    @IBOutlet weak var viewten: UIView!
    @IBOutlet weak var viewtentextfiled: UITextField!
    @IBOutlet weak var vieweleven: UIView!
    @IBOutlet weak var viewleventextfiled: UITextField!
    @IBOutlet weak var viewtwelve: UIView!
    @IBOutlet weak var viewtwelvetextfiled: UITextField!
    
    
    @IBOutlet weak var verifyalertview: UIView!
  
    @IBOutlet weak var verifytopview: UIView!
    
    var Loginstr = String()
    
    var coverView = UIView()
    var imageView = UIImageView()
    
    
    @IBOutlet weak var okbutton: UIButton!
    
    
    @IBOutlet weak var verymiddleview: UIView!
    
    @IBOutlet weak var cancelbutton: UIButton!
    
    @IBOutlet weak var yourmobilenumberRegistered: UILabel!
    
    @IBOutlet weak var verificationsucess: UILabel!
    var Verificationfinalvalueotpfinal = String()
    
    var Mobilefinalvaluestringsetpin = String()
    
    var Mobileotppinvaluefinal = String()
    
    var stringnewpinone = String()
    var stringnewpinTwo = String()
   var clickedstringfinalvalue = String()
    var messagevalue = String()
    
    
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        resetpinview.layer.shadowOffset = CGSize(width: 0, height: 3)
        resetpinview.layer.shadowOpacity = 0.6
        resetpinview.layer.shadowRadius = 3.0
        resetpinview.layer.shadowColor = UIColor.color2().cgColor
      
        self.viewone.layer.cornerRadius = self.viewone.frame.size.width/2
        self.viewtwo.layer.cornerRadius = self.viewtwo.frame.size.width/2
        self.viewthree.layer.cornerRadius = self.viewthree.frame.size.width/2
        self.viewfour.layer.cornerRadius = self.viewfour.frame.size.width/2
        self.viewfive.layer.cornerRadius = self.viewfive.frame.size.width/2
        self.viewsix.layer.cornerRadius = self.viewsix.frame.size.width/2
        self.textfiledone.layer.cornerRadius = self.textfiledone.frame.size.width/2
        self.textfiledtwo.layer.cornerRadius = self.textfiledtwo.frame.size.width/2
        self.textfiledthree.layer.cornerRadius = self.textfiledthree.frame.size.width/2
        self.textfiledfour.layer.cornerRadius = self.textfiledfour.frame.size.width/2
        self.textfiledfive.layer.cornerRadius = self.textfiledfive.frame.size.width/2
        self.textfiledsix.layer.cornerRadius = self.textfiledsix.frame.size.width/2
        textfiledone.keyboardType = .asciiCapableNumberPad
        textfiledtwo.keyboardType = .asciiCapableNumberPad
        textfiledthree.keyboardType = .asciiCapableNumberPad
        textfiledfour.keyboardType = .asciiCapableNumberPad
        textfiledfive.keyboardType = .asciiCapableNumberPad
        textfiledsix.keyboardType = .asciiCapableNumberPad

        textfiledone.delegate = self
        textfiledtwo.delegate = self
        textfiledthree.delegate = self
        textfiledfour.delegate = self
        textfiledfive.delegate = self
        textfiledsix.delegate = self

        textfiledone.addTarget(self, action: #selector(ResetpinViewController.textFieldDidChange(_:)), for: .editingChanged)
        textfiledtwo.addTarget(self, action: #selector(ResetpinViewController.textFieldDidChange(_:)), for: .editingChanged)
        textfiledthree.addTarget(self, action: #selector(ResetpinViewController.textFieldDidChange(_:)), for: .editingChanged)
        textfiledfour.addTarget(self, action: #selector(ResetpinViewController.textFieldDidChange(_:)), for: .editingChanged)
        textfiledfive.addTarget(self, action: #selector(ResetpinViewController.textFieldDidChange(_:)), for: .editingChanged)
        textfiledsix.addTarget(self, action: #selector(ResetpinViewController.textFieldDidChange(_:)), for: .editingChanged)

        
        
        textfiledseven.addTarget(self, action: #selector(ResetpinViewController.textFieldDidChange(_:)), for: .editingChanged)
        textfiledEight.addTarget(self, action: #selector(ResetpinViewController.textFieldDidChange(_:)), for: .editingChanged)
        textfilednine.addTarget(self, action: #selector(ResetpinViewController.textFieldDidChange(_:)), for: .editingChanged)
        viewtentextfiled.addTarget(self, action: #selector(ResetpinViewController.textFieldDidChange(_:)), for: .editingChanged)
        viewleventextfiled.addTarget(self, action: #selector(ResetpinViewController.textFieldDidChange(_:)), for: .editingChanged)
        viewtwelvetextfiled.addTarget(self, action: #selector(ResetpinViewController.textFieldDidChange(_:)), for: .editingChanged)
        
        
        self.viewseven.layer.cornerRadius = self.viewseven.frame.size.width/2
        self.viewEight.layer.cornerRadius = self.viewEight.frame.size.width/2
        self.viewnine.layer.cornerRadius = self.viewnine.frame.size.width/2
        self.viewten.layer.cornerRadius = self.viewten.frame.size.width/2
        self.vieweleven.layer.cornerRadius = self.vieweleven.frame.size.width/2
        self.viewtwelve.layer.cornerRadius = self.viewtwelve.frame.size.width/2
        self.textfiledseven.layer.cornerRadius = self.textfiledseven.frame.size.width/2
        self.textfiledEight.layer.cornerRadius = self.textfiledEight.frame.size.width/2
        self.textfilednine.layer.cornerRadius = self.textfilednine.frame.size.width/2
        self.viewtentextfiled.layer.cornerRadius = self.viewtentextfiled.frame.size.width/2
        self.viewleventextfiled.layer.cornerRadius = self.viewleventextfiled.frame.size.width/2
        self.viewtwelvetextfiled.layer.cornerRadius = self.viewtwelvetextfiled.frame.size.width/2
        self.textfiledseven.delegate = self
         self.textfiledEight.delegate = self
        self.textfilednine.delegate = self
        self.viewtentextfiled.delegate = self
        self.viewleventextfiled.delegate = self
        self.viewtwelvetextfiled.delegate = self
        textfiledseven.keyboardType = .asciiCapableNumberPad
        textfiledEight.keyboardType = .asciiCapableNumberPad
        textfilednine.keyboardType = .asciiCapableNumberPad
        viewtentextfiled.keyboardType = .asciiCapableNumberPad
        viewleventextfiled.keyboardType = .asciiCapableNumberPad
        viewtwelvetextfiled.keyboardType = .asciiCapableNumberPad
        textfiledone.becomeFirstResponder()

        self.view.makeToast(messagevalue)
    }
    @objc func textFieldDidChange(_ textField: UITextField)
    {
        let tetx = textField.text
   
        
        if (textfiledone.text?.count)! > 0
        {
//            viewone.isUserInteractionEnabled = true
//            textfiledone.isUserInteractionEnabled = true
//            viewtwo.isUserInteractionEnabled = true
//            textfiledtwo.isUserInteractionEnabled = true
//            viewthree.isUserInteractionEnabled = true
//            textfiledthree.isUserInteractionEnabled = true
//            viewfour.isUserInteractionEnabled = true
//            textfiledfour.isUserInteractionEnabled = true
//            viewfive.isUserInteractionEnabled = true
//            viewsix.isUserInteractionEnabled = true
//            textfiledsix.isUserInteractionEnabled = true
//            viewseven.isUserInteractionEnabled = true
//            viewEight.isUserInteractionEnabled = true
//            viewnine.isUserInteractionEnabled = true
//            viewten.isUserInteractionEnabled = true
//            vieweleven.isUserInteractionEnabled = true
//            viewleventextfiled.isUserInteractionEnabled = true
//            viewtwelve.isUserInteractionEnabled = true
//            viewtwelvetextfiled.isUserInteractionEnabled = true

        }
//        @IBOutlet weak var viewone: UIView!
//        @IBOutlet weak var textfiledone: UITextField!
//        @IBOutlet weak var viewtwo: UIView!
//        @IBOutlet weak var textfiledtwo: UITextField!
//        @IBOutlet weak var viewthree: UIView!
//        @IBOutlet weak var textfiledthree: UITextField!
//        @IBOutlet weak var viewfour: UIView!
//        @IBOutlet weak var textfiledfour: UITextField!
//        @IBOutlet weak var viewfive: UIView!
//        @IBOutlet weak var textfiledfive: UITextField!
//        @IBOutlet weak var viewsix: UIView!
//        @IBOutlet weak var textfiledsix: UITextField!
//        @IBOutlet weak var viewseven: UIView!
//        @IBOutlet weak var textfiledseven: UITextField!
//        @IBOutlet weak var viewEight: UIView!
//        @IBOutlet weak var textfiledEight: UITextField!
//        @IBOutlet weak var viewnine: UIView!
//        @IBOutlet weak var textfilednine: UITextField!
//        @IBOutlet weak var viewten: UIView!
//        @IBOutlet weak var viewtentextfiled: UITextField!
//        @IBOutlet weak var vieweleven: UIView!
//        @IBOutlet weak var viewleventextfiled: UITextField!
//        @IBOutlet weak var viewtwelve: UIView!
//        @IBOutlet weak var viewtwelvetextfiled: UITextField!
//
        
        
        
//        if tetx?.utf16.count == 1
//        {
//            switch textField
//            {
//            case textfiledone:
//               textfiledone.backgroundColor = UIColor.red
//                textfiledone.textColor = UIColor.red
//                viewone.backgroundColor =  UIColor.red
//                textfiledtwo.becomeFirstResponder()
//            case textfiledtwo:
//                textfiledtwo.backgroundColor = UIColor.red
//                textfiledtwo.textColor = UIColor.red
//                viewtwo.backgroundColor =  UIColor.red
//                textfiledthree.becomeFirstResponder()
//            case textfiledthree:
//                textfiledthree.backgroundColor = UIColor.red
//                textfiledthree.textColor = UIColor.red
//                viewthree.backgroundColor =  UIColor.red
//                textfiledfour.becomeFirstResponder()
//            case textfiledfour:
//                textfiledfour.backgroundColor = UIColor.red
//                textfiledfour.textColor = UIColor.red
//                viewfour.backgroundColor =  UIColor.red
//                textfiledfive.becomeFirstResponder()
//            case textfiledfive:
//                textfiledfive.backgroundColor = UIColor.red
//                textfiledfive.textColor = UIColor.red
//                viewfive.backgroundColor =  UIColor.red
//                textfiledsix.becomeFirstResponder()
//            case textfiledsix:
//                textfiledsix.backgroundColor = UIColor.red
//                textfiledsix.textColor = UIColor.red
//                viewsix.backgroundColor =  UIColor.red
//                textfiledseven.becomeFirstResponder()
//            case textfiledseven:
//                textfiledseven.backgroundColor = UIColor.red
//                textfiledseven.textColor = UIColor.red
//                viewseven.backgroundColor =  UIColor.red
//                textfiledEight.becomeFirstResponder()
//
//            case textfiledEight:
//                textfiledEight.backgroundColor = UIColor.red
//                textfiledEight.textColor = UIColor.red
//                viewEight.backgroundColor =  UIColor.red
//                textfilednine.becomeFirstResponder()
//            case textfilednine:
//                textfilednine.backgroundColor = UIColor.red
//                textfilednine.textColor = UIColor.red
//                viewnine.backgroundColor =  UIColor.red
//
//                viewtentextfiled.becomeFirstResponder()
//
//            case viewtentextfiled:
//                viewtentextfiled.backgroundColor = UIColor.red
//                viewtentextfiled.textColor = UIColor.red
//                viewten.backgroundColor =  UIColor.red
//                viewleventextfiled.becomeFirstResponder()
//            case viewleventextfiled:
//                viewleventextfiled.backgroundColor = UIColor.red
//                viewleventextfiled.textColor = UIColor.red
//                vieweleven.backgroundColor =  UIColor.red
//                viewtwelvetextfiled.becomeFirstResponder()
//            case viewtwelvetextfiled:
//                viewtwelvetextfiled.backgroundColor = UIColor.red
//                viewtwelvetextfiled.textColor = UIColor.red
//                viewtwelve.backgroundColor =  UIColor.red
//              viewtwelvetextfiled.resignFirstResponder()
//
//                let stringNewpin = NSString(format:"%@%@%@%@%@%@",textfiledone.text!,textfiledtwo.text!,textfiledthree.text!,textfiledfour.text!,textfiledfive.text!,textfiledsix.text!)
//
//                let stringNewpintwo = NSString(format:"%@%@%@%@%@%@",textfiledseven.text!,textfiledEight.text!,textfilednine.text!,viewtentextfiled.text!,viewleventextfiled.text!,viewtwelvetextfiled.text!)
//                stringnewpinone = stringNewpin as String
//                stringnewpinTwo = stringNewpintwo as String
//               print(stringnewpinone)
//                print(stringnewpinTwo)
//
//                if stringnewpinone == stringnewpinTwo
//                {
//                      self.ResetpinMethod()
//                }
//                else{
//                    self.verifyalertview.isHidden = false
//                    self.verificationsucess.text = "Verification  Failure"
//                    self.yourmobilenumberRegistered.text = "pins not matched"
//                }
//
//            default: break
//            }
//        }
 
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
    }
    @IBAction func Backbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion: nil)
        
    }

    
    func ResetpinMethod()
    {
        self.showSpinner()
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        
        print(stringnewpinone)
        
        let defaultssingelvalue = UserDefaults.standard
        let singlvaluefinalis = defaultssingelvalue.value(forKey:"textenterotpfinalvalue")as?String
        print(singlvaluefinalis)
        
        let singlvaluefinalTwois = defaultssingelvalue.value(forKey:"Mymobilenumbervaluefinal")as?String
        
        print(singlvaluefinalTwois)
        
        
        if let statusstringfinalvalue:String = defaultssingelvalue.value(forKey:"textenterotpfinalvalue")as?String
        {
            Mobilefinalvaluestringsetpin = statusstringfinalvalue
        }
        if let statusstringpin:String = defaultssingelvalue.value(forKey:"Mymobilenumbervaluefinal")as?String
        {
            Mobileotppinvaluefinal = statusstringpin
        }
        let postString1 =  String(format: "method=%@&mobilenumber=%@&otp=%@&account_new_pin=%@","newPIN",Mobileotppinvaluefinal,Mobilefinalvaluestringsetpin,stringnewpinone)
        print(postString1)
        
        
        request.httpBody = postString1.data(using: .utf8)
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
                        if  str2 == "0"
                        {
                            let msgvalue  = dict.value(forKey:"msg")as!String
                            self.verifyalertview.isHidden = false
                            self.verificationsucess.text = "New Pin does not match with Re enter pin"
                            self.yourmobilenumberRegistered.text = "Error"
                            self.Verificationfinalvalueotpfinal = "0"
                        }
                        if str2 == "1"
                        {
                            let msgvalue  = dict.value(forKey:"msg")as!String
                            self.verifyalertview.isHidden = false
                            self.verificationsucess.text = "Verification  Sucess"
                            self.yourmobilenumberRegistered.text = msgvalue
                            self.Verificationfinalvalueotpfinal = "1"
                        }
                    }
                    
                }
                break
            case .failure(_):
                break
            }
            
            
            
        }
        
    }
    
    @IBAction func okbutton(_ sender: UIButton)
    {
        self.verifyalertview.isHidden = true
        if self.Verificationfinalvalueotpfinal == "1"
        {
            DispatchQueue.main.async
                {
                let Loginview = self.storyboard?.instantiateViewController(withIdentifier:"loginPageVC")as!loginPageVC
                    self.present(Loginview, animated:true, completion:nil)
            }
        }
        else
        {
            
            self.textfiledone.text = nil
            self.textfiledtwo.text = nil
            self.textfiledthree.text = nil
            self.textfiledfour.text = nil
            self.textfiledfive.text = nil
            self.textfiledsix.text = nil
            self.textfiledseven.text = nil
            self.textfiledEight.text = nil
            self.textfilednine.text = nil
            self.viewtentextfiled.text = nil
            self.viewleventextfiled.text = nil
            self.viewtwelvetextfiled.text = nil
            
            textfiledone.resignFirstResponder()

                textfiledone.backgroundColor = UIColor.lightGray
                textfiledone.textColor = UIColor.lightGray
                viewone.backgroundColor =  UIColor.lightGray
            
                textfiledtwo.backgroundColor = UIColor.lightGray
                textfiledtwo.textColor = UIColor.lightGray
                viewtwo.backgroundColor =  UIColor.lightGray
            
                textfiledthree.backgroundColor = UIColor.lightGray
                textfiledthree.textColor = UIColor.lightGray
                viewthree.backgroundColor =  UIColor.lightGray
            
                textfiledfour.backgroundColor = UIColor.lightGray
                textfiledfour.textColor = UIColor.lightGray
                viewfour.backgroundColor =  UIColor.lightGray
            
                textfiledfive.backgroundColor = UIColor.lightGray
                textfiledfive.textColor = UIColor.lightGray
                viewfive.backgroundColor =  UIColor.lightGray
            
                textfiledsix.backgroundColor = UIColor.lightGray
                textfiledsix.textColor = UIColor.lightGray
                viewsix.backgroundColor =  UIColor.lightGray
            
                textfiledseven.backgroundColor = UIColor.lightGray
                textfiledseven.textColor = UIColor.lightGray
                viewseven.backgroundColor =  UIColor.lightGray
            
                textfiledEight.backgroundColor = UIColor.lightGray
                textfiledEight.textColor = UIColor.lightGray
                viewEight.backgroundColor =  UIColor.lightGray
            
                textfilednine.backgroundColor = UIColor.lightGray
                textfilednine.textColor = UIColor.lightGray
                viewnine.backgroundColor =  UIColor.lightGray
            
                viewtentextfiled.backgroundColor = UIColor.lightGray
                viewtentextfiled.textColor = UIColor.lightGray
                viewten.backgroundColor =  UIColor.lightGray
            
                viewleventextfiled.backgroundColor = UIColor.lightGray
                viewleventextfiled.textColor = UIColor.lightGray
                vieweleven.backgroundColor = UIColor.lightGray
            
                viewtwelve.backgroundColor = UIColor.lightGray
                viewtwelvetextfiled.textColor = UIColor.lightGray
                viewtwelvetextfiled.backgroundColor =  UIColor.lightGray
            
        }
    }
    
    @IBAction func Cancelbutton(_ sender: UIButton)
    {
        self.verifyalertview.isHidden = true
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
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if ((textField.text?.count)! < 1 ) && (string.count > 0) {
            if textField == textfiledone {
                textfiledone.backgroundColor = UIColor.red
                textfiledone.textColor = UIColor.red
                viewone.backgroundColor =  UIColor.red
                textfiledtwo.becomeFirstResponder()
                }
            
            if textField == textfiledtwo {
                textfiledtwo.backgroundColor = UIColor.red
                textfiledtwo.textColor = UIColor.red
                viewtwo.backgroundColor =  UIColor.red
                textfiledthree.becomeFirstResponder()
                
                
            }
            
            if textField == textfiledthree {
                textfiledthree.backgroundColor = UIColor.red
                textfiledthree.textColor = UIColor.red
                viewthree.backgroundColor =  UIColor.red
                textfiledfour.becomeFirstResponder()
                
                
            }
            
            if textField == textfiledfour
            {
                textfiledfour.backgroundColor = UIColor.red
                textfiledfour.textColor = UIColor.red
                viewfour.backgroundColor =  UIColor.red
                textfiledfive.becomeFirstResponder()
            }
            
            if textField == textfiledfive
            {
                textfiledfive.backgroundColor = UIColor.red
                textfiledfive.textColor = UIColor.red
                viewfive.backgroundColor =  UIColor.red
                textfiledsix.becomeFirstResponder()
            }
            if textField == textfiledsix
            {
                textfiledsix.backgroundColor = UIColor.red
                textfiledsix.textColor = UIColor.red
                viewsix.backgroundColor =  UIColor.red
                textfiledseven.becomeFirstResponder()
            }
            if textField == textfiledseven
            {
                textfiledseven.backgroundColor = UIColor.red
                textfiledseven.textColor = UIColor.red
                viewseven.backgroundColor =  UIColor.red
                textfiledEight.becomeFirstResponder()
            }
            if textField == textfiledEight
            {
                textfiledEight.backgroundColor = UIColor.red
                textfiledEight.textColor = UIColor.red
                viewEight.backgroundColor =  UIColor.red
                textfilednine.becomeFirstResponder()
            }
            if textField == textfilednine
            {
                textfilednine.backgroundColor = UIColor.red
                textfilednine.textColor = UIColor.red
                viewnine.backgroundColor =  UIColor.red
                viewtentextfiled.becomeFirstResponder()
            }
            if textField == viewtentextfiled
            {
                viewtentextfiled.backgroundColor = UIColor.red
                viewtentextfiled.textColor = UIColor.red
                viewten.backgroundColor =  UIColor.red
                viewleventextfiled.becomeFirstResponder()
            }
            if textField == viewleventextfiled
            {
                viewleventextfiled.backgroundColor = UIColor.red
                viewleventextfiled.textColor = UIColor.red
                vieweleven.backgroundColor = UIColor.red
                viewtwelvetextfiled.becomeFirstResponder()

            }
            
            if textField == viewtwelvetextfiled
            {
                viewtwelve.backgroundColor = UIColor.red
                viewtwelvetextfiled.textColor = UIColor.red
                viewtwelvetextfiled.backgroundColor =  UIColor.red
                viewtwelvetextfiled.resignFirstResponder()
                

            }
            textField.text = string
            
            print(viewtwelvetextfiled.text)
            
            if (textfiledone.text?.count)! > 0 && (textfiledtwo.text?.count)! > 0 &&  (textfiledthree.text?.count)! > 0 && (textfiledfour.text?.count)! > 0 &&  (textfiledfive.text?.count)! > 0 && (textfiledsix.text?.count)! > 0
                &&  (textfiledseven.text?.count)! > 0 && (textfiledEight.text?.count)! > 0
                &&  (textfilednine.text?.count)! > 0 && (viewtentextfiled.text?.count)! > 0 &&  (viewleventextfiled.text?.count)! > 0 &&  (viewtwelvetextfiled.text?.count)! > 0
            {
                let stringNewpin = NSString(format:"%@%@%@%@%@%@",textfiledone.text!,textfiledtwo.text!,textfiledthree.text!,textfiledfour.text!,textfiledfive.text!,textfiledsix.text!)
                let stringNewpintwo = NSString(format:"%@%@%@%@%@%@",textfiledseven.text!,textfiledEight.text!,textfilednine.text!,viewtentextfiled.text!,viewleventextfiled.text!,viewtwelvetextfiled.text!)
                stringnewpinone = stringNewpin as String
                stringnewpinTwo = stringNewpintwo as String
                print(stringnewpinone)
                print(stringnewpinTwo)
        
                if stringnewpinone == stringnewpinTwo
                {
                    let s = stringnewpinone
                    var str_arr: [String] = []
                    for i in s {
                        str_arr.append(String(i))
                    }
                    if str_arr.count == 6 {
                        let v1 = Int(str_arr[0])
                        let v2 = Int(str_arr[1])
                        let v3 = Int(str_arr[2])
                        let v4 = Int(str_arr[3])
                        let v5 = Int(str_arr[4])
                        let v6 = Int(str_arr[5])
                    
                        if v1 == v2 || v2 == v3 || v3 == v4 || v4 == v5 || v5 == v6
                        {
                            
                             clickedstringfinalvalue = "120"

                            let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
                            
                            popOverVC.alertMessageString = "Sorry! Any one can guess this PIN, try with at least four unique digits in your PIN"
                            popOverVC.alertTitleString = "Error"

                            self.addChildViewController(popOverVC)
                            popOverVC.view.frame = self.view.frame
                            self.view.addSubview(popOverVC.view)
                            popOverVC.didMove(toParentViewController: self)
 
                        }
                   
                        
                        
//                         if v2!-v1! == 1 || v3!-v2! == 1 || v4!-v3! == 1 || v5!-v4! == 1 || v6!-v5! == 1 {
//                            alert_message(title: "No sequencing numbers allowed", message: "")
//                        }
                         if v1 == v2! - 1 || v2 == v3! - 1 || v3 == v4! - 1 || v4 == v5! - 1 || v5 == v6! - 1
                        {
//                            lblCreate.text = "No sequencing numbers allowed"
//                            lblCreate.isHidden = false
//                            lblCreate.textColor = UIColor.red
//
                            clickedstringfinalvalue = "120"

                            let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
                            
                            popOverVC.alertMessageString = "Sorry! Any one can guess this PIN, try with at least four unique digits in your PIN"
                            popOverVC.alertTitleString = "Error"
                            
                            self.addChildViewController(popOverVC)
                            popOverVC.view.frame = self.view.frame
                            self.view.addSubview(popOverVC.view)
                            popOverVC.didMove(toParentViewController: self)
                            
                        }
                      

                         else if clickedstringfinalvalue  == ""
                        {
                            DispatchQueue.main.async
                                {
                                self.ResetpinMethod()
                            }
                            }
                            
                        }
              
                    }
                else
                {
                    let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
                    popOverVC.alertTitleString = "Error"
                    popOverVC.alertMessageString = "New pin does not match with confirm pin"
                    
                    self.addChildViewController(popOverVC)
                    popOverVC.view.frame = self.view.frame
                    self.view.addSubview(popOverVC.view)
                    popOverVC.didMove(toParentViewController: self)
                }
             
                }
//                else{
//                    self.verifyalertview.isHidden = false
//                    self.verificationsucess.text = "Verification  Failure"
//                    self.yourmobilenumberRegistered.text = "pins not matched"
//                }

           
            
            return false
        }

        
        else if ((textField.text?.count)! >= 1) && (string.count == 0)
        {
            if textField == textfiledone
            {
                textfiledone.backgroundColor = UIColor.lightGray
                textfiledone.textColor = UIColor.lightGray
                viewone.backgroundColor =  UIColor.lightGray
                textfiledone.resignFirstResponder()
            }
            
            if textField == textfiledtwo
            {
                textfiledtwo.backgroundColor = UIColor.lightGray
                textfiledtwo.textColor = UIColor.lightGray
                viewtwo.backgroundColor =  UIColor.lightGray
                textfiledone.becomeFirstResponder()
                
            }
            
            if textField == textfiledthree {
                textfiledthree.backgroundColor = UIColor.lightGray
                textfiledthree.textColor = UIColor.lightGray
                viewthree.backgroundColor =  UIColor.lightGray
                textfiledtwo.becomeFirstResponder()
                
                
            }
            
            if textField == textfiledfour
            {
                textfiledfour.backgroundColor = UIColor.lightGray
                textfiledfour.textColor = UIColor.lightGray
                viewfour.backgroundColor =  UIColor.lightGray
                textfiledthree.becomeFirstResponder()
            }
            
            if textField == textfiledfive
            {
                textfiledfive.backgroundColor = UIColor.lightGray
                textfiledfive.textColor = UIColor.lightGray
                viewfive.backgroundColor =  UIColor.lightGray
                textfiledfour.becomeFirstResponder()
            }
            if textField == textfiledsix
            {
                textfiledsix.backgroundColor = UIColor.lightGray
                textfiledsix.textColor = UIColor.lightGray
                viewsix.backgroundColor =  UIColor.lightGray
                textfiledfive.becomeFirstResponder()
            }
            if textField == textfiledseven
            {
                textfiledseven.backgroundColor = UIColor.lightGray
                textfiledseven.textColor = UIColor.lightGray
                viewseven.backgroundColor =  UIColor.lightGray
                textfiledsix.becomeFirstResponder()
            }
            if textField == textfiledEight
            {
                textfiledEight.backgroundColor = UIColor.lightGray
                textfiledEight.textColor = UIColor.lightGray
                viewEight.backgroundColor =  UIColor.lightGray
                textfiledseven.becomeFirstResponder()
            }
            if textField == textfilednine
            {
                textfilednine.backgroundColor = UIColor.lightGray
                textfilednine.textColor = UIColor.lightGray
                viewnine.backgroundColor =  UIColor.lightGray
                textfiledEight.becomeFirstResponder()
            }
            if textField == viewtentextfiled
            {
                viewtentextfiled.backgroundColor = UIColor.lightGray
                viewtentextfiled.textColor = UIColor.lightGray
                viewten.backgroundColor =  UIColor.lightGray
                textfilednine.becomeFirstResponder()
            }
            if textField == viewleventextfiled
            {
                viewleventextfiled.backgroundColor = UIColor.lightGray
                viewleventextfiled.textColor = UIColor.lightGray
                vieweleven.backgroundColor = UIColor.lightGray
                viewtentextfiled.becomeFirstResponder()
                
            }
            
            if textField == viewtwelvetextfiled
            {
                viewtwelve.backgroundColor = UIColor.lightGray
                viewtwelvetextfiled.textColor = UIColor.lightGray
                viewtwelvetextfiled.backgroundColor =  UIColor.lightGray
                viewleventextfiled.becomeFirstResponder()
             
            }
            textField.text = ""
            return false
        }
        else if (textField.text?.count)! >= 1
        {
            textField.text = string
            return false
        }
        
        return true
    }

}
