//
//  cashBackItemVC.swift
//  AgentRestocks
//
//  Created by apple on 12/14/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

//
class cashBackItemVC: UIViewController,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var lblCBItems: UILabel!
    @IBOutlet weak var tableList: UITableView!
    @IBOutlet weak var lblAmount: UILabel!


    var Cashbackarayfinalvalue = NSArray()
    
   var ProductDetailsarrayone = NSArray()
    
    var productdetailname = NSArray()
    
    var Productnamevalue = NSArray()
    
    
    var CashBacknamevalue = [String]()
    var CashBacknamevprice = [String]()
    var CashBacknameQunatity = [String]()
    
    var strVlad = String()

    var handleDict = [String: Any]()
    var imageNameHandel = String()
    
    var strHamaliText1 = String()
    var strHamaliText2 = String()
    
    var cashBackHamaliVal1 = [String]()
    var cashBackHamaliVal2 = [String]()
   

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.tableList.dataSource = self
        self.tableList.delegate = self
        
        lblAmount.text = self.strVlad
        
        DispatchQueue.main.async {
            self.newDemoHamdle()
        }
      
    }
    
    
    @IBAction func btnBackAction(_ sender: Any) {
    
      self.dismiss(animated: true, completion: nil)

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CashBacknamevalue.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: cbItemCell = tableList.dequeueReusableCell(withIdentifier: "cbItemCell") as! cbItemCell
        //cell.lblProductName.text = self.CashBacknamevalue[indexPath.row]
        
        
        if let CashBacknamevaluefinalvalue:String = self.CashBacknamevalue[indexPath.row] as? String
        {
          //  cell.lblProductName.text = self.CashBacknamevalue[indexPath.row]

           cell.lblProductName.text = CashBacknamevaluefinalvalue
        }
        
        
//        cell.lblQnty.text = self.CashBacknameQunatity[indexPath.row]
        
        if CashBacknameQunatity.count > 0
        {
            if let CashBacknameQunatityfinalvalue:String = self.CashBacknameQunatity[indexPath.row] as? String
            {
                cell.lblQnty.text = CashBacknameQunatityfinalvalue
                
            }
        }
        if CashBacknamevprice.count > 0
        {
            if let CashBacknamevpricetotal:String = self.CashBacknamevprice[indexPath.row] as? String {
            
            cell.lblPriceQnty.text = CashBacknamevpricetotal
            
            }
        }
        
//        if cashBackHamaliVal2.count > 0
//        {
//            if let Descriptionfav:String = self.cashBackHamaliVal2[indexPath.row] as? String {
//
//                //            self.discriptioonFavourite.append(Descriptionfav)
//                let cbitems = NSString(format:"%@ %@","CashBack",Descriptionfav)
//
//                cell.cbItemValue.text = cbitems as String
//
//            }
//
//        }
       
        
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
                    self.strHamaliText1 = textonefinalvalue
                }
                self.cashBackHamaliVal1.append(strHamaliText1)
                
                if let texttwofinalvalue:String = handleDict["text2"] as? String
                {
                    self.strHamaliText2 = texttwofinalvalue
                    self.cashBackHamaliVal2.append(strHamaliText2)
                    let cbitems = NSString(format:"%@ %@","CashBack",(self.cashBackHamaliVal2[indexPath.row] as? String)!)
                    
                   cell.cbItemValue.text = cbitems as String

                    
                }
            }
        }
        
        
        
        
     
   
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    
    func newDemoHamdle()  {
    
        let defaultsvaluesingel = UserDefaults.standard
        
        
        topView.layer.shadowOffset = CGSize(width: 0, height: 3)
        topView.layer.shadowOpacity = 0.6
        topView.layer.shadowRadius = 3.0
        topView.layer.shadowColor = UIColor.color2().cgColor
        
        if let sold_filledbydiscriptionarrayfinalvalue: NSArray  =  defaultsvaluesingel.value(forKey:"Myproductdetailsary") as? NSArray
        {
            self.Cashbackarayfinalvalue = sold_filledbydiscriptionarrayfinalvalue
        }
        
        if let ProductDetailsarrayonefinalvalue:NSArray =   self.Cashbackarayfinalvalue as? NSArray
        {
            self.ProductDetailsarrayone = ProductDetailsarrayonefinalvalue
        }
        
        if let ProductDetailsnamevalue: NSArray =  self.Cashbackarayfinalvalue.value(forKey:"cashback_breakup") as? NSArray
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

                if self.imageNameHandel == "baseprice" {
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
        
        DispatchQueue.main.async {
            self.tableList.reloadData()
        }
        
    }
    
}
