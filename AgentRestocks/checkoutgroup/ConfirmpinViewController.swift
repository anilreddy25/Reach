//
//  ConfirmpinViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 17/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class ConfirmpinViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var textfiledone: UITextField!
    @IBOutlet weak var textfiledthree: UITextField!
    
    @IBOutlet weak var textfiletwo: UITextField!
    
    @IBOutlet weak var textfiledfour: UITextField!
    
    @IBOutlet weak var textfilefive: UITextField!
    
    
    @IBOutlet weak var textfiledsix: UITextField!
    
    @IBOutlet weak var eyebutton: UIButton!
    
    @IBOutlet weak var showbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
        textfiledone.useUnderline()
        textfiletwo.useUnderline()
        textfiledthree.useUnderline()
        textfiledfour.useUnderline()
        textfilefive.useUnderline()
        textfiledsix.useUnderline()
        
        
        textfiledone.delegate = self
        textfiletwo.delegate = self
        textfiledthree.delegate = self
        textfiledfour.delegate = self
        textfilefive.delegate = self
        textfiledsix.delegate = self
        
        
        textfiledone.keyboardType = .numberPad
        textfiletwo.keyboardType = .numberPad
        textfiledthree.keyboardType = .numberPad
        textfiledfour.keyboardType = .numberPad
        textfilefive.keyboardType = .numberPad
        textfiledsix.keyboardType = .numberPad
        
        
        textfiledone.addTarget(self, action: #selector(ConfirmpinViewController.textFieldDidChangeConfirmpin(_:)),
                               for: UIControlEvents.editingChanged)
        
        
        textfiletwo.addTarget(self, action: #selector(ConfirmpinViewController.textFieldDidChangeConfirmpin(_:)),
                               for: UIControlEvents.editingChanged)
        
        textfiledthree.addTarget(self, action: #selector(ConfirmpinViewController.textFieldDidChangeConfirmpin(_:)),
                                 for: UIControlEvents.editingChanged)
        
        
        textfiledfour.addTarget(self, action: #selector(ConfirmpinViewController.textFieldDidChangeConfirmpin(_:)),
                                for: UIControlEvents.editingChanged)
        
        textfilefive.addTarget(self, action: #selector(ConfirmpinViewController.textFieldDidChangeConfirmpin(_:)),
                                for: UIControlEvents.editingChanged)
        
        textfiledsix.addTarget(self, action: #selector(ConfirmpinViewController.textFieldDidChangeConfirmpin(_:)),
                               for: UIControlEvents.editingChanged)
   
    }
    @objc func textFieldDidChangeConfirmpin(_ textField: UITextField)
    {
        
    }
    @IBAction func eyebuton(_ sender: UIButton)
    {
        
        if eyebutton.tag == 0
        {
            eyebutton.setBackgroundImage(#imageLiteral(resourceName: "eye_close-22"), for:.normal)
            eyebutton.tag = 1
        }
        else if eyebutton.tag == 1
        {
            eyebutton.setBackgroundImage(#imageLiteral(resourceName: "Eye"), for:.normal)
            eyebutton.tag = 0
        }
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 1
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }

}
