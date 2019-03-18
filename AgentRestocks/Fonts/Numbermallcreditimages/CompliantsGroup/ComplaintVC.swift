//
//  ComplaintVC.swift
//  AgentRestocks
//
//  Created by apple on 11/27/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import Alamofire

class ComplaintVC: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var btnBackPop: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tableList: UITableView!
    var arrayList = NSArray()
    var userComplaintID = String()
    var complaintName = [String]()
    var complaintDiction = NSArray()
    var complaintIssueID = [String]()
    
    @IBOutlet weak var viewtopview: UIView!
    var coverView = UIView()
    var imageView = UIImageView()
   var Missedcallfeaturetwo = String()
    var AcessTokenfinalstring = String()
    var myagentTotalvalue  = String()
    override func viewDidLoad() {
        super.viewDidLoad()



        tableList.delegate = self
        tableList.dataSource = self
        
        topView.layer.shadowOffset = CGSize(width: 0, height: 3)
        topView.layer.shadowOpacity = 0.6
        topView.layer.shadowRadius = 3.0
        topView.layer.shadowColor = UIColor.color2().cgColor
        
        
        
        self.complaintAction()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
    
    
    self.dismiss(animated: true, completion: nil)
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return complaintName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: complaintCell = tableList.dequeueReusableCell(withIdentifier: "complaintCell") as! complaintCell
     cell.lblComplaintText.text = self.complaintName[indexPath.row] as String
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell: complaintCell = tableList.dequeueReusableCell(withIdentifier: "complaintCell") as! complaintCell
        cell.lblComplaintText.text = self.complaintName[indexPath.row] as String
        let seletVC: SelectComplaintVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectComplaintVC") as! SelectComplaintVC
        seletVC.completDict = self.complaintDiction[indexPath.row] as! NSArray
        seletVC.strComplaintId = self.complaintIssueID[indexPath.row]
        
        let defaults = UserDefaults.standard
        defaults.set(self.complaintIssueID[indexPath.row], forKey:"Mynewcopliantidvalue")
        defaults.set(self.complaintName[indexPath.row],forKey:"MycompliantName")

        defaults.synchronize()
        
        seletVC.userComplaint = cell.lblComplaintText.text!
        
        self.present(seletVC, animated: true, completion: nil)
        
    }
    
    func complaintAction()
    {
        DispatchQueue.main.async
        {
            self.showSpinner()
        }
        var request = URLRequest(url: URL(string:AgentConstants.DescriptionBaseurl)!)
        request.httpMethod = "POST"
        let defaults = UserDefaults.standard
        if let Reviewfinaluseroid:String = defaults.value(forKey: "myuseridvaluefinal")as?String
        {
            self.userComplaintID = Reviewfinaluseroid
        }
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        let postString =  String(format: "method=%@","logComplaint")
        print(postString)
        request.httpBody = postString.data(using: .utf8)
        request.addValue(AcessTokenfinalstring, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    self.arrayList = dict.value(forKey:"complaits_data")as! NSArray
                    
                    DispatchQueue.main.async {
                        self.removeSpinner()
                    }
                    if self.arrayList.count > 0
                    {
                        if let DescriptionMOQfinal:[String] = self.arrayList.value(forKey: "complaint_name") as? [String] {
                            self.complaintName = DescriptionMOQfinal
                        }
                        
                        if let DescriptionMOQfinal:[String] = self.arrayList.value(forKey: "complaint_id") as? [String] {
                            self.complaintIssueID = DescriptionMOQfinal
                        }
                        
                        if let DescriptionValue:NSArray = self.arrayList.value(forKey: "complaint_type") as? NSArray {
                            self.complaintDiction = DescriptionValue
                        }
                        print(self.arrayList)
                        self.tableList.reloadData()
                    }
                 }
                print(self.complaintName)
                break

            case .failure(_):
                DispatchQueue.main.async {
                    self.removeSpinner()
                }
                print("error")
            }
}
}
    func showSpinner()
    {
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.view.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(imageView)
    }
    func removeSpinner()
    {
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()
    }
    
    @IBAction func phonecallbuttonvaluetotal(_ sender: UIButton)
    {
        Missedcallfeaturetwo = "8688986889"
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
