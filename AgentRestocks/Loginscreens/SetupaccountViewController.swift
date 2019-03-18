//
//  SetupaccountViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 28/01/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class SetupaccountViewController: UIViewController,UITextFieldDelegate
{
    @IBOutlet weak var Topviewfinal: UIView!
    @IBOutlet weak var gstnumber: UITextField!
    @IBOutlet weak var businessname: UITextField!
    @IBOutlet weak var Emailid: UITextField!
    @IBOutlet weak var nametextfield: UITextField!
    @IBOutlet weak var myconfirm: UIButton!
   
    @IBOutlet weak var Enternamelabel: UILabel!
    @IBOutlet weak var Entermeilid: UILabel!
    @IBOutlet weak var enterbusinessname: UILabel!
    @IBOutlet weak var EnterGstname: UILabel!
    
   var Mymobilenumebrfinalvalue = String()
    var coverView = UIView()
    var imageView = UIImageView()

    var stringfinalvalue = String()
    
    @IBOutlet weak var backalertview: UIView!
    
    @IBOutlet weak var alertviewtop: UIView!
    
    @IBOutlet weak var alertviewmiddel: UIView!
    @IBOutlet weak var alertviewbottom: UIView!
    
    var validEmailvalue = String()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        myconfirm.layer.cornerRadius = 34
        myconfirm.clipsToBounds = true

        gstnumber.useUnderline()
        businessname.useUnderline()
        Emailid.useUnderline()
        nametextfield.useUnderline()
        
        nametextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

        Topviewfinal.layer.shadowOffset = CGSize(width: 0, height: 3)
        Topviewfinal.layer.shadowOpacity = 0.6
        Topviewfinal.layer.shadowRadius = 3.0
        Topviewfinal.layer.shadowColor = UIColor.color2().cgColor
        
        nametextfield.delegate = self
        businessname.delegate = self
        Emailid.delegate = self
        gstnumber.delegate = self

        
        nametextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
//        nametextfield.keyboardType = .numberPad
        
        businessname.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
//        businessname.keyboardType = .numberPad
        
        Emailid.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
//        Emailid.keyboardType = .numberPad
        
        gstnumber.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
//        gstnumber.keyboardType = .numberPad
        
        Topviewfinal.layer.shadowOffset = CGSize(width: 0, height: 3)
        Topviewfinal.layer.shadowOpacity = 0.6
        Topviewfinal.layer.shadowRadius = 3.0
        Topviewfinal.layer.shadowColor = UIColor.color2().cgColor
        
        alertviewmiddel.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.4)
        alertviewmiddel.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.4)
        let colo = UIColor.gray
        let attributes = [
            NSAttributedStringKey.foregroundColor: colo
        ]
        nametextfield.attributedPlaceholder = NSAttributedString(string:"Name", attributes:attributes)
        businessname.attributedPlaceholder = NSAttributedString(string:"Business name", attributes:attributes)
        Emailid.attributedPlaceholder = NSAttributedString(string:"Email ID", attributes:attributes)
        gstnumber.attributedPlaceholder = NSAttributedString(string:"GST number of this address (optional)", attributes:attributes)

        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField)
    {
//        if textField == nametextfield
//        {
//            if (textField.text?.count)! > 0
//            {
//                self.Enternamelabel.isHidden = true
//                self.Enternamelabel.text = " Enter Name"
//            }
//            else
//            {
//                self.Enternamelabel.isHidden = false
//                self.Enternamelabel.text = " Enter Name"
//            }
//        }
//         if textField == businessname
//        {
//            if (textField.text?.count)! > 0
//            {
//                self.enterbusinessname.isHidden = true
//                self.enterbusinessname.text = " Enter Name"
//            }
//            else
//                {
//                    self.enterbusinessname.isHidden = false
//                    self.enterbusinessname.text = "Enter Valid Name"
//            }
//        }
//        else if textField == Emailid
//        {
//            if (textField.text?.count)! > 0
//            {
//
//                if ((textField.text!.count) > 1)
//                {
//                    if (isValidEmailfinal(email:textField.text!))
//                    {
//                        self.Entermeilid.isHidden = true
//                        self.Entermeilid.text = "Enter Valid  Email Id"
//                        self.Entermeilid.textColor = UIColor.red
//                    }
//                    else{
//                        self.Entermeilid.isHidden = false
//                        self.Entermeilid.text = "Enter Valid Email Id"
//                        self.Entermeilid.textColor = UIColor.red
//                    }
//                }
//            }
//            else{
//                self.Entermeilid.isHidden = false
//                self.Entermeilid.text = "Enter Valid Email Id"
//                self.Entermeilid.textColor = UIColor.red
//            }
//        }
//        if (gstnumber.text!.count) > 0
//        {
//            stringfinalvalue = "stringfinalvalue"
//            if gstnumber.text?.count == 15
//            {
//                stringfinalvalue = ""
//
//                self.EnterGstname.isHidden = true
//                self.EnterGstname.text = "Enter GST number"
//                self.Entermeilid.textColor = UIColor.red
//            }
//            else
//            {
//                self.EnterGstname.isHidden = false
//                self.EnterGstname.text = "Enter valid GST number"
//                self.EnterGstname.textColor = UIColor.red
//            }
//        }
        
                if textField == nametextfield
                {
                    if (textField.text?.count)! > 0
                    {
                        self.Enternamelabel.isHidden = true
                        self.Enternamelabel.text = " Enter Name"
                    }
                    
                }
                 if textField == businessname
                {
                    if (textField.text?.count)! > 0
                    {
                        self.enterbusinessname.isHidden = true
                        self.enterbusinessname.text = " Enter Name"
                    }
                   
                }
                else if textField == Emailid
                {
                    if (textField.text?.count)! > 0
                    {
        
                                self.Entermeilid.isHidden = true
                                self.Entermeilid.text = "Enter Valid  Email Id"
                                self.Entermeilid.textColor = UIColor.red
                        
                    }
                    
                }
                if (gstnumber.text!.count) > 0
                {
                    stringfinalvalue = "stringfinalvalue"
                    if gstnumber.text?.count == 15
                    {
                        stringfinalvalue = ""
        
                        self.EnterGstname.isHidden = true
                        self.EnterGstname.text = "Enter GST number"
                        self.Entermeilid.textColor = UIColor.red
                    }
                    else
                    {
                        self.EnterGstname.isHidden = false
                        self.EnterGstname.text = "Enter valid GST number"
                        self.EnterGstname.textColor = UIColor.red
                    }
                }
        
    }
    @IBAction func tremsandConditions(_ sender: UIButton)
    {
        let WebViewControllerVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        self.present(WebViewControllerVc, animated:true, completion:nil)
    }
    @IBAction func Myconfirm(_ sender: UIButton)
    {
        let textnamefinal = nametextfield.text
        let txtbusinessnamefinal = businessname.text
        let textemailfinal = Emailid.text
        let txtgstnumbernamefinal = gstnumber.text
       
        if (textnamefinal?.isEmpty)!
        {
            self.Enternamelabel.isHidden = false
            self.Enternamelabel.text = " Enter Valid Name"
        }
        if (txtbusinessnamefinal?.isEmpty)!
        {
            self.enterbusinessname.isHidden = false
            self.enterbusinessname.text = "Enter Valid Surname "
        }
        if (textemailfinal?.isEmpty)!
        {
            self.Entermeilid.isHidden = false
            self.Entermeilid.text = "Enter Valid  Email Id"
            self.Entermeilid.textColor = UIColor.red
        }
//        if (txtgstnumbernamefinal?.isEmpty)!
//        {
//            self.EnterGstname.isHidden = false
//            self.EnterGstname.text = "Enter GST number"
//            self.EnterGstname.textColor = UIColor.red
//        }
        
        if ((textemailfinal!.count) > 0)
        {
            if (isValidEmailfinal(email:textemailfinal!))
            {
                self.Entermeilid.isHidden = true
                self.Entermeilid.text = "Enter Valid  Email Id"
                self.Entermeilid.textColor = UIColor.red
                validEmailvalue = "validEmailvalue"
            }
            else{
                self.Entermeilid.isHidden = false
                self.Entermeilid.text = "Enter Valid Email Id"
                self.Entermeilid.textColor = UIColor.red
                validEmailvalue = ""
            }
        }
        if (txtgstnumbernamefinal?.count)! > 0
        {
            if txtgstnumbernamefinal?.count == 15
            {
                self.gstnumber.isHidden = true
                self.gstnumber.text = "Enter GST number"
                self.gstnumber.textColor = UIColor.red
            }
            else
            {
                self.gstnumber.isHidden = false
                self.gstnumber.text = "Enter valid GST number"
                self.gstnumber.textColor = UIColor.red
            }
        }
        
        if stringfinalvalue == ""
        {
            if (textnamefinal?.count)! > 0 && (txtbusinessnamefinal?.count)! > 0 && validEmailvalue.count > 0
            {
                DispatchQueue.main.async
                    {
                        self.ownerDetailsMAinMethod()
                }
            }
        }
       
    }
    func ownerDetailsMAinMethod()
    {
        
//        method=getownerdetails&mobileNo=9856555522&type=submit&category=businessdetails&data={"ownerdetails":{"given_name":"RAGHU","surname":"R","email_id":"raghu@gmail.com","image":" "}
//
        let textnamefinal = nametextfield.text
        let txtbusinessnamefinal = businessname.text
        let textemailfinal = Emailid.text
        let txtgstnumbernamefinal = gstnumber.text
       
        let defaultsfinalavalue = UserDefaults.standard
        
        if let ComboNamefinal:String = defaultsfinalavalue.value(forKey: "Mymobilenumber") as? String
        {
            
            self.Mymobilenumebrfinalvalue = ComboNamefinal
        }

        let data = ["ownerdetails":["given_name":textnamefinal,"businessname":txtbusinessnamefinal,"email_id": textemailfinal,"image":"","GST":txtgstnumbernamefinal]] as [String : Any]
        let jsonData = try? JSONSerialization.data(withJSONObject: data, options: [])
        let jsonString = String(data: jsonData!, encoding: .utf8)
        
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let postString =  String(format: "method=%@&mobileNo=%@&type=%@&updateflag=%@&category=%@&data=%@","getownerdetails",self.Mymobilenumebrfinalvalue,"submit","0","ownerdetails",jsonString!)
        
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
                self.removeSpinner()
                //                    {
                //                        Status = 1;
                //                        StatusCode = 1;
                //                        message = Success;
                //                }
                print(response.result.value)
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    print(dict)
                    
                    let valuefinal = dict.value(forKey:"Status")as!NSNumber
                    
                    print(valuefinal)
                    
                    
                    
                    let valuesingel = valuefinal.stringValue
                    
                    print(valuesingel)
                    if valuesingel == "1"
                    {
                        let setLocation = self.storyboard?.instantiateViewController(withIdentifier: "SetLocationViewController") as! SetLocationViewController
                        setLocation.addanotherfisrt = "addanotherfisrt"
                        self.present(setLocation, animated: true, completion: nil)

                    }
                    else
                    {
                        
                    }
                    
                }
                else
                {
                    
                    
                    
                }
                break
            case .failure(_):
                break
            }
            
            
            
        }
    }
    func isValidEmailfinal(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: email)
        return result
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        var result = true
        
        if textField == gstnumber {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")
            let characterSet = CharacterSet(charactersIn: string)
            let maxLength = 15
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            
            return  newString.length <= maxLength
        }
        return result
        
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
        //        self.btnSign.isUserInteractionEnabled = true
    }
    
    @IBAction func alertviewnobutton(_ sender: UIButton)
    {
        alertviewmiddel.isHidden = true

    }
    
    @IBAction func alertviewyesbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    
    @IBAction func Mybackbuttonfinalvalue(_ sender: UIButton)
    {
        self.backalertview.isHidden = false
    }
    
    
    @IBAction func Myalertbackbutton(_ sender: UIButton)
    {
        self.backalertview.isHidden = true
        
    }
    
}
