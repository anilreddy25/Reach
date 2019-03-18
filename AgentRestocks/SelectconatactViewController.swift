//
//  SelectconatactViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 18/10/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//
// https://stackoverflow.com/questions/32669612/how-to-fetch-all-contacts-record-in-ios-9-using-contacts-framework
import UIKit
import ContactsUI

class SelectconatactViewController: UIViewController,CNContactPickerDelegate {
    @IBOutlet weak var selectcontactview: UIView!
    
    @IBOutlet weak var Newgroupviewfinalvalue: UIView!
    
    @IBOutlet weak var Invitefriendsview: UIView!
    var Phonenumbervalue = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.selectcontactview.layer.addBorder(edge:.bottom, color: UIColor.textfiledbottomcolorside(), thickness:0.6)
        self.Newgroupviewfinalvalue.layer.addBorder(edge:.bottom, color: UIColor.textfiledbottomcolorside(), thickness:0.6)
        self.Invitefriendsview.layer.addBorder(edge:.bottom, color: UIColor.textfiledbottomcolorside(), thickness:0.6)
        let cnPicker = CNContactPickerViewController()
        cnPicker.delegate = self
//        self.present(cnPicker, animated: true, completion: nil)
//        for phoneNumber in contact.phoneNumbers {
//            if let number = phoneNumber.value as? CNPhoneNumber,
//                let label = phoneNumber.label {
//                let localizedLabel = CNLabeledValue.localizedStringForLabel(label)
//                print("\(localizedLabel)  \(number.stringValue)")
//            }
//        }
//        for number in cnPicker.phoneNumbers {
//            let phoneNumber = number.value
//            let string = phoneNumber.stringValue
//            
//            print("number is = \(phoneNumber)")
//            Phonenumbervalue.append(string)
//            
//        }
        
   
            print(Phonenumbervalue)
            self.methodfinalvalue()
        
        }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
    }
    @IBAction func MyBackbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    @IBAction func seacrhbutton(_ sender: UIButton)
    {
        
    }
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        contacts.forEach { contact in
            for number in contact.phoneNumbers {
                let phoneNumber = number.value
                let string = phoneNumber.stringValue
                
                print("number is = \(phoneNumber)")
                Phonenumbervalue.append(string)
                
            }
            print(Phonenumbervalue)

        }
    }
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        print("Cancel Contact Picker")
    }
    func methodfinalvalue()
    {
        let store = CNContactStore()
        store.requestAccess(for: .contacts, completionHandler: {
            granted, error in
            
            guard granted else {
                let alert = UIAlertController(title: "Can't access contact", message: "Please go to Settings -> MyApp to enable contact permission", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
        let keysToFetch = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName), CNContactPhoneNumbersKey] as [Any]
        let request = CNContactFetchRequest(keysToFetch: keysToFetch as! [CNKeyDescriptor])
        var cnContacts = [CNContact]()
        
        do {
            try store.enumerateContacts(with: request){
                (contact, cursor) -> Void in
                cnContacts.append(contact)
            }
        } catch let error {
            NSLog("Fetch contact error: \(error)")
        }
        
        print(">>>> Contact list:")
        for contact in cnContacts {
            let fullName = CNContactFormatter.string(from: contact, style: .fullName) ?? "No Name"
            print("\(fullName): \(contact.phoneNumbers.description)")
        }
    })
    }

}
