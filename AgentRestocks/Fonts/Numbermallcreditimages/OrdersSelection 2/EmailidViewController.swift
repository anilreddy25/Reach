
//
//  EmailidViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 29/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class EmailidViewController: UIViewController,UITextFieldDelegate
{
    @IBOutlet weak var profiletopview: UIView!
    @IBOutlet weak var Backbutton: UIButton!
    @IBOutlet weak var EnteryourEmailid: UITextField!
    
    @IBOutlet weak var Confirmbutton: UIButton!
    
    
    @IBOutlet weak var verficationpendinglabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profiletopview.layer.shadowOffset = CGSize(width: 0, height: 3)
        profiletopview.layer.shadowOpacity = 0.6
        profiletopview.layer.shadowRadius = 3.0
        profiletopview.layer.shadowColor = UIColor.color2().cgColor
        
        Confirmbutton.layer.cornerRadius = 6.0
        Confirmbutton.layer.masksToBounds = true
        
        EnteryourEmailid.useUnderline()
        EnteryourEmailid.delegate = self
    }
    
    @IBAction func MyBackbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
        
    }
    
    @IBAction func Confirm(_ sender: UIButton)
    {
        verficationpendinglabel.isHidden = true
        
        guard let email = EnteryourEmailid.text, EnteryourEmailid.text?.characters.count != 0  else {
            verficationpendinglabel.isHidden = false
            verficationpendinglabel.text = "Verification pending"
            return
        }
        
        if isValidEmail(emailID: email) == false
        {
            verficationpendinglabel.isHidden = false
            verficationpendinglabel.text = "Verification pending"
        }
        
//        guard let password = txtPassword.text, txtPassword.text?.characters.count != 0  else {
//            lblValidationMessage.isHidden = false
//            lblValidationMessage.text = "Please enter your password"
//            return
//        }
     
    }
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        if textField == EnteryourEmailid
        {
            print("You edit EnteryourEmailid")
        }
    }
    
    func isValidEmail(emailID:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailID)
    }
    
    
}
