//
//  deletecartViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 13/11/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class deletecartViewController: UIViewController {
    @IBOutlet weak var middleviewfinalvalue: UIView!
    
    @IBOutlet weak var deletecartviewfinalvalue: UIView!
    var getcaruseridvalue = String()
    var statusnumbervalue = String()
    var statusstring = NSString()
    var AcessTokenfinalstring = String()
    var myagentTotalvalue  = String()
    var timer = Timer()
 
    
    @IBOutlet weak var cartEmptyView: UIView!
    
    @IBOutlet weak var deletecarttotalviewfinal: UIView!
    
    @IBOutlet weak var smalllineviewtotal: UIView!
    @IBOutlet weak var deletecarttopviewfinalvalueis: UIView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.middleviewfinalvalue.layer.addBorder(edge:.top, color: UIColor.textfiledbottomcolorside(), thickness:0.6)
        self.middleviewfinalvalue.layer.addBorder(edge:.bottom, color: UIColor.textfiledbottomcolorside(), thickness:0.6)
        let DeletetapView = UITapGestureRecognizer(target: self, action: #selector(self.handleNumberChatview(_:)))
        deletecartviewfinalvalue.addGestureRecognizer(DeletetapView)
        deletecartviewfinalvalue.isUserInteractionEnabled = true
        
        self.deletecarttotalviewfinal.roundedButton()
        self.deletecarttopviewfinalvalueis.roundedButton()
        
        self.smalllineviewtotal.layer.cornerRadius = 5.0
        self.smalllineviewtotal.layer.masksToBounds = true
    }
    @objc func handleNumberChatview(_ sender: UITapGestureRecognizer)
    {
        self.view.removeFromSuperview()
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    @IBAction func Nobutton(_ sender: UIButton)
    {
        self.view.removeFromSuperview()
    }
    @IBAction func yesbutton(_ sender: UIButton)
    {
        self.Deletecartvalue()
    }
    

    func Deletecartvalue()
    {
        //  http://172.31.0.13/NumberMall/agent_Gwy.php?&method=getCartList&userid=127&productid=&updatedQuantity=&sellerID=
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let defaults = UserDefaults.standard
        
        
        if let Reviewfinaluseroid:String = defaults.value(forKey: "myuseridvaluefinal")as?String
        {
            self.getcaruseridvalue = Reviewfinaluseroid
        }
        
        if let Reviewfinaluseroid:String = defaults.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }

        
        
        let postString1 =  String(format: "method=%@&userid=%@&productid=%@&updatedQuantity=%@&sellerID=%@&deviceType=%@","clearCart",self.getcaruseridvalue,"","","","mobile")
        print(postString1)
        request.httpBody = postString1.data(using: .utf8)
        request.addValue(AcessTokenfinalstring, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    print(dict)
                    self.statusstring = dict.value(forKey:"status")as!NSString
                   
                    if  self.statusstring == "1"
                    {
//                        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NoInternetViewcontroller") as! NoInternetViewcontroller
//
//                        self.addChildViewController(popOverVC)
//                        popOverVC.view.frame = self.view.frame
//                        self.view.addSubview(popOverVC.view)
//                        popOverVC.didMove(toParentViewController: self)
//                    }
                    
                        self.dismiss(animated:true, completion:nil)

                 }
                }
                
                break
            case .failure(_):
                break
            }
            
            
        }
        
    }
    
    @objc func timerActionCartvalue()  {
        self.dismiss(animated:true, completion:nil)
    }


}
