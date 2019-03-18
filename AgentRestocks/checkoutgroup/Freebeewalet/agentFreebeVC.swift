//
//  agentFreebeVC.swift
//  AgentRestocks
//
//  Created by apple on 2/7/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit

class agentFreebeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var lblWalletAmount: UILabel!
    

    @IBOutlet weak var tableList: UITableView!
    
    var arrayList = NSArray()
    var detailArrayList = [Any]()
    var detailDictList = [String: Any]()
    
    var walletAmount = String()
    var sellertext = String()
    var sellerReceivedamount = String()
    var sellerIsexpired = String()
    var sellerDateandTime = String()
    var sellerSubtext = String()
    
    var detailSellertext = [String]()
    var detailSellerReceivedamount = [String]()
    var detailSellerIsexpired = [String]()
    var detailSellerDateandTime = [String]()
    var detailSellerSubtext = [String]()
    var sellerType  = String()
    var detailSellType =  [Any]()
    
    @IBOutlet weak var topviewfinal: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        topviewfinal.layer.shadowOffset = CGSize(width: 0, height: 3)
        topviewfinal.layer.shadowOpacity = 0.6
        topviewfinal.layer.shadowRadius = 3.0
        topviewfinal.layer.shadowColor = UIColor.color2().cgColor
        
        tableList.delegate = self
        tableList.dataSource = self
        
        lblWalletAmount.text = self.walletAmount
        
        for i in 0 ..< self.arrayList.count {
        
            if let valedArray : [Any] = self.arrayList[i] as? [Any] {
                self.detailArrayList = valedArray
            }
            for i in 0 ..< self.detailArrayList.count {
           
                if let valedDict: [String: Any] = self.detailArrayList[i] as? [String: Any] {
                    self.detailDictList = valedDict
                }
                
                if let valedText: String  =  self.detailDictList["text"] as? String {
                    self.sellertext = valedText
                }
                self.detailSellertext.append(self.sellertext)
                
                if let valedSubText: String =  self.detailDictList["sub_text"] as? String {
                    self.sellerSubtext = valedSubText
                }
                self.detailSellerSubtext.append(self.sellerSubtext)
                
                if let valedReceived: String =   self.detailDictList["received_amount"] as? String {
                    self.sellerReceivedamount = valedReceived
                }
                self.detailSellerReceivedamount.append(self.sellerReceivedamount)
                
                
                if let valedExpiryText =  self.detailDictList["seller_expiry_text"] as? String {
                    self.sellerIsexpired = valedExpiryText
                }
                self.detailSellerIsexpired.append(self.sellerIsexpired)
                
                if let valedDateTime: String =   self.detailDictList["date_and_time"] as? String {
                    self.sellerDateandTime = valedDateTime
                }
                self.detailSellerDateandTime.append(self.sellerDateandTime)
                
                if let valedTyme: String =   self.detailDictList["type"] as? String {
                    self.sellerType = valedTyme
                }
                self.detailSellType.append(self.sellerType)
                }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.detailArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: aagentListCell = tableList.dequeueReusableCell(withIdentifier: "aagentListCell") as! aagentListCell
        cell.lblPaidOrder.text = self.detailSellertext[indexPath.row]
        cell.lblNMorder.text = self.detailSellerSubtext[indexPath.row]
        cell.lblFreebeAmount.text = self.detailSellerReceivedamount[indexPath.row]
        cell.lblExpireDetail.text = self.detailSellerIsexpired[indexPath.row]
        cell.lblDateTime.text = self.detailSellerDateandTime[indexPath.row]
        let strValeee : String = self.detailSellType[indexPath.row] as! String
        if strValeee == "received" {
            cell.btnUpandDown.setBackgroundImage(#imageLiteral(resourceName: "up_arrow-2"), for: .normal)
        }
        if strValeee == "paid" {
            cell.btnUpandDown.setBackgroundImage(#imageLiteral(resourceName: "down_arrow-1"), for: .normal)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 80
    }

    @IBAction func btnSearchAction(_ sender: Any)
    {
   
    }
    
    @IBAction func btnBackAction(_ sender: Any)
    {
    self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnFilterAction(_ sender: Any)
    {
    
    }
    
}
