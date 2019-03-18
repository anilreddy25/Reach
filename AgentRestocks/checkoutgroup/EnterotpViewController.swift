//
//  EnterotpViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 17/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class EnterotpViewController: UIViewController,UITextFieldDelegate
{
    @IBOutlet weak var openeyebutton: UIButton!
    @IBOutlet weak var showbutton: UIButton!
    @IBOutlet weak var oponetextfield: UITextField!
    @IBOutlet weak var otptwotextfield: UITextField!
    @IBOutlet weak var otpthree: UITextField!
    @IBOutlet weak var otpfourt: UITextField!
    @IBOutlet weak var otpfive: UITextField!
    @IBOutlet weak var otpsix: UITextField!
    @IBOutlet weak var Enterpintetxfiledone: UITextField!
    @IBOutlet weak var enterpintextfiledtwo: UITextField!
    @IBOutlet weak var enterpintextfiledthree: UITextField!
    @IBOutlet weak var enterpintetxfiledfour: UITextField!
    @IBOutlet weak var entertextfilefive: UITextField!
    @IBOutlet weak var entertextfiledsix: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        oponetextfield.addTarget(self, action: #selector(EnterotpViewController.textFieldDidChange(_:)),
                            for: UIControlEvents.editingChanged)
        otptwotextfield.addTarget(self, action: #selector(EnterotpViewController.textFieldDidChange(_:)),
                                 for: UIControlEvents.editingChanged)
        otpthree.addTarget(self, action: #selector(EnterotpViewController.textFieldDidChange(_:)),
                                  for: UIControlEvents.editingChanged)
        otpfourt.addTarget(self, action: #selector(EnterotpViewController.textFieldDidChange(_:)),
                           for: UIControlEvents.editingChanged)
        otpfive.addTarget(self, action: #selector(EnterotpViewController.textFieldDidChange(_:)),
                           for: UIControlEvents.editingChanged)
        otpsix.addTarget(self, action: #selector(EnterotpViewController.textFieldDidChange(_:)),
                           for: UIControlEvents.editingChanged)
        
        Enterpintetxfiledone.addTarget(self, action: #selector(EnterotpViewController.textFieldDidChangetwo(_:)),
                         for: UIControlEvents.editingChanged)
        
       enterpintextfiledtwo.addTarget(self, action: #selector(EnterotpViewController.textFieldDidChangetwo(_:)),
                                           for: UIControlEvents.editingChanged)
        
        
        enterpintextfiledthree.addTarget(self, action: #selector(EnterotpViewController.textFieldDidChangetwo(_:)),
                                       for: UIControlEvents.editingChanged)
        
        enterpintetxfiledfour.addTarget(self, action: #selector(EnterotpViewController.textFieldDidChangetwo(_:)),
                                         for: UIControlEvents.editingChanged)
        entertextfilefive.addTarget(self, action: #selector(EnterotpViewController.textFieldDidChangetwo(_:)),
                                        for: UIControlEvents.editingChanged)
        
        entertextfiledsix.addTarget(self, action: #selector(EnterotpViewController.textFieldDidChangetwo(_:)),
                                    for: UIControlEvents.editingChanged)
        
        oponetextfield.useUnderline()
        otptwotextfield.useUnderline()
        otpthree.useUnderline()
        otpfourt.useUnderline()
        otpfive.useUnderline()
        otpsix.useUnderline()
        
        oponetextfield.delegate = self
        otptwotextfield.delegate = self
        otpthree.delegate = self
        otpfourt.delegate = self
        otpfive.delegate = self
        otpsix.delegate = self
     
        Enterpintetxfiledone.delegate = self
        enterpintextfiledtwo.delegate = self
        enterpintextfiledthree.delegate = self
        enterpintetxfiledfour.delegate = self
        entertextfilefive.delegate = self
        entertextfiledsix.delegate = self
        
        Enterpintetxfiledone.useUnderline()
        enterpintextfiledtwo.useUnderline()
        enterpintextfiledthree.useUnderline()
        enterpintetxfiledfour.useUnderline()
        entertextfilefive.useUnderline()
        entertextfiledsix.useUnderline()
        
        Enterpintetxfiledone.keyboardType = .phonePad
        enterpintextfiledtwo.keyboardType = .phonePad
        enterpintextfiledthree.keyboardType = .phonePad
        enterpintetxfiledfour.keyboardType = .phonePad
        entertextfilefive.keyboardType = .phonePad
        entertextfiledsix.keyboardType = .phonePad

        
        
        oponetextfield.keyboardType = .phonePad
        otptwotextfield.keyboardType = .phonePad
        otpthree.keyboardType = .phonePad
        otpfourt.keyboardType = .phonePad
        otpfive.keyboardType = .phonePad
        otpsix.keyboardType = .phonePad

    }
    @objc func textFieldDidChange(_ textField: UITextField)
    {
        
    
        
        
        
        
        if textField == oponetextfield
        {
            let text = textField.text
            if text?.utf16.count == 1
            {
                otptwotextfield.becomeFirstResponder()
            }
        }
        if textField == otptwotextfield
        {
            let text = textField.text
            if text?.utf16.count == 1
            {
                otpthree.becomeFirstResponder()
                
            }
        }
        if textField == otpthree
        {
            let text = textField.text
            if text?.utf16.count == 1
            {
                otpfourt.becomeFirstResponder()
            }
        }
        if textField == otpfourt
        {
            let text = textField.text
            if text?.utf16.count == 1
            {
                otpfive.becomeFirstResponder()
                
            }
        }
        if textField == otpfive
        {
            let text = textField.text
            if text?.utf16.count == 1
            {
                otpsix.becomeFirstResponder()

            }
        }
        if textField == otpsix
        {
            let text = textField.text
            if text?.utf16.count == 1
            {
                Enterpintetxfiledone.becomeFirstResponder()
                
            }
        }
        
       
    }
    @objc func textFieldDidChangetwo(_ textField: UITextField)
    {
    
        if textField == Enterpintetxfiledone
        {
            let text = textField.text
            if text?.utf16.count == 1
            {
                enterpintextfiledtwo.becomeFirstResponder()
            }
        }
        if textField == enterpintextfiledtwo
        {
            let text = textField.text
            if text?.utf16.count == 1
            {
                enterpintextfiledthree.becomeFirstResponder()
                
            }
        }
        if textField == enterpintextfiledthree
        {
            let text = textField.text
            if text?.utf16.count == 1
            {
                enterpintetxfiledfour.becomeFirstResponder()
            }
        }
        if textField == enterpintetxfiledfour
        {
            let text = textField.text
            if text?.utf16.count == 1
            {
                entertextfilefive.becomeFirstResponder()
                
            }
        }
        if textField == entertextfilefive
        {
            let text = textField.text
            if text?.utf16.count == 1
            {
                entertextfiledsix.becomeFirstResponder()
                
            }
        }
        if textField == entertextfiledsix
        {
            let text = textField.text
            if text?.utf16.count == 1
            {
                entertextfiledsix.resignFirstResponder()
                
                
                DispatchQueue.main.async
                    {
                        
                    let payyoumoney = self.storyboard?.instantiateViewController(withIdentifier:"PayingusingViewController")as!PayingusingViewController
                        self.present(payyoumoney, animated:true, completion:nil)
                }
            }
        }
    }
    
    @IBAction func opneye(_ sender: UIButton)
    {
        if openeyebutton.tag == 0
        {
            openeyebutton.setBackgroundImage(#imageLiteral(resourceName: "eye_close-22"), for:.normal)
            
            oponetextfield.isSecureTextEntry = false
            otptwotextfield.isSecureTextEntry = false
            otpthree.isSecureTextEntry = false
            otpfourt.isSecureTextEntry = false
            otpfive.isSecureTextEntry = false
            otpsix.isSecureTextEntry = false


            Enterpintetxfiledone.isSecureTextEntry = false
            enterpintextfiledtwo.isSecureTextEntry = false
            enterpintextfiledthree.isSecureTextEntry = false
            enterpintetxfiledfour.isSecureTextEntry = false
            entertextfilefive.isSecureTextEntry = false
            entertextfiledsix.isSecureTextEntry = false
            
           

            openeyebutton.tag = 1
        }
        else if openeyebutton.tag == 1
        {
            oponetextfield.isSecureTextEntry = true
            otptwotextfield.isSecureTextEntry = true
            otpthree.isSecureTextEntry = true
            otpfourt.isSecureTextEntry = true
            otpfive.isSecureTextEntry = true
            otpsix.isSecureTextEntry = true
            
            Enterpintetxfiledone.isSecureTextEntry = true
            enterpintextfiledtwo.isSecureTextEntry = true
            enterpintextfiledthree.isSecureTextEntry = true
            enterpintetxfiledfour.isSecureTextEntry = true
            entertextfilefive.isSecureTextEntry = true
            entertextfiledsix.isSecureTextEntry = true
            
            openeyebutton.setBackgroundImage(#imageLiteral(resourceName: "Eye"), for:.normal)
            openeyebutton.tag = 0
        }
    }
    
    @IBAction func showbutton(_ sender: UIButton)
    {
        
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool
    {
        
            let maxLength = 1
            let currentString: NSString = textField.text as! NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
       
    }
    
    
    
    
}
