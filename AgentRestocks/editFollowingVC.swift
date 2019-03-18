//
//  editFollowingVC.swift
//  AgentRestocks
//
//  Created by apple on 2/15/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit
import Alamofire


class editFollowingVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var tableList: UITableView!
    
    
    var EditprofiledescriptionViewall = String()
    var isFollowingValue = Bool()

    
    var strName = String()
    var strDistr = String()
    var strAreaName = String()
    var strStroeNam = String()
    
    var strID = String()
    var strNotify = String()
    var strOfShowNotify = String()
    var strRequest = String()
    
    var strNotifiedValue = String()
    
    var listOfID = [Any]()
    var listNotify = [Any]()
    var listOfShowNotify = [Any]()
    var listOfRequst = [Any]()

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
    
    var myagentTotalvalue = String()
    var AcessTokenfinalstring = String()

    
    @IBOutlet weak var mubuttonbackbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableList.delegate = self
        tableList.dataSource = self
        
        
        
        DispatchQueue.main.async {
            self.followingAction()
        }
        
        topView.layer.shadowOffset = CGSize(width: 0, height: 3)
        topView.layer.shadowOpacity = 0.6
        topView.layer.shadowRadius = 3.0
        topView.layer.shadowColor = UIColor.color2().cgColor
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listofSuggested.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let tableCell: editFollowingCell  = tableList.dequeueReusableCell(withIdentifier: "editFollowingCell") as! editFollowingCell
            isFollowingValue = true
        tableCell.lblProfileName.text = self.listofName[indexPath.row] as? String
        tableCell.lblReqMsg.text = self.listofMsg[indexPath.row] as? String
        tableCell.lblReqType.text = self.listofStores[indexPath.row] as? String
        tableCell.lblAddress.text = self.listofAddress[indexPath.row] as? String
        tableCell.btnImgProfile.isHidden = false
        tableCell.btnTypeAction.isHidden = false
        tableCell.btnTypeAction.isUserInteractionEnabled = true
        tableCell.btnImgProfile.isUserInteractionEnabled = true
        tableCell.btnTypeAction.layer.cornerRadius = 12.0
        tableCell.btnTypeAction.clipsToBounds = true
        tableCell.btnTypeAction.layer.borderWidth  = 1.0
        tableCell.btnTypeAction.layer.borderColor = UIColor.lightGray.cgColor
        tableCell.btnTypeAction.addTarget(self, action: #selector(btnFollowingAction), for: .touchUpInside)
        tableCell.btnNotifyme.addTarget(self, action: #selector(btnNotifyAction), for: .touchUpInside)
        tableCell.btnNotifyme.tag = indexPath.row
        tableCell.btnTypeAction.tag = indexPath.row
        tableCell.selectionStyle = .none

        if let strValNotify: String = self.listNotify[indexPath.row] as? String {
            self.strNotifiedValue = strValNotify
        }
        
        if self.strNotifiedValue == "1" {
            tableCell.btnNotifyme.setBackgroundImage(#imageLiteral(resourceName: "notifyMe"), for: .normal)
        }
        if self.strNotifiedValue == "0" {
            tableCell.btnNotifyme.setBackgroundImage(#imageLiteral(resourceName: "notify"), for: .normal)
        }

        return tableCell
    }

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
{
            let editSelection : EditprofileViewController = self.storyboard?.instantiateViewController(withIdentifier: "EditprofileViewController") as! EditprofileViewController
            editSelection.strButton = self.listOfRequst[indexPath.row] as! String
            editSelection.isboolPending = isFollowingValue
            editSelection.dictProfile = self.listofSuggested[indexPath.row] as! [String:Any]
            editSelection.notifyValue = self.listNotify[indexPath.row] as! String
            editSelection.strID = self.listOfID[indexPath.row] as! String
            self.present(editSelection, animated: true, completion: nil)
        }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }

    @objc func btnFollowingAction(sender: UIButton) {
        print("following")
    }
    
    @objc func btnNotifyAction(sender: UIButton) {
        
        let btnTag = sender.tag
        
        let notifed: notifyVC = self.storyboard?.instantiateViewController(withIdentifier: "notifyVC") as! notifyVC
        notifed.strName = (self.listofName[btnTag] as? String)!
        notifed.notifyValue = self.listNotify[btnTag] as! String
        self.present(notifed, animated: true, completion: nil)
        
        print("notify")
    }
    
    
    
    func followingAction() {
        
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.EditprofiledescriptionViewall = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue =   Myagentidfinlavalue
        }
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        
        
        
        var request = URLRequest(url: URL(string:AgentConstants.baseUrlMarketShout)!)
        request.httpMethod = "POST"
        
        let postString =  String(format: "method=%@&agentid=%@&status=%@&type=%@","marketplace",self.EditprofiledescriptionViewall,"1","following")
        
        print(postString)
        
        request.httpBody = postString.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        request.addValue(self.AcessTokenfinalstring, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    
                    
                    if let arrayListSuggest: [Any] = dict.value(forKey: "following") as? [Any] {
                        self.listofSuggested = arrayListSuggest
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
                        
                        if let valOfID : String = self.dictofSuggested["id"] as? String {
                            self.strID = valOfID
                        }
                        self.listOfID.append(self.strID)
                        
                        
                        if let valOfShowNotify : String = self.dictofSuggested["shownotify"] as? String {
                            self.strOfShowNotify = valOfShowNotify
                        }
                        self.listOfShowNotify.append(self.strOfShowNotify)
                        
                        if let valOfNotify : String = self.dictofSuggested["notify"] as? String {
                            self.strNotify = valOfNotify
                        }
                        self.listNotify.append(self.strNotify)
                        
                        
                        if let valOfReq : String = self.dictofSuggested["requested"] as? String {
                            self.strRequest = valOfReq
                        }
                        self.listOfRequst.append(self.strRequest)
                        
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
    
    @IBAction func mybutonback(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    
}
