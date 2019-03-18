//
//  NamebuttonViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 05/10/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SDWebImage

class NamebuttonViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var ANmelabel: UILabel!
    @IBOutlet weak var namebuttonview: UIView!
    @IBOutlet weak var savebutton: UIButton!
    @IBOutlet weak var NAmetextfiled: UITextField!
    var Namelabelstring = String()
    var NameTextfiledstring = String()
    @IBOutlet weak var dateofbirthbutton: UIButton!
    @IBOutlet weak var datepikcer: UIDatePicker!
    @IBOutlet weak var pickerview: UIView!
    var NameDateofbirthstring1 = String()
    @IBOutlet weak var dateofbirthlabel: UILabel!
    @IBOutlet weak var datepickerview: UIView!
    @IBOutlet weak var veryalertview: UIView!
    var EditaccountNametimer = Timer()
    var coverView = UIView()
    var imageView = UIImageView()
    var Typevalue = String()
    var textfileddatavalue = String()
    var Mobilenumebrfinlvalue = String()
    var finalbusinesstypevaluefinal = String()
    var VerificationfinalvalueEditfinal = String()
    var uploadstring = [String]()
    var Newagentid = String()
    var NewMobileNumber = String()

    

    @IBOutlet weak var pancardtextfield: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        namebuttonview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness: 0.6)
        NAmetextfiled.useUnderline()
        
        NAmetextfiled.delegate = self
        NAmetextfiled.addTarget(self, action: #selector(NamebuttonViewController.textFieldDidChange(_:)), for: .editingChanged)
        
          pancardtextfield.addTarget(self, action: #selector(NamebuttonViewController.textFieldDidChange(_:)), for: .editingChanged)
        
        ANmelabel.text = self.Namelabelstring
        NAmetextfiled.text = self.NameTextfiledstring
        pancardtextfield.text = self.NameTextfiledstring
        self.dateofbirthbutton.layer.addBorder(edge:.bottom, color: UIColor.textfiledbottomcolorside(), thickness: 0.6)
        self.dateofbirthbutton.setTitle(NameTextfiledstring, for:.normal)
        textfileddatavalue = NameTextfiledstring

        if Namelabelstring == "Date of birth"
        {
//            savebutton.isHidden = false
            NAmetextfiled.isHidden = true
            pancardtextfield.isHidden = true
          self.dateofbirthbutton.isHidden = false
            self.dateofbirthbutton.setTitle(NameTextfiledstring, for:.normal)
        }
        else{
//            savebutton.isHidden = false
            NAmetextfiled.isHidden = false
//            self.pickerview.isHidden = true
            self.dateofbirthbutton.isHidden = true

        }

        if Namelabelstring == "Name"
        {
            Typevalue = "name"
        }
        if Namelabelstring == "Business name"
        {
            Typevalue = "business_name"
        }
        if Namelabelstring == "Pan Number"
        {
            Typevalue = "pan"
            NAmetextfiled.isHidden = true
            pancardtextfield.isHidden = false
        }
        if Namelabelstring == "GST Number"
        {
            Typevalue = "gst"
            NAmetextfiled.isHidden = false
            pancardtextfield.isHidden = true
        }
        if Namelabelstring == "Date of birth"
        {
            Typevalue = "dob"
        }
        if Namelabelstring == "Location"
        {
            Typevalue = "Location"
        }
        if Namelabelstring == "House / Plot / Shop no."
        {
            Typevalue = "House / Plot / Shop no."
        }
        if Namelabelstring == "Landmark"
        {
            Typevalue = "Landmark"
        }
        if Namelabelstring == "Area"
        {
            Typevalue = "Area"
        }
        if Namelabelstring == "City"
        {
            Typevalue = "City"
        }
        if Namelabelstring == "Pincode"
        {
            Typevalue = "Pincode"
        }
      
        
        pancardtextfield.useUnderlinetwo()
        

        pancardtextfield.autocapitalizationType = .allCharacters
    }
    @objc func textFieldDidChange(_ textField: UITextField?)
    {
        savebutton.isHidden = false

        if textField == pancardtextfield
        {
            pancardtextfield.autocapitalizationType = .allCharacters
            textfileddatavalue.removeAll()
            
            textfileddatavalue = pancardtextfield.text!
            
            print(textfileddatavalue)
        }
        else
        {
            savebutton.isHidden = false
            textfileddatavalue = NAmetextfiled.text!
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func MyBackbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    
    
    @IBAction func Savebutton(_ sender: UIButton)
    {
        if Namelabelstring == "Pan Number"
        {
            Typevalue = "pan"
            
            let isValid = validatePANCardNumber(pancardtextfield.text!)
            if isValid == true{
                DispatchQueue.main.async {
                    self.updatesinglvaluefinal()
                }

            }else{
          
                
                let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
                popOverVC.alertTitleString = "Alert"
                popOverVC.alertMessageString = "please enter valid data" as NSString
                self.addChildViewController(popOverVC)
                popOverVC.view.frame = self.view.frame
                self.view.addSubview(popOverVC.view)
                popOverVC.didMove(toParentViewController: self)
            }
            
            
        }
        if Namelabelstring == "GST Number"
        {
            Typevalue = "gst"
            
            if (isValidEmailfinal(email:(NAmetextfiled.text)!))
            {
                Typevalue = "gst"
                DispatchQueue.main.async
                    {
                    self.updatesinglvaluefinal()
            }
            }
            else
            {
                let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
                popOverVC.alertTitleString = "Alert"
                popOverVC.alertMessageString = "please enter valid data" as NSString
                self.addChildViewController(popOverVC)
                popOverVC.view.frame = self.view.frame
                self.view.addSubview(popOverVC.view)
                popOverVC.didMove(toParentViewController: self)
            }
            
        }
            
            
        if Namelabelstring == "Location"
        {
            DispatchQueue.main.async {
                self.updatesinglbilloingadressvalue()
            }
            
        }
        if Namelabelstring == "House / Plot / Shop no."
        {
            DispatchQueue.main.async
                {
            self.updatesinglbilloingadressvalue()
            }
        }
        if Namelabelstring == "Landmark"
        {
        DispatchQueue.main.async
        {
            self.updatesinglbilloingadressvalue()
            }
            
        }
        if Namelabelstring == "Area"
        {
            DispatchQueue.main.async
            {
            self.updatesinglbilloingadressvalue()
            }
        }
        if Namelabelstring == "City"
        {
            DispatchQueue.main.async
                {
            self.updatesinglbilloingadressvalue()
            }
            
        }
        if Namelabelstring == "Pincode"
        {
            DispatchQueue.main.async
                {
                    self.updatesinglbilloingadressvalue()
            }
            
        }
       
        else{
            DispatchQueue.main.async {
                self.updatesinglvaluefinal()
            }

        }
        
    }
    
    func validatePANCardNumber(_ strPANNumber : String) -> Bool{
        let regularExpression = "[A-Z]{5}[0-9]{4}[A-Z]{1}"
        let panCardValidation = NSPredicate(format : "SELF MATCHES %@", regularExpression)
        return panCardValidation.evaluate(with: strPANNumber)
    }
    
    
    @IBAction func Dateofbirthbutton(_ sender: UIButton)
    {
        self.pickerview.isHidden = false
    }
    @IBAction func datepickerfinal(_ sender: UIDatePicker)
    {
        
        datepikcer.maximumDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY"
        NameDateofbirthstring1 = dateFormatter.string(from:sender.date)
      //  dateofbirthbutton.setTitle(NameDateofbirthstring1, for: .normal)
        print(NameDateofbirthstring1)
        
        dateofbirthbutton.setTitleColor(UIColor.black, for:.normal)
        dateofbirthbutton.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        
        
    }
    @IBAction func Datepickerdone(_ sender: UIButton)
    {
        self.pickerview.isHidden = true
        let dateOfBirth = datepikcer.date
        let today = NSDate()
        let gregorian = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let age = gregorian.components([.year], from: dateOfBirth, to: today as Date, options: [])
        if age.year! < 18 {
            dateofbirthlabel.text = "Date of birth is invalid"
            dateofbirthlabel.isHidden = false
            dateofbirthlabel.textColor = UIColor.red
            dateofbirthbutton.setTitle(NameDateofbirthstring1, for: .normal)

        }
        else{
            dateofbirthbutton.setTitle(NameDateofbirthstring1, for: .normal)
            dateofbirthlabel.isHidden = true
             savebutton.isHidden = false
        }
        textfileddatavalue = NameDateofbirthstring1
    }
    @IBAction func Datepickercancel(_ sender: UIButton)
    {
        self.pickerview.isHidden = true

    }
    func updatesinglvaluefinal()
    {
        self.showSpinner()
        let defaultsingelvalue = UserDefaults.standard
      //  var request = URLRequest(url: URL(string:AgentConstants.DescriptionBaseurl)!)
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)

        let kuserdefaukts = UserDefaults.standard
    
        if let Myagentidfinal:String = (kuserdefaukts.value(forKey:"myuseridvaluefinal")as!String)
        {
            self.Newagentid = Myagentidfinal
        }
//        if let Myagentidfinal:String = kuserdefaukts.value(forKey:"Myagentid")as!String
//        {
//            self.Newagentid = Myagentidfinal
//        }
//           let Myagentidvalueis = defaultsingelvalue.value(forKey:"myuseridvaluefinal")as!String
//
        
        if let MyMobilenumbervalue:String = (kuserdefaukts.value(forKey:"Mymobilenumbervalue")as!String)
        {
            self.NewMobileNumber = MyMobilenumbervalue
        }
        request.httpMethod = "POST"
        let postString =  String(format: "method=%@&agentID=%@&mobileNo=%@&type=%@&text=%@&userid=%@","updateSingleValue",self.Newagentid,NewMobileNumber,Typevalue,textfileddatavalue, self.Newagentid)
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
                
                if let dictsingelvalue:NSDictionary = response.result.value as? NSDictionary
                {
                    print(dictsingelvalue)
                    
                    if let str2:String = dictsingelvalue.value(forKey:"Status")as?String
                    {
                        print(str2)
                        if  str2 == "0"
                        {
                            self.removeSpinner()
                            self.veryalertview.isHidden = true
                        }
                        if  str2 == "1"
                        {
    self.EditaccountNametimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.EEditaccountNametimertimerAction), userInfo: nil, repeats: false)
                        }
                        
                    }
               
                
                    
                }
                break
            case .failure(_):
                break
            }
        }
        
    }
    
    func updatesinglbilloingadressvalue()
    {
        self.showSpinner()
        let defaultsingelvalue = UserDefaults.standard
        //  var request = URLRequest(url: URL(string:AgentConstants.DescriptionBaseurl)!)
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        
        let kuserdefaukts = UserDefaults.standard
        
        if let Myagentidfinal:String = (kuserdefaukts.value(forKey:"myuseridvaluefinal")as!String)
        {
            self.Newagentid = Myagentidfinal
        }
            if let MyMobilenumbervalue:String = (kuserdefaukts.value(forKey:"Mymobilenumbervalue")as!String)
        {
            self.NewMobileNumber = MyMobilenumbervalue
        }
        request.httpMethod = "POST"
        let postString =  String(format: "method=%@&agentID=%@&mobileNo=%@&type=%@&text=%@&key=%@&userid=%@","updateSingleValue",self.Newagentid,NewMobileNumber,Typevalue,textfileddatavalue,"billing",self.Newagentid)
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
                
                if let dictsingelvalue:NSDictionary = response.result.value as? NSDictionary
                {
                    print(dictsingelvalue)
                    
                    if let str2:String = dictsingelvalue.value(forKey:"Status")as?String
                    {
                        print(str2)
                        if  str2 == "0"
                        {
                            self.removeSpinner()
                            self.veryalertview.isHidden = true
                        }
                        if  str2 == "1"
                        {
                            self.EditaccountNametimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.EEditaccountNametimertimerAction), userInfo: nil, repeats: false)
                        }
                        
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
        self.veryalertview.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(imageView)
    }
    func removeSpinner(){
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()
        
        let defaults = UserDefaults.standard
        defaults.set("singelvalue", forKey: "singelupdate")
        defaults.set("", forKey: "MyBillingadressset")
        defaults.set("", forKey: "Mydeliveryadressset")
        defaults.set("", forKey: "Mydeliveryadresssetfinalvalue")
        defaults.set("", forKey: "myanothersvalue")
        defaults.synchronize()
        
        DispatchQueue.main.async {
            let viewfinalvalue = self.storyboard?.instantiateViewController(withIdentifier:"EditAccountViewController")as!EditAccountViewController
            self.present(viewfinalvalue, animated: true, completion:nil)
            
        }
    }
    @objc func EEditaccountNametimertimerAction()
    {
        self.removeSpinner()
        self.veryalertview.isHidden = true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let result = true
        
        if textField == pancardtextfield {
               pancardtextfield.autocapitalizationType = .allCharacters
                let maxLength = 10
                let currentString: NSString = textField.text! as NSString
                let newString: NSString =
                    currentString.replacingCharacters(in: range, with: string) as NSString
                return newString.length <= maxLength
        }
//        if textField == NAmetextfiled {
//            if Namelabelstring == "GST Number"
//            {
//                pancardtextfield.autocapitalizationType = .allCharacters
//                let maxLength = 15
//                let currentString: NSString = textField.text! as NSString
//                let newString: NSString =
//                    currentString.replacingCharacters(in: range, with: string) as NSString
//                return newString.length <= maxLength
//            }
//         
//        }
  
        return result
    }
    
    func isValidEmailfinal(email: String) -> Bool
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: email)
        return result
    }

}
