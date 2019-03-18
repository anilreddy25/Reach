//
//  PinViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 02/01/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
class PinViewController: UIViewController,UITextFieldDelegate
{
    @IBOutlet weak var totaltopviewfinal: UIView!
    @IBOutlet weak var pinboardertop: UIView!
    @IBOutlet weak var textfiledone: UITextField!
    @IBOutlet weak var viewone: UIView!
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
    var timersingel = Timer()
    var CheckoutViewControllerstringfinal = String()

///// Own Design code
    var  sellers_header = String ()
    var  amountsellers_header = String ()
    var itemssellers_header = String ()
    var itemssellersquantity_header = String ()
    var itemssellersquantity_message = String ()
    var itemssellersquantity_Status = String ()
    var itemssellersquantity_StatusMsg = String ()
    var types = NSArray()
    var typesDict = NSDictionary()
    var sellersList = NSArray()
    var sellersid = NSArray()
    var sellerschecked = NSArray()
    var sellerscheckbox_text = NSArray()
    var sellerscheckbox_items = NSArray()
    var sellerscheckbox_quantity = NSArray()
    var sellerscheckbox_amount = NSArray()
    var sellersidtwo = NSArray()
    var sellerscheckedtwo = NSArray()
    var sellerscheckbox_texttwo = NSArray()
    var sellerscheckbox_itemstwo = NSArray()
    var sellerscheckbox_quantitytwo = NSArray()
    var sellerscheckbox_amounttwo = NSArray()
    var sellerscheckbox_optiuon = String()
    var sellerscheckbox_text1 = [String]()
    var sellerscheckbox_text2 = [String]()
    var sellerscheckbox_text3 = [String]()
    var sellerscheckbox_text3_color1 = [String]()
    var sellerscheckbox_text3_color2 = [String]()
    var typesNsarryay = NSArray()
    var optionsTypesarrayfinal = NSArray()
    var sellerListTypesarrayfinal = NSArray()
    var orginalpinvalue = String()
    var fristtwo = String()
    @IBOutlet weak var mycancelbuttonvalue: UIButton!
    var viewfinalvalue = UIView()
    @IBOutlet weak var myconfirmthisordervalue: UIButton!
    @IBOutlet weak var myforgotbutton: UIButton!
    
    var Totalpintwovalue = UIView()
    
    var MycelleridTotalvalue = String()
    
    var Chekoutadressid = String()
    
    var coverView = UIView()
    var imageView = UIImageView()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        print("Method calledvalue")
        
        self.pinboardertop.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        
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
//        textfiledone.resignFirstResponder()
        
        textfiledone.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClicked))
        
        textfiledtwo.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClicked))
        textfiledthree.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClicked))
        textfiledfour.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClicked))
        textfiledfour.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClicked))
        textfiledfive.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClicked))
        textfiledsix.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClicked))
        self.totaltopviewfinal.roundedButton()
        
//        self.textfiledone.becomeFirstResponder()
        
        self.textfiledone.resignFirstResponder()


        
    }
    @objc func doneButtonClicked(_ sender: Any) {
        
        
        
        if textfiledone.text != "" && textfiledtwo.text != "" && textfiledthree.text != "" && textfiledfour.text != "" && textfiledfive.text != "" && textfiledsix.text != ""
        {
            timersingel = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerActioncheckout), userInfo: nil, repeats: false)
            
            
            
        }
        
        
    }
    @objc func timerActioncheckout()
    {
        DispatchQueue.main.async {
            let view = self.storyboard?.instantiateViewController(withIdentifier:"orederconfirmListViewController")as! orederconfirmListViewController
            self.present(view, animated:true, completion:nil)
            
        }
    }
    
    
    
    
    @IBAction func CancelbuttonTop(_ sender: UIButton)
    {
        
        
    }
    @IBAction func Forgotpin(_ sender: UIButton)
    {
        
        
    }
    func Resetprintvalue()
    {
        self.showSpinner()
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        //   let postString = "method=landingPage&userid=511111117"
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.CheckoutViewControllerstringfinal = Reviewfinaluseroid
        }
        
        
        if let ChekoutadressidTotal:String = defaulst.value(forKey: "MyadressoneTotal")as?String
        {
            self.Chekoutadressid = ChekoutadressidTotal
        }
        
        
        
        
        let stringNewpin = NSString(format:"%@%@%@%@%@%@",textfiledone.text!,textfiledtwo.text!,textfiledthree.text!,textfiledfour.text!,textfiledfive.text!,textfiledsix.text!)
        print(stringNewpin)
//        let value = self.sellersidtwo[0]
        
        if let MycelleridTotalvalue:String = defaulst.value(forKey: "Mycelleridfinalvalue")as?String
        {
            self.MycelleridTotalvalue = MycelleridTotalvalue
        }
        
    
//    "method=makePayment&pin="+pin+"&Promo="+st+"&addressID="+ClassicSingleton.selectedAddress+"&paymentIDS="+getIDS()+"&userid="+userId;

        
        
        let aStr = String(format: "%@%@%@", "[",self.MycelleridTotalvalue,"]")
        print(aStr)
        let postString =  String(format: "method=%@&pin=%@&Promo=%@&addressID=%@&paymentIDS=%@&userid=%@","makePayment",stringNewpin,"",self.Chekoutadressid,self.MycelleridTotalvalue,self.CheckoutViewControllerstringfinal)
        print(postString)
        request.httpBody = postString.data(using: .utf8)
        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    print(dict)
                    self.removeSpinner()

                    DispatchQueue.main.async {
                        let OrderDoneView = self.storyboard?.instantiateViewController(withIdentifier:"OrderDoneViewController")as!OrderDoneViewController
                        self.present(OrderDoneView, animated:true, completion:nil)
                        
                    }
                }
                
                break
            case .failure(_):
                break
            }
            
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if ((textField.text?.count)! < 1 ) && (string.count > 0) {
            if textField == textfiledone {
                textfiledone.backgroundColor = UIColor.red
                textfiledone.textColor = UIColor.red
                viewone.backgroundColor =  UIColor.red
                textfiledtwo.becomeFirstResponder()
            }
            
            if textField == textfiledtwo
            {
                textfiledtwo.backgroundColor = UIColor.red
                textfiledtwo.textColor = UIColor.red
                viewtwo.backgroundColor =  UIColor.red
                textfiledthree.becomeFirstResponder()
            }
            
            if textField == textfiledthree
            {
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
                textfiledsix.resignFirstResponder()
            }
            
            textField.text = string
            
            if (textfiledone.text?.count)! > 0 && (textfiledtwo.text?.count)! > 0 &&  (textfiledthree.text?.count)! > 0 && (textfiledfour.text?.count)! > 0 &&  (textfiledfive.text?.count)! > 0 && (textfiledsix.text?.count)! > 0
            {
                let stringNewpin = NSString(format:"%@%@%@%@%@%@",textfiledone.text!,textfiledtwo.text!,textfiledthree.text!,textfiledfour.text!,textfiledfive.text!,textfiledsix.text!)
                print(stringNewpin)
                
                let defaultsfinalvalue = UserDefaults.standard
                if let Description_qty_disp:String = defaultsfinalvalue.value(forKey: "Mypinvalue") as? String {
                    self.orginalpinvalue = Description_qty_disp
                }
                
                print(defaultsfinalvalue.value(forKey: "Mypinvalue"))
                print(self.orginalpinvalue)
                print(stringNewpin)
                
                if stringNewpin as String ==  self.orginalpinvalue
                {
                    DispatchQueue.main.async {
                        self.Resetprintvalue()
                    }
                }
                    
                else
                {
                    self.textfiledone.backgroundColor = UIColor.textfiledbottomcolorside()
                    self.textfiledone.textColor = UIColor.textfiledbottomcolorside()
                    self.viewone.backgroundColor =  UIColor.textfiledbottomcolorside()
                    self.textfiledone.text = ""
                    
                    self.textfiledtwo.backgroundColor = UIColor.textfiledbottomcolorside()
                    self.textfiledtwo.textColor = UIColor.textfiledbottomcolorside()
                    self.viewtwo.backgroundColor =  UIColor.textfiledbottomcolorside()
                    self.textfiledtwo.text = ""
                    
                    
                    self.textfiledthree.backgroundColor = UIColor.textfiledbottomcolorside()
                    self.textfiledthree.textColor = UIColor.textfiledbottomcolorside()
                    self.viewthree.backgroundColor =  UIColor.textfiledbottomcolorside()
                    self.textfiledthree.text = ""
                    
                    
                    self.textfiledfour.backgroundColor = UIColor.textfiledbottomcolorside()
                    self.textfiledfour.textColor = UIColor.textfiledbottomcolorside()
                    self.viewfour.backgroundColor =  UIColor.textfiledbottomcolorside()
                    self.textfiledfour.text = ""
                    
                    
                    self.textfiledfive.backgroundColor = UIColor.textfiledbottomcolorside()
                    self.textfiledfive.textColor = UIColor.textfiledbottomcolorside()
                    self.viewfive.backgroundColor =  UIColor.textfiledbottomcolorside()
                    self.textfiledfive.text = ""
                    
                    
                    self.textfiledsix.backgroundColor = UIColor.textfiledbottomcolorside()
                    self.textfiledsix.textColor = UIColor.textfiledbottomcolorside()
                    self.viewsix.backgroundColor =  UIColor.textfiledbottomcolorside()
                    
                    self.textfiledsix.text = ""
//                    self.demotwo.isHidden = true
//                    self.confirmorderfinalview.isHidden = true
//                    self.fingerprintview.isHidden = true
//                    self.pinviewtwo.isHidden = true
             
                    
                    
                    let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
                    popOverVC.alertMessageString = "Login Failed"
                    popOverVC.alertTitleString = "Alert"
                    self.addChildViewController(popOverVC)
                    popOverVC.view.frame = self.view.frame
                    self.view.addSubview(popOverVC.view)
                    popOverVC.didMove(toParentViewController: self)
                    
                    //                    self.textfiledone.becomeFirstResponder()
                    
                }
            }
            
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
                //                textfiledfive.becomeFirstResponder()
                
                textfiledfive.becomeFirstResponder()
                
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

    @IBAction func mycancelbutton(_ sender: UIButton)
    {
        self.viewfinalvalue.isHidden = true
        self.Totalpintwovalue.isHidden = true
        self.view.removeFromSuperview()
    }
    
    
    @IBAction func myconfirmthisordervalue(_ sender: UIButton)
    {
        
        
    }
    
    @IBAction func Myforgotbutton(_ sender: UIButton)
    {
        DispatchQueue.main.async
            {
            let Democodevalue = self.storyboard?.instantiateViewController(withIdentifier:"ForgotPasswordVC")as!ForgotPasswordVC
            self.present(Democodevalue, animated:true, completion:nil)
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
        
    }
}


extension PinViewController: UIGestureRecognizerDelegate
{
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool
    {
        return true
    }
}
