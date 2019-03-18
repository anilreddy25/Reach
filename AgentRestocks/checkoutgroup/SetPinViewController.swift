
//
//  SetPinViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 17/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class SetPinViewController: UIViewController,UITextFieldDelegate
{
    @IBOutlet weak var textfiledone: UITextField!
    @IBOutlet weak var textfiledtwo: UITextField!
    
    @IBOutlet weak var textfiledthree: UITextField!
    
    @IBOutlet weak var textfiledfour: UITextField!
    
    @IBOutlet weak var textfiledfive: UITextField!
    
    @IBOutlet weak var tetxfieldsix: UITextField!
    
    @IBOutlet weak var buttonshow: UIButton!
    @IBOutlet weak var buttoneye: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        textfiledone.useUnderline()
        textfiledtwo.useUnderline()
        textfiledthree.useUnderline()
        textfiledfour.useUnderline()
        textfiledfive.useUnderline()
        tetxfieldsix.useUnderline()


        textfiledone.delegate = self
        textfiledtwo.delegate = self
        textfiledthree.delegate = self
        textfiledfour.delegate = self
        textfiledfive.delegate = self
        tetxfieldsix.delegate = self
        
        
        textfiledone.keyboardType = .numberPad
        textfiledtwo.keyboardType = .numberPad
        textfiledthree.keyboardType = .numberPad
        textfiledfour.keyboardType = .numberPad
        textfiledfive.keyboardType = .numberPad
        tetxfieldsix.keyboardType = .numberPad
        
        
        

        
        textfiledone.addTarget(self, action: #selector(SetPinViewController.textFieldDidChangesetpin(_:)),
                                 for: UIControlEvents.editingChanged)
        
        
        textfiledtwo.addTarget(self, action: #selector(SetPinViewController.textFieldDidChangesetpin(_:)),
                                  for: UIControlEvents.editingChanged)
        
        textfiledthree.addTarget(self, action: #selector(SetPinViewController.textFieldDidChangesetpin(_:)),
                           for: UIControlEvents.editingChanged)
        
        
        textfiledfour.addTarget(self, action: #selector(SetPinViewController.textFieldDidChangesetpin(_:)),
                           for: UIControlEvents.editingChanged)
        
        textfiledfive.addTarget(self, action: #selector(SetPinViewController.textFieldDidChangesetpin(_:)),
                          for: UIControlEvents.editingChanged)
        
        tetxfieldsix.addTarget(self, action: #selector(SetPinViewController.textFieldDidChangesetpin(_:)),
                         for: UIControlEvents.editingChanged)
        
        
      
        
        
        
    }
    @objc func textFieldDidChangesetpin(_ textField: UITextField)
    {
        
    }
    @IBAction func buttoneye(_ sender: UIButton) {
        
        if buttoneye.tag == 0
        {
            buttoneye.setBackgroundImage(#imageLiteral(resourceName: "eye_close-22"), for:.normal)
            buttoneye.tag = 1
        }
        else if buttoneye.tag == 1
        {
            buttoneye.setBackgroundImage(#imageLiteral(resourceName: "Eye"), for:.normal)
            buttoneye.tag = 0
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
