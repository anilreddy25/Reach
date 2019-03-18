
//
//  UPipinViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 17/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class UPipinViewController: UIViewController,UITextFieldDelegate
{
    
    @IBOutlet weak var eyebutton: UIButton!
    @IBOutlet weak var upitextfiledone: UITextField!
    @IBOutlet weak var upitextfiledtwo: UITextField!
    @IBOutlet weak var upitextfiledthree: UITextField!
    @IBOutlet weak var upitextfiledfour: UITextField!
    @IBOutlet weak var showbutton: UIButton!
    var UPipinViewthisorderView = Timer()
    
    @IBOutlet weak var eyebuttonone: UIButton!
    
    @IBOutlet weak var showbuttone: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        upitextfiledone.useUnderline()
        upitextfiledtwo.useUnderline()
        upitextfiledthree.useUnderline()
        upitextfiledfour.useUnderline()
      
        upitextfiledone.delegate  = self
        upitextfiledtwo.delegate  = self
        upitextfiledthree.delegate  = self
        upitextfiledfour.delegate  = self
        
        upitextfiledone.keyboardType = .numberPad
        upitextfiledtwo.keyboardType = .numberPad
        upitextfiledthree.keyboardType = .numberPad
        upitextfiledfour.keyboardType = .numberPad
        
       
        upitextfiledone.addTarget(self, action: #selector(UPipinViewController.textFieldDidChangeUPipinViewController(_:)),
                               for: UIControlEvents.editingChanged)
        upitextfiledtwo.addTarget(self, action: #selector(UPipinViewController.textFieldDidChangeUPipinViewController(_:)),
                              for: UIControlEvents.editingChanged)
        upitextfiledthree.addTarget(self, action: #selector(UPipinViewController.textFieldDidChangeUPipinViewController(_:)),
                                 for: UIControlEvents.editingChanged)
        upitextfiledfour.addTarget(self, action: #selector(UPipinViewController.textFieldDidChangeUPipinViewController(_:)),
                                for: UIControlEvents.editingChanged)
 
        upitextfiledone.becomeFirstResponder()

          UPipinViewthisorderView = Timer.scheduledTimer(timeInterval:5.0, target: self, selector: #selector(UPipinViewthisorderViewtimerAction), userInfo: nil, repeats: false)
    }
    
    @objc func UPipinViewthisorderViewtimerAction()
    {
        DispatchQueue.main.async
            {
                let Bankvaluetwo = self.storyboard?.instantiateViewController(withIdentifier:"OrderDoneViewController")as!OrderDoneViewController
                self.present(Bankvaluetwo, animated: true, completion:nil)
        }
    }
    
    
    @objc func textFieldDidChangeUPipinViewController(_ textField: UITextField)
    {
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if ((textField.text?.count)! < 1 ) && (string.count > 0) {
            
//
//            upitextfiledone.useUnderline()
//            upitextfiledtwo.useUnderline()
//            upitextfiledthree.useUnderline()
//            upitextfiledfour.useUnderline()
//
//
            if textField == upitextfiledone {
                upitextfiledtwo.becomeFirstResponder()
            }
            
            if textField == upitextfiledtwo {
                upitextfiledthree.becomeFirstResponder()
            }
            
            if textField == upitextfiledthree {
                upitextfiledfour.becomeFirstResponder()
            }
            
            if textField == upitextfiledfour {
                upitextfiledfour.resignFirstResponder()
            }
            
            textField.text = string
            return false
        } else if ((textField.text?.count)! >= 1) && (string.count == 0) {
            if textField == upitextfiledtwo {
                upitextfiledone.becomeFirstResponder()
            }
            if textField == upitextfiledthree {
                upitextfiledtwo.becomeFirstResponder()
            }
            if textField == upitextfiledfour {
                upitextfiledthree.becomeFirstResponder()
            }
            if textField == upitextfiledone {
                upitextfiledone.resignFirstResponder()
            }
            
            textField.text = ""
            return false
        } else if (textField.text?.count)! >= 1 {
            textField.text = string
            return false
        }
        
        return true
    }

    @IBAction func eyebutton(_ sender: UIButton)
    {
        if eyebuttonone.tag == 0
        {
            eyebuttonone.setBackgroundImage(#imageLiteral(resourceName: "eye_close-22"), for:.normal)
            upitextfiledone.isSecureTextEntry = false
            upitextfiledtwo.isSecureTextEntry = false
            upitextfiledthree.isSecureTextEntry = false
            upitextfiledfour.isSecureTextEntry = false
            eyebuttonone.tag = 1
        }
        else if eyebuttonone.tag == 1
        {
            upitextfiledone.isSecureTextEntry = true
            upitextfiledtwo.isSecureTextEntry = true
            upitextfiledthree.isSecureTextEntry = true
            upitextfiledfour.isSecureTextEntry = true
            eyebuttonone.setBackgroundImage(#imageLiteral(resourceName: "Eye"), for:.normal)
            eyebuttonone.tag = 0
        }
    }
}



