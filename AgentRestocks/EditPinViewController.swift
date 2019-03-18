//
//  EditPinViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 23/10/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class EditPinViewController: UIViewController {
    var coverView = UIView()
    var imageView = UIImageView()
    var confirmpasswordsingel = String()
    var confirmbusinnesnumber = String()
    
    let defaulst = UserDefaults.standard
    
    
    @IBOutlet weak var veryalertview: UIView!
    var timersingeltwo = Timer()
    var Editstr2 = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tappin = UITapGestureRecognizer(target: self, action: #selector(self.handleNumberpinEdit(_:)))
        Topview.addGestureRecognizer(tappin)
        Topview.isUserInteractionEnabled = true
        self.viewtopview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness: 0.6)
        self.bottomview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness: 0.6)
        confirmpasswordsingel = defaulst.value(forKey:"Mypassword")as!String
        confirmbusinnesnumber = defaulst.value(forKey:"Mybusinessnumber")as!String
     
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func handleNumberpinEdit(_ sender: UITapGestureRecognizer)
    {
        self.view.removeFromSuperview()
    }
    @IBOutlet weak var Topview: UIView!
    
    @IBOutlet weak var bottomview: UIView!
    
    @IBOutlet weak var viewtopview: UIView!
    
    @IBAction func Closebutton(_ sender: UIButton)
    {
        self.view.removeFromSuperview()

    }
    @IBAction func Nobutton(_ sender: UIButton)
    {
        self.view.removeFromSuperview()
    }
    
    @IBAction func yesbutton(_ sender: Any)
    {
       // self.Verifyotpmethod()
        self.EditsetPin()
        
    }
    func Verifyotpmethod()
    {
        self.Topview.isHidden = true
        self.veryalertview.isHidden = false
        self.showSpinner()
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let postString =  String(format: "method=%@&mobilenumber=%@","resendOTPforforgotPin",confirmbusinnesnumber)
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
                
          
                
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    print(dict)
                    if let statusstring:NSNumber = dict.value(forKey:"status")as?NSNumber
                    {
                        print(statusstring)
                        var str2 = statusstring.stringValue
                        print(str2)
                        if  str2 == "2"
                        {
                            self.removeSpinner()
                            let msgvalue  = dict.value(forKey:"msg")as!String
                            self.veryalertview.isHidden = false
                            self.timersingeltwo = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(self.timerActionTwo), userInfo: nil, repeats: false)
                            self.view.makeToast(msgvalue)
                    }
                        if  str2 == "1"
                        {
                            self.removeSpinner()
                            let msgvalue  = dict.value(forKey:"msg")as!String
                            self.veryalertview.isHidden = false
                            self.timersingeltwo = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(self.timerActionTwo), userInfo: nil, repeats: false)
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
    
    func EditsetPin()  {
        self.Topview.isHidden = true
        self.veryalertview.isHidden = false
        self.showSpinner()
        
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
    let postString =  String(format:"method=%@&mobilenumber=%@&logintype=%@","resetPIN",confirmbusinnesnumber,"4")
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
                        self.Editstr2 = statusstring.stringValue
                        
                        
                        
                        if  self.Editstr2 == "0"
                        {
                            self.removeSpinner()
                            let msgvalue  = dict.value(forKey:"msg")as!String
                            self.veryalertview.isHidden = true
                            
//                            self.timersingeltwo = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(self.timerActionTwo), userInfo: nil, repeats: false)
                            self.view.makeToast(msgvalue)
                        }
                        if  self.Editstr2 == "1"
                        {
                            self.removeSpinner()
                            let msgvalue  = dict.value(forKey:"msg")as!String
                            self.veryalertview.isHidden = false
                            self.timersingeltwo = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(self.timerActionTwo), userInfo: nil, repeats: false)
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
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // No need for semicolon
        self.view.removeFromSuperview()
    }
    
 @objc func timerActionTwo() {
    DispatchQueue.main.async {
        
        let viewfirst = self.storyboard?.instantiateViewController(withIdentifier:"ChangePinViewController")as!ChangePinViewController
        self.present(viewfirst, animated: true, completion:nil)
        
    }
    
        }
   
    func showSpinner(){
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.veryalertview.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(imageView)
    }
    func removeSpinner(){
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()
        
    }
}
