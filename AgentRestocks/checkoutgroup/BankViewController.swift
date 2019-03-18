//
//  BankViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 14/12/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class BankViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var images1 = [UIImage]()
    var logoImages1 = [String]()
    @IBOutlet weak var Banktopview: UIView!
    var BankName1 = [String]()
    @IBOutlet weak var banktabelviewtwo: UITableView!
    @IBOutlet weak var Bankbutton: UIButton!
    var Logoimagevalue = [UIImage]()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        Banktopview.layer.shadowOffset = CGSize(width: 0, height: 2)
        Banktopview.layer.shadowOpacity = 0.3
        Banktopview.layer.shadowRadius = 1.0
        Banktopview.layer.borderColor = UIColor.color2().cgColor
        Banktopview.layer.shadowColor = UIColor.color2().cgColor
        BankName1 = ["State bank of india","Axis bank","HDFC bank"]
        self.Banktopview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.5)
        banktabelviewtwo.dataSource = self
        banktabelviewtwo.delegate = self
        Logoimagevalue = [UIImage(named:"SBI.png"),UIImage(named:"axis-bank.png"),UIImage(named:"HDFC.png"),] as! [UIImage]
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
            return self.BankName1.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell  = banktabelviewtwo.dequeueReusableCell(withIdentifier:"BankTableViewCell", for: indexPath) as! BankTableViewCell
            cell.selectionStyle = .none
            cell.BankName.text = self.BankName1[indexPath.row] as? String
        
        cell.Bankimageview.image = self.Logoimagevalue[indexPath.row] as? UIImage
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        DispatchQueue.main.async
            {
            let secondvalue = self.storyboard?.instantiateViewController(withIdentifier:"selectBankverficationViewController")as!selectBankverficationViewController
            self.present(secondvalue, animated:true, completion:nil)
        }
    }
    
    
    @IBAction func Backnbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
        
    }
 
}
