//
//  startedMsgVC.swift
//  AgentRestocks
//
//  Created by apple on 12/24/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class startedMsgVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var lblStarredtitle: UILabel!
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var tableList: UITableView!
    
    var EditprofiledescriptionViewall = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func btnBackPopAction(_ sender: Any) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: starredMsgCell = tableList.dequeueReusableCell(withIdentifier: "starredMsgCell") as! starredMsgCell
        cell.profileImg.image = #imageLiteral(resourceName: "photosecccc")
        cell.selectionStyle = .blue
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
        
    }
    
    
    func valueReadinApi() {
        
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.EditprofiledescriptionViewall = Reviewfinaluseroid
        }
        
        var request = URLRequest(url: URL(string:AgentConstants.baseUrlMarket)!)
        request.httpMethod = "POST"
        
        let postString =  String(format: "agentid=%@&shoutId=%@","69","1")
        
        request.httpBody = postString.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
    
    
    
    }
    
    
}
