//
//  PendingRequestVC.swift
//  AgentRestocks
//
//  Created by apple on 12/21/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import Alamofire

class PendingRequestVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var lblPendingReq: UILabel!
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var tableLisr: UITableView!
    
    var groupTitles = [Any]()
    var followerGroup = [Any]()
    var nameOfAgent = [Any]()
    var storeName = [Any]()
    var typeStore = [Any]()
    var location = [Any]()
    var valueID = Int()
    var EditprofiledescriptionViewall = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        groupTitles = ["FOLLOWER REQUESTS","YOUR REQUESTS", "SUGGESTED REQUESTS"]
        
        nameOfAgent = ["Rajagoud","Kamalakar"]
        
        storeName = ["Raja kirana","fancy store","Distributer"]
        
        typeStore = ["fancyStore","Distributer"]
        
        location = ["Hitech City","Panjagutta"]
        
        self.sendRestApi()

    }
    
    
    @IBAction func btnBackUpAction(_ sender: Any) {
    
    
    
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return groupTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            valueID = storeName.count
        }else if section == 1{
           valueID = typeStore.count
        }else if section == 2 {
          valueID = location.count
        }
        return valueID
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PendingCell = tableLisr.dequeueReusableCell(withIdentifier: "PendingCell") as! PendingCell
        if indexPath.section == 0 {
           cell.btnAccept.isHidden = false
           cell.btnDecline.isHidden = false
           cell.btnDecline.roundCornerButtontwo(sender: cell.btnDecline)
           cell.btnAccept.roundCornerButtontwo(sender: cell.btnAccept)

        }else if indexPath.section == 1{
           cell.btnRequested.isHidden = false
           cell.btnRequested.roundCornerButtontwo(sender: cell.btnRequested)

        }else if indexPath.section == 2{
           cell.btnCross.isHidden = false
           cell.btnFollow.isHidden = false
           cell.btnFollow.roundCornerButtontwo(sender: cell.btnFollow)
        }
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let titelString = groupTitles[section] as? String
        return titelString
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    func sendRestApi()
    {
       
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.EditprofiledescriptionViewall = Reviewfinaluseroid
        }
        
        var request = URLRequest(url: URL(string:AgentConstants.baseUrlMarket)!)
        request.httpMethod = "POST"
        
        let postString =  String(format: "agentid=%@&shoutId=%@&type=%@&comment=%@","128","66","reshout","adnsadsjfndfs")
       
        print(postString)
        
        request.httpBody = postString.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    print(dict)
                }
                break
                
            case .failure(_):
                print("anilreddy")
            }
        }
    }
}

extension UIButton{
    func roundCornerButtontwo(sender : UIButton) {
        let btn = sender
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.lightGray.cgColor
    }
    
//    roundCornerButton
}



