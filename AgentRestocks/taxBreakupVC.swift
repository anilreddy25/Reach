//
//  taxBreakupVC.swift
//  AgentRestocks
//
//  Created by apple on 12/14/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class taxBreakupVC: UIViewController , UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblTaxbreakUp: UILabel!
    @IBOutlet weak var lblTaxvaleee: UILabel!
    
    @IBOutlet weak var tableList: UITableView!
   
    
    @IBOutlet weak var taxbreakupfinalview: UIView!
    
    
    //// tax break up
    var expandedCells = [Int]()
    var taxValeee = String()

    var Demosingelarrayfinalvalue = NSArray()
    var CashBacktotalvalue = NSMutableArray()
    var Cashbackarayfinalvalue = NSArray()
    var CashbackDictfinalvalue = NSArray()
    var Cashbaccashback_breakupvalue = NSArray()
    var ProductDetailsarrayone = NSArray()
    var productdetailArr = NSArray()
    var productdetailname = NSDictionary()
    var Productnamevalue = NSArray()
    var ProductnameSingelvalue = [String]()
    var Productnamevaluefinalvalue = NSArray()
    var cashbackitem = [String]()
    var gstBaseVal1 = [String]()
    var gstBaseVal2 = [String]()

    var CashBacknamevalue = [String]()
    var CashBacknamevprice = [String]()
    var CashBacknameQunatity = [String]()
    
    
    var nameProduct = String()
    var valueOFQnty = String()
    var weightOFPrdct = String()
    
    var baseValed = String()
    var baseValed2 = String()
    
    var valTaxDic = [String: Any]()
    var handleDict = [String: Any]()
    var imageNameHandel = String()
    
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
    
    var valeedEnd = String()

    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        taxbreakupfinalview.layer.shadowOffset = CGSize(width: 0, height: 3)
        taxbreakupfinalview.layer.shadowOpacity = 0.6
        taxbreakupfinalview.layer.shadowRadius = 3.0
        taxbreakupfinalview.layer.shadowColor = UIColor.color2().cgColor
        
        lblTaxvaleee.text = self.taxValeee
        
        tableList.delegate = self
        tableList.dataSource = self
        
        DispatchQueue.main.async {
            self.numberServiceOfTax()
        }
    }
    
    
    @IBAction func btnBackAction(_ sender: Any) {
    
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return Cashbackarayfinalvalue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: taxBreakCell = tableList.dequeueReusableCell(withIdentifier: "taxBreakCell") as! taxBreakCell
        cell.lblProductName.text = self.CashBacknamevalue[indexPath.row]
        cell.lblQnty.text = self.CashBacknamevprice[indexPath.row]
        cell.btnUpAndDown.tag = indexPath.row
        cell.btnUpAndDown.setBackgroundImage(#imageLiteral(resourceName: "up_arrowfinalvalue"), for:.normal)
        cell.btnUpAndDown.addTarget(self, action: #selector(btnAddLabels), for: .touchUpInside)
       
        
        
//        cell.lblHGstValue.text = self.gstbasePriceVal1[indexPath.row]
//        cell.lblHOneVal.text = self.gstbasePriceVal2[indexPath.row]
//
//        cell.lblTGstValue.text = self.gstHamaliVal1[indexPath.row]
//        cell.lblTOneVal.text = self.gstHamaliVal2[indexPath.row]
//
//        cell.lblTTsetVal.text = self.gstDeliveryVal1[indexPath.row]
//        cell.lblTTOneVal.text = self.gstDeliveryVal2[indexPath.row]
//
//        cell.lblFinalValue.text = self.gstTotalVal[indexPath.row]
        
        
        for k in 0 ..< self.productdetailArr.count {
            if let HamDiction: NSDictionary = self.productdetailArr[k] as? NSDictionary{
                self.productdetailname = HamDiction
            }
            
            
            
            if let strImageName: String = self.productdetailname["image"] as? String {
                self.imageNameHandel = strImageName
            }
            
            if self.imageNameHandel == "baseprice" {
                if let textonefinalvalue:String = self.productdetailname["text1"] as? String
                {
                    self.strBaseText1 = textonefinalvalue
                    self.gstbasePriceVal1.append(strBaseText1)
                    cell.lblHGstValue.text = self.gstbasePriceVal1[indexPath.row]

                }
                if let texttwofinalvalue:String = self.productdetailname["text2"] as? String
                {
                    self.strBaseText2 = texttwofinalvalue
                    self.gstbasePriceVal2.append(strBaseText2)
                    cell.lblHOneVal.text = self.gstbasePriceVal2[indexPath.row]

                }
            }
            
            if self.imageNameHandel == "hamali" {
                if let textonefinalvalue:String = self.productdetailname["text1"] as? String
                {
                    self.strHamaliText1 = textonefinalvalue
                    self.gstHamaliVal1.append(strHamaliText1)
                    cell.lblTGstValue.text = self.gstHamaliVal1[indexPath.row]

                }
                
                if let texttwofinalvalue:String = self.productdetailname["text2"] as? String
                {
                    self.strHamaliText2 = texttwofinalvalue
                    self.gstHamaliVal2.append(strHamaliText2)
                    cell.lblTOneVal.text = self.gstHamaliVal2[indexPath.row]

                }
            }
            
            if self.imageNameHandel == "delivery" {
                if let textonefinalvalue:String = self.productdetailname["text1"] as? String
                {
                    self.strDeliveryText1 = textonefinalvalue
                    self.gstDeliveryVal1.append(strDeliveryText1)
                    cell.lblTTsetVal.text = self.gstDeliveryVal1[indexPath.row]

                }
                
                if let texttwofinalvalue:String = self.productdetailname["text2"] as? String
                {
                    self.strDeliveryText2 = texttwofinalvalue
                    self.gstDeliveryVal2.append(strDeliveryText2)
                    cell.lblTTOneVal.text = self.gstDeliveryVal2[indexPath.row]

                }
            }
            
            if self.imageNameHandel == "" {
                
                if let texttwofinalvalue:String = self.productdetailname["text2"] as? String
                {
                    self.strTotalGSTText2 = texttwofinalvalue
                    self.gstTotalVal.append(strTotalGSTText2)
                    cell.lblFinalValue.text = self.gstTotalVal[indexPath.row]

                }
            }
        }
        
        
        
        
        
        

        cell.btnTaxPrice.setTitle(cell.lblFinalValue.text, for: .normal)
        cell.selectionStyle = .none
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if expandedCells.contains(indexPath.row) {
            return 175
        } else {
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
        DispatchQueue.main.async {
            self.tableList.reloadData()
        }
        
    }
    
    func numberServiceOfTax()  {

        for i in 0 ..< (self.Cashbackarayfinalvalue as AnyObject).count {


            if let CashBacknamevalueDetailsnamevalue: String =  (self.Cashbackarayfinalvalue[i] as AnyObject).value(forKey:"name") as? String
            {
                self.nameProduct = CashBacknamevalueDetailsnamevalue
            }
            self.CashBacknamevalue.append(self.nameProduct)


            if let CashBacknamevpricevalue: String =  (self.Cashbackarayfinalvalue[i] as AnyObject).value(forKey:"weightMRP") as? String
            {
                self.weightOFPrdct = CashBacknamevpricevalue
            }
            self.CashBacknamevprice.append(self.weightOFPrdct)

            if let CashBacknameQunatityvalue: String =  (self.Cashbackarayfinalvalue[i] as AnyObject).value(forKey: "qty") as? String
            {
                self.valueOFQnty = CashBacknameQunatityvalue
            }
            self.CashBacknameQunatity.append(self.valueOFQnty)

            if let ProductDetailsnamevalue: NSArray =  (self.Cashbackarayfinalvalue[i] as AnyObject).value(forKey:"GST_breakup") as? NSArray
            {
                self.productdetailArr = ProductDetailsnamevalue
            }

            for k in 0 ..< self.productdetailArr.count {
                if let HamDiction: NSDictionary = self.productdetailArr[k] as? NSDictionary{
                    self.productdetailname = HamDiction
                }



                    if let strImageName: String = self.productdetailname["image"] as? String {
                        self.imageNameHandel = strImageName
                    }

                    if self.imageNameHandel == "baseprice" {
                        if let textonefinalvalue:String = self.productdetailname["text1"] as? String
                        {
                            self.strBaseText1 = textonefinalvalue
                            self.gstbasePriceVal1.append(strBaseText1)
                        }
                        if let texttwofinalvalue:String = self.productdetailname["text2"] as? String
                        {
                            self.strBaseText2 = texttwofinalvalue
                            self.gstbasePriceVal2.append(strBaseText2)
                        }
                    }

                    if self.imageNameHandel == "hamali" {
                        if let textonefinalvalue:String = self.productdetailname["text1"] as? String
                        {
                            self.strHamaliText1 = textonefinalvalue
                            self.gstHamaliVal1.append(strHamaliText1)
                        }

                        if let texttwofinalvalue:String = self.productdetailname["text2"] as? String
                        {
                            self.strHamaliText2 = texttwofinalvalue
                            self.gstHamaliVal2.append(strHamaliText2)
                        }
                    }

                    if self.imageNameHandel == "delivery" {
                        if let textonefinalvalue:String = self.productdetailname["text1"] as? String
                        {
                            self.strDeliveryText1 = textonefinalvalue
                            self.gstDeliveryVal1.append(strDeliveryText1)
                        }

                        if let texttwofinalvalue:String = self.productdetailname["text2"] as? String
                        {
                            self.strDeliveryText2 = texttwofinalvalue
                            self.gstDeliveryVal2.append(strDeliveryText2)
                        }
                    }

                    if self.imageNameHandel == "" {

                    if let texttwofinalvalue:String = self.productdetailname["text2"] as? String
                        {
                            self.strTotalGSTText2 = texttwofinalvalue
                            self.gstTotalVal.append(strTotalGSTText2)
                        }
                    }
                }
            }
        
         DispatchQueue.main.async {
            self.tableList.reloadData()
         }
        
    }
    
}


