//
//  SelectComplaintVC.swift
//  AgentRestocks
//
//  Created by apple on 11/27/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class SelectComplaintVC: UIViewController , UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var btnBackpop: UIButton!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tableList: UITableView!
    var arrayList = NSArray()
    var userComplaint = String()
    var complaintName = [String]()
    var completDict = NSArray()
    var strComplaintId = String()
    @IBOutlet weak var mycomplianttotalvalue: UIButton!
    @IBOutlet weak var viewtopview: UIView!
    var Missedcallfeaturetwo = String()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableList.delegate = self
        tableList.dataSource = self
        topView.layer.shadowOffset = CGSize(width: 0, height: 3)
        topView.layer.shadowOpacity = 0.6
        topView.layer.shadowRadius = 3.0
        topView.layer.shadowColor = UIColor.color2().cgColor
        self.topView.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        self.viewtopview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
       self.viewtopview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        Missedcallfeaturetwo = "8688986889"
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnBackAction(_ sender: Any)
    {
    self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return completDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: SelectComplaintCell = tableList.dequeueReusableCell(withIdentifier: "SelectComplaintCell") as! SelectComplaintCell
        cell.lblSelectComplaint.text = self.completDict[indexPath.row] as? String
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell: SelectComplaintCell = tableList.dequeueReusableCell(withIdentifier: "SelectComplaintCell") as! SelectComplaintCell
        cell.lblSelectComplaint.text = self.completDict[indexPath.row] as? String
        let newComp = self.storyboard?.instantiateViewController(withIdentifier: "MynewcompliantViewController") as! MynewcompliantViewController
        newComp.Connectionfinalstring1 = self.completDict
        newComp.valueStr = cell.lblSelectComplaint.text!
        newComp.validateIssue = self.userComplaint
        newComp.validID = self.strComplaintId
        let defaults = UserDefaults.standard
        defaults.set(self.completDict[indexPath.row], forKey:"Mysubcomplaint")
        defaults.synchronize()
        
        cell.selectionStyle = .none
        self.present(newComp, animated: true, completion: nil)
    }
    @IBAction func mycomplaintbutton(_ sender: UIButton)
    {
        phone(phoneNum:Missedcallfeaturetwo)
    }
    func phone(phoneNum: String)
    {
        if let url = URL(string: "tel://\(phoneNum)") {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                
            }
            else {
                UIApplication.shared.openURL(url as URL)
                
            }
        }
    }
}
