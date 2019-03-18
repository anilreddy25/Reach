//
//  HandlingChargeVC.swift
//  AgentRestocks
//
//  Created by apple on 12/14/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import Alamofire

class HandlingChargeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
  
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet weak var lblHandlingCharge: UILabel!
    
    @IBOutlet weak var lblAmount: UILabel!
    
    @IBOutlet weak var tableList: UITableView!
    
    var expandedCells = [Int]()
    var Cashbackarayfinalvalue = NSArray()
    var cashButtonTime = NSArray()
    var ProductDetailsarrayone = NSArray()
    var productdetailname = NSArray()
    var Productnamevalue = NSArray()
    var strHamaliText1 = String()
    var strHamaliText2 = String()
    var strDeliveryText1 = String()
    var strDeliveryText2 = String()
    var cashBackHamaliVal1 = [String]()
    var cashBackHamaliVal2 = [String]()
    var cashBackDeliveryVal1 = [String]()
    var cashBackDeliveryVal2 = [String]()
    var cashbacktextfinal = [String]()
    var cashbacktexttwofinal = [String]()
    var CashBacknamevalue = [String]()
    var CashBacknamevprice = [String]()
    var CashBacknameQunatity = [String]()
    var handleDict = [String: Any]()
    var imageNameHandel = String()
    var strValed = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        topView.layer.shadowOffset = CGSize(width: 0, height: 3)
        topView.layer.shadowOpacity = 0.6
        topView.layer.shadowRadius = 3.0
        topView.layer.shadowColor = UIColor.color2().cgColor
        
        lblAmount.text = self.strValed
        
        
        
        if let ProductDetailsarrayonefinalvalue:NSArray =   self.Cashbackarayfinalvalue as? NSArray
        {
            self.ProductDetailsarrayone = ProductDetailsarrayonefinalvalue
        }
        
        
        
        if let ProductDetailsnamevalue: NSArray =  self.Cashbackarayfinalvalue.value(forKey:"Hamali_breakup") as? NSArray
        {
            self.productdetailname = ProductDetailsnamevalue
        }
        for i in 0 ..< self.productdetailname.count
        {
            let arraysingel = self.productdetailname[i] as! NSArray
            self.Productnamevalue = arraysingel
            
            for j in 0 ..< self.Productnamevalue.count {
               if let valuefinal: [String: Any] =  (self.Productnamevalue[j] as? [String: Any]) {
                    self.handleDict = valuefinal
                }
                
                if let strImageName: String = self.handleDict["image"] as? String {
                    self.imageNameHandel = strImageName
                }
                
                if self.imageNameHandel == "hamali" {
                    if let textonefinalvalue:String = handleDict["text1"] as? String
                    {
                        self.strHamaliText1 = textonefinalvalue
                    }
                    self.cashBackHamaliVal1.append(strHamaliText1)
                    
                    if let texttwofinalvalue:String = handleDict["text2"] as? String
                    {
                        self.strHamaliText2 = texttwofinalvalue
                    }
                    self.cashBackHamaliVal2.append(strHamaliText2)
                }
                
                if self.imageNameHandel == "delivery" {
                    if let textonefinalvalue:String = handleDict["text1"] as? String
                    {
                        self.strDeliveryText1 = textonefinalvalue
                    }
                    self.cashBackDeliveryVal1.append(strDeliveryText1)
                    
                    if let texttwofinalvalue:String = handleDict["text2"] as? String
                    {
                        self.strDeliveryText2 = texttwofinalvalue
                    }
                    self.cashBackDeliveryVal2.append(strDeliveryText2)
                }
            }
        }
        
     

        if let CashBacknamevalueDetailsnamevalue: [String] =  self.ProductDetailsarrayone.value(forKey:"name") as? [String]
        {
            self.CashBacknamevalue = CashBacknamevalueDetailsnamevalue
        }
        if let CashBacknamevpricevalue: [String] =  self.ProductDetailsarrayone.value(forKey:"price") as? [String]
        {
            self.CashBacknamevprice = CashBacknamevpricevalue
        }
        if let CashBacknameQunatityvalue: [String] =  self.ProductDetailsarrayone.value(forKey:"qty") as? [String]
        {
            self.CashBacknameQunatity = CashBacknameQunatityvalue
        }
    }
    
    
    
    @IBAction func btnBackAction(_ sender: Any) {
    
     self.dismiss(animated: true, completion: nil)
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CashBacknamevalue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: handlingCell = tableList.dequeueReusableCell(withIdentifier: "handlingCell") as! handlingCell
        cell.lblProductName.text = self.CashBacknamevalue[indexPath.row]
        cell.lblQnty.text = self.CashBacknameQunatity[indexPath.row]
        cell.lblPrice.text = self.CashBacknamevprice[indexPath.row]
//        let stringvalue = self.cashbacktextfinal[indexPath.row] as? String
//        let cbitems = NSString(format:"%@",stringvalue!)
//        cell.btnPrice.setTitle(cbitems as String, for: .normal)
        
       
        cell.btnUpAndDown.tag = indexPath.row
        cell.btnUpAndDown.setImage(#imageLiteral(resourceName: "busineup"), for: .normal)
        cell.btnUpAndDown.addTarget(self, action: #selector(btnAddLabels), for: .touchUpInside)
        
//        cell.lblHamaliProdct.text = self.cashBackHamaliVal1[indexPath.row]
//        cell.lblHamaliValue.text = self.cashBackHamaliVal2[indexPath.row]
//        cell.lblDelivryProdt.text = self.cashBackDeliveryVal1[indexPath.row]
//        cell.lblDelivrValue.text = self.cashBackDeliveryVal2[indexPath.row]
        
        
        
        for i in 0 ..< self.productdetailname.count
        {
            let arraysingel = self.productdetailname[i] as! NSArray
            self.Productnamevalue = arraysingel
            
            for j in 0 ..< self.Productnamevalue.count {
                if let valuefinal: [String: Any] =  (self.Productnamevalue[j] as? [String: Any]) {
                    self.handleDict = valuefinal
                }
                
                if let strImageName: String = self.handleDict["image"] as? String {
                    self.imageNameHandel = strImageName
                }
                
                if self.imageNameHandel == "hamali" {
                    if let textonefinalvalue:String = handleDict["text1"] as? String
                    {
                        self.strHamaliText1 = textonefinalvalue
                        self.cashBackHamaliVal1.append(strHamaliText1)
                        cell.lblHamaliProdct.text = self.cashBackHamaliVal1[indexPath.row]
                    }
                    
                    if let texttwofinalvalue:String = handleDict["text2"] as? String
                    {
                        self.strHamaliText2 = texttwofinalvalue
                        self.cashBackHamaliVal2.append(strHamaliText2)
                        cell.lblHamaliValue.text = self.cashBackHamaliVal2[indexPath.row]
                    }
                }
                
                if self.imageNameHandel == "delivery" {
                    if let textonefinalvalue:String = handleDict["text1"] as? String
                    {
                        self.strDeliveryText1 = textonefinalvalue
                        self.cashBackDeliveryVal1.append(strDeliveryText1)
                        cell.lblDelivryProdt.text = self.cashBackDeliveryVal1[indexPath.row]
                    }
                    
                    if let texttwofinalvalue:String = handleDict["text2"] as? String
                    {
                        self.strDeliveryText2 = texttwofinalvalue
                        self.cashBackDeliveryVal2.append(strDeliveryText2)
                        cell.lblDelivrValue.text = self.cashBackDeliveryVal2[indexPath.row]
                    }
                }
            }
        }
        cell.selectionStyle = .none
        return cell
    }
   
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if expandedCells.contains(indexPath.row)
        {
            return 125
        }
        else
        {
            return 65
        }
    }
    
    @objc func btnAddLabels(sender: UIButton) {
        
        let btn = sender
        
        if btn.isSelected{
            btn.setImage(#imageLiteral(resourceName: "busineup"), for: .normal)
            btn.isSelected = false

        }else{
            btn.setImage(#imageLiteral(resourceName: "businessdown"), for: .normal)
            btn.isSelected = true

        }
        
        if expandedCells.contains(sender.tag) {
            expandedCells = expandedCells.filter({ $0 != sender.tag})
            
        }
        else {
            expandedCells.append(sender.tag)
        }
        tableList.reloadData()
    }
    
  
    
}
