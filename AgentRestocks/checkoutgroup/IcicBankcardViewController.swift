//
//  IcicBankcardViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 17/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class IcicBankcardViewController: UIViewController,UITextFieldDelegate
{

    @IBOutlet weak var topview: UIView!
    @IBOutlet weak var firsttetxfiled: UITextField!
    @IBOutlet weak var secondtextfield: UITextField!
    
    @IBOutlet weak var thirdtextfiled: UITextField!
    
    
    @IBOutlet weak var datemonthtetxfieldview: UITextField!
    
    @IBOutlet weak var Zerodigittextfiled: UITextField!
    
    
    var IcicBankcardViewtimertwo = Timer()

    
    @IBOutlet weak var sendbutton: UIButton!
    
    
    var accountnumber = String()
    
    var accountExpiredtae = String()

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        topview.layer.shadowOffset = CGSize(width: 0, height: 2)
        topview.layer.shadowOpacity = 0.3
        topview.layer.shadowRadius = 1.0
        topview.layer.borderColor = UIColor.color2().cgColor
        topview.layer.shadowColor = UIColor.color2().cgColor
        datemonthtetxfieldview.useUnderline()
        datemonthtetxfieldview.keyboardType = .numberPad
        firsttetxfiled.keyboardType = .numberPad
        secondtextfield.keyboardType = .numberPad
        thirdtextfiled.keyboardType = .numberPad
        Zerodigittextfiled.keyboardType = .numberPad
        Zerodigittextfiled.useUnderline()
        firsttetxfiled.delegate = self
        secondtextfield.delegate = self
        thirdtextfiled.delegate = self
        datemonthtetxfieldview.delegate = self
        Zerodigittextfiled.delegate = self

//        Zerodigittextfiled.addTarget(self, action: #selector(myTargetFunction), for: UIControlEvents.touchDown)
//        firsttetxfiled.addTarget(self, action: #selector(myTargetFunctionone), for: UIControlEvents.touchDown)
//        secondtextfield.addTarget(self, action: #selector(myTargetFunctiontwo), for: UIControlEvents.touchDown)
//        thirdtextfiled.addTarget(self, action: #selector(myTargetFunctionthree), for: UIControlEvents.touchDown)
//
        Zerodigittextfiled.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        firsttetxfiled.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        secondtextfield.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        thirdtextfiled.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        
        datemonthtetxfieldview.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
    }
    
 @objc func textFieldDidChange(textField: UITextField)
 {
    if textField == firsttetxfiled
    {
        let text = textField.text
        if text?.utf16.count == 4
        {
            secondtextfield.becomeFirstResponder()
        }
    }
    if textField == secondtextfield
    {
        let text = textField.text
        if text?.utf16.count == 4
        {
            thirdtextfiled.becomeFirstResponder()
            
        }
    }
    if textField == thirdtextfiled
    {
        let text = textField.text
        if text?.utf16.count == 2
        {
            Zerodigittextfiled.becomeFirstResponder()
            accountnumber = "accountnumber"
        }
    }
    if textField == Zerodigittextfiled
    {
        let text = textField.text
        if text?.utf16.count == 6
        {
            datemonthtetxfieldview.becomeFirstResponder()
//            IcicBankcardViewtimertwo = Timer.scheduledTimer(timeInterval:5.0, target: self, selector: #selector(IcicBankcardViewtimertwofinalvalue), userInfo: nil, repeats: false)
        }
    }
    if textField == datemonthtetxfieldview
    {
        let text = textField.text
        if text?.utf16.count == 5
        {
            accountExpiredtae = "accountExpiredtae"
            datemonthtetxfieldview.resignFirstResponder()
                 IcicBankcardViewtimertwo = Timer.scheduledTimer(timeInterval:1.0, target: self, selector: #selector(IcicBankcardViewtimertwofinalvalue), userInfo: nil, repeats: false)
        }
    }

    }

    @objc func IcicBankcardViewtimertwofinalvalue()
    {
        DispatchQueue.main.async
            {
            let viewone = self.storyboard?.instantiateViewController(withIdentifier:"TitleUPIPINViewController")as!TitleUPIPINViewController
            self.present(viewone, animated: true, completion:nil)
        }
    }
    @IBOutlet weak var mycardview: CardView!
    
    @IBAction func Backbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool
    {
        if textField == datemonthtetxfieldview
        {
            let maxLength = 5
            let currentString: NSString = textField.text as! NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
      
        if textField == firsttetxfiled
        {
            let maxLength = 4
            let currentString: NSString = textField.text as! NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength

        }
        if textField == secondtextfield
        {
            let maxLength = 4
            let currentString: NSString = textField.text as! NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
        
        if textField == thirdtextfiled
        {
            let maxLength = 2
            let currentString: NSString = textField.text as! NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
        if textField == Zerodigittextfiled
        {
            let maxLength = 6
            let currentString: NSString = textField.text as! NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
        else
        {
            let maxLength = 6
            let currentString: NSString = textField.text as! NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
    }
    @IBAction func send(_ sender: UIButton)
    {
        if accountnumber != "" && accountExpiredtae != ""
        
        {
            
            DispatchQueue.main.async
                {
                    let viewone = self.storyboard?.instantiateViewController(withIdentifier:"TitleUPIPINViewController")as!TitleUPIPINViewController
                    self.present(viewone, animated: true, completion:nil)
            }
        }
    }
 
}
