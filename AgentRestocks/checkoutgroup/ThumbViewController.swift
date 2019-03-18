//
//  ThumbViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 02/01/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit

///https://stackoverflow.com/questions/42161476/swift-3-image-view-with-tap-gesture/42162686

import LocalAuthentication
import Alamofire
import AlamofireImage

class ThumbViewController: UIViewController
{
    @IBOutlet weak var totaldemoview: UIView!
    @IBOutlet weak var totalTopview: UIView!
    @IBOutlet weak var Totalbottomview: UIView!
    @IBOutlet weak var middelviewfinal: UIView!
    @IBOutlet weak var mythumbDirectimage: UIImageView!
    @IBOutlet weak var pleaseplaceyourfinagevalue: UILabel!
    
    //// fingerprint screen Design
    
    var timersingel = Timer()
    
    var CheckoutViewControllerstringfinal = String()
    
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
    var selleropinion = NSArray()
    var textone = NSArray()
    var texttwo = NSArray()
    var textthree = NSArray()

    var fristtwo = String()
    
    var orginalpinvalue = String()
    
    var checkoputselectedint = Int()
    
    var viewfinalvalue = UIView()
    
    

    @IBOutlet weak var totalconfirmscrennvaluetwo: UIView!

    var MycelleridTotalvalue = String()
    var Chekoutadressid = String()
    
    
    var coverView = UIView()
    var imageView = UIImageView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.totalTopview.layer.addBorder(edge:.bottom, color: UIColor.textfiledbottomcolorside(), thickness: 0.8)
        self.Totalbottomview.layer.addBorder(edge:.top, color: UIColor.textfiledbottomcolorside(), thickness: 0.8)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ThumbViewController.connected(_:)))
        
        self.mythumbDirectimage.isUserInteractionEnabled = true
        self.mythumbDirectimage.addGestureRecognizer(tapGestureRecognizer)
        
        
        
    }
    
    @objc func connected(_ sender:AnyObject)
    {
        thumbvalue()
    }
    func thumbvalue()
    {
        print("hello there!.. You have clicked the touch ID")
        
        let myContext = LAContext()
        let myLocalizedReasonString = "Biometric Authntication testing !! "
        
        var authError: NSError?
        if #available(iOS 8.0, macOS 10.12.1, *) {
            if myContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
                myContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: myLocalizedReasonString) { success, evaluateError in
                    
                    DispatchQueue.main.async {
                        if success {
                            // User authenticated successfully, take appropriate action
                            //                            self.pleaseplacefingerprint.text = "User authenticated successfully "
                            
                            
                            self.pingerprintvalue()
                            
                        } else {
                            // User did not authenticate successfully, look at error and take appropriate action
                            self.pleaseplaceyourfinagevalue.text = "Sorry!!... User did not authenticate successfully"
                        }
                    }
                }
            } else {
                // Could not evaluate policy; look at authError and present an appropriate message to user
                pleaseplaceyourfinagevalue.text = "Sorry!!.. Could not evaluate policy."
            }
        } else {
            // Fallback on earlier versions
            
            pleaseplaceyourfinagevalue.text = "Ooops!!.. This feature is not supported."
        }
    }
    @IBAction func usebutton(_ sender: UIButton)
    {
        self.totalconfirmscrennvaluetwo.isHidden = false
//        DispatchQueue.main.async
//            {
//         let secondvalue = self.storyboard?.instantiateViewController(withIdentifier:"PinViewController")as!PinViewController
//                secondvalue.viewfinalvalue = self.totalconfirmscrennvaluetwo
//            self.present(secondvalue, animated: true, completion:nil)
//        }
//
        let PinViewControllerVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PinViewController") as! PinViewController
        PinViewControllerVC.Totalpintwovalue = self.totalconfirmscrennvaluetwo
        self.addChildViewController(PinViewControllerVC)
        PinViewControllerVC.view.frame = self.view.frame
        self.totalconfirmscrennvaluetwo.addSubview(PinViewControllerVC.view)
        PinViewControllerVC.didMove(toParentViewController: self)
        
//        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "comboViewController") as! comboViewController
//        self.addChildViewController(popOverVC)
//        popOverVC.view.frame = self.view.frame
//        self.view.addSubview(popOverVC.view)
//        popOverVC.didMove(toParentViewController: self)
    
    }
    
    @IBAction func Closebutton(_ sender: UIButton)
    {
        self.viewfinalvalue.isHidden = true
    }
    
    func pingerprintvalue()
    {
        self.showSpinner()

        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let defaulst = UserDefaults.standard

        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.CheckoutViewControllerstringfinal = Reviewfinaluseroid
        }
        
        
        if let ChekoutadressidTotal:String = defaulst.value(forKey: "MyadressoneTotal")as?String
        {
            self.Chekoutadressid = ChekoutadressidTotal
        }

        
        if let MycelleridTotalvalue:String = defaulst.value(forKey: "Mycelleridfinalvalue")as?String
        {
            self.MycelleridTotalvalue = MycelleridTotalvalue
        }
     
        
        let aStr = String(format: "%@%@%@", "[",self.MycelleridTotalvalue,"]")
        print(aStr)
     
     
        let postString =  String(format: "method=%@&pin=%@@&Promo=%@&addressID=%@&paymentIDS=%@&userid=%@","makePayment","xxxxxx","",self.Chekoutadressid,aStr,self.CheckoutViewControllerstringfinal)
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
