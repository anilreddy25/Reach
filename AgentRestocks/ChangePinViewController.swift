//
//  ChangePinViewController.swift
//  AgentRestocks
//
//  Created by apple on 9/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

/// https://github.com/pgorzelany/ScratchCardView
//https://pgorzelany.github.io/ScratchCardView/
//method=resetPIN&mobilenumber=9561561561&logintype=4
//
//method=resendOTPforforgotPin&mobilenumber=9561561561
//
//method=verifyResetPinOTP&mobilenumber=9561561561&otp=556696&logintype=4
//
//method=newPIN&mobilenumber=9561561561&account_new_pin=986532&OTP=292760
import UIKit
import Alamofire

class ChangePinViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var shadowView: UIView!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var navTitle: UILabel!
    
    @IBOutlet weak var lblOTPNew: UILabel!
    
    @IBOutlet weak var txtOTP: UITextField!
    @IBOutlet weak var lblOTP: UILabel!
    
    @IBOutlet weak var lblChangePin: UILabel!
    
    @IBOutlet weak var btnHelp: UIButton!
    
    @IBOutlet weak var txtNewPin: UITextField!
    @IBOutlet weak var lblNewPin: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var txtConfirmPin: UITextField!
    
    @IBOutlet weak var lblConfirm: UILabel!
    
    var previousNumber: UInt32?

    var confirmpasswordsingel = String()
    var confirmbusinnesnumber = String()
    let defaulst = UserDefaults.standard
    var timersingel = Timer()
    var EditaccountnumberCahngepin = String()
    
    
    var Changetimerone = Timer()

    var Changetimerfinalvalue = Timer()

    var changebtnPWSHtwo = UIButton()

    
    @IBOutlet weak var updatepintwo: UIButton!
    
    
    var coverView = UIView()
    var imageView = UIImageView()
 
    
    var clikedstring1 = String()
    
    
    @IBOutlet weak var veryalertviewfinal: UIView!
    
    var clikedstringTwo = String()

    var ChangetimerSecondvalue = Timer()
    var timerotpfiletwo = Timer()

    var Otpverfication = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


//        shadowView.layer.shadowOffset = CGSize(width: 0, height: 3)
//        shadowView.layer.shadowOpacity = 0.6
//        shadowView.layer.shadowRadius = 2.0
//        shadowView.layer.shadowColor = UIColor.color3().cgColor

        txtOTP.delegate = self
        txtNewPin.delegate = self
        txtConfirmPin.delegate = self
        
        txtOTP.useUnderline()
        txtNewPin.useUnderline()
        txtConfirmPin.useUnderline()
        
        txtOTP.addTarget(self, action: #selector(ChangePinViewController.textFieldDidChange(_:)), for: .editingChanged)
        txtConfirmPin.isSecureTextEntry = true
        
      // self.validateRandomandSequence(txtNewPin.text)
        
        headerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        headerView.layer.shadowOpacity = 0.3
        headerView.layer.shadowRadius = 1.0
        headerView.layer.borderColor = UIColor.color2().cgColor
        headerView.layer.shadowColor = UIColor.color2().cgColor

    confirmpasswordsingel = defaulst.value(forKey:"Mypassword")as!String
    confirmbusinnesnumber = defaulst.value(forKey:"Mybusinessnumber")as!String
        
//       self.view.makeToast("OTP Sent SucessFully")

        txtOTP.keyboardType = .numberPad
        txtNewPin.keyboardType = .numberPad
        txtConfirmPin.keyboardType = .numberPad
        self.updatepintwo.isHidden = true
        
        
        let iconWidthlogintwo = 20;
        let iconHeightLogintwo = 20;
        let imagepasswordtwo = UIImage(named:"wrong")
        changebtnPWSHtwo.setBackgroundImage(imagepasswordtwo, for:.normal)
        changebtnPWSHtwo.frame = CGRect(x:295, y:10, width: iconWidthlogintwo, height: iconHeightLogintwo)
        let paddingViewpintwo = UIView(frame: CGRect(x: 0, y: 0, width:20, height:20))
        txtOTP.rightViewMode = UITextFieldViewMode.always
        txtOTP.addSubview(changebtnPWSHtwo)
        txtOTP.rightView = paddingViewpintwo
        changebtnPWSHtwo.isHidden = true
        
        
        confirmpasswordsingel = defaulst.value(forKey:"Mypassword")as!String
        confirmbusinnesnumber = defaulst.value(forKey:"Mybusinessnumber")as!String
        
    }
    
    @IBAction func btnHelp(_ sender: Any)
    {
        DispatchQueue.main.async
            {
            let singelvalue = self.storyboard?.instantiateViewController(withIdentifier:"NeedTohelpViewController")as!NeedTohelpViewController
            self.present(singelvalue, animated: true, completion:nil)
        }
    }
    
    
    
    
    //MARK: UITextField Delegates
    
  
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        let result = true
        if textField == txtOTP {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")
            let characterSet = CharacterSet(charactersIn: string)
            let maxLength = 6
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
//            if txtOTP.text?.count == 6
//            {
//                DispatchQueue.main.async {
//                    self.dataVerifyOTP()
//                }
//            }
            if self.txtOTP.text?.count == 5
            {
                
                self.txtOTP.textColor = UIColor.black
                Changetimerone = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(self.TextotptimerFunc1), userInfo: nil, repeats: false)
            }
            if self.txtOTP.text?.count == 6
            {
                self.txtOTP.textColor = UIColor.black

            }
            return allowedCharacters.isSuperset(of: characterSet) && newString.length <= maxLength
        }
        if textField == txtNewPin {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")
            let characterSet = CharacterSet(charactersIn: string)
            let maxLength = 6
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
//            if self.txtNewPin.text?.count == 5
//            {
//                   ChangetimerSecondvalue = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(self.NewTimersigel), userInfo: nil, repeats: false)
//
//            }
            
           
            
            
            return allowedCharacters.isSuperset(of: characterSet) && newString.length <= maxLength
        }
        if textField == txtConfirmPin {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")
            let characterSet = CharacterSet(charactersIn: string)
            let maxLength = 6
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            
            
            
            if self.txtConfirmPin.text?.count == 5
            {
                
                Changetimerfinalvalue = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(self.NewTextotptimerFunc1two), userInfo: nil, repeats: false)
            }
            
            
            
            
            
//                else{
//                    self.lblNewPin.text = "Pin Didn't Match"
//                    self.lblNewPin.isHidden = false
//                    self.lblNewPin.textColor = UIColor.red
//                }
          
            return allowedCharacters.isSuperset(of: characterSet) && newString.length <= maxLength
            
            
            
        }
        return result
    }
    
    @objc func TextotptimerFunc1(){
        
        print(self.txtOTP.text?.count)
        
        
        if self.txtOTP.text?.count == 6{
            self.txtOTP.resignFirstResponder()
            self.dataVerifyOTP()
            
        }
    }
    @objc func OTPtimerActiontwovalue(){
        
        print(self.txtOTP.text?.count)
        
        self.view.makeToast("Reset PIN Successfully")
        DispatchQueue.main.async {
            let second = self.storyboard?.instantiateViewController(withIdentifier:"EditAccountViewController")as!EditAccountViewController
            
            self.present(second, animated: true, completion:nil)
            
        }
    }
    
    
//    @objc func NewTimersigel(){
//
//        print(self.txtOTP.text?.count)
//
//        if txtNewPin.text?.count == 6 && txtConfirmPin.text?.count == 6
//        {
//            let textnewpinfinal = txtNewPin.text?.count
//            let textnewconfirmfinal = txtConfirmPin.text?.count
//            if textnewpinfinal == textnewconfirmfinal
//            {
//                let s = txtNewPin.text
//                var str_arr: [String] = []
//                for i in s! {
//                    str_arr.append(String(i))
//                }
//                if str_arr.count == 6
//                {
//                    let v1 = Int(str_arr[0])
//                    let v2 = Int(str_arr[1])
//                    let v3 = Int(str_arr[2])
//                    let v4 = Int(str_arr[3])
//                    let v5 = Int(str_arr[4])
//                    let v6 = Int(str_arr[5])
//                    if v1 == v2 || v2 == v3 || v3 == v4 || v4 == v5 || v5 == v6
//                    {
//                        self.lblNewPin.text = "Sorry! Any one can guess this PIN, try with at least four unique digits in yourPIN"
//                        self.lblNewPin.isHidden = false
//                        self.lblNewPin.textColor = UIColor.red
//                    }
//                    else if v1 == v2! - 1 || v2 == v3! - 1 || v3 == v4! - 1 || v4 == v5! - 1 || v5 == v6! - 1
//                    {
//                        self.lblNewPin.text = "Sorry! Any one can guess this PIN, try with at least four unique digits in yourPIN"
//                        self.lblNewPin.isHidden = false
//                        self.lblNewPin.textColor = UIColor.red
//                    }
//                    else
//                    {
//                        clikedstringTwo = "Demo"
//                        self.updatepintwo.isHidden = false
//
//                        //                        self.CahngeResetpinMethod()
//                    }
//
//
//                }
//            }
//
//        }
//    }
    @objc func NewTextotptimerFunc1two(){
        
        if txtNewPin.text?.count == 6 && txtConfirmPin.text?.count == 6
        {
            self.txtConfirmPin.resignFirstResponder()
            let textnewpinfinal = txtNewPin.text
            let textnewconfirmfinal = txtConfirmPin.text
            
            print(textnewpinfinal)
            print(textnewconfirmfinal)
            
            if textnewpinfinal == textnewconfirmfinal
            {
                let s = txtNewPin.text
                var str_arr: [String] = []
                for i in s! {
                    str_arr.append(String(i))
                }
                var string = String()
                
                if str_arr.count == 6
                {
                    let v1 = Int(str_arr[0])
                    let v2 = Int(str_arr[1])
                    let v3 = Int(str_arr[2])
                    let v4 = Int(str_arr[3])
                    let v5 = Int(str_arr[4])
                    let v6 = Int(str_arr[5])
                    if v1 == v2 || v2 == v3 || v3 == v4 || v4 == v5 || v5 == v6
                    {
                        self.lblNewPin.text = "Sorry! Any one can guess this PIN, try with at least four unique digits in yourPIN"
                        self.lblNewPin.isHidden = false
                        self.lblNewPin.textColor = UIColor.red
                        string = "122"
                        
                    }
                    else if v1 == v2! - 1 || v2 == v3! - 1 || v3 == v4! - 1 || v4 == v5! - 1 || v5 == v6! - 1
                    {
                        self.lblNewPin.text = "Sorry! Any one can guess this PIN, try with at least four unique digits in yourPIN"
                        self.lblNewPin.isHidden = false
                        self.lblNewPin.textColor = UIColor.red
                        string = "122"

                    }
                    else
                    {
                        
                        if self.Otpverfication == "two"
                        {
                            
                            if string == ""
                            {
                                clikedstring1 = "Demo"
                                self.updatepintwo.isHidden = false
                               self.lblConfirm.isHidden = true
                                self.lblNewPin.isHidden = true

                            }
                          
                        }
                        else{
                            self.view.makeToast("OTP verification pending")
                        }
                       
                 

//                        self.CahngeResetpinMethod()
                    }
                    
                    
                }
            }
            else{
                self.lblConfirm.text = "Pin don't match"
                self.lblConfirm.isHidden = false
                self.lblConfirm.textColor = UIColor.red
                
                let iconWidthlogintwo = 20;
                let iconHeightLogintwo = 20;
                let imagepasswordtwo = UIImage(named:"wrong")
                changebtnPWSHtwo.setBackgroundImage(imagepasswordtwo, for:.normal)
                changebtnPWSHtwo.frame = CGRect(x:295, y:10, width: iconWidthlogintwo, height: iconHeightLogintwo)
                let paddingViewpintwo = UIView(frame: CGRect(x: 0, y: 0, width:20, height:20))
                txtConfirmPin.rightViewMode = UITextFieldViewMode.always
                txtConfirmPin.addSubview(changebtnPWSHtwo)
                txtConfirmPin.rightView = paddingViewpintwo
            }
            
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField?)  {
        
        print("Anil KUMAR REDDy")
    
    }
    
    
    @IBAction func btnUpdatePIN(_ sender: Any) {
   
//        if (self.txtNewPin.text?.isEmpty)!
//        {
//            self.lblNewPin.isHidden = false
//            self.lblNewPin.text = "Please Create Password"
//            self.lblNewPin.textColor = UIColor.red
//        }
//        else if self.txtNewPin.text  != ""
//        {
//            self.lblNewPin.isHidden = true
//        }
//        if (self.txtConfirmPin.text?.isEmpty)!
//        {
//            self.lblConfirm.isHidden = false
//            self.lblConfirm.text = "Enter Confirmation Password"
//            self.lblConfirm.textColor = UIColor.red
//        }
//        else if self.txtConfirmPin.text != ""
//        {
//            self.lblConfirm.isHidden = true
//        }
//        if txtNewPin.text == txtConfirmPin.text {
//            self.lblConfirm.isHidden = true
//            self.imgView.image = UIImage(named: "tickk.png")
//        }else{
//            self.lblConfirm.isHidden = false
//            self.lblConfirm.text = "Enter valid Password"
//            self.lblConfirm.textColor = UIColor.red
//            self.imgView.image = UIImage(named: "wrong.png")
//        }
        

        if clikedstring1.count > 0
        {
            DispatchQueue.main.async {
                self.CahngeResetpinMethod()
            }
        }
    }
    
    
    @IBAction func Backbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    
    func dataVerifyOTP()
    {
        let defaults = UserDefaults.standard
        if let MyagemntNumber:String = defaults.value(forKey:"Mybusinessnumber")as?String
        {
            self.EditaccountnumberCahngepin = MyagemntNumber
        }
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        //   let postString = "method=landingPage&userid=511111117"
        let postString =  String(format: "method=%@&mobilenumber=%@&otp=%@&logintype=%@","verifyResetPinOTP",self.EditaccountnumberCahngepin,txtOTP.text!,"4")
        request.httpBody = postString.data(using: .utf8)
        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                print(response.result)
      
                if let dict:NSDictionary = response.result.value as? NSDictionary
                {
                    print(dict)
                    if let statusstring:NSNumber = dict.value(forKey:"status")as?NSNumber
                    {
                        print(statusstring)
                        var str2 = statusstring.stringValue
                        print(str2)
                        if  str2 == "2"
                        {
                            let msgvalue  = dict.value(forKey:"msg")as!String
                            self.view.makeToast(msgvalue)
                            DispatchQueue.main.async {
//                                self.verifyAlert.isHidden = false
//                                self.removeSpinner()
                                //self.timerotpfile = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.OTPtimerAction), userInfo: nil, repeats: false)
                                 self.updatepintwo.isHidden = true
                                self.txtOTP.textColor = UIColor.red
                                self.changebtnPWSHtwo.isHidden = true

                            }
                        }
                        if  str2 == "0"
                        {
                            let msgvalue  = dict.value(forKey:"msg")as!String
                            self.view.makeToast(msgvalue)
                            DispatchQueue.main.async {
                                //                                self.verifyAlert.isHidden = false
                                //                                self.removeSpinner()
                                //self.timerotpfile = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.OTPtimerAction), userInfo: nil, repeats: false)
                                self.updatepintwo.isHidden = true
                                self.txtOTP.textColor = UIColor.red
                                self.changebtnPWSHtwo.isHidden = false
                            }
                        }
                        if  str2 == "1"
                        {
                            self.Otpverfication = "two"
                            let msgvalue  = dict.value(forKey:"msg")as!String
                            self.view.makeToast(msgvalue)
                            DispatchQueue.main.async {
                                //                                self.verifyAlert.isHidden = false
                                //                                self.removeSpinner()
                                //self.timerotpfile = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.OTPtimerAction), userInfo: nil, repeats: false)
                                self.updatepintwo.isHidden = true
                                self.txtOTP.textColor = UIColor.black
                                self.changebtnPWSHtwo.isHidden = false
                                
                                let iconWidthlogintwo = 20;
                                let iconHeightLogintwo = 20;
                                let imagepasswordtwo = UIImage(named:"tickk")
                                self.changebtnPWSHtwo.setBackgroundImage(imagepasswordtwo, for:.normal)
                               self.changebtnPWSHtwo.frame = CGRect(x:295, y:10, width: iconWidthlogintwo, height: iconHeightLogintwo)
                                let paddingViewpintwo = UIView(frame: CGRect(x: 0, y: 0, width:20, height:20))
                                self.txtOTP.rightViewMode = UITextFieldViewMode.always
                                self.txtOTP.addSubview(self.changebtnPWSHtwo)
                                self.txtOTP.rightView = paddingViewpintwo
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
    func CahngeResetpinMethod()
    {
        self.showSpinner()
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
   
        let postString1 =  String(format: "method=%@&mobilenumber=%@&otp=%@&account_new_pin=%@","newPIN",confirmbusinnesnumber,txtOTP.text!,txtNewPin.text!)
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
                            self.veryalertviewfinal.isHidden = true
                        }
                        if str2 == "1"
                        {
                            let msgvalue  = dict.value(forKey:"msg")as!String
                            self.veryalertviewfinal.isHidden = true
 
//                            SUCCESS
//                                {
//                                    msg = "Reset PIN Successfully";
//                                    status = 1;
//                            }
                            
                               self.timerotpfiletwo = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.OTPtimerActiontwovalue), userInfo: nil, repeats: false)
                            
                            
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
        self.veryalertviewfinal.addSubview(self.coverView)
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
 
}
