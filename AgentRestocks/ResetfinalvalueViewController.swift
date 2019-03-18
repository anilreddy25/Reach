//
//  ResetfinalvalueViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 26/11/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import IQKeyboardManagerSwift

class ResetfinalvalueViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var navBarView: UIView!
    
    @IBOutlet weak var newPinTF: UITextField!
    
    @IBOutlet weak var confirmPinTf: UITextField!
    
    
    
    @IBOutlet weak var cn1: UIView!
    
    @IBOutlet weak var cn2: UIView!
    
    @IBOutlet weak var cn6: UIView!
    
    @IBOutlet weak var cn5: UIView!
    @IBOutlet weak var cn4: UIView!
    @IBOutlet weak var cn3: UIView!
    
    
    @IBOutlet weak var np5: UIView!
    @IBOutlet weak var np1: UIView!
    
    
    @IBOutlet weak var np6: UIView!
    @IBOutlet weak var np2: UIView!
    
    @IBOutlet weak var np3: UIView!
    
    @IBOutlet weak var np4: UIView!
    var boolValue = Bool()
    var timer = Timer()
    var returnBTN = UIButton()
    var mobileNumer = NSString()
    var OTP = NSString()
    var coverView = UIView()
    var imageview = UIImageView()
    var confirmPinArray : NSMutableArray = NSMutableArray()
    var newPinArray : NSMutableArray = NSMutableArray()
    
    var Mobilefinalvaluestringsetpin = String()
    var Mobileotppinvaluefinal = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBarView.layer.shadowOpacity =  0.5
        self.navBarView.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.navBarView.layer.shadowRadius = 3.0
        self.navBarView.layer.shadowColor = UIColor.black.cgColor
        self.confirmPinTf.delegate = self
        self.newPinTF.delegate = self
        self.confirmPinTf.clearButtonMode = .always
        
//        self.returnBTN.setTitle("Done", for: UIControlState())
//        self.returnBTN.setTitleColor(UIColor.black, for: UIControlState())
//        self.returnBTN.frame = CGRect(x: 0, y: 163, width: 106, height: 53)
//        self.returnBTN.adjustsImageWhenHighlighted = false
//        self.returnBTN.addTarget(self, action: #selector(Done), for: UIControlEvents.touchUpInside)
        
//        IQKeyboardManager.sharedManager().enable = false
//        IQKeyboardManager.sharedManager().enableAutoToolbar = false
//        IQKeyboardManager.sharedManager().shouldShowToolbarPlaceholder = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        ValidateValues.setStatusBarBackgroundColor(color: .black)
        self.newPinTF.becomeFirstResponder()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        print(string)
        if textField == self.confirmPinTf{
            if self.confirmPinArray.count != 6{
                if string != ""{
                    self.confirmPinArray.add(string)
                    self.confirmPinChange()
                }
                else{
                    self.confirmPinArray.removeLastObject()
                    self.confirmPinChange()
                }
            }
            else{
                //self.newPinTF.becomeFirstResponder()
                
                return false
                
            }
        }
        
        
        if textField == self.newPinTF{
            if self.newPinArray.count != 6{
                if string != ""{
                    
                    self.newPinArray.add(string)
                    self.newPinChange()
                }
                else{
                    self.newPinArray.removeLastObject()
                    self.newPinChange()
                }
            }
            else
            {
                if self.boolValue == false{
                    self.confirmPinTf.becomeFirstResponder()
                    return false
                }
                else{
                    if string != ""{
                        
                        self.newPinArray.add(string)
                        self.newPinChange()
                    }
                    else{
                        self.newPinArray.removeLastObject()
                        self.newPinChange()
                    }
                }
                
                
            }
            
        }
        
        return true
    }
    
    @objc func timerAction()
    {
        self.newPinTF.becomeFirstResponder()
    }
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        NotificationCenter.default.addObserver(self, selector: #selector(ResetfinalvalueViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//    }
//    @objc func keyboardWillShow(_ note : Notification) -> Void{
//        DispatchQueue.main.async { () -> Void in
//            self.returnBTN.isHidden = false
//            let keyBoardWindow = UIApplication.shared.windows.last
//            self.returnBTN.frame = CGRect(x: 0, y: (keyBoardWindow?.frame.size.height)!-53, width: 106, height: 53)
//            keyBoardWindow?.addSubview(self.returnBTN)
//            keyBoardWindow?.bringSubview(toFront: self.returnBTN)
//            UIView.animate(withDuration: (((note.userInfo! as NSDictionary).object(forKey: UIKeyboardAnimationCurveUserInfoKey) as AnyObject).doubleValue)!, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
//                self.view.frame = self.view.frame.offsetBy(dx: 0, dy: 0)
//            }, completion: { (complete) -> Void in
//                print("Complete")
//            })
//        }
//    }
    @objc func Done()
    {
//        if Reachability.isConnectedToNetwork() == true{
//
            print(self.newPinTF.text! , self.confirmPinTf.text!)
            
            print(self.confirmPinArray , self.newPinArray)
            
            let newPin = self.newPinArray.componentsJoined(by: "")
            let conPin = self.confirmPinArray.componentsJoined(by: "")
            print(newPin , conPin)
            if self.confirmPinArray.count == 6 && self.newPinArray.count == 6 && newPin == conPin{
                //self.showSpinner()
                let newPinSTR = self.newPinArray.componentsJoined(by: "")

                var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
                request.httpMethod = "POST"
                
                
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
                let postString1 =  String(format: "method=%@&mobilenumber=%@&otp=%@&account_new_pin=%@","newPIN",Mobileotppinvaluefinal,Mobilefinalvaluestringsetpin,self.newPinTF.text!)
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
                                    
                                }
                                if str2 == "1"
                                {
                                    let msgvalue  = dict.value(forKey:"msg")as!String
                                    let storyBoard : UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
                                    let firstVC = storyBoard.instantiateViewController(withIdentifier: "ResetfinalvalueViewController") as! ResetfinalvalueViewController
                                self.present(firstVC, animated: true, completion: nil)
                                   
                                }
                            }
                            
                        }
                        break
                    case .failure(_):
                        
                        
                        self.removeSpinner()
                        self.np1.backgroundColor = UIColor.lightGray
                        self.np2.backgroundColor = UIColor.lightGray
                        self.np3.backgroundColor = UIColor.lightGray
                        self.np4.backgroundColor = UIColor.lightGray
                        self.np5.backgroundColor = UIColor.lightGray
                        self.np6.backgroundColor = UIColor.lightGray
                        self.cn1.backgroundColor = UIColor.lightGray
                        self.cn2.backgroundColor = UIColor.lightGray
                        self.cn3.backgroundColor = UIColor.lightGray
                        self.cn4.backgroundColor = UIColor.lightGray
                        self.cn5.backgroundColor = UIColor.lightGray
                        self.cn6.backgroundColor = UIColor.lightGray
                        self.newPinTF.becomeFirstResponder()
                        self.newPinArray.removeAllObjects()
                        self.confirmPinArray.removeAllObjects()
                        break
                    }
                }
        }
              
         else
                
            {
                self.view.endEditing(true)
                self.np1.backgroundColor = UIColor.lightGray
                self.np2.backgroundColor = UIColor.lightGray
                self.np3.backgroundColor = UIColor.lightGray
                self.np4.backgroundColor = UIColor.lightGray
                self.np5.backgroundColor = UIColor.lightGray
                self.np6.backgroundColor = UIColor.lightGray
                self.cn1.backgroundColor = UIColor.lightGray
                self.cn2.backgroundColor = UIColor.lightGray
                self.cn3.backgroundColor = UIColor.lightGray
                self.cn4.backgroundColor = UIColor.lightGray
                self.cn5.backgroundColor = UIColor.lightGray
                self.cn6.backgroundColor = UIColor.lightGray
                self.newPinTF.becomeFirstResponder()
                self.newPinArray.removeAllObjects()
                self.confirmPinArray.removeAllObjects()


                if self.confirmPinTf.text?.count == 0 || self.confirmPinTf.text?.count != 6{
                   
                    let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
                    popOverVC.alertTitleString = "Error"
                    popOverVC.alertMessageString = "Please enter confirm pin"
                    self.addChildViewController(popOverVC)
                    popOverVC.view.frame = self.view.frame
                    self.view.addSubview(popOverVC.view)
                    popOverVC.didMove(toParentViewController: self)
                }
                if self.newPinTF.text?.count == 0 || self.newPinTF.text?.count != 6{

                  
                    let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
                    popOverVC.alertTitleString = "Error"
                    popOverVC.alertMessageString = "Please enter new pin"
                    self.addChildViewController(popOverVC)
                    popOverVC.view.frame = self.view.frame
                    self.view.addSubview(popOverVC.view)
                    popOverVC.didMove(toParentViewController: self)
                    
                }
                if self.newPinTF.text! != self.confirmPinTf.text!{
                   
                    let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
                    popOverVC.alertTitleString = "Error"
                    popOverVC.alertMessageString = "Confirm Pin not matching with new pin"
                    self.addChildViewController(popOverVC)
                    popOverVC.view.frame = self.view.frame
                    self.view.addSubview(popOverVC.view)
                    popOverVC.didMove(toParentViewController: self)

                }

            }
//        }
//        else{
//            self.removeSpinner()
//            let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NoInternetViewcontroller") as! NoInternetViewcontroller
//
//            self.addChildViewController(popOverVC)
//            popOverVC.view.frame = self.view.frame
//            self.view.addSubview(popOverVC.view)
//            popOverVC.didMove(toParentViewController: self)
//
//        }
    }
    
    func confirmPinChange()
    {
        if self.confirmPinArray.count == 0{
            
            self.cn1.backgroundColor = UIColor.lightGray
            self.cn2.backgroundColor = UIColor.lightGray
            self.cn3.backgroundColor = UIColor.lightGray
            self.cn4.backgroundColor = UIColor.lightGray
            self.cn5.backgroundColor = UIColor.lightGray
            self.cn6.backgroundColor = UIColor.lightGray
            self.boolValue = true
            self.newPinTF.becomeFirstResponder()
            
        }
        if self.confirmPinArray.count == 1{
            
            self.cn1.backgroundColor = UIColor.red
            self.cn2.backgroundColor = UIColor.lightGray
            self.cn3.backgroundColor = UIColor.lightGray
            self.cn4.backgroundColor = UIColor.lightGray
            self.cn5.backgroundColor = UIColor.lightGray
            self.cn6.backgroundColor = UIColor.lightGray
            
            
        }
        if self.confirmPinArray.count == 2{
            
            self.cn1.backgroundColor = UIColor.red
            self.cn2.backgroundColor = UIColor.red
            self.cn3.backgroundColor = UIColor.lightGray
            self.cn4.backgroundColor = UIColor.lightGray
            self.cn5.backgroundColor = UIColor.lightGray
            self.cn6.backgroundColor = UIColor.lightGray
            
        }
        if self.confirmPinArray.count == 3{
            
            self.cn1.backgroundColor = UIColor.red
            self.cn2.backgroundColor = UIColor.red
            self.cn3.backgroundColor = UIColor.red
            self.cn4.backgroundColor = UIColor.lightGray
            self.cn5.backgroundColor = UIColor.lightGray
            self.cn6.backgroundColor = UIColor.lightGray
            
        }
        if self.confirmPinArray.count == 4{
            
            self.cn1.backgroundColor = UIColor.red
            self.cn2.backgroundColor = UIColor.red
            self.cn3.backgroundColor = UIColor.red
            self.cn4.backgroundColor = UIColor.red
            self.cn5.backgroundColor = UIColor.lightGray
            self.cn6.backgroundColor = UIColor.lightGray
            
        }
        if self.confirmPinArray.count == 5{
            
            self.cn1.backgroundColor = UIColor.red
            self.cn2.backgroundColor = UIColor.red
            self.cn3.backgroundColor = UIColor.red
            self.cn4.backgroundColor = UIColor.red
            self.cn5.backgroundColor = UIColor.red
            self.cn6.backgroundColor = UIColor.lightGray
            
        }
        if self.confirmPinArray.count == 6{
            
            self.cn1.backgroundColor = UIColor.red
            self.cn2.backgroundColor = UIColor.red
            self.cn3.backgroundColor = UIColor.red
            self.cn4.backgroundColor = UIColor.red
            self.cn5.backgroundColor = UIColor.red
            self.cn6.backgroundColor = UIColor.red
            self.view.endEditing(true)
//            self.showSpinner()
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.Done), userInfo: nil, repeats: false)
        }
    }
    func newPinChange()
    {
        if self.newPinArray.count == 0{
            
            self.np1.backgroundColor = UIColor.lightGray
            self.np2.backgroundColor = UIColor.lightGray
            self.np3.backgroundColor = UIColor.lightGray
            self.np4.backgroundColor = UIColor.lightGray
            self.np5.backgroundColor = UIColor.lightGray
            self.np6.backgroundColor = UIColor.lightGray
            
            
        }
        if self.newPinArray.count == 1{
            
            self.np1.backgroundColor = UIColor.red
            self.np2.backgroundColor = UIColor.lightGray
            self.np3.backgroundColor = UIColor.lightGray
            self.np4.backgroundColor = UIColor.lightGray
            self.np5.backgroundColor = UIColor.lightGray
            self.np6.backgroundColor = UIColor.lightGray
            
            
        }
        if self.newPinArray.count == 2{
            
            self.np1.backgroundColor = UIColor.red
            self.np2.backgroundColor = UIColor.red
            self.np3.backgroundColor = UIColor.lightGray
            self.np4.backgroundColor = UIColor.lightGray
            self.np5.backgroundColor = UIColor.lightGray
            self.np6.backgroundColor = UIColor.lightGray
            
        }
        if self.newPinArray.count == 3{
            
            self.np1.backgroundColor = UIColor.red
            self.np2.backgroundColor = UIColor.red
            self.np3.backgroundColor = UIColor.red
            self.np4.backgroundColor = UIColor.lightGray
            self.np5.backgroundColor = UIColor.lightGray
            self.np6.backgroundColor = UIColor.lightGray
            
        }
        if self.newPinArray.count == 4{
            
            self.np1.backgroundColor = UIColor.red
            self.np2.backgroundColor = UIColor.red
            self.np3.backgroundColor = UIColor.red
            self.np4.backgroundColor = UIColor.red
            self.np5.backgroundColor = UIColor.lightGray
            self.np6.backgroundColor = UIColor.lightGray
            
        }
        if self.newPinArray.count == 5{
            
            self.np1.backgroundColor = UIColor.red
            self.np2.backgroundColor = UIColor.red
            self.np3.backgroundColor = UIColor.red
            self.np4.backgroundColor = UIColor.red
            self.np5.backgroundColor = UIColor.red
            self.np6.backgroundColor = UIColor.lightGray
            
        }
        if self.newPinArray.count == 6{
            print(newPinArray,newPinArray.count)
            self.np1.backgroundColor = UIColor.red
            self.np2.backgroundColor = UIColor.red
            self.np3.backgroundColor = UIColor.red
            self.np4.backgroundColor = UIColor.red
            self.np5.backgroundColor = UIColor.red
            self.np6.backgroundColor = UIColor.red
            self.confirmPinTf.becomeFirstResponder()
            
        }
    }
    func showSpinner(){
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.view.addSubview(self.coverView)
        
        imageview.frame = CGRect(x:screenSize.width/2-25,y:screenSize.height/2-25,width:50,height:50)
        imageview.image = UIImage.gif(name: "loader2")
        self.coverView.addSubview(imageview)
    }
    func removeSpinner(){
        self.imageview.removeFromSuperview()
        self.coverView.removeFromSuperview()
    }
    
    
}
