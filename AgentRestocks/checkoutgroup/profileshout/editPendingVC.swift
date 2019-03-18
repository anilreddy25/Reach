//
//  editPendingVC.swift
//  AgentRestocks
//
//  Created by apple on 2/15/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit
import Alamofire
import QuartzCore


class editPendingVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var lblRequestType: UILabel!
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var tableList: UITableView!
    
    
    var EditprofiledescriptionViewall = String()
    
    var isPendingValue = Bool()
    
    var strName = String()
    var strDistr = String()
    var strAreaName = String()
    var strStroeNam = String()
    var strID = String()
    var strFoll = String()
    
    var strYRName = String()
    var strYRDistr = String()
    var strYRStroeNam = String()
    var strYRAreaName = String()
    var strYRID = String()
    var strRequest = String()

    
    var valofFollowers = String()
    var valofSuggested = String()
    var valofYourRequest = String()
    
    var groupTitles = [Any]()
    var valueID = Int()
    var stringID = String()
    
    
    var listofYRName = [Any]()
    var listofYRMsg = [Any]()
    var listofYRAddress = [Any]()
    var listofYRStores = [Any]()
    var listOfYRID = [Any]()
    var listOfRequst = [Any]()
    
    var strType = String()
    
    var listofName = [Any]()
    var listofMsg = [Any]()
    var listofAddress = [Any]()
    var listofStores = [Any]()
    var listOfID = [Any]()
    var listOfFoll = [Any]()
    var listOfType = [Any]()
    
    var fowlloweracceptedid = [Any]()
    var fowlloweraccept = [Any]()
    var fowllowerdecline = [Any]()
    
    var FollowersAceeptedstring = String()
    
    var FollowersAceeptedidstring = String()

    var fowllowerdeclinestring = String()

    
  
    
    var listofFollowers = [Any]()
    var listofSuggested = [Any]()
    var listofYourRequest = [Any]()
    var appendArray = [Any]()
    
    var dictofFollowers = [String: Any]()
    var dictofSuggested = [String: Any]()
    var dictofYourRequest = [String: Any]()
    var useridbiling1  = String()
    var productdescriptionuseridbiling = String()
    var Myauthorisationstringfinalvalue = String()
    var myagentTotalvalue = String()
    
    var folloowpostString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableList.delegate = self
        tableList.dataSource = self
        
        DispatchQueue.main.async
            {
            self.pendingAction()
         }
        topView.layer.shadowOffset = CGSize(width: 0, height: 3)
        topView.layer.shadowOpacity = 0.6
        topView.layer.shadowRadius = 3.0
        topView.layer.shadowColor = UIColor.color2().cgColor
        
        tableList.showsHorizontalScrollIndicator = false
        tableList.showsVerticalScrollIndicator = false
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableList.reloadData()
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
        let tableCell: editPendingCell  = tableList.dequeueReusableCell(withIdentifier: "editPendingCell") as! editPendingCell
               isPendingValue = true
        tableCell.lblKiranaStore.layer.cornerRadius = 4.0
        tableCell.lblKiranaStore.layer.masksToBounds = true
        tableCell.btnFollow.layer.cornerRadius = 12.0
        tableCell.btnFollow.clipsToBounds = true
        tableCell.btnRequested.layer.cornerRadius = 12.0
        tableCell.btnRequested.clipsToBounds = true
        tableCell.btnRequested.layer.borderWidth  = 1.0
        
        tableCell.btnRequested.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        
        tableCell.btnDecline.layer.cornerRadius = 12.0
        tableCell.btnDecline.clipsToBounds = true
        tableCell.btnAccept.layer.cornerRadius = 12.0
        tableCell.btnAccept.clipsToBounds = true
        if indexPath.section == 0
        {
            tableCell.lblSenderName.text = self.listofYRName[indexPath.row] as? String
            tableCell.lblStoreName.text = self.listofYRMsg[indexPath.row] as? String
            tableCell.lblKiranaStore.text = self.listofYRStores[indexPath.row] as? String
            tableCell.lblLocation.text = self.listofYRAddress[indexPath.row] as? String
            tableCell.imgProfile.isHidden = false
            tableCell.imgProfile.isUserInteractionEnabled = true
          
            tableCell.btnRequested.isHidden = false
            tableCell.btnAccept.isHidden = true
            tableCell.btnDecline.isHidden = true
            tableCell.btnCross.isHidden = true
            tableCell.btnFollow.isHidden = true
            
            
        }
        else if indexPath.section == 1
        {
            tableCell.lblSenderName.text = self.listofName[indexPath.row] as? String
            tableCell.lblStoreName.text = self.listofMsg[indexPath.row] as? String
            tableCell.lblKiranaStore.text = self.listofStores[indexPath.row] as? String
            tableCell.lblLocation.text = self.listofAddress[indexPath.row] as? String
            tableCell.imgProfile.isHidden = false
            tableCell.imgProfile.isUserInteractionEnabled = true
            
            tableCell.btnAccept.isHidden = false
            tableCell.btnDecline.isHidden = false
            tableCell.btnCross.isHidden = true
            tableCell.btnFollow.isHidden = true
            tableCell.btnRequested.isHidden = true

        }
        else if indexPath.section == 2
        {
            tableCell.lblSenderName.text = self.listofName[indexPath.row] as? String
            tableCell.lblStoreName.text = self.listofMsg[indexPath.row] as? String
            tableCell.lblKiranaStore.text = self.listofStores[indexPath.row] as? String
            tableCell.lblLocation.text = self.listofAddress[indexPath.row] as? String
            tableCell.imgProfile.isHidden = false
            tableCell.imgProfile.isUserInteractionEnabled = true
            
            tableCell.btnCross.isHidden = false
            tableCell.btnFollow.isHidden = false
         
            tableCell.btnFollow.addTarget(self, action: #selector(btnFollowAction), for: .touchUpInside)
            tableCell.btnFollow.tag = indexPath.row
            tableCell.btnAccept.isHidden = true
            tableCell.btnDecline.isHidden = true
            tableCell.btnRequested.isHidden = true

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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let tableCell: editPendingCell  = tableList.dequeueReusableCell(withIdentifier: "editPendingCell") as! editPendingCell
        
        let editSelection : EditprofileViewController = self.storyboard?.instantiateViewController(withIdentifier: "EditprofileViewController") as! EditprofileViewController

        if indexPath.section == 0
        {
            tableCell.btnRequested.isHidden = false
            tableCell.btnAccept.isHidden = true
            tableCell.btnDecline.isHidden = true
            tableCell.btnCross.isHidden = true
            tableCell.btnFollow.isHidden = true
            editSelection.strID = self.listOfYRID[indexPath.row] as! String
            editSelection.strButton = self.listOfRequst[indexPath.row] as! String
            
            
        }
        else if indexPath.section == 1{
            
            tableCell.btnAccept.isHidden = false
            tableCell.btnDecline.isHidden = false
            tableCell.btnCross.isHidden = true
            tableCell.btnFollow.isHidden = true
            tableCell.btnRequested.isHidden = true
            print(self.fowlloweracceptedid)
            print(self.fowlloweracceptedid[indexPath.row])
            editSelection.strID = self.fowlloweracceptedid[indexPath.row] as! String
//            editSelection.strButton = self.listOfRequst[indexPath.row] as! String
            
        }else if indexPath.section == 2{
            tableCell.btnCross.isHidden = false
            tableCell.btnFollow.isHidden = false
            tableCell.btnFollow.addTarget(self, action: #selector(btnFollowAction), for: .touchUpInside)
            tableCell.btnFollow.tag = indexPath.row
            tableCell.btnAccept.isHidden = true
            tableCell.btnDecline.isHidden = true
            tableCell.btnRequested.isHidden = true

            editSelection.strID = self.listOfID[indexPath.row] as! String
            editSelection.strButton = self.listOfFoll[indexPath.row] as! String
        }
        
        editSelection.isboolPending = isPendingValue
        self.present(editSelection, animated: true, completion: nil)
    }
    
    
    @objc func btnFollowAction(sender: UIButton) {
        
        let btnTag = sender
        
        valueID = btnTag.tag
        
        DispatchQueue.main.async {
            self.FollwproductMarketmethod()
        }
      
    }
    
    
    func pendingAction() {
        
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
       
        var request = URLRequest(url: URL(string:AgentConstants.baseUrlMarketShout)!)
        request.httpMethod = "POST"
        
        let postString =  String(format: "method=%@&agentid=%@&page=%@&type=%@","marketplace",self.useridbiling1,"0","pending")
        
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
                    
                   
                    
                    for i in 0 ..< self.listofYourRequest.count {
                        
                        if let valedSuggest:[String: Any] = self.listofYourRequest[i] as? [String: Any]{
                            self.dictofYourRequest = valedSuggest
                        }
                        
                        if let valOfName : String = self.dictofYourRequest["name"] as? String {
                            self.strYRName  = valOfName
                        }
                        self.listofYRName.append(self.strYRName)
                        
                        
                        if let valOfMSG : String = self.dictofYourRequest["text"] as? String {
                            self.strYRDistr = valOfMSG
                        }
                        self.listofYRMsg.append(self.strYRDistr)
                        
                        if let valOfStore : String = self.dictofYourRequest["shop_type"] as? String {
                            self.strYRStroeNam = valOfStore
                        }
                        self.listofYRStores.append(self.strYRStroeNam)
                        
                        if let valOfAddres : String = self.dictofYourRequest["area"] as? String {
                            self.strYRAreaName = valOfAddres
                        }
                        self.listofYRAddress.append(self.strYRAreaName)
                        
                        if let valOfID : String = self.dictofYourRequest["id"] as? String {
                            self.strYRID = valOfID
                        }
                        self.listOfYRID.append(self.strYRID)
                        
                        if let valOfReq : String = self.dictofYourRequest["requested"] as? String {
                            self.strRequest = valOfReq
                        }
                        self.listOfRequst.append(self.strRequest)
                        
                    }
                    for i in 0 ..< self.listofYourRequest.count {
                        
                        if let valedSuggest:[String: Any] = self.listofYourRequest[i] as? [String: Any]{
                            self.dictofYourRequest = valedSuggest
                        }
                        
                        if let valOfName : String = self.dictofYourRequest["name"] as? String {
                            self.strYRName  = valOfName
                        }
                        self.listofYRName.append(self.strYRName)
                        
                        
                        if let valOfMSG : String = self.dictofYourRequest["text"] as? String {
                            self.strYRDistr = valOfMSG
                        }
                        self.listofYRMsg.append(self.strYRDistr)
                        
                        if let valOfStore : String = self.dictofYourRequest["shop_type"] as? String {
                            self.strYRStroeNam = valOfStore
                        }
                        self.listofYRStores.append(self.strYRStroeNam)
                        
                        if let valOfAddres : String = self.dictofYourRequest["area"] as? String {
                            self.strYRAreaName = valOfAddres
                        }
                        self.listofYRAddress.append(self.strYRAreaName)
                        
                        if let valOfID : String = self.dictofYourRequest["id"] as? String {
                            self.strYRID = valOfID
                        }
                        self.listOfYRID.append(self.strYRID)
                        
                        if let valOfReq : String = self.dictofYourRequest["requested"] as? String {
                            self.strRequest = valOfReq
                        }
                        self.listOfRequst.append(self.strRequest)
                    }
                    for i in 0 ..< self.listofFollowers.count
                    {
                        if let valedSuggest:[String: Any] = self.listofFollowers[i] as? [String: Any]{
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
                        
                        print(self.dictofFollowers["acceptedid"] as Any)
                        
                        if let valuetwo : String = self.dictofFollowers["acceptedid"] as? String {
                            self.FollowersAceeptedidstring = valuetwo
                        }
                        self.fowlloweracceptedid.append(self.FollowersAceeptedidstring)
                        
                        
                        
                        if let FollowersAceeptedstringfianl : String = self.dictofFollowers["accept"] as? String {
                            self.FollowersAceeptedstring = FollowersAceeptedstringfianl
                        }
                        self.fowlloweraccept.append(self.FollowersAceeptedstring)
                        
                        
                        if let fowllowerdeclinestringfinal : String = self.dictofFollowers["decline"] as? String {
                            self.fowllowerdeclinestring = fowllowerdeclinestringfinal
                        }
                        self.fowllowerdecline.append(self.fowllowerdeclinestring)
                        
                    }
                 
                    for i in 0 ..< self.listofSuggested.count
                    {
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
                        
                        
                        if let valOfID : String = self.dictofSuggested["suggestedid"] as? String {
                            self.strID = valOfID
                        }
                        self.listOfID.append(self.strID)
                        
                        if let valOfReq : String = self.dictofSuggested["follow"] as? String {
                            self.strFoll = valOfReq
                        }
                        self.listOfFoll.append(self.strFoll)
                        
                        if let valOfTye : String = self.dictofSuggested["type"] as? String {
                            self.strType = valOfTye
                        }
                       
                        self.listOfType.append(self.strType)
                    }
                    
                    DispatchQueue.main.async {
                        self.tableList.reloadData()
                    }
                }
                break
            case .failure(_):
                print("failurevalue")
            }
        }
    }
    
    
    
    func actionFollow()  {
        
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.EditprofiledescriptionViewall = Reviewfinaluseroid
        }
        
        var request = URLRequest(url: URL(string:AgentConstants.baseUrlMarketShout)!)
        request.httpMethod = "POST"
        
        if let str : String = self.listOfID[valueID] as? String {
            self.strID = str
        }

        let postString =  String(format: "method=%@&agentid=%@&followerid=%@","followagent","69948",self.strID)
        print(postString)
        
        request.httpBody = postString.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                print(response.result)
                print(response.result.value)

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
                    
                    
                    
                    for i in 0 ..< self.listofYourRequest.count {
                        
                        if let valedSuggest:[String: Any] = self.listofYourRequest[i] as? [String: Any]{
                            self.dictofYourRequest = valedSuggest
                        }
                        
                        if let valOfName : String = self.dictofYourRequest["name"] as? String {
                            self.strYRName  = valOfName
                        }
                        self.listofYRName.append(self.strYRName)
                        
                        
                        if let valOfMSG : String = self.dictofYourRequest["text"] as? String {
                            self.strYRDistr = valOfMSG
                        }
                        self.listofYRMsg.append(self.strYRDistr)
                        
                        if let valOfStore : String = self.dictofYourRequest["shop_type"] as? String {
                            self.strYRStroeNam = valOfStore
                        }
                        self.listofYRStores.append(self.strYRStroeNam)
                        
                        if let valOfAddres : String = self.dictofYourRequest["area"] as? String {
                            self.strYRAreaName = valOfAddres
                        }
                        self.listofYRAddress.append(self.strYRAreaName)
                        
                        if let valOfID : String = self.dictofYourRequest["id"] as? String {
                            self.strYRID = valOfID
                        }
                        self.listOfYRID.append(self.strYRID)
                        
                        if let valOfReq : String = self.dictofYourRequest["requested"] as? String {
                            self.strRequest = valOfReq
                        }
                        self.listOfRequst.append(self.strRequest)
                        
                    }
                    for i in 0 ..< self.listofYourRequest.count {
                        
                        if let valedSuggest:[String: Any] = self.listofYourRequest[i] as? [String: Any]{
                            self.dictofYourRequest = valedSuggest
                        }
                        
                        if let valOfName : String = self.dictofYourRequest["name"] as? String {
                            self.strYRName  = valOfName
                        }
                        self.listofYRName.append(self.strYRName)
                        
                        
                        if let valOfMSG : String = self.dictofYourRequest["text"] as? String {
                            self.strYRDistr = valOfMSG
                        }
                        self.listofYRMsg.append(self.strYRDistr)
                        
                        if let valOfStore : String = self.dictofYourRequest["shop_type"] as? String {
                            self.strYRStroeNam = valOfStore
                        }
                        self.listofYRStores.append(self.strYRStroeNam)
                        
                        if let valOfAddres : String = self.dictofYourRequest["area"] as? String {
                            self.strYRAreaName = valOfAddres
                        }
                        self.listofYRAddress.append(self.strYRAreaName)
                        
                        if let valOfID : String = self.dictofYourRequest["id"] as? String {
                            self.strYRID = valOfID
                        }
                        self.listOfYRID.append(self.strYRID)
                        
                        if let valOfReq : String = self.dictofYourRequest["requested"] as? String {
                            self.strRequest = valOfReq
                        }
                        self.listOfRequst.append(self.strRequest)
                    }
                    for i in 0 ..< self.listofFollowers.count
                    {
                        if let valedSuggest:[String: Any] = self.listofFollowers[i] as? [String: Any]{
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
                        
                        print(self.dictofFollowers["acceptedid"] as Any)
                        
                        if let valuetwo : String = self.dictofFollowers["acceptedid"] as? String {
                            self.FollowersAceeptedidstring = valuetwo
                        }
                        self.fowlloweracceptedid.append(self.FollowersAceeptedidstring)
                        
                        
                        
                        if let FollowersAceeptedstringfianl : String = self.dictofFollowers["accept"] as? String {
                            self.FollowersAceeptedstring = FollowersAceeptedstringfianl
                        }
                        self.fowlloweraccept.append(self.FollowersAceeptedstring)
                        
                        
                        if let fowllowerdeclinestringfinal : String = self.dictofFollowers["decline"] as? String {
                            self.fowllowerdeclinestring = fowllowerdeclinestringfinal
                        }
                        self.fowllowerdecline.append(self.fowllowerdeclinestring)
                        
                    }
                    
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
                        
                        
                        if let valOfID : String = self.dictofSuggested["suggestedid"] as? String {
                            self.strID = valOfID
                        }
                        self.listOfID.append(self.strID)
                        
                        if let valOfReq : String = self.dictofSuggested["follow"] as? String {
                            self.strFoll = valOfReq
                        }
                        self.listOfFoll.append(self.strFoll)
                        
                        if let valOfTye : String = self.dictofSuggested["type"] as? String {
                            self.strType = valOfTye
                        }
                        self.listOfType.append(self.strType)
                    }
                    
                    if let dictVale: [String: Any] =  self.listofSuggested[self.valueID] as? [String: Any] {
                        self.listofYourRequest.append(dictVale)
                    }
                    self.listofSuggested.remove(at: self.valueID)
                }
                DispatchQueue.main.async {
                    self.tableList.reloadData()
                }
//                            DispatchQueue.main.async {
//                                self.pendingAction()
//
//                }
                break
            case .failure(_):
                print("Narenasfsdafklnwekl")
            }
        }
}
    func FollwproductMarketmethod()
    {
        var request = URLRequest(url: URL(string:AgentConstants.MarketFinalvalue)!)
        request.httpMethod = "POST"
        let dafaults = UserDefaults.standard
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
         folloowpostString =  String(format: "method=%@&agentid=%@&followerid=%@","followagent",self.useridbiling1,self.strID)
   
        print(folloowpostString)
        
        request.httpBody = folloowpostString.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        request.addValue(self.Myauthorisationstringfinalvalue, forHTTPHeaderField: "Authorization")
        request.addValue(self.useridbiling1, forHTTPHeaderField:"AgentID")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                print("sucessvalue")

                print(response.result)
                let value = response.response
                
                let valuetwo = response.data
                
                if let response = response as? HTTPURLResponse
                {
                    if response.statusCode == 200 {
                    }
                }
                if let httpResponse1 = value
                {
                    if let xDemAuth = httpResponse1.allHeaderFields["Authorization"] as? String {
                        
                        let defaults = UserDefaults.standard
                        defaults.set(xDemAuth, forKey:"Myauthorisation")
                        defaults.synchronize()
                    }
                }
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
                    
                    for i in 0 ..< self.listofYourRequest.count {
                        
                        if let valedSuggest:[String: Any] = self.listofYourRequest[i] as? [String: Any]{
                            self.dictofYourRequest = valedSuggest
                        }
                        
                        if let valOfName : String = self.dictofYourRequest["name"] as? String {
                            self.strYRName  = valOfName
                        }
                        self.listofYRName.append(self.strYRName)
                        
                        
                        if let valOfMSG : String = self.dictofYourRequest["text"] as? String {
                            self.strYRDistr = valOfMSG
                        }
                        self.listofYRMsg.append(self.strYRDistr)
                        
                        if let valOfStore : String = self.dictofYourRequest["shop_type"] as? String {
                            self.strYRStroeNam = valOfStore
                        }
                        self.listofYRStores.append(self.strYRStroeNam)
                        
                        if let valOfAddres : String = self.dictofYourRequest["area"] as? String {
                            self.strYRAreaName = valOfAddres
                        }
                        self.listofYRAddress.append(self.strYRAreaName)
                        
                        if let valOfID : String = self.dictofYourRequest["id"] as? String {
                            self.strYRID = valOfID
                        }
                        self.listOfYRID.append(self.strYRID)
                        
                        if let valOfReq : String = self.dictofYourRequest["requested"] as? String {
                            self.strRequest = valOfReq
                        }
                        self.listOfRequst.append(self.strRequest)
                    }
                    for i in 0 ..< self.listofFollowers.count
                    {
                        if let valedSuggest:[String: Any] = self.listofFollowers[i] as? [String: Any]{
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
                       
                        print(self.dictofFollowers["acceptedid"] as Any)
                    
                        if let valuetwo : String = self.dictofFollowers["acceptedid"] as? String {
                            self.FollowersAceeptedidstring = valuetwo
                        }
                        self.fowlloweracceptedid.append(self.FollowersAceeptedidstring)
                        
                        
                        
                        if let FollowersAceeptedstringfianl : String = self.dictofFollowers["accept"] as? String {
                            self.FollowersAceeptedstring = FollowersAceeptedstringfianl
                        }
                        self.fowlloweraccept.append(self.FollowersAceeptedstring)
                        
                        
                        if let fowllowerdeclinestringfinal : String = self.dictofFollowers["decline"] as? String {
                            self.fowllowerdeclinestring = fowllowerdeclinestringfinal
                        }
                        self.fowllowerdecline.append(self.fowllowerdeclinestring)
                       
                    }
                    
                    
                    
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
                        
                        
                        if let valOfID : String = self.dictofSuggested["suggestedid"] as? String {
                            self.strID = valOfID
                        }
                        self.listOfID.append(self.strID)
                        
                        if let valOfReq : String = self.dictofSuggested["follow"] as? String {
                            self.strFoll = valOfReq
                        }
                        self.listOfFoll.append(self.strFoll)
                        
                        if let valOfTye : String = self.dictofSuggested["type"] as? String {
                            self.strType = valOfTye
                        }
                        self.listOfType.append(self.strType)
                    }
                    
                    if let dictVale: [String: Any] =  self.listofSuggested[self.valueID] as? [String: Any] {
                        self.listofYourRequest.append(dictVale)
                    }
                    self.listofSuggested.remove(at: self.valueID)
                }
                DispatchQueue.main.async {
                    self.tableList.reloadData()
                }
              
                break
            case .failure(_):
                print("Demofollovalue")
                DispatchQueue.main.async {
                    self.pendingAction()
                }
                break
            }
        }
    }
}
//extension UIButton{
//    func roundCornerButton(sender : UIButton) {
//        let btn = sender
//        btn.layer.cornerRadius = 5
//        btn.layer.borderWidth = 1
//        btn.layer.borderColor = UIColor.lightGray.cgColor
//    }
//}
