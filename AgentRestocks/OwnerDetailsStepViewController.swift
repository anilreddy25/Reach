//
//  OwnerDetailsStepViewController.swift
//  loginPageVC
//
//  Created by apple on 8/18/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
import Alamofire
import IQKeyboardManagerSwift

class OwnerDetailsStepViewController: UIViewController,UIScrollViewDelegate,UITextFieldDelegate {
    @IBOutlet weak var shadowView: UIView!
    
    @IBOutlet weak var pickerBackgroundView: UIView!
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var pickerDate: UIView!
    @IBOutlet weak var lblSurName: UILabel!
    
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var lblDOB: UILabel!
    
    @IBOutlet weak var lblCreate: UILabel!
    
    @IBOutlet weak var lblConfirmation: UILabel!
    
    @IBOutlet weak var Datepickerdateselection: UIDatePicker!
    
    
    @IBOutlet weak var lblGenderType: UILabel!
    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var contentView: UIView!
    
    
    
    @IBOutlet weak var btnCall: UIButton!
    
    @IBOutlet weak var imgNMTitle: UIImageView!
    
    @IBOutlet weak var lblPersonal: UILabel!
    
    @IBOutlet weak var lblLine: UIView!
    
    @IBOutlet weak var txtName: UITextField!
    
    
    @IBOutlet weak var txtSurName: UITextField!
    
    
    @IBOutlet weak var txtEmail: UITextField!
    
    
    @IBOutlet weak var txtCreate: UITextField!
    
    
    @IBOutlet weak var txtConfirmation: UITextField!
    
    
    @IBOutlet weak var lblGender: UILabel!
    
    @IBOutlet weak var btnFemale: UIButton!
    
    @IBOutlet weak var btnMale: UIButton!
    
    @IBOutlet weak var lineView: UIView!
    
    @IBOutlet weak var btnIcon: UIButton!
    
    @IBOutlet weak var btnNext: UIButton!
    
    @IBOutlet weak var btnDOB: UIButton!
    var formatter = DateFormatter()
    var gender = String()
    var phonecall = String()
    
    
    @IBOutlet weak var buttondateofbirth: UIButton!
    
    @IBOutlet weak var Donebutton: UIButton!
    
    @IBOutlet weak var Cancel: UIButton!
    
    var Dateofbirthstring = String()
    var coverView = UIView()
    var imageView = UIImageView()
    var OwnerMissedCalledNumbervalueotp = String()
    
    var OwnerDetils = NSDictionary()
    var create_passwordstring = String()
    var date_of_birthstring = String()
    var email_idstring = String()
    var gender_string = String()
    var given_name_string = String()
    var image_string = String()
    var phone_string = String()
    var surname_string = String()

    var ClickGenderstring = String()
    var submit_dict = NSMutableDictionary()

    
    
    @IBOutlet weak var verifyalertview: UIView!
  
    @IBOutlet weak var verifytopview: UIView!
    
    @IBOutlet weak var verydatepickerview: UIView!
    
    @IBOutlet weak var okbutton: UIButton!
    
    
    @IBOutlet weak var yourmobilenumber: UILabel!
    
    @IBOutlet weak var verificationsucessfull: UIView!
    
    @IBOutlet weak var buttoncalltwo: UIButton!
  
    let MINIMUM_AGE: Date = Calendar.current.date(byAdding: .year, value: -18, to: Date())!;
    let MAXIMUM_AGE: Date = Calendar.current.date(byAdding: .year, value: -100, to: Date())!;
    
    var btnPWSHone = UIButton()
    var btnPWSHTwo = UIButton()

    var dateofbirthfinalvalue = String()
    
    var Messagestringfinalvalue = String()
    
    @IBOutlet weak var iamgetopview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.makeToast(Messagestringfinalvalue)
        
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 3)
        shadowView.layer.shadowOpacity = 0.6
        shadowView.layer.shadowRadius = 3.0
        shadowView.layer.shadowColor = UIColor.color2().cgColor
        txtCreate.isSecureTextEntry = true
        txtConfirmation.isSecureTextEntry = true
        txtName.delegate = self
        txtEmail.delegate = self
        txtCreate.delegate = self
        txtSurName.delegate = self
        txtConfirmation.delegate = self
       self.btnDOB.layer.addBorder(edge: .bottom, color:UIColor.buttondateofbirthcolor(), thickness: 1)
        let iconWidth = 20;
        let iconHeight = 20;
        let imageView = UIImageView()
        let imageEmail = UIImage(named:"user.png")
        imageView.image = imageEmail
        imageView.frame = CGRect(x:0, y:10, width: iconWidth, height: iconHeight)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width:25, height: self.txtName.frame.size.height))
        txtName.leftViewMode = UITextFieldViewMode.always
        txtName.addSubview(imageView)
        txtName.leftView = paddingView
    
        let imageViewtwo = UIImageView()
         imageViewtwo.frame = CGRect(x:0, y:10, width: iconWidth, height: iconHeight)
        let imageEmailTwo = UIImage(named:"user.png")
        let paddingViewtwo = UIView(frame: CGRect(x: 0, y: 0, width:25, height: self.txtSurName.frame.size.height))
        imageViewtwo.image = imageEmailTwo
        txtSurName.leftViewMode = UITextFieldViewMode.always
        txtSurName.addSubview(imageViewtwo)
        txtSurName.leftView = paddingViewtwo
    
        let imageViewthree = UIImageView()
        imageViewthree.frame = CGRect(x:0, y:10, width: iconWidth, height: iconHeight)
        let imageEmailThree = UIImage(named:"envelope.png")
        let paddingViewthree = UIView(frame: CGRect(x: 0, y: 0, width:25, height: self.txtEmail.frame.size.height))
        imageViewthree.image = imageEmailThree
        txtEmail.leftViewMode = UITextFieldViewMode.always
        txtEmail.addSubview(imageViewthree)
        txtEmail.leftView = paddingViewthree
   
        let imageViewfour = UIImageView()
        imageViewfour.frame = CGRect(x:0, y:10, width: iconWidth, height: iconHeight)
        let imagecratepassword = UIImage(named:"lock-2.png")
        let paddingViewfour = UIView(frame: CGRect(x: 0, y: 0, width:25, height: self.txtCreate.frame.size.height))
        imageViewfour.image = imagecratepassword
        txtCreate.leftViewMode = UITextFieldViewMode.always
        txtCreate.addSubview(imageViewfour)
        txtCreate.leftView = paddingViewfour
        
        
        let imageViewfive = UIImageView()
        imageViewfive.frame = CGRect(x:0, y:10, width: iconWidth, height: iconHeight)
        let imageconfirmpassword = UIImage(named:"lock-2.png")
        let paddingViewfive = UIView(frame: CGRect(x: 0, y: 0, width:25, height: self.txtConfirmation.frame.size.height))
        imageViewfive.image = imageconfirmpassword
        txtConfirmation.leftViewMode = UITextFieldViewMode.always
        txtConfirmation.addSubview(imageViewfive)
        txtConfirmation.leftView = paddingViewfive
        buttondateofbirth.addBordertwo(side:.Bottom, color: UIColor.buttondateofbirthcolor(), width:1.0)
    
        txtName.useUnderlinetwo()
        txtSurName.useUnderlinetwo()
        txtEmail.useUnderlinetwo()
        txtCreate.useUnderlinetwo()
        txtConfirmation.useUnderlinetwo()

       self.lblPersonal.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:1.0)
        
        
        
        self.headerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.headerView.layer.shadowOpacity = 0.3
        self.headerView.layer.shadowRadius = 1.0
        self.headerView.layer.borderColor = UIColor.color2().cgColor
        self.headerView.layer.shadowColor = UIColor.color2().cgColor

        DispatchQueue.main.async {
            self.OWNER_DetailsMethod()
        }
        self.verifytopview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        self.okbutton.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        txtName.delegate = self
        txtName.addTarget(self, action: #selector(OwnerDetailsStepViewController.textFieldDidChange(_:)), for: .editingChanged)
        txtSurName.delegate = self
        txtSurName.addTarget(self, action: #selector(OwnerDetailsStepViewController.textFieldDidChange(_:)), for: .editingChanged)
        txtEmail.delegate = self
        txtEmail.addTarget(self, action: #selector(OwnerDetailsStepViewController.textFieldDidChange(_:)), for: .editingChanged)
        txtCreate.delegate = self
        txtCreate.addTarget(self, action: #selector(OwnerDetailsStepViewController.textFieldDidChange(_:)), for: .editingChanged)
        txtConfirmation.delegate = self
        txtConfirmation.addTarget(self, action: #selector(OwnerDetailsStepViewController.textFieldDidChange(_:)), for: .editingChanged)
        txtCreate.keyboardType = .numberPad
        txtConfirmation.keyboardType = .numberPad
        txtName.tintColor = .black
        txtEmail.tintColor = .black
        txtCreate.tintColor = .black
        txtConfirmation.tintColor = .black
        txtSurName.tintColor = .black
        
    
        let iconWidthlogintwo = 25;
        let iconHeightLogintwo = 25;
        let imagepasswordtwo = UIImage(named:"eye_close-22")
        btnPWSHone.setBackgroundImage(imagepasswordtwo, for:.normal)
        btnPWSHone.frame = CGRect(x:285, y:10, width: iconWidthlogintwo, height: iconHeightLogintwo)
        let paddingViewpintwo = UIView(frame: CGRect(x: 0, y: 0, width:25, height:25))
        txtCreate.rightViewMode = UITextFieldViewMode.always
        txtCreate.addSubview(btnPWSHone)
        txtCreate.rightView = paddingViewpintwo
       // btnPWSHone.addTarget(self, action:#selector(self.btnwashone), for: .touchUpInside)
        
        btnPWSHone.addTarget(self, action: #selector(self.btnwashone(_:)), for: .touchUpInside)

        
        let iconWidthloginthree = 25;
        let iconHeightLoginthree = 25;
         let imagepasswordthree = UIImage(named:"eye_op-22")
        btnPWSHTwo.setBackgroundImage(imagepasswordthree, for:.normal)
        btnPWSHTwo.frame = CGRect(x:285, y:10, width: iconWidthloginthree, height: iconHeightLoginthree)
        let paddingViewpinthree = UIView(frame: CGRect(x: 0, y: 0, width:25, height:25))
        txtConfirmation.rightViewMode = UITextFieldViewMode.always
        txtConfirmation.addSubview(btnPWSHTwo)
        txtConfirmation.rightView = paddingViewpinthree
       // btnPWSHTwo.addTarget(self, action:#selector(self.buttonClickedtwo), for: .touchUpInside)
        btnPWSHTwo.addTarget(self, action: #selector(self.buttonClickedtwo(_:)), for: .touchUpInside)

        
        
        
        let singupHeadervalue = UITapGestureRecognizer(target: self, action: #selector(self.handleOwnerde(_:)))
        iamgetopview.addGestureRecognizer(singupHeadervalue)
        iamgetopview.isUserInteractionEnabled = true
        txtConfirmation.isSecureTextEntry = true

  
    }
    @objc func handleOwnerde(_ sender: UITapGestureRecognizer)
    {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BackalertViewController") as! BackalertViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    @objc func btnwashone(_ sender: UIButton)
    {
        txtCreate.resignFirstResponder()
        if btnPWSHone.tag == 0
        {
            txtCreate.isSecureTextEntry = false
            btnPWSHone.setBackgroundImage(#imageLiteral(resourceName: "eye_op-22"), for:.normal)
            btnPWSHone.tag = 1
        }
        else if btnPWSHone.tag == 1
        {
            txtCreate.isSecureTextEntry = true
             btnPWSHone.setBackgroundImage(#imageLiteral(resourceName: "eye_close-22"), for:.normal)
            btnPWSHone.tag = 0
        }
    }
    @objc func buttonClickedtwo(_ sender: UIButton)
    {
        txtConfirmation.resignFirstResponder()
        if btnPWSHTwo.tag == 0
        {
            txtConfirmation.isSecureTextEntry = true
          //  btnPWSHTwo.setBackgroundImage(#imageLiteral(resourceName: "eye_op-22"), for:.normal)
            
             btnPWSHTwo.setBackgroundImage(#imageLiteral(resourceName: "eye_close-22"), for:.normal)
            btnPWSHTwo.tag = 1
        }
        else if btnPWSHTwo.tag == 1
        {
            txtConfirmation.isSecureTextEntry = false
           
            
            
             btnPWSHTwo.setBackgroundImage(#imageLiteral(resourceName: "eye_op-22"), for:.normal)
            btnPWSHTwo.tag = 0
        }
    }
    
    
    @objc func textFieldDidChange(_ textField: UITextField?)
    {
        
        if textField == txtName
        {
            if (textField?.text?.count)! > 0
            {
                self.lblName.isHidden = true
            }
        }
         if textField == txtSurName
        {
            if (textField?.text?.count)! > 0
            {
                self.lblSurName.isHidden = true
            }
        }
         if textField == txtEmail
        {
            if (textField?.text?.count)! > 0
            {
                self.lblEmail.isHidden = true
            }
        }
         if textField == txtCreate
        {
            if (textField?.text?.count)! > 0
            {
                self.lblCreate.isHidden = true
            }
        }
         if textField == txtConfirmation
        {
            if (textField?.text?.count)! > 0
            {
                self.lblConfirmation.isHidden = true
            }
        }
        
    }
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        if textField == txtName
        {
            if (textField.text?.count)! > 0
            {
                self.lblName.isHidden = true
            }
        }
        else if textField == txtSurName
        {
            if (textField.text?.count)! > 0
            {
                self.lblSurName.isHidden = true
            }
        }
        else if textField == txtEmail
        {
            if (textField.text?.count)! > 0
            {
                self.lblEmail.isHidden = true
            }
        }
        else if textField == txtCreate
        {
            if (textField.text?.count)! > 0
            {
                self.lblCreate.isHidden = true
            }
        }
        else if textField == txtConfirmation
        {
            if (textField.text?.count)! > 0
            {
                self.lblConfirmation.isHidden = true
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
     //  self.initializeTextFieldInputView()
    }
    
    @IBAction func Donebutton(_ sender: UIButton)
    {

        self.dateofbirthfinalvalue = "Pickdate"
     self.pickerDate.isHidden = true
    
        let dateOfBirth = Datepickerdateselection.date

        let today = NSDate()

        let gregorian = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!

        let age = gregorian.components([.year], from: dateOfBirth, to: today as Date, options: [])

        if age.year! < 18 {
           // lblDOB.text = "Date of birth is invalid"
               lblDOB.text = "Age cannot be less than 18"
            lblDOB.isHidden = false
            lblDOB.textColor = UIColor.red
        }
      
        else{
            buttondateofbirth.setTitle(Dateofbirthstring, for: .normal)
            lblDOB.isHidden = true

        }
    }
    
    @IBAction func Cancel(_ sender: UIButton)
    {
        self.pickerDate.isHidden = true

    }

    
    @IBAction func btnCall(_ sender: Any) {
        phonecall = "86889 86889"
       
        phonecall.makeAColl()
        pickerDate.isHidden = true
    }
    
    @IBAction func btnDOB(_ sender: Any) {
  
        lblDOB.isHidden = true
        
        if btnDOB.tag == 0
        {
//            IQKeyboardManager.sharedManager().enable = false
//
//            IQKeyboardManager.sharedManager().enableAutoToolbar = true
//            IQKeyboardManager.sharedManager().shouldShowTextFieldPlaceholder = true
      
            txtName.resignFirstResponder()
            txtEmail.resignFirstResponder()
            txtCreate.resignFirstResponder()
            txtConfirmation.resignFirstResponder()
            txtSurName.resignFirstResponder()

            self.pickerDate.isHidden = false
            let dateFormatter = DateFormatter()
            Datepickerdateselection.setValue(UIColor.black, forKeyPath: "textColor")
            Datepickerdateselection.setValue(1.0, forKeyPath: "alpha")
            dateFormatter.dateFormat = "YYYY-MM-dd"
             Datepickerdateselection.maximumDate = Date()
            Datepickerdateselection.addTarget(self, action: #selector(OwnerDetailsStepViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
            btnDOB.tag = 1
        }
        else if btnDOB.tag == 1
        {
      
            self.pickerDate.isHidden = true
            let dateFormatter = DateFormatter()
            Datepickerdateselection.setValue(UIColor.black, forKeyPath: "textColor")
            Datepickerdateselection.setValue(1.0, forKeyPath: "alpha")
            dateFormatter.dateFormat = "dd-MM-YYYY"
            Datepickerdateselection.maximumDate = Date()
            Datepickerdateselection.addTarget(self, action: #selector(OwnerDetailsStepViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
            
            btnDOB.tag = 0
        }
    }
    
    
    
    func validateAge(birthDate: Date) -> Bool {
        var isValid: Bool = true;
        
        if birthDate < MAXIMUM_AGE || birthDate > MINIMUM_AGE {
            isValid = false;
        }
        
        return isValid;
    }
    
    
    
    
    
    @IBAction func Datepcikerfinal(_ sender: UIDatePicker)
    {
        Datepickerdateselection.maximumDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY"
       Dateofbirthstring = dateFormatter.string(from: sender.date)
        print(Dateofbirthstring)
        buttondateofbirth.setTitle(Dateofbirthstring, for: .normal)
        self.lblDOB.isHidden = true
        buttondateofbirth.setTitleColor(UIColor.buttondateofbirthcolor(), for:.normal)
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker)
    {
        
    }
    
    
    @IBAction func Myclosebutton(_ sender: UIButton) {
        self.verifyalertview.isHidden = true
    }
    
    
    
    
    @IBAction func btnMale(_ sender: Any) {
        self.gender = "Male"
        
         self.gender_string = "Male"
        btnFemale.setBackgroundImage(#imageLiteral(resourceName: "female_grey"), for:.normal)
        btnMale.setBackgroundImage(#imageLiteral(resourceName: "male_red"), for:.normal)
        lblGenderType.isHidden = true

        }
    
    @IBAction func btnFemale(_ sender: Any) {
        self.gender = "Female"
        self.gender_string = "Female"

        btnFemale.setBackgroundImage(#imageLiteral(resourceName: "female_red"), for:.normal)
        btnMale.setBackgroundImage(#imageLiteral(resourceName: "male_grey"), for:.normal)
        
        lblGenderType.isHidden = true
        
        

    }
    
    @IBAction func btnConfirmation(_ sender: Any) {
    
        if btnIcon.tag == 0
        {
            txtConfirmation.isSecureTextEntry = true
            btnIcon.setBackgroundImage(#imageLiteral(resourceName: "eye_close-22"), for:.normal)
    
            btnIcon.tag = 1
            
        }
        else if btnIcon.tag == 1
        {
            txtConfirmation.isSecureTextEntry = false
            btnIcon.setBackgroundImage(#imageLiteral(resourceName: "eye_op-22"), for:.normal)
             btnIcon.tag = 0
        }
        
    }
   
    @IBAction func btnNext(_ sender: Any)
    {
        let textnamefinal = txtName.text
        let txtSurNamefinal = txtSurName.text
        let textemailfinal = txtEmail.text
        let txtCreatefinal = txtCreate.text
        let txtConfirmationfinal = txtConfirmation.text
       // self.dateofbirthfinalvalue = (self.buttondateofbirth.titleLabel?.text)!

      //  print(self.dateofbirthfinalvalue)
        
        
        print(txtCreatefinal)
        print(txtConfirmationfinal)

         if (textnamefinal?.isEmpty)!
        {
             self.lblName.isHidden = false
            self.lblName.text = " Enter Valid Name"

        }
       
        if (txtSurNamefinal?.isEmpty)!
        {
            self.lblSurName.isHidden = false
            self.lblSurName.text = "Enter Valid Surname "
        }
         if (textemailfinal?.isEmpty)!
        {
            self.lblEmail.isHidden = false
            self.lblEmail.text = "Enter Valid  Email Id"
            self.lblEmail.textColor = UIColor.red

        }
        if ((txtEmail.text?.count)! > 1)
        {
            
            if (isValidEmailfinal(email:textemailfinal!))
            {
                self.lblEmail.isHidden = true

             }
            else{
                self.lblEmail.isHidden = false
                self.lblEmail.text = " Enter Valid Email Id"
                self.lblEmail.textColor = UIColor.red
            }

            
        }
         if (txtCreatefinal?.isEmpty)!
        {
            self.lblCreate.isHidden = false
            self.lblCreate.text = "Enter a Valid PIN "
            self.lblCreate.textColor = UIColor.red

        }
       
         if (txtConfirmationfinal?.isEmpty)!
        {
            self.lblConfirmation.isHidden = false
            self.lblConfirmation.text = " Create confirmation PIN "
            self.lblConfirmation.textColor = UIColor.red

        }
        if (dateofbirthfinalvalue.isEmpty) && (self.date_of_birthstring.isEmpty)
        {
            self.lblDOB.isHidden = false
            self.lblDOB.text = "Enter Valid DateOfBirth"
            self.lblDOB.textColor = UIColor.red

        }
        
        
        
        
//        if (self.gender.isEmpty)
//        {
//            self.lblGenderType.isHidden = false
//            self.lblGenderType.text = "Select gendertype"
//            self.lblGenderType.textColor = UIColor.red
//        }
//        self.gender_string
        if (self.gender_string.isEmpty)
        {
            self.lblGenderType.isHidden = false
            self.lblGenderType.text = "Select gendertype"
            self.lblGenderType.textColor = UIColor.red
        }
        if ((txtCreatefinal?.count)! < 6)
        {
            self.lblCreate.isHidden = false
            self.lblCreate.text = "Enter Valid PIN"
            self.lblCreate.textColor = UIColor.red
        }
        if ((txtCreatefinal?.count)! ==  6)
        {
            self.lblCreate.isHidden = true
        }
        if ((txtConfirmationfinal?.count)! < 6)
        {
            self.lblConfirmation.isHidden = false
            self.lblConfirmation.text = "Pin don't match"
            self.lblConfirmation.textColor = UIColor.red

        }
        if ((txtConfirmationfinal?.count)! ==  6)
        {
            self.lblConfirmation.isHidden = true

        }
        if ((txtConfirmationfinal?.count)! == 0)
        {
            self.lblConfirmation.isHidden = true
        }
        
        if txtCreatefinal?.count == 6 && txtConfirmationfinal?.count == 6
        {
          
            if txtCreatefinal == txtConfirmationfinal
            {

                    let s = txtCreate.text
                    var str_arr: [String] = []
                    for i in s! {
                        str_arr.append(String(i))
                    }
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
                            lblCreate.text = "Sorry! Any one can guess this PIN, try with at least four unique digits in yourPIN"
                            lblCreate.isHidden = false
                            lblCreate.textColor = UIColor.red
                        }
                        else if v1 == v2! - 1 || v2 == v3! - 1 || v3 == v4! - 1 || v4 == v5! - 1 || v5 == v6! - 1 
                        {
                            lblCreate.text = "Sorry! Any one can guess this PIN, try with at least four unique digits in yourPIN"
                            lblCreate.isHidden = false
                            lblCreate.textColor = UIColor.red
                        }
                     else  if (textemailfinal?.isValidEmail())!
                        {
                            if (self.gender_string.count > 0)
                            {
                                if (textnamefinal?.count)! > 0
                                {
                                    if (txtSurNamefinal?.count)! > 0
                                    {
                                        DispatchQueue.main.async {
                                            self.ownerDetailsMAinMethod()
                                        }
                                    }
                                }
                                
                            }
                            
                        }
                        else{
                            self.lblEmail.isHidden = false
                            self.lblEmail.text = "Enter valid Email"
                            self.lblEmail.textColor = UIColor.red
                        }
                        
                        
                }
                    }
                
//                    let s2 = txtConfirmation.text
//                    var str_arrtwo: [String] = []
//                    for i in s2! {
//                        str_arrtwo.append(String(i))
//                    }
//                    if str_arrtwo.count == 6
//                    {
//                        let v1 = Int(str_arrtwo[0])
//                        let v2 = Int(str_arrtwo[1])
//                        let v3 = Int(str_arrtwo[2])
//                        let v4 = Int(str_arrtwo[3])
//                        let v5 = Int(str_arrtwo[4])
//                        let v6 = Int(str_arrtwo[5])
//
//                        if v1 == v2 || v2 == v3 || v3 == v4 || v4 == v5 || v5 == v6
//                        {
//                            lblConfirmation.text = "No repeated numbers allowed"
//                        }
//                else if v1 == v2!+1 || v2 == v3!+1 || v3 == v4!+1 || v4 == v5!+1 || v5 == v6!+1
//                        {
//                            lblConfirmation.text = "No sequencing numbers allowed"
//                            lblConfirmation.isHidden = false
//                            lblConfirmation.textColor = UIColor.red
//
//                        }
//
//                    }
//                    else
//                    {
//                        if (textemailfinal?.isValidEmail())!
//                        {
//                            if (gender.count > 0)
//                            {
//
//                                if (textnamefinal?.count)! > 0
//                                {
//                                    if (txtSurNamefinal?.count)! > 0
//                                    {
//                                        DispatchQueue.main.async {
//                                            self.ownerDetailsMAinMethod()
//                                        }
//                                    }
//                                }
//
//                            }
//
//                        }
//                    }
//
                
//                    else{
//
//
//            }
            else{
//               self.view.makeToast("passowrd Doesnot match")
                let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
                popOverVC.alertTitleString = "Error"
                popOverVC.alertMessageString = "Password Doesnot match"
                self.addChildViewController(popOverVC)
                popOverVC.view.frame = self.view.frame
                self.view.addSubview(popOverVC.view)
                popOverVC.didMove(toParentViewController: self)
                
                
            }
        }
      
        
        
    }
    
    
    func isValidEmailfinal(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: email)
        return result
    }
    @IBAction func onwerdaetlsbutton(_ sender: UIButton)
    {
        
    }
    @IBAction func buttoncalltwo(_ sender: UIButton)
    {
        if buttoncalltwo.tag == 0
        {
            txtCreate.isSecureTextEntry = false
            buttoncalltwo.setBackgroundImage(#imageLiteral(resourceName: "eye_close-22"), for:.normal)
    
            buttoncalltwo.tag = 1
            
        }
        else if buttoncalltwo.tag == 1
        {
            txtCreate.isSecureTextEntry = true
            buttoncalltwo.setBackgroundImage(#imageLiteral(resourceName: "eye_op-22"), for:.normal)
            buttoncalltwo.tag = 0
        }
    }

    func ownerDetailsMAinMethod()
    {

        let Dateof_birth = self.buttondateofbirth.titleLabel?.text
        let data = ["ownerdetails":["given_name":self.txtName.text!,"surname":self.txtSurName.text!,"date_of_birth":Dateof_birth!,"email_id": self.txtEmail.text!,"image":"","gender":self.gender_string,"create_password":self.txtConfirmation.text!]] as [String : Any]
        let jsonData = try? JSONSerialization.data(withJSONObject: data, options: [])
        let jsonString = String(data: jsonData!, encoding: .utf8)
      
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let postString =  String(format: "method=%@&mobileNo=%@&type=%@&updateflag=%@&category=%@&data=%@","getownerdetails",OwnerMissedCalledNumbervalueotp,"submit","0","ownerdetails",jsonString!)
     
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
                        let view  = self.storyboard?.instantiateViewController(withIdentifier:"BusinessDetailsViewController")as!BusinessDetailsViewController
                        view.MobileNumberBusinessDetail = self.OwnerMissedCalledNumbervalueotp
                        self.present(view, animated: true, completion:nil)
                        
                        
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
    
        func OWNER_DetailsMethod()
        {
            print(OwnerMissedCalledNumbervalueotp)
            
            self.showSpinner()
            var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
            request.httpMethod = "POST"
            
            let defaultsfinalvalue = UserDefaults.standard
        
            let Mobilevalueis  = defaultsfinalvalue.value(forKey:"Mymobilenumbervalue")
          
            let postString =  String(format: "method=%@&mobileNo=%@&type=%@&category=%@","getownerdetails",Mobilevalueis as! CVarArg,"get","ownerdetails")
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
                        if let ownerValue:NSDictionary =              dict.value(forKey:"ownerdetails")as?NSDictionary
                        {
                            self.OwnerDetils = ownerValue
                            print(self.OwnerDetils)
                            
                            self.email_idstring = self.OwnerDetils.value(forKey:"email_id")as!String
                            
                            self.create_passwordstring = self.OwnerDetils.value(forKey:"create_password")as!String
                            self.date_of_birthstring = self.OwnerDetils.value(forKey:"date_of_birth")as!String
                            self.email_idstring = self.OwnerDetils.value(forKey:"email_id")as!String
                            
                            self.gender_string = self.OwnerDetils.value(forKey:"gender")as!String
                            
                            print(self.gender_string)
                            
                            self.given_name_string = self.OwnerDetils.value(forKey:"given_name")as!String
//                            self.phone_string = self.OwnerDetils.value(forKey:"phone")as!String
                            self.surname_string = self.OwnerDetils.value(forKey:"surname")as!String
                            
                            self.txtName.text = self.given_name_string
                            self.txtSurName.text = self.surname_string
                            self.txtEmail.text = self.email_idstring

                            self.txtCreate.text = self.create_passwordstring
                            self.buttondateofbirth.setTitle(self.date_of_birthstring, for:.normal)
                            self.buttondateofbirth.setTitleColor(UIColor.black, for:.normal)
                            self.txtConfirmation.text = self.create_passwordstring

                            if self.gender_string == "Male"
                            {
                                self.btnMale.isHidden = false
                                self.btnMale.setBackgroundImage(#imageLiteral(resourceName: "male_red"), for:.normal)
                            }
                            if self.gender_string == "Female"
                            {
                                self.btnMale.isHidden = false
                                self.btnMale.setBackgroundImage(#imageLiteral(resourceName: "female_red"), for:.normal)

                            }
                          
                            let  userdefaultsingel = UserDefaults.standard
                            
                            userdefaultsingel.removeObject(forKey:"MyarryTwofinal")
                            userdefaultsingel.removeObject(forKey:"arryone")
                            userdefaultsingel.removeObject(forKey:"Mybusinessname")
                            userdefaultsingel.synchronize()

                            
                        }
  
                    }
                    else
                    {
                        self.removeSpinner()
     
                    }
                    break
                case .failure(_):
                    break
                }
                DispatchQueue.main.async {
                    self.removeSpinner()
                }
                
                
            }
            
        }

    func showSpinner(){
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.verifyalertview.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(imageView)
    }
    func removeSpinner(){
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var result = true
        if textField == txtCreate {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")
            let characterSet = CharacterSet(charactersIn: string)
            let maxLength = 6
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            
            return allowedCharacters.isSuperset(of: characterSet) && newString.length <= maxLength
        }
        if textField == txtConfirmation {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")
            let characterSet = CharacterSet(charactersIn: string)
            let maxLength = 6
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            
            return allowedCharacters.isSuperset(of: characterSet) && newString.length <= maxLength
        }
        

        return result
        
    }
    
    
}







extension UITextField {
    
    enum Direction {
        case Left
        case Right
    }
    
    // add image to textfield
    func withImage(direction: Direction, image: UIImage, colorSeparator: UIColor, colorBorder: UIColor){
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
        mainView.layer.cornerRadius = 5
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.layer.borderWidth = CGFloat(0.5)
        view.layer.borderColor = colorBorder.cgColor
        mainView.addSubview(view)
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 12.0, y: 10.0, width: 24.0, height: 24.0)
        view.addSubview(imageView)
        
        let seperatorView = UIView()
        seperatorView.backgroundColor = colorSeparator
        mainView.addSubview(seperatorView)
        
        if(Direction.Left == direction){ // image left
            seperatorView.frame = CGRect(x: 45, y: 0, width: 5, height: 45)
            self.leftViewMode = .always
            self.leftView = mainView
        } else { // image right
            seperatorView.frame = CGRect(x: 0, y: 0, width: 5, height: 45)
            self.rightViewMode = .always
            self.rightView = mainView
        }
        
        self.layer.borderColor = colorBorder.cgColor
        self.layer.borderWidth = CGFloat(0.5)
        self.layer.cornerRadius = 5
}

        func setLeftPaddingPoints(_ amount:CGFloat){
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
            self.leftView = paddingView
            self.leftViewMode = .always
        }
        func setRightPaddingPoints(_ amount:CGFloat) {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }

extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}
