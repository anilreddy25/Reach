//
//  BusinessDetailsViewController.swift
//  loginPageVC
//
//  Created by apple on 8/20/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
import Alamofire
class BusinessDetailsViewController: UIViewController,UITextFieldDelegate,UIScrollViewDelegate
{
    @IBOutlet weak var validType: UILabel!
    @IBOutlet weak var validCategory: UILabel!
    @IBOutlet weak var validBusiness: UILabel!
    @IBOutlet weak var btnCall: UIButton!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnSetLocation: UIButton!
    @IBOutlet weak var lblBusiness: UILabel!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPAN: UITextField!
    @IBOutlet weak var txtGST: UITextField!
    @IBOutlet weak var imgInfo: UIImageView!
    @IBOutlet weak var lblGST: UILabel!
    @IBOutlet weak var validPAN: UILabel!
    @IBOutlet weak var validGST: UILabel!
    var arrayList = [Any]()
    var arrayCategory = [Any]()
    var phonecallTwo = String()
    var line = UILabel()
    var profileselectedIndex :Int?
    var selectBusinesscategory = [String]()
    var selectBusinesstwocategory = [String]()
    var selectedcatageory = String()
    @IBOutlet weak var BusinessDetailscrollview: UIScrollView!
    @IBOutlet weak var DeliveryLocationappone: UIView!
    @IBOutlet weak var Locationtextfiled: UITextField!
    @IBOutlet weak var HousePlottextfiled: UITextField!
    @IBOutlet weak var Bluedarttextfiled: UITextField!
    @IBOutlet weak var addanotherLocation: UIButton!
    @IBOutlet weak var DeliveryLocationTwo: UIView!
    @IBOutlet weak var DeliveryLoctaiontextfiledtwo: UITextField!
    @IBOutlet weak var DeliveryHousetextfiledthree: UITextField!
    @IBOutlet weak var Landmarktextfiledthree: UITextField!
    var Locationone = String()
    var Locationtwo = String()
    var Housenumberone = String()
    var HousenumberTwo = String()
    var LandMarkone = String()
    var LandMarkTwo = String()
    var Editbuttonone = String()
    var EditbuttonTwo = String()
    var Savedbuttontwo = String()
    var addanotherLocationlDelivery = String()
    var saveButtonone = String()
    @IBOutlet weak var bottomviewtwofinal: UIView!
    var addanotherLocationstring = UserDefaults.standard
    var SetDeliveryString = String()
    var MobileNumberBusinessDetail  = String()
    var coverView = UIView()
    var imageView = UIImageView()
    var TypeofBusinessarray = NSArray()
    var TypeofBusinessCatageory = NSArray()
    var selectbusinesscatageooryid = [String]()
    var selectbusinesTwocatageooryid = [String]()
    var TypeofBusinessarrayTwo = NSArray()
    var selectBusinessstring = String()
    var selectbusinesscatageooryidone = String()
    var selectbusinesTwocatageooryidtwo = String()
    var Dictfinal  = NSMutableDictionary()
    var frist = String()
    var arryone = [String]()
    var arrayfinalvalue = [String]()

    var app = UIApplication.shared.delegate as! AppDelegate
    var Mapdictone = NSDictionary()
    
    var MapdictTwo = NSDictionary()

    @IBOutlet weak var storetextfiled: UITextField!
    
    @IBOutlet weak var storeview: UIView!
    
    @IBOutlet weak var totaldemoviewfinal: UIView!
   
    @IBOutlet weak var addsecondLocation: UIButton!
    
    @IBOutlet weak var addsecondview: UIView!
    @IBOutlet weak var storetextfiledtwo: UITextField!
    @IBOutlet weak var adLocationtwofinal: UIView!
    @IBOutlet weak var referalcodeviewfinal: UIView!
    @IBOutlet weak var referalcodetextfiled: UITextField!
    @IBOutlet weak var applay: UIButton!
    @IBOutlet weak var checkmark: UIButton!
    var Mutabelstringfinalvalue = NSMutableString()
    var MutabelstringfinalTwovalue = NSMutableString()
    var checckedstring = String()
    @IBOutlet weak var agreelabel: UILabel!
    @IBOutlet weak var Referalcodelabel: UILabel!
    var defaults = UserDefaults.standard
    var mymobilenumbervalue = String()
    var Enterpannumber = String()
    var Entergst = String()
    @IBOutlet weak var setLocationlabel: UILabel!
    @IBOutlet weak var Backimagefinalvalue: UIImageView!
    
    @IBOutlet weak var termsconditionslabel: UILabel!
    
    var applyZipcode = String()
    
    var sereviceavailabel = String()
    
    
    @IBOutlet weak var storelabelone: UILabel!
    

    
    
    @IBOutlet weak var storefinaltwo: UILabel!
    
    var Mybusinessvaluefinal = String()
    
    
    
    
    @IBOutlet weak var mydemoscrollview: UIScrollView!
    
    @IBOutlet weak var mydemoscrollviewtwo: UIScrollView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        txtName.delegate = self
        txtGST.delegate = self
        txtPAN.delegate = self
        btnSetLocation.layer.cornerRadius = 3.0
        btnSetLocation.layer.borderColor = UIColor.black.cgColor
        headerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        headerView.layer.shadowOpacity = 0.3
        headerView.layer.shadowRadius = 1.0
        headerView.layer.borderColor = UIColor.color2().cgColor
        headerView.layer.shadowColor = UIColor.color2().cgColor
        lblBusiness.layer.addBorder(edge:.bottom, color: UIColor.textfiledbottomcolorside(), thickness:1.0)
        
        mydemoscrollview.delegate = self
        
        
        if self.view.frame.size.height < 800
        {
            BusinessDetailscrollview.contentInset = UIEdgeInsetsMake(0, 0,850, 0)
            BusinessDetailscrollview.isScrollEnabled = true
            BusinessDetailscrollview.delegate = self
            BusinessDetailscrollview.showsVerticalScrollIndicator = false
            
            mydemoscrollview.contentInset = UIEdgeInsetsMake(10, 0,0, 800)
            mydemoscrollview.isScrollEnabled = true
            mydemoscrollview.delegate = self
            mydemoscrollview.showsVerticalScrollIndicator = false
            mydemoscrollview.showsHorizontalScrollIndicator = false
            
            
            mydemoscrollviewtwo.contentInset = UIEdgeInsetsMake(10, 0,0, 800)
            mydemoscrollviewtwo.isScrollEnabled = true
            mydemoscrollviewtwo.delegate = self
            mydemoscrollviewtwo.showsVerticalScrollIndicator = false
            mydemoscrollviewtwo.showsHorizontalScrollIndicator = false
        }
        Locationtextfiled.useUnderlinetwo()
        HousePlottextfiled.useUnderlinetwo()
        Bluedarttextfiled.useUnderlinetwo()
        DeliveryLoctaiontextfiledtwo.useUnderlinetwo()
        DeliveryHousetextfiledthree.useUnderlinetwo()
        Landmarktextfiledthree.useUnderlinetwo()
        
        let valuesingel = UserDefaults.standard
        valuesingel.set(MobileNumberBusinessDetail, forKey:"Mymobilenumber")
        valuesingel.synchronize()
        
//        referalcodetextfiled.text = MobileNumberBusinessDetail
         self.txtName.text = nil
        
        
        let defaults = UserDefaults.standard
            if let Reviewfinal:[String] = defaults.value(forKey: "arryone")as?[String]
        {
            let valuefirst = Reviewfinal[0]
            let valuesecond = Reviewfinal[1]
            let valueThree = Reviewfinal[2]
            self.applyZipcode = Reviewfinal[3]
            self.applayBusinessDetailsadress()
          
            Locationtextfiled.text = valuefirst as! String
            HousePlottextfiled.text = valuesecond as? String
            Bluedarttextfiled.text = valueThree as? String
            
            Mutabelstringfinalvalue.append(valuefirst)
            Mutabelstringfinalvalue.append(valuesecond)
            Mutabelstringfinalvalue.append(valueThree)
          print(Mutabelstringfinalvalue)
            storetextfiled.text = Mutabelstringfinalvalue as String
            self.btnSetLocation.isHidden = true
        
    

//              self.totaldemoviewfinal.frame = CGRect(x:0, y:250, width:self.referalcodeviewfinal.frame.size.width, height:200)

            let valuesingetwo = UserDefaults.standard
           let total =  valuesingetwo.value(forKey:"Mymobilenumber")
            print(total)
            self.bottomviewtwofinal.isHidden = true
            self.DeliveryLocationappone.isHidden = false
            self.addsecondLocation.isHidden = false
            self.totaldemoviewfinal.isHidden = false
            self.addsecondview.isHidden = true
            self.adLocationtwofinal.isHidden = true
            self.storeview.isHidden = false
            
             self.totaldemoviewfinal.frame = CGRect(x:0, y:250, width:self.totaldemoviewfinal.frame.size.width, height:175)
            self.referalcodeviewfinal.frame = CGRect(x:0, y:425, width:self.referalcodeviewfinal.frame.size.width, height:250)
            
             self.referalcodeviewfinal.isHidden = false
            
        }
     
        
        if let gstfinal:String = defaults.value(forKey: "Gstname")as?String
        {
            
            let valuegstfinal = gstfinal
            
            txtGST.text = valuegstfinal

            
        }
        if let pannamefinal:String = defaults.value(forKey: "panname")as?String
        {
            let valuepanfinal = pannamefinal
            txtPAN.text = valuepanfinal
        }
        if let Busnessnamefinal:String = defaults.value(forKey: "Busnessname")as?String
        {
            let valueBusnessnamefinal = Busnessnamefinal
            txtName.text = valueBusnessnamefinal
        }
        DispatchQueue.main.async {
            //self.BuseneeDetails()
        }
        let singeldefaults = UserDefaults.standard
        if let str_array:NSDictionary  = singeldefaults.value(forKey:"finaldictvalue")as? NSDictionary
         {
               self.Mapdictone = str_array
        }
        if let str_arraytwo:NSDictionary  = singeldefaults.value(forKey:"finaldicTwotvalue")as? NSDictionary
        {
            self.MapdictTwo = str_arraytwo
        }
        storetextfiled.useUnderline()
        referalcodetextfiled.useUnderlinetwo()
        txtName.useUnderlinetwo()
        applay.layer.cornerRadius = 5.0
        storetextfiledtwo.useUnderlinetwo()
        addsecondLocation.layer.cornerRadius = 5.0
        txtGST.useUnderlinetwo()
        txtPAN.useUnderlinetwo()
        
        txtGST.addTarget(self, action: #selector(BusinessDetailsViewController.textFieldDidChange(_:)), for: .editingChanged)
        
         txtPAN.addTarget(self, action: #selector(BusinessDetailsViewController.textFieldDidChange(_:)), for: .editingChanged)
        txtName.addTarget(self, action: #selector(BusinessDetailsViewController.textFieldDidChange(_:)), for: .editingChanged)
       referalcodetextfiled.keyboardType = .numberPad
        
        DeliveryLoctaiontextfiledtwo.tintColor = .black
        DeliveryHousetextfiledthree.tintColor = .black
        Landmarktextfiledthree.tintColor = .black
        storetextfiledtwo.tintColor = .black
        referalcodetextfiled.tintColor = .black
        txtPAN.autocapitalizationType = .allCharacters

        let singupBusinessHeadervalue = UITapGestureRecognizer(target: self, action: #selector(self.handleBusinessdetails(_:)))
        Backimagefinalvalue.addGestureRecognizer(singupBusinessHeadervalue)
        Backimagefinalvalue.isUserInteractionEnabled = true
        
        
        let singupfinalvalueBusiness = UITapGestureRecognizer(target: self, action: #selector(self.Webviewgesturefinal(_:)))
        termsconditionslabel.addGestureRecognizer(singupfinalvalueBusiness)
        termsconditionslabel.isUserInteractionEnabled = true
        
        
        let singupfinalvalue = UITapGestureRecognizer(target: self, action: #selector(self.Webviewgesturefinalvalue(_:)))
        storetextfiled.addGestureRecognizer(singupfinalvalue)
        storetextfiled.isUserInteractionEnabled = true
        
        checckedstring = "true"

        let singupfinalvalueone = UITapGestureRecognizer(target: self, action: #selector(self.Webviewgesturefinalvalue(_:)))
        storetextfiled.addGestureRecognizer(singupfinalvalueone)
        storetextfiled.isUserInteractionEnabled = true
      
        let singupfinalvaluetwo = UITapGestureRecognizer(target: self, action: #selector(self.storeviesingeone(_:)))
         self.storeview.addGestureRecognizer(singupfinalvaluetwo)
         self.storeview.isUserInteractionEnabled = true
        
        
        let singupfinalvaluethree = UITapGestureRecognizer(target: self, action: #selector(self.storetwoeone(_:)))
        self.addsecondview.addGestureRecognizer(singupfinalvaluethree)
         self.addsecondview.isUserInteractionEnabled = true
        
        
        
        if let Reviewmyarrayfinal:[String] = defaults.value(forKey: "MyarryTwofinal")as?[String]
        {
            print("secodnmethod called")
            let Locationtwo = Reviewmyarrayfinal[0]
            let HousenumberTwo = Reviewmyarrayfinal[1]
            let LandMarkTwo = Reviewmyarrayfinal[2]

            DeliveryLoctaiontextfiledtwo.text = Locationtwo
            DeliveryHousetextfiledthree.text = HousenumberTwo
            Landmarktextfiledthree.text = LandMarkTwo
            MutabelstringfinalTwovalue.append(Locationtwo)
            MutabelstringfinalTwovalue.append(HousenumberTwo)
            MutabelstringfinalTwovalue.append(LandMarkTwo)
            print(MutabelstringfinalTwovalue)
            storetextfiledtwo.text = MutabelstringfinalTwovalue as String
            self.bottomviewtwofinal.isHidden = true
            self.DeliveryLocationappone.isHidden = false
            self.addsecondLocation.isHidden = true
            
            self.totaldemoviewfinal.isHidden = false
            self.addsecondview.isHidden = false
            self.adLocationtwofinal.isHidden = false
            self.storeview.isHidden = false
            
            self.totaldemoviewfinal.frame = CGRect(x:0, y:250, width:self.totaldemoviewfinal.frame.size.width, height:175)
            self.referalcodeviewfinal.frame = CGRect(x:0, y:410, width:self.referalcodeviewfinal.frame.size.width, height:250)
            
            self.referalcodeviewfinal.isHidden = false
            
            if let arra:[String] = defaults.value(forKey: "arraytwo")as?[String]
            {
                let valuefirst = arra[0]
                let valuesecond = arra[1]
                let valueThree = arra[2]
                self.applyZipcode = arra[3]
                Locationtextfiled.text = valuefirst as! String
                HousePlottextfiled.text = valuesecond as? String
                Bluedarttextfiled.text = valueThree as? String
                
                Mutabelstringfinalvalue.append(valuefirst)
                Mutabelstringfinalvalue.append(valuesecond)
                Mutabelstringfinalvalue.append(valueThree)
                storetextfiled.text = Mutabelstringfinalvalue as String
            }
        }
        
        let defaultsfinalvalue = UserDefaults.standard
        defaultsfinalvalue.set(txtName.text!, forKey:"Mybusinessname")
        defaultsfinalvalue.synchronize()
        self.mydemoscrollview.contentSize.height = 1.0

    }
    
    
    
    @objc func storeviesingeone(_ sender: UITapGestureRecognizer)
    {
        let setLocation = self.storyboard?.instantiateViewController(withIdentifier: "SetLocationViewController") as! SetLocationViewController
        setLocation.firsttimesett = "firsttimeset"
        
        self.present(setLocation, animated: true, completion: nil)
        
    }
    @objc func storetwoeone(_ sender: UITapGestureRecognizer)
    {
        let SetLocationView = self.storyboard?.instantiateViewController(withIdentifier: "SetLocationViewController") as! SetLocationViewController
        SetLocationView.addanotherfisrt = "secondvalue"
        self.present(SetLocationView, animated: true, completion: nil)
        
    }
    
    
    
    
    
    @objc func Webviewgesturefinalvalue(_ sender: UITapGestureRecognizer)
    {
        if self.sereviceavailabel == "1000"
        {
            DispatchQueue.main.async
            {
                let SetLocationView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SetLocationViewController") as! SetLocationViewController
                SetLocationView.firsttimesett = "firsttimeset"
                self.present(SetLocationView, animated:true, completion:nil)
            }
        }
        else
        {
            storetextfiled.isUserInteractionEnabled = false
        }
    }
    @objc func Webviewgesturefinal(_ sender: UITapGestureRecognizer)
    {
        let WebViewControllerVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        self.present(WebViewControllerVc, animated:true, completion:nil)
      
    }
    @objc func handleBusinessdetails(_ sender: UITapGestureRecognizer)
    {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BackalertViewController") as! BackalertViewController
        let defaults = UserDefaults.standard
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    @objc func textFieldDidChange(_ textField: UITextField?)
    {
        if textField == txtGST
        {
        if textField?.text?.count == 0
        {
            validGST.isHidden = false
            validGST.textColor = UIColor.red
            validGST.text = "Enter BusinessName"
        }
            if (textField?.text?.count)! > 0
            {
                validGST.isHidden = true
                validGST.textColor = UIColor.red
                validGST.text = "Enter BusinessName"
                defaults.set(txtGST.text, forKey:"Gstname")
                defaults.synchronize()
                Entergst = "gstfinal"
              
            }
        }
        if textField == txtPAN
        {
            if textField?.text?.count == 0
            {
                validPAN.isHidden = false
                validPAN.textColor = UIColor.red
                validPAN.text = "Enter PAN Number"
            }
            if (textField?.text?.count)! > 0
            {
                validPAN.isHidden = true
                validPAN.textColor = UIColor.red
                validPAN.text = "Enter PAN Number"
                defaults.set(txtPAN.text, forKey:"panname")
                defaults.synchronize()

           Enterpannumber = "textfinal"
            }
        }
        if textField == txtName
        {
            if textField?.text?.count == 0
            {
                validBusiness.isHidden = false
                validBusiness.textColor = UIColor.red
                validBusiness.text = "Enter Shop Number"
            }
            if (textField?.text?.count)! > 0
            {
                validBusiness.isHidden = true
                validBusiness.textColor = UIColor.red
                validBusiness.text = "Enter Shop Number"
                defaults.set(txtName.text, forKey:"Busnessname")
                defaults.synchronize()
            }
        }
//      referalcodetextfiled.text = MobileNumberBusinessDetail
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnCall(_ sender: Any)
    {
        
    phonecallTwo = "86889 86889"
    phonecallTwo.makeAColl()
    }

    @IBAction func Editone(_ sender: UIButton)
    {
        let setLocation = self.storyboard?.instantiateViewController(withIdentifier: "SetLocationViewController") as! SetLocationViewController
        setLocation.firsttimesett = "firsttimeset"
        
        self.present(setLocation, animated: true, completion: nil)
    }
    
    @IBAction func Editwtofinal(_ sender: UIButton)
    {
        let SetLocationView = self.storyboard?.instantiateViewController(withIdentifier: "SetLocationViewController") as! SetLocationViewController
        SetLocationView.addanotherfisrt = "secondvalue"
        self.present(SetLocationView, animated: true, completion: nil)
    }
    
    
    @IBAction func btnNext(_ sender: Any)
    {
        if txtName.text?.count == 0
        {
            validBusiness.isHidden = false
            validBusiness.textColor = UIColor.red
            validBusiness.text = "Enter Business Name"
        }
        if (txtName.text?.count)! > 0
        {
            validBusiness.isHidden = true
            validBusiness.textColor = UIColor.red
            validBusiness.text = "Enter Business Name"
        }

   
        if storetextfiled.text?.count == 0
        {
//            self.view.makeToast("Please select Location")
            setLocationlabel.isHidden = false
        }
        if (storetextfiled.text?.count)! > 0
        {
            setLocationlabel.isHidden = true
        }
  
        if checckedstring == "true"
        {
                if (txtName.text?.count)! > 0 && (storetextfiled.text?.count)! > 0
                {
                    if Entergst.count > 0 || Enterpannumber.count > 0
                    {
                        if (txtPAN.text?.count)! > 1
                        {
                            let isValid = validatePANCardNumber(txtPAN.text!)
                            if isValid == true{
                                validPAN.isHidden = true
                            }else{
                                validPAN.text = "Enter Valid Pan Card Details"
                                validPAN.textColor = UIColor.red
                                validPAN.isHidden = false
                            }
                        }
                        if Entergst.count > 1
                        {
                            validGST.text = "Enter Gst Card Details"
                            validGST.textColor = UIColor.red
                            validGST.isHidden = false
                        }
                    }
                    else {
                        if (txtName.text?.count)! > 1  && (storetextfiled.text?.count)! > 1
                        {
//                            BusinessMainmethod
                            
                            if self.sereviceavailabel == "1000"
                            {
                                self.view.makeToast("Not started our service in this area")
                            }
                            else{
                                DispatchQueue.main.async
                                    {
                                        self.BusinessMainmethod()
                                }
                            }
                            
                            
                        }
                    }
                }

        }
        
        else{
            self.agreelabel.isHidden = false
            agreelabel.textColor = UIColor.red
            self.agreelabel.text = "you agree to the NumberMall Terms & conditions"
        }
    
    }
    @IBAction func addanotherLocation(_ sender: UIButton)
    {

        let SetLocationView = self.storyboard?.instantiateViewController(withIdentifier: "SetLocationViewController") as! SetLocationViewController
       SetLocationView.addanotherfisrt = "secondvalue"
        self.present(SetLocationView, animated: true, completion: nil)
    }
    
   
    
    
    @IBAction func btnSetLocation(_ sender: Any)
    {

        let setLocation = self.storyboard?.instantiateViewController(withIdentifier: "SetLocationViewController") as! SetLocationViewController
        setLocation.firsttimesett = "firsttimeset"

        self.present(setLocation, animated: true, completion: nil)
    }


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    func validatePANCardNumber(_ strPANNumber : String) -> Bool{
        let regularExpression = "[A-Z]{5}[0-9]{4}[A-Z]{1}"
        let panCardValidation = NSPredicate(format : "SELF MATCHES %@", regularExpression)
        return panCardValidation.evaluate(with: strPANNumber)
    }
    func BuseneeDetails()
    {
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let postString =  String(format: "method=%@&mobileNo=%@&type=%@&category=%@&VersionCode=%@&appType=%@","getownerdetails","7702187410","get","businessdetails","2.7-34","Agent")
        
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
                
                print(response.result.value)
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    print(dict)
                 
                    self.TypeofBusinessCatageory = dict.value(forKey:"BusinessType")as!NSArray
                    self.selectBusinesscategory =            self.TypeofBusinessCatageory.value(forKey:"value")as![String]
                    self.selectbusinesscatageooryid =            self.TypeofBusinessCatageory.value(forKey:"id")as![String]
                    self.TypeofBusinessarrayTwo =         dict.value(forKey:"BusinessCategory")as!NSArray
                    
                    print(self.TypeofBusinessarrayTwo)
                    self.selectbusinesTwocatageooryid =            self.TypeofBusinessarrayTwo.value(forKey:"id")as![String]
                    self.selectBusinesstwocategory =            self.TypeofBusinessarrayTwo.value(forKey:"value")as![String]

                    
                    DispatchQueue.main.async {
                     
                   

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
    
    func applayBusinessDetailsadress()
    {
       // var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        
        var request = URLRequest(url: URL(string:"http://172.31.0.23/NumberMall/agent_Gwy.php")!)
        request.httpMethod = "POST"
       print(self.applyZipcode)
        let postString =  String(format: "method=%@&pincode=%@","getAvailability",self.applyZipcode)
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
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    let valuesingel = dict.value(forKey:"StatusCode")as!String
                   // let valuesingel = valuefinal.stringValue
                    print(valuesingel)
                    if valuesingel == "1"
                    {
                        self.sereviceavailabel = ""
                        self.storelabelone.text = "Store"
                        self.storelabelone.textColor = UIColor.textfiledbottomcolorside()

                    }
                    else {
                        self.storelabelone.text = "Not started our service in this area"
                        self.storelabelone.textColor = UIColor.red
                        self.sereviceavailabel = "1000"
                        self.view.makeToast("Not started our service in this area")
                    }
//                    if valuesingel == "0"
//                    {
//
//                    }
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
    
    
    func BusinessMainmethod()
    {
        
        DispatchQueue.main.async {
//            self.showSpinner()
        }
        let Busineesvalue = "123"
        let typesofcatageoryfinal = "12w432152"

        let datafour = ["classification":"","timingsdata":"","updateflag":"0","versioncode":"2.7-34","appType":"Agent"]
       
        let defaults = UserDefaults.standard
//        defaults.set(txtMblnum.text, forKey:"Mymobilenumber")
//        defaults.synchronize()
        if let mymobilenumber:String = defaults.value(forKey: "Mymobilenumbervalue")as?String
        {
            mymobilenumbervalue = mymobilenumber
        }
        print(mymobilenumbervalue)
        let businessanamevalue = txtName.text
        let businesspannumber = txtName.text
        let businessgstnumber = txtGST.text
        let Dictone = ["businessdetails":["name":businessanamevalue,"pan":businesspannumber,"gst":businessgstnumber]] 
        Dictfinal.addEntries(from:Dictone)
        Dictfinal.addEntries(from:Mapdictone as! [AnyHashable : Any])
        Dictfinal.addEntries(from:MapdictTwo as! [AnyHashable : Any])
     Dictfinal.addEntries(from:datafour)
        let jsonData = try? JSONSerialization.data(withJSONObject:Dictfinal, options: [])
        print(jsonData)
        let jsonString = String(data: jsonData!, encoding: .utf8)
        print(jsonString)
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let postString =  String(format: "method=%@&mobileNo=%@&type=%@&category=%@&data=%@","getownerdetails",mymobilenumbervalue,"submit","businessdetails",jsonString!)
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
              
                print(response.result.value)
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    print(dict)
                    
                    DispatchQueue.main.async {
                        self.removeSpinner()
                    }
                    
                    
                    let valuefinal = dict.value(forKey:"Status")as!NSNumber
                    
                    
                    let valuesingel = valuefinal.stringValue
                    
                    print(valuesingel)
                    if valuesingel == "1"
                    {
                        DispatchQueue.main.async {
//                            self.view.makeToast(StatusMsg)

                            let loginPageVCfinal = self.storyboard?.instantiateViewController(withIdentifier:"loginPageVC")as!loginPageVC
                            loginPageVCfinal.demovalue = "123456"
                            self.present(loginPageVCfinal, animated: true, completion:nil)
                            
                        }
                    }
                    if valuesingel == "0"
                    {
                        DispatchQueue.main.async {
//                            let loginPageVCfinal = self.storyboard?.instantiateViewController(withIdentifier:"loginPageVC")as!loginPageVC
//                            self.present(loginPageVCfinal, animated: true, completion:nil)
                             self.view.makeToast(valuesingel)
                        }
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

    @IBAction func addsecondlocatio(_ sender: UIButton)
    {
        let SetLocationView = self.storyboard?.instantiateViewController(withIdentifier: "SetLocationViewController") as! SetLocationViewController
        SetLocationView.addanotherfisrt = "secondvalue"
        self.present(SetLocationView, animated: true, completion: nil)
    }
    
    @IBAction func applay(_ sender: UIButton)
    {
     
            self.applaypromocodemethod()
       
    }
    
    func applaypromocodemethod()
    {
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        let defaultsfinalvalue = UserDefaults.standard
        let Mobilevalueis  = defaultsfinalvalue.value(forKey:"Mymobilenumbervalue")
        request.httpMethod = "POST"
        let postString =  String(format: "method=%@&mobileno=%@&promocodedata=%@","applycodesuser",Mobilevalueis as! CVarArg,referalcodetextfiled.text!)
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
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    let valuefinal = dict.value(forKey:"StatusCode")as!NSNumber
                    let valuesingel = valuefinal.stringValue
                    print(valuesingel)
                    if valuesingel == "1"
                    {
                        self.view.makeToast("Promocode exists")
                    }
                    if valuesingel == "0"
                    {
                      

                      self.view.makeToast("Promocode not exists")
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
    @IBAction func checkmarkbutton(_ sender: UIButton)
    {
        if checkmark.tag == 0
        {
            checkmark.setBackgroundImage(#imageLiteral(resourceName: "checkmark-seelcted"), for:.normal)
            checckedstring = "true"
            checkmark.tag = 1
            self.agreelabel.isHidden = true
            agreelabel.textColor = UIColor.red
            self.agreelabel.text = "you agree to the NumberMall Terms & conditions"
        }
        else if checkmark.tag == 1
        {
            checckedstring = "false"

            checkmark.setBackgroundImage(#imageLiteral(resourceName: "check-box-emptybusiness"), for:.normal)
            checkmark.tag = 0
             self.agreelabel.isHidden = true
            agreelabel.textColor = UIColor.red
            self.agreelabel.text = "you agree to the NumberMall Terms & conditions"
        }
    }
    func showSpinner()
    {
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
        self.showProgressBar()
        
        self.coverView.addSubview(imageView)
    }
    func removeSpinner()
    {
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var result = true
        if textField == txtGST {
            let maxLength = 15
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return  newString.length <= maxLength
        }
        if textField == txtPAN
        {
        
            let maxLength = 10
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return  newString.length <= maxLength
        }
        if textField == referalcodetextfiled
        {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")
            let characterSet = CharacterSet(charactersIn: string)
            let maxLength = 10
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            
            return allowedCharacters.isSuperset(of: characterSet) && newString.length <= maxLength
        }
        
        
        return result
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        
        let defaultsfinalvalue = UserDefaults.standard
       
        if let Bulkarrayfinal:String = defaultsfinalvalue.value(forKey: "Mybusinessname") as? String
        {
            self.Mybusinessvaluefinal = Bulkarrayfinal
//            self.txtName.text =  self.Mybusinessvaluefinal
        }
        
    }

}
extension UITableView
{
    func isLast(for indexPath: IndexPath) -> Bool {
        
        let indexOfLastSection = numberOfSections > 0 ? numberOfSections - 1 : 0
        let indexOfLastRowInLastSection = numberOfRows(inSection: indexOfLastSection) - 1
        
        return indexPath.section == indexOfLastSection && indexPath.row == indexOfLastRowInLastSection
    }
}
