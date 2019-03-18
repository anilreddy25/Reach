//
//  checkTaxBreakVC.swift
//  AgentRestocks
//
//  Created by apple on 2/12/19.
//  Copyright © 2019 NumberMall. All rights reserved.
//

import UIKit

class checkTaxBreakVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblTaxbreakUp: UILabel!
    @IBOutlet weak var lblTaxvaleee: UILabel!
    
    @IBOutlet weak var tableList: UITableView!
    
    
    @IBOutlet weak var taxbreakupfinalview: UIView!
    
    
    var expandedCells = [Int]()

    var Cashbackarayfinalvalue = NSArray()
    
    var ProductDetailsarrayone = NSArray()
    
    var productdetailname = NSArray()
    
    var Productnamevalue = NSArray()
    
    var strBaseText1 = String()
    var strBaseText2 = String()
    
    var strHamaliText1 = String()
    var strHamaliText2 = String()
    
    var strDeliveryText1 = String()
    var strDeliveryText2 = String()
    var strTotalGSTText2 = String()
    
    
    var gstbasePriceVal1 = [String]()
    var gstbasePriceVal2 = [String]()
    
    var gstHamaliVal1 = [String]()
    var gstHamaliVal2 = [String]()
    
    var gstDeliveryVal1 = [String]()
    var gstDeliveryVal2 = [String]()
    
    var gstTotalVal = [String]()

    
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

        tableList.delegate =  self
        tableList.dataSource = self
        
        if self.strValed.count > 0
        {
            lblTaxvaleee.text = self.strValed
        }
        
        let defaultsvaluesingel = UserDefaults.standard
        
        if let sold_filledbydiscriptionarrayfinalvalue: NSArray  =  defaultsvaluesingel.value(forKey:"Myproductdetailsary") as? NSArray
        {
            self.Cashbackarayfinalvalue = sold_filledbydiscriptionarrayfinalvalue
        }
        if let ProductDetailsarrayonefinalvalue:NSArray =   self.Cashbackarayfinalvalue as? NSArray
        {
            self.ProductDetailsarrayone = ProductDetailsarrayonefinalvalue
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
        if let ProductDetailsnamevalue: NSArray =  self.Cashbackarayfinalvalue.value(forKey:"GST_breakup") as? NSArray
        {
            self.productdetailname = ProductDetailsnamevalue
        }
        for i in 0 ..< self.productdetailname.count
        {
            let arraysingel = self.productdetailname[i] as! NSArray
            self.Productnamevalue = arraysingel
            
//            for j in 0 ..< self.Productnamevalue.count {
//                if let valuefinal: [String: Any] =  (self.Productnamevalue[j] as? [String: Any]) {
//                    self.handleDict = valuefinal
//                }
//
//                if let strImageName: String = self.handleDict["image"] as? String {
//                    self.imageNameHandel = strImageName
//                }
//
//                if self.imageNameHandel == "baseprice" {
//                    if let textonefinalvalue:String = handleDict["text1"] as? String
//                    {
//                        self.strBaseText1 = textonefinalvalue
//                        self.gstbasePriceVal1.append(strBaseText1)
//                    }
//
//                    if let texttwofinalvalue:String = handleDict["text2"] as? String
//                    {
//                        self.strBaseText2 = texttwofinalvalue
//                        self.gstbasePriceVal2.append(strBaseText2)
//                    }
//                }
//
//                if self.imageNameHandel == "hamali" {
//                    if let textonefinalvalue:String = handleDict["text1"] as? String
//                    {
//                        self.strHamaliText1 = textonefinalvalue
//                        self.gstHamaliVal1.append(strHamaliText1)
//                    }
//
//                    if let texttwofinalvalue:String = handleDict["text2"] as? String
//                    {
//                        self.strHamaliText2 = texttwofinalvalue
//                        self.gstHamaliVal2.append(strHamaliText2)
//                    }
//                }
//
//
//                if self.imageNameHandel == "delivery" {
//                    if let textonefinalvalue:String = handleDict["text1"] as? String
//                    {
//                        self.strDeliveryText1 = textonefinalvalue
//                        self.gstDeliveryVal1.append(strDeliveryText1)
//                    }
//                if let texttwofinalvalue:String = handleDict["text2"] as? String
//                    {
//                        self.strDeliveryText2 = texttwofinalvalue
//                        self.gstDeliveryVal2.append(strDeliveryText2)
//
//                    }
//                }
//
//                if self.imageNameHandel == "" {
//
//                    if let texttwofinalvalue:String = handleDict["text2"] as? String
//                    {
//                        self.strTotalGSTText2 = texttwofinalvalue
//                        self.gstTotalVal.append(strTotalGSTText2)
//                    }
//                }
//            }
        }
        
        taxbreakupfinalview.layer.shadowOffset = CGSize(width: 0, height: 3)
        taxbreakupfinalview.layer.shadowOpacity = 0.6
        taxbreakupfinalview.layer.shadowRadius = 3.0
        taxbreakupfinalview.layer.shadowColor = UIColor.color2().cgColor
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CashBacknamevalue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: checkTaxCell = tableList.dequeueReusableCell(withIdentifier: "checkTaxCell") as! checkTaxCell
        cell.lblProductName.text = self.CashBacknamevalue[indexPath.row]
        cell.lblQnty.text = self.CashBacknameQunatity[indexPath.row]
//        cell.lblText1.text = self.gstbasePriceVal1[indexPath.row]
//
//        if self.gstHamaliVal1.count > 0
//        {
//            cell.lblText2.text = self.gstHamaliVal1[indexPath.row]
//
//        }
//        if self.gstDeliveryVal1.count > 0
//        {
//
//            if let Descriptionfav:String = self.gstDeliveryVal1[indexPath.row] as? String {
//
////                self.discriptioonFavourite.append(Descriptionfav)
//
//                cell.lblText3.text = Descriptionfav
//
//            }
//
//
////            cell.lblText3.text = self.gstDeliveryVal1[indexPath.row]
//
//        }
        
//        if self.gstHamaliVal2.count > 0
//        {
////            cell.lblValText2.text = self.gstHamaliVal2[indexPath.row]
//
//            if let Descriptionfav:String = self.gstHamaliVal2[indexPath.row]as? String {
//
//                //                self.discriptioonFavourite.append(Descriptionfav)
//
//                cell.lblValText2.text = Descriptionfav
//
//
//            }
//
//        }
//        if self.gstDeliveryVal2.count > 0
//        {
////            cell.lblValText3.text = self.gstDeliveryVal2[indexPath.row]
//
//            if let Descriptionfav:String = self.gstDeliveryVal2[indexPath.row] as? String
//            {
//                  cell.lblValText3.text = Descriptionfav
//            }
//
//        }
//        cell.lblValText1.text = self.gstbasePriceVal2[indexPath.row]
//        cell.lblValText2.text = self.gstHamaliVal2[indexPath.row]
//        cell.lblValText3.text = self.gstDeliveryVal2[indexPath.row]
//
//        cell.lblText1.text = self.gstbasePriceVal1[indexPath.row]
//        cell.lblText2.text = self.gstHamaliVal1[indexPath.row]
//        cell.lblText3.text = self.gstDeliveryVal1[indexPath.row]

        for i in 0 ..< self.productdetailname.count
        {
             self.Productnamevalue = self.productdetailname[i] as! NSArray
            
            for j in 0 ..< self.Productnamevalue.count {
                if let valuefinal: [String: Any] =  (self.Productnamevalue[j] as? [String: Any]) {
                    self.handleDict = valuefinal
                }
                
                if let strImageName: String = self.handleDict["image"] as? String {
                    self.imageNameHandel = strImageName
                }
                
                if self.imageNameHandel == "baseprice" {
                    if let textonefinalvalue:String = handleDict["text1"] as? String
                    {
                        self.strBaseText1 = textonefinalvalue
                        self.gstbasePriceVal1.append(strBaseText1)
                        cell.lblText1.text = self.gstbasePriceVal1[indexPath.row]
                        
                    }
                    
                    if let texttwofinalvalue:String = handleDict["text2"] as? String
                    {
                        self.strBaseText2 = texttwofinalvalue
                        self.gstbasePriceVal2.append(strBaseText2)
                        cell.lblValText1.text = self.gstbasePriceVal2[indexPath.row]
                        
                    }
                }
                
                if self.imageNameHandel == "hamali" {
                    if let textonefinalvalue:String = handleDict["text1"] as? String
                    {
                        self.strHamaliText1 = textonefinalvalue
                        self.gstHamaliVal1.append(strHamaliText1)
                        cell.lblText2.text = self.gstHamaliVal1[indexPath.row]
                        
                    }
                    
                    if let texttwofinalvalue:String = handleDict["text2"] as? String
                    {
                        self.strHamaliText2 = texttwofinalvalue
                        self.gstHamaliVal2.append(strHamaliText2)
                        cell.lblValText2.text = self.gstHamaliVal2[indexPath.row]
                    }
                }
                
                
                if self.imageNameHandel == "delivery" {
                    if let textonefinalvalue:String = handleDict["text1"] as? String
                    {
                        self.strDeliveryText1 = textonefinalvalue
                        self.gstDeliveryVal1.append(strDeliveryText1)
                        cell.lblText3.text = self.gstDeliveryVal1[indexPath.row]
                    }
                    if let texttwofinalvalue:String = handleDict["text2"] as? String
                    {
                        self.strDeliveryText2 = texttwofinalvalue
                        self.gstDeliveryVal2.append(strDeliveryText2)
                        cell.lblValText3.text = self.gstDeliveryVal2[indexPath.row]
                    }
                }
                if self.imageNameHandel == "" {
                    
                    if let texttwofinalvalue:String = handleDict["text2"] as? String
                    {
                        self.strTotalGSTText2 = texttwofinalvalue
                        self.gstTotalVal.append(strTotalGSTText2)
                        cell.btnTaxPrice.setTitle(self.gstTotalVal[indexPath.row], for: .normal)
                    }
                }
            }
        
        
        }
        
       
        
        
        cell.btnUpAndDown.tag = indexPath.row
        cell.btnUpAndDown.setImage(#imageLiteral(resourceName: "down_arrow"), for: .normal)
        cell.btnUpAndDown.addTarget(self, action: #selector(btnAddLabels), for: .touchUpInside)

        cell.btnTaxPrice.addTarget(self, action: #selector(btnAddLabels), for: .touchUpInside)

        
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
//            btn.setImage(#imageLiteral(resourceName: "busineup"), for: .normal)
            

            btn.setBackgroundImage(#imageLiteral(resourceName: "busineup"), for:.normal)

            btn.isSelected = false
            
        }else{
//            btn.setImage(#imageLiteral(resourceName: "businessdown"), for: .normal)
            btn.setBackgroundImage(#imageLiteral(resourceName: "businessdown"), for:.normal)
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

    
    @IBAction func btnBackAction(_ sender: Any) {
    
        self.dismiss(animated: true, completion: nil)
    
    }
    

}
