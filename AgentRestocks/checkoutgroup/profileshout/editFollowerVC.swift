//
//  editFollowerVC.swift
//  AgentRestocks
//
//  Created by apple on 2/15/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit
import Alamofire

class editFollowerVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
        
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var tableList: UITableView!
    
    
    var EditprofiledescriptionViewall = String()
    
    var strName = String()
    var strDistr = String()
    var strAreaName = String()
    var strStroeNam = String()
    
    var groupTitles = [Any]()
    var valueID = Int()
    
    var valofFollowers = String()
    var valofSuggested = String()
    var valofYourRequest = String()
    
    var listofName = [Any]()
    var listofMsg = [Any]()
    var listofAddress = [Any]()
    var listofStores = [Any]()
    
    var listofFollowers = [Any]()
    var listofSuggested = [Any]()
    var listofYourRequest = [Any]()
    
    var dictofFollowers = [String: Any]()
    var dictofSuggested = [String: Any]()
    var dictofYourRequest = [String: Any]()
    
    var useridbiling1  = String()
    var productdescriptionuseridbiling = String()
    var Myauthorisationstringfinalvalue = String()
    var myagentTotalvalue = String()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()


        tableList.delegate = self
        tableList.dataSource = self
        
        
        
        DispatchQueue.main.async {
            self.followerAction()
        }
        
        topView.layer.shadowOffset = CGSize(width: 0, height: 3)
        topView.layer.shadowOpacity = 0.6
        topView.layer.shadowRadius = 3.0
        topView.layer.shadowColor = UIColor.color2().cgColor

    }
    

    @IBAction func btnBackAction(_ sender: Any) {
   
    
    
    self.dismiss(animated: true, completion: nil)
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return groupTitles.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            valueID = listofYourRequest.count
        }else if section == 1{
            valueID = listofFollowers.count
        }else if section == 2 {
            valueID = listofSuggested.count
        }
        return valueID
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell: editFollowerCell  = tableList.dequeueReusableCell(withIdentifier: "editFollowerCell") as! editFollowerCell
        
        tableCell.lblSenderName.text = self.listofName[indexPath.row] as? String
        tableCell.lblStoreName.text = self.listofMsg[indexPath.row] as? String
        tableCell.lblKiranaStore.text = self.listofStores[indexPath.row] as? String
        tableCell.lblLocation.text = self.listofAddress[indexPath.row] as? String
        tableCell.imgProfile.isHidden = false
        tableCell.imgProfile.isUserInteractionEnabled = true
        
        if indexPath.section == 0 {
            tableCell.btnAccept.isHidden = false
            tableCell.btnDecline.isHidden = false
            tableCell.btnDecline.layer.cornerRadius = 30.0
            tableCell.btnDecline.clipsToBounds = true
            tableCell.btnAccept.layer.cornerRadius = 30.0
            tableCell.btnAccept.clipsToBounds = true
          
//            tableCell.btnDecline.roundCornerButton(sender: tableCell.btnDecline)
//            tableCell.btnAccept.roundCornerButton(sender: tableCell.btnAccept)
            
        }else if indexPath.section == 1
        {
            tableCell.btnRequested.isHidden = false
//            tableCell.btnRequested.roundCornerButton(sender: tableCell.btnRequested)
            tableCell.btnAccept.layer.cornerRadius = 30.0
            tableCell.btnAccept.clipsToBounds = true
        }else if indexPath.section == 2
        {
            tableCell.btnCross.isHidden = false
            tableCell.btnFollow.isHidden = false
            tableCell.btnFollow.layer.cornerRadius = 30.0
            tableCell.btnFollow.clipsToBounds = true
//            tableCell.btnFollow.roundCornerButton(sender: tableCell.btnFollow)
        }
        tableCell.selectionStyle = .none
        
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let titelString = groupTitles[section] as? String
        return titelString
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    
    
    
    
    
    func followerAction() {
        
        
        let dafaults = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = dafaults.value(forKey: "myuseridvaluefinal")as?String
        {
            self.EditprofiledescriptionViewall = Reviewfinaluseroid
        }
        
        if let Reviewfinaluseroid:String = dafaults.value(forKey:"MyLoginfinalvalue")as?String
        {
            self.useridbiling1 = Reviewfinaluseroid
        }
        if let Reviewfinaluseroid:String = dafaults.value(forKey: "myproductidvalue")as?String
        {
            self.productdescriptionuseridbiling = Reviewfinaluseroid
        }
        
        if let Myauthorisationfinlavalue:String = dafaults.value(forKey: "Myauthorisation")as?String
        {
            self.Myauthorisationstringfinalvalue = Myauthorisationfinlavalue
        }
        if let Myagentidfinlavalue:String = dafaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
   
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.EditprofiledescriptionViewall = Reviewfinaluseroid
        }
        
        var request = URLRequest(url: URL(string:AgentConstants.baseUrlMarketShout)!)
        request.httpMethod = "POST"
        
      let postString =  String(format: "method=%@&agentid=%@&page=%@&type=%@","marketplace",self.useridbiling1,"0","followers")
        
        print(postString)
        
        request.httpBody = postString.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        request.addValue(self.Myauthorisationstringfinalvalue, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    
                    if let arrayListFollow: [Any] = dict.value(forKey: "follower_requests") as? [Any] {
                        self.listofFollowers = arrayListFollow
                    }
                    
                    if let arrayListSuggest: [Any] = dict.value(forKey: "suggested_requests") as? [Any] {
                        self.listofSuggested = arrayListSuggest
                    }
                    
                    if let arrayListYours: [Any] = dict.value(forKey: "your_requests") as? [Any] {
                        self.listofYourRequest = arrayListYours
                    }
                    
                    if let stringListFollow: String = dict.value(forKey: "follower_requests_text") as? String {
                        self.valofFollowers = stringListFollow
                    }
                    
                    if let stringListSuggest: String = dict.value(forKey: "suggested_requests_text") as? String {
                        self.valofSuggested = stringListSuggest
                    }
                    
                    if let stringListYours: String = dict.value(forKey: "your_requests_text") as? String {
                        self.valofYourRequest = stringListYours
                    }
                    
                    self.groupTitles = [self.valofYourRequest,self.valofFollowers,self.valofSuggested]
                    
                    for i in 0 ..< self.listofSuggested.count {
                        
                        if let valedSuggest:[String: Any] = self.listofSuggested[i] as? [String: Any]{
                            self.dictofSuggested = valedSuggest
                        }
                        
                        if let valOfName : String = self.dictofSuggested["name"] as? String {
                            self.strName  = valOfName
                        }
                        self.listofName.append(self.strName)
                        
                        
                        if let valOfMSG : String = self.dictofSuggested["text"] as? String {
                            self.strDistr = valOfMSG
                        }
                        self.listofMsg.append(self.strDistr)
                        
                        if let valOfStore : String = self.dictofSuggested["shop_type"] as? String {
                            self.strStroeNam = valOfStore
                        }
                        self.listofStores.append(self.strStroeNam)
                        
                        if let valOfAddres : String = self.dictofSuggested["area"] as? String {
                            self.strAreaName = valOfAddres
                        }
                        self.listofAddress.append(self.strAreaName)
                    }
                    
                    for i in 0 ..< self.listofYourRequest.count {
                        
                        if let valedSuggest:[String: Any] = self.listofYourRequest[i] as? [String: Any]{
                            self.dictofYourRequest = valedSuggest
                        }
                        
                        if let valOfName : String = self.dictofYourRequest["name"] as? String {
                            self.strName  = valOfName
                        }
                        self.listofName.append(self.strName)
                        
                        
                        if let valOfMSG : String = self.dictofYourRequest["text"] as? String {
                            self.strDistr = valOfMSG
                        }
                        self.listofMsg.append(self.strDistr)
                        
                        if let valOfStore : String = self.dictofYourRequest["shop_type"] as? String {
                            self.strStroeNam = valOfStore
                        }
                        self.listofStores.append(self.strStroeNam)
                        
                        if let valOfAddres : String = self.dictofYourRequest["area"] as? String {
                            self.strAreaName = valOfAddres
                        }
                        self.listofAddress.append(self.strAreaName)
                    }
                    
                    
                    for i in 0 ..< self.listofFollowers.count {
                        
                        if let valedSuggest:[String: Any] = self.listofYourRequest[i] as? [String: Any]{
                            self.dictofFollowers = valedSuggest
                        }
                        
                        if let valOfName : String = self.dictofFollowers["name"] as? String {
                            self.strName  = valOfName
                        }
                        self.listofName.append(self.strName)
                        
                        
                        if let valOfMSG : String = self.dictofFollowers["text"] as? String {
                            self.strDistr = valOfMSG
                        }
                        self.listofMsg.append(self.strDistr)
                        
                        if let valOfStore : String = self.dictofFollowers["shop_type"] as? String {
                            self.strStroeNam = valOfStore
                        }
                        self.listofStores.append(self.strStroeNam)
                        
                        if let valOfAddres : String = self.dictofFollowers["area"] as? String {
                            self.strAreaName = valOfAddres
                        }
                        self.listofAddress.append(self.strAreaName)
                    }
                    
                    DispatchQueue.main.async {
                        self.tableList.reloadData()
                    }
                }
                break
            case .failure(_):
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       print("anilreddy")
            }
        }
    }
    
    
    
    

}
