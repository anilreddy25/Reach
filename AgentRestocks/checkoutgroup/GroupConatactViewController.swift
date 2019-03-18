//
//  GroupConatactViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 17/01/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit
import Contacts
import DTZFloatingActionButton
import SocketIO

class GroupConatactViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet weak var Topviewfinal: UIView!
  
    @IBOutlet weak var Contacttabelview: UITableView!
    var Conctastore = CNContactStore()
    var Contacts = [Conatactstruct]()
    var Phone_numberstring = [String]()
    var Phone_numbernamestring = [String]()
    var Phone_numbersemailtring = [String]()
  
  
    let managerthree = SocketManager(socketURL: URL(string: "http://172.31.0.13:3000")!, config: [.log(true), .compress])
    
    var socketthree:SocketIOClient!
    var socketDict = [Any]()
    var socketDictfinalvalue = [Any]()
    
    var MainsocketDict = NSDictionary()
    var MainsocketArray = NSArray()
    var useridbiling = String()
    
    var chatingimagevalue = [String]()
    
    var Mycompliantfinalvalue = String()
    
    
    @IBOutlet weak var Mysharefinalbuttonfinal: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        Topviewfinal.layer.shadowOffset = CGSize(width: 0, height: 3)
        Topviewfinal.layer.shadowOpacity = 0.6
        Topviewfinal.layer.shadowRadius = 3.0
        Topviewfinal.layer.shadowColor = UIColor.color2().cgColor
        
        
        ContactList()
        self.Contacttabelview.dataSource = self
        self.Contacttabelview.delegate = self
        Contacttabelview.showsHorizontalScrollIndicator = false
        Contacttabelview.showsVerticalScrollIndicator = false
        
      self.Contacttabelview.dataSource = self
      self.Contacttabelview.delegate = self

    }
    

    @IBAction func Mybackbutton(_ sender: UIButton)
    {
        
        self.dismiss(animated:true, completion:nil)
    }
    
    
    func ContactList()
    {
        let contactStore = CNContactStore()
        var contacts = [CNContact]()
        let keys = [
            CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
            CNContactPhoneNumbersKey,
            CNContactEmailAddressesKey
            ] as [Any]
        let request = CNContactFetchRequest(keysToFetch: keys as! [CNKeyDescriptor])
        do {
            try contactStore.enumerateContacts(with: request){
                (contact, stop) in
                // Array containing all unified contacts from everywhere
                contacts.append(contact)
                for phoneNumber in contact.phoneNumbers {
                    if let number = phoneNumber.value as? CNPhoneNumber, let label = phoneNumber.label {
                        let localizedLabel = CNLabeledValue<CNPhoneNumber>.localizedString(forLabel: label)
                        
                        self.Phone_numberstring.append(number.stringValue)
                        
                        self.Phone_numbernamestring.append(contact.givenName)
                        
                        //                        self.Phone_numbersemailtring.append(contact.emailAddresses)
                        
                        
                        
                        
                    }
                }
                
                DispatchQueue.main.async
                    {
                        self.socketconnectionfinalvalue()
                }
            }
            print(contacts)
        }
        catch
        {
            print("unable to fetch contacts")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.Phone_numberstring.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell  = Contacttabelview.dequeueReusableCell(withIdentifier:"ContactoneTableViewCell", for: indexPath) as! ContactoneTableViewCell
        cell.selectionStyle = .none
        cell.phonenumebrnamelabel.text = self.Phone_numberstring[indexPath.row] as? String
        cell.phonenumberlabel.text = self.Phone_numbernamestring[indexPath.row] as? String
        cell.contactimage.layer.cornerRadius =   cell.contactimage.frame.size.width/2
        cell.contactimage.clipsToBounds = true
        cell.contactimage.layer.borderColor = UIColor.gray.cgColor
        cell.contactimage.layer.borderWidth = 1.0
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        DispatchQueue.main.async
            {
                let secondvalue = self.storyboard?.instantiateViewController(withIdentifier:"selectBankverficationViewController")as!selectBankverficationViewController
                self.present(secondvalue, animated:true, completion:nil)
        }
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    @IBAction func mybackbutton(_ sender: UIButton)
    {
        
        self.dismiss(animated:true, completion:nil)
        
    }
 
    func socketconnectionfinalvalue()
    {
        socketthree = managerthree.defaultSocket
        let defaultsvalue = UserDefaults.standard
        let finalvalue = defaultsvalue.value(forKey:"MyLoginfinalvalue")as!String
        
        let tringfinalvalue = String(format:"%@%@",self.Phone_numberstring,self.Phone_numbernamestring)
        
        let datafour = ["username":finalvalue,"contacts" :tringfinalvalue]
        
        let jsonData = try? JSONSerialization.data(withJSONObject:datafour, options: [])
        let jsonString = String(data: jsonData!, encoding: .utf8)
        
        self.socketthree.emit("receive_list", jsonString!)
        
        self.socketthree.on("receive_list")
        {data, ack in
            print(data)
            
            self.socketDict = data as! [Any]
            print(self.socketDict)
            let arraysingelValue  = self.socketDict[0]
            self.MainsocketDict = arraysingelValue as! NSDictionary
            print(self.MainsocketDict)
            self.MainsocketArray = self.MainsocketDict.value(forKey:"chats")as!NSArray
            self.chatingimagevalue =       self.MainsocketArray.value(forKey:"image")as![String]
        }
    }

    

}
