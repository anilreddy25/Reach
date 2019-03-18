//
//  DemochatViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 21/02/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class DemochatViewController: UIViewController,UITextFieldDelegate
{
    @IBOutlet weak var mytopview: UIView!
    @IBOutlet weak var mybackbutton: UIButton!
    @IBOutlet weak var viewtop: UIView!
    @IBOutlet weak var myimageviewround: UIImageView!
    @IBOutlet weak var commendname: UILabel!
    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var drop: UIButton!
    @IBOutlet weak var viewtwo: UIView!
    @IBOutlet weak var mytextfielddelgate: UITextField!
    @IBOutlet weak var buttonarrow: UIButton!
    @IBOutlet weak var myshout: UIButton!
    var CommentTotaltextfield  = String()
    var Commenttext  = String()
    var useridbiling1 = String()
    var productdescriptionuseridbiling = String()
    var myagentTotalvalue = String()
    var postStringone  = String()
    var Myauthorisationstringfinalvalue = String()
    var profileidstringTotal  = String()
     var statusTotalvalue = String()
    var namevalue = String()
    @IBOutlet weak var emaillabel: UILabel!
    var randomNumber = Int()
    var secondRandomNumber = Int()
    @IBOutlet weak var mytextlabel: UILabel!
   var SingelMarketshoutidvalue1 = String()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        print(namevalue)
        mytopview.layer.shadowOffset = CGSize(width: 0, height: 3)
        mytopview.layer.shadowOpacity = 0.6
        mytopview.layer.shadowRadius = 3.0
        mytopview.layer.shadowColor = UIColor.color2().cgColor
        self.mytextfielddelgate.useUnderline()
        self.mytextfielddelgate.setLeftPaddingPoints(12)
        self.mytextfielddelgate.setRightPaddingPoints(12)
        self.mytextfielddelgate.delegate = self
        self.mytextfielddelgate.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        let colo = UIColor.black
        let attributes = [
            NSAttributedStringKey.foregroundColor: colo
        ]
        self.mytextfielddelgate.attributedPlaceholder = NSAttributedString(string:"Comment here", attributes:attributes)
        myshout.layer.cornerRadius = 16
        myshout.layer.masksToBounds = true
        self.commendname.text = namevalue
        let stringtotalvalue = NSString(format:"%@%@","@",namevalue)
        emaillabel.text = stringtotalvalue as String
        randomNumber = 140
    }
    
    @objc func textFieldDidChange(_ textField: UITextField)
    {
        self.CommentTotaltextfield = self.mytextfielddelgate.text!
        self.Commenttext = "Commenttext"
        let totalvalueis = self.mytextfielddelgate.text
        let secondRandomNumber = Int(totalvalueis!.count)
        let subTot = 140 - secondRandomNumber
        let total = "\(subTot)"
        if total.count > 0
        {
            self.mytextlabel.text = total
        }
    }
    @IBAction func mybackbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    @IBAction func mydropbutton(_ sender: UIButton)
    {
        
    }
    @IBAction func buttonarrow(_ sender: UIButton)
    {

    }
    @IBAction func myshoutTotal(_ sender: UIButton)
    {
        if self.Commenttext == "Commenttext"
        {
            DispatchQueue.main.async
            {
            self.shoutwithcommentValue()
            }
        }
        else
        {
            self.view.makeToast("Please Enter text to Comment")
        }
    }
    
    @IBAction func buttonshout(_ sender: UIButton)
    {
        
    }
    func shoutwithcommentValue()
    {
        //        self.showSpinner()
        var request = URLRequest(url: URL(string:AgentConstants.MarketFinalvalue)!)
        request.httpMethod = "POST"
        let dafaults = UserDefaults.standard
        if let Reviewfinaluseroid:String = dafaults.value(forKey:"MyLoginfinalvalue")as?String
        {
            self.useridbiling1 = Reviewfinaluseroid
        }
        if let Reviewfinaluseroid:String = dafaults.value(forKey: "myproductidvalue")as?String
        {
            self.productdescriptionuseridbiling = Reviewfinaluseroid
        }
        
        if let Myauthorisationfinlavalue:String = dafaults.value(forKey: "Myauthorisation")as?String
        {
            self.Myauthorisationstringfinalvalue = Myauthorisationfinlavalue
        }
        if let Myagentidfinlavalue:String = dafaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
    
        let profileTotalshout = NSString(format:"%@%@%@","[",self.profileidstringTotal,"]")
        if self.Commenttext == "Commenttext"
        {
            
            postStringone =  String(format: "method=%@&shoutId=%@&agentId=%@&shoutcomment=%@&type=%@&ids=%@", "optionshout", self.SingelMarketshoutidvalue1,self.useridbiling1,self.CommentTotaltextfield,"comment",profileTotalshout)
            print(postStringone)
        }
        else
        {
            postStringone =  String(format: "method=%@&shoutId=%@&agentId=%@&shoutcomment=%@&type=%@&ids=%@", "optionshout", self.productdescriptionuseridbiling,self.useridbiling1,"","comment","[]")
            print(postStringone)
        }
        
        request.httpBody = postStringone.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        request.addValue(self.Myauthorisationstringfinalvalue, forHTTPHeaderField: "Authorization")
        request.addValue(self.useridbiling1, forHTTPHeaderField:"AgentID")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                print(response.result)
                let value = response.response
                
                let valuetwo = response.data
                
                if let response = response as? HTTPURLResponse
                {
                    if response.statusCode == 200 {
                    }
                }
                if let httpResponse1 = value
                {
                    if let xDemAuth = httpResponse1.allHeaderFields["Authorization"] as? String {
                        
                        let defaults = UserDefaults.standard
                        defaults.set(xDemAuth, forKey:"Myauthorisation")
                        defaults.synchronize()
                    }
                }
                
                if let dict:NSDictionary = response.result.value as? NSDictionary
                {
                    print(dict)
                    
                    if let statusTotalvaluefinal:String = dict.value(forKey:"StatusMsg") as?String
                    {
                        self.statusTotalvalue = statusTotalvaluefinal
                        
                        if self.statusTotalvalue == "Success"
                        {
                            
                            let defultstotal = UserDefaults.standard
                            defultstotal.set("Comments", forKey:"Mycommentstotal")
                            defultstotal.synchronize()
                            
                            self.view.makeToast(self.statusTotalvalue)
                            DispatchQueue.main.async
                                {
                                    self.dismiss(animated:true, completion:nil)
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
}
