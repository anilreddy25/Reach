//
//  checkoufinalViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 28/11/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
class checkoufinalViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var topview: UIView!
    var Sellersitemname = [String]()
    var Sellertype = [String]()
    var Sellerrupees = [String]()
    var Selleritems = [String]()
    var SellerQuantity = [String]()
    @IBOutlet weak var productfinaltabelview: UITableView!
    @IBOutlet weak var proceedconfirm: UIButton!
    @IBOutlet weak var quantitynavigationbartop: UILabel!
    @IBOutlet weak var rupessnavigationbar: UILabel!
    var useridbiling = String()
    var coverView = UIView()
    var imageView = UIImageView()
    var SellerListfinlvalue = NSArray()
    var seller_id = [String]()
    var seller_name = [String]()
    var seller_caption = [String]()
    var items_caption = [String]()
    var quantity = [String]()
    var amount = [String]()
    var shopname = [String]()
    var delivery_address = [String]()
    var delivery_timings = [String]()
    var text1 = [String]()
    var text2 = [String]()
    var text3 = [String]()
    var upi = NSArray()
    var credit = NSArray()
    var prod_details = NSArray()
    var charges = NSArray()
    
    var sellers_headerValue = String()
    var total_sellers_header_amount = String()
    
    var ChekcoutShopName = [String]()
    var delivery_addressValue = NSDictionary()
    
    
    //// Product details screen Value
    
    var ProductDetails = NSArray()
    var cashFinalVale = NSArray()
    
    var nameProductvalue = [String]()
    var pricevalue = [String]()
    var qtyvalue = [String]()

    var ProductDetailsarrayone = NSArray()
    var ProductDetailsarraytwo = NSArray()

    
    var Cahrgesarray = NSArray()
    
    var Cahrgesarrayone = NSArray()
    var CahrgesarrayTWo = NSArray()
    
    
    
    var CashBakbreakuparray = NSArray()
    
    var CashBakbreakuparrayone = NSArray()

    
    
    ///// Billing adress

    
    var addressesDict = NSArray()
    
    var billingJSONDict = NSDictionary()
    
    var billingJSOnLocationstring = String()
    var billingJSOnlandmarkNamestring = String()


    
    
    
    
    
    //// Delivery adress
    
    var deliveryJsonDict = NSDictionary()
    var deliveryJsonDictone = NSDictionary()
    var deliveryJsonDictLocationstring = String()
    var deliveryJsonDictlandmarkNamestring = String()
    
    
    
    //// strings display
    
    var useridbilingfinalvalue = String()
    
    var Myauthorisationstringfinalvalue = String()

    var myagentTotalvalue = String()

    
    var billingLocationstringvalue = String()
    
    var billingsaveAsstringvalue = String()
    var billingMylandmarkstring = String()

    
    
    var DeliveryLocationstringvalue = String()
    
    var DeliverysaveAsstringvalue = String()
    
    var DeliveryLandmarkstringvalue = String()
    

    
    
    
    
    //// Delivery adresstwoDict
    
    
    var DlocationDict = NSDictionary()

    var Dlocationtwo = String()
    
    var Dlocationsavetwo = String()
    
    var Dlandmarktwo = String()
  
    var sellerDueamount = [String]()
    
    var sellerCreditamount = [String]()
    
    var seller_idfinalvalueClik = String()

    var Deliveryadressidsingelone = String()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        topview.layer.shadowOffset = CGSize(width: 0, height: 2)
        topview.layer.shadowOpacity = 0.3
        topview.layer.shadowRadius = 1.0
        topview.layer.borderColor = UIColor.color2().cgColor
        topview.layer.shadowColor = UIColor.color2().cgColor
        proceedconfirm.layer.cornerRadius = 6
        proceedconfirm.clipsToBounds = true
        DispatchQueue.main.async
            {
            self.orderdeatilsviewscreen()
          }
    }
    @IBAction func Backbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
    return self.Sellersitemname.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell  = productfinaltabelview.dequeueReusableCell(withIdentifier: "ProcessedconfirmTableViewCell", for: indexPath) as! ProcessedconfirmTableViewCell
        cell.selectionStyle = .none
        cell.productname.text = self.Sellersitemname[indexPath.row] as? String
      
        cell.productamount.text = self.Sellerrupees[indexPath.row] as? String
        
        cell.stockoutlabel.text = self.Sellertype[indexPath.row] as? String

        cell.itemslabel.text = self.Selleritems[indexPath.row] as? String

        cell.quantitylabel.text = self.SellerQuantity[indexPath.row] as? String
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 65
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        DispatchQueue.main.async
            {
                let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"ConfirmthisorderViewController")as!ConfirmthisorderViewController
                viewfinal.sellernamesingelvalue    = self.Sellersitemname[indexPath.row]
                viewfinal.superstockoutlabelvalue    = self.Sellertype[indexPath.row]
              //  viewfinal.shopNamelabellabelvalue    = self.ChekcoutShopName[indexPath.row]
//                viewfinal.Deliverysinglvalue    =  self.delivery_addressValue[indexPath.row] as! String
                viewfinal.amountlabelstring    =  self.Sellerrupees[indexPath.row]
                viewfinal.Quantitylabelsstring    =  self.SellerQuantity[indexPath.row]
                viewfinal.selleritemTotalvalue    =  self.Selleritems[indexPath.row]
                
                viewfinal.int_count = indexPath.row


               viewfinal.totalAmontVal = self.total_sellers_header_amount
                let value1 =   self.SellerListfinlvalue[indexPath.row]
                if let ProductDetailsfinalvalue:NSArray =    (value1 as AnyObject).value(forKey:"prod_details") as? NSArray
                {
                    self.ProductDetails = ProductDetailsfinalvalue
                    
                    let defaults = UserDefaults.standard
                    defaults.set(self.ProductDetails, forKey:"Myproductdetailsary")
                    defaults.synchronize()
                    
                }
                
                if let chargefinalvalue:NSArray =    (value1 as AnyObject).value(forKey:"charges") as? NSArray
                {
                    self.cashFinalVale = chargefinalvalue
                    
                    let defaults = UserDefaults.standard
                    defaults.set(self.cashFinalVale, forKey:"MyChargesdetailsary")
                    defaults.synchronize()
                    
                }
                
                
                if let ProductDetailsarrayonefinalvalue:NSArray =   self.ProductDetails as? NSArray
                    {
                    self.ProductDetailsarrayone = ProductDetailsarrayonefinalvalue
                    }
                
                if let ProductDetailsnamevalue: [String] =  self.ProductDetailsarrayone.value(forKey:"name") as? [String]
                    {
                    self.nameProductvalue = ProductDetailsnamevalue
                    }
                    if let ProductDetailsnamevalue: [String] =  self.ProductDetailsarrayone.value(forKey:"price") as? [String]
                    {
                    self.pricevalue = ProductDetailsnamevalue
                    }
                if let ProductDetailsqtyvalue: [String] =  self.ProductDetailsarrayone.value(forKey:"qty") as? [String]
                {
                    self.qtyvalue = ProductDetailsqtyvalue
                }
                
                if let ProductDetailsqtyvalue: NSArray =  self.ProductDetailsarrayone.value(forKey:"cashback_breakup") as? NSArray
                {
                    self.CashBakbreakuparray = ProductDetailsqtyvalue
                    let defaults = UserDefaults.standard
                    defaults.set(self.CashBakbreakuparray, forKey:"Mycashbackarray")
                    defaults.synchronize()
                }
                 viewfinal.Popcornname    =  self.nameProductvalue
                 viewfinal.PopcornQunatitylabel =  self.qtyvalue
                 viewfinal.PopcornTotalRupess =  self.pricevalue
                viewfinal.Deliveryadresssname    =  self.deliveryJsonDictLocationstring
                viewfinal.Deliveryadresssaveas = self.deliveryJsonDictlandmarkNamestring
                viewfinal.DeliveryadressDictconfirm =  self.deliveryJsonDictone
                viewfinal.Billingadresssname    =  self.billingJSOnLocationstring
                
                viewfinal.Billingadresssaveas =  self.billingJSOnlandmarkNamestring
                viewfinal.BillingadressDictform =  self.billingJSONDict
                viewfinal.DeliveryadressLandmark    =  self.DeliveryLandmarkstringvalue
                viewfinal.BillingadressLAndmark =  self.billingMylandmarkstring
                
               self.seller_idfinalvalueClik =  self.seller_id[indexPath.row]
                
                
                let defaults = UserDefaults.standard
                defaults.set(self.seller_idfinalvalueClik, forKey:"Mycelleridfinalvalue")
                defaults.synchronize()
                
                
                self.present(viewfinal, animated: true, completion:nil)
                
                
                print(self.ProductDetailsarrayone)
                
                print(self.ProductDetails)

                
    }
    }
    
    func orderdeatilsviewscreen()
    {
        self.showSpinner()
        let dafaults = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = dafaults.value(forKey: "Myuseridfinaltwovalue")as?String
        {
            self.useridbilingfinalvalue = Reviewfinaluseroid
        }
        if let Myauthorisationfinlavalue:String = dafaults.value(forKey: "Myauthorisation")as?String
        {
            self.Myauthorisationstringfinalvalue = Myauthorisationfinlavalue
        }
        if let Myagentidfinlavalue:String = dafaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        
        print(self.Myauthorisationstringfinalvalue)
        print(self.myagentTotalvalue)
        print(self.useridbilingfinalvalue)

        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let postString =  String(format: "method=%@&userid=%@&app=%@","checkoutSummaryNew",self.useridbilingfinalvalue,"IOS")
        print(postString)
        
        request.addValue(self.Myauthorisationstringfinalvalue, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")

        request.httpBody = postString.data(using: .utf8)
//        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
//        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    
                    print(dict)
                    
                    self.removeSpinner()
                    
                    if let DescriptionMRP:NSArray = dict.value(forKey: "sellersList") as? NSArray
                    {
                        self.SellerListfinlvalue = DescriptionMRP
                    }
                    if let seller_idvalue:[String] =  self.SellerListfinlvalue.value(forKey: "seller_id") as? [String]
                    {
                        self.seller_id = seller_idvalue
                        
                        
                    }
                    if let seller_namevalue:[String] =  self.SellerListfinlvalue.value(forKey: "seller_name") as? [String]
                    {
                        self.Sellersitemname = seller_namevalue
                    }
                    
                    if let sellerDueamountfinalvalue:[String] =  self.SellerListfinlvalue.value(forKey: "total_seller_due_amount") as? [String]
                    {
                        self.sellerDueamount = sellerDueamountfinalvalue
                    }
                    
                    if let sellerCreditamountfinalvalue:[String] =  self.SellerListfinlvalue.value(forKey: "total_seller_credit_amount") as? [String]
                    {
                        self.sellerCreditamount = sellerCreditamountfinalvalue
                    }
                   
                    
                    
                    if let seller_captionvalue:[String] =  self.SellerListfinlvalue.value(forKey: "seller_caption") as? [String]
                    {
                        self.Sellertype = seller_captionvalue
                    }
                    
                    if let shopnamevalue:[String] =  self.SellerListfinlvalue.value(forKey:"shopname") as? [String]
                    {
                        self.ChekcoutShopName = shopnamevalue
                    }
                    
                    if let seller_quantityvalue:[String] =  self.SellerListfinlvalue.value(forKey:"quantity") as? [String]
                    {
                        self.SellerQuantity = seller_quantityvalue
                    }
                    if let amountvalue:[String] =  self.SellerListfinlvalue.value(forKey:"amount") as? [String]
                    {
                        self.Sellerrupees = amountvalue
                    }
                    
                    if let itemsvalue:[String] =  self.SellerListfinlvalue.value(forKey:"items") as? [String]
                    {
                        self.Selleritems = itemsvalue
                    }
                    
                    if let total_sellers_header_amountvalue:String =  dict.value(forKey:"total_sellers_header_amount") as? String
                    {
                        self.total_sellers_header_amount = total_sellers_header_amountvalue
                        
                        self.rupessnavigationbar.text =  self.total_sellers_header_amount
                    }
                    if let sellers_headerValuevalue:String =  dict.value(forKey:"sellers_header") as? String
                    {
                        self.sellers_headerValue = sellers_headerValuevalue
                        self.quantitynavigationbartop.text =  self.sellers_headerValue
                    }
                
                    if let Cahrgesarrayqtyvalue:NSArray =  self.SellerListfinlvalue.value(forKey:"charges") as? NSArray
                    {
                        self.Cahrgesarray = Cahrgesarrayqtyvalue
                    }
                    if let DeliveryLocationstringvaluefinalvalue:String =   self.delivery_addressValue.value(forKey:"location") as? String
                    {
                        self.DeliveryLocationstringvalue = DeliveryLocationstringvaluefinalvalue
                    }
                    if let addressesDictvalue:NSArray =   self.SellerListfinlvalue.value(forKey:"addresses") as? NSArray
                    {
                        self.addressesDict = addressesDictvalue
                    }
                    if let sellers_deliveryfinalvalue:NSDictionary =  (self.addressesDict[0] as AnyObject).value(forKey:"billingJSON") as? NSDictionary
                    {
                       self.billingJSONDict = sellers_deliveryfinalvalue
                    }
                    if let sellers_deliveryfinalvalue:String =   self.billingJSONDict.value(forKey:"location") as? String
                    {
                        self.billingLocationstringvalue = sellers_deliveryfinalvalue
                    }
                    
                    if let deliveryJsonDictlandmarkNamestringfinalvalue:String =   self.billingJSONDict.value(forKey:"saveAs") as? String
                    {
                        self.billingsaveAsstringvalue = deliveryJsonDictlandmarkNamestringfinalvalue
                    }
                    if let billingMylandmarkstringfinalvalue:String =  self.billingJSONDict.value(forKey:"landmark") as? String
                    {
                        self.billingMylandmarkstring = billingMylandmarkstringfinalvalue
                    }
                    
                    
                    
                    
                    if let deliveryJsonDictfinalvalue:NSDictionary =  (self.addressesDict[0] as AnyObject).value(forKey:"deliveryJson") as? NSDictionary
                    {
                        self.deliveryJsonDict = deliveryJsonDictfinalvalue
                    }
                    if let deliveryJsonDictonefinalvalue:NSDictionary =  self.deliveryJsonDict.value(forKey:"delAddress1") as? NSDictionary
                    {
                        self.deliveryJsonDictone = deliveryJsonDictonefinalvalue
                    }
                    
                    if let deliveryJsonDictlandmarkNamestringfinalvalue:String =  self.deliveryJsonDictone.value(forKey:"saveAs") as? String
                    {
                        self.DeliverysaveAsstringvalue = deliveryJsonDictlandmarkNamestringfinalvalue
                    }
                    
                    if let Deliveryadressidsingelonefinalvalue:String =  self.deliveryJsonDictone.value(forKey:"addressone") as? String
                    {
                        self.Deliveryadressidsingelone = Deliveryadressidsingelonefinalvalue
                        let defaults = UserDefaults.standard
                        defaults.set(self.Deliveryadressidsingelone, forKey:"MyadressoneTotal")
                        defaults.synchronize
                    }
                    
                    
                    
                    
                    
                    
                    if let deliveryJsonDictlandmarkNamestringfinalvalue:String =  self.deliveryJsonDictone.value(forKey:"location") as? String
                    {
                        self.deliveryJsonDictLocationstring = deliveryJsonDictlandmarkNamestringfinalvalue
                    }
                  
                    if let DeliveryLandmarkstringvaluefinalvalue:String =  self.deliveryJsonDictone.value(forKey:"landmark") as? String
                    {
                        self.DeliveryLandmarkstringvalue = DeliveryLandmarkstringvaluefinalvalue
                    }
                 
                   
                    
                    
                    
                    
                    if let DlocationDictfinalvalue:NSDictionary =  self.deliveryJsonDict.value(forKey:"delAddress2") as? NSDictionary
                    {
                        self.DlocationDict = DlocationDictfinalvalue
                    }
                    
                    if let Dlocationsavetwostringfinalvalue:String =  self.DlocationDict.value(forKey:"saveAs") as? String
                    {
                        self.Dlocationsavetwo = Dlocationsavetwostringfinalvalue
                    }
                    if let Dlocationsavetwostringfinalvalue:String =  self.DlocationDict.value(forKey:"location") as? String
                    {
                        self.Dlocationtwo = Dlocationsavetwostringfinalvalue
                    }
                    
                    if let Dlandmarktwofinalvalue:String =  self.DlocationDict.value(forKey:"landmark") as? String
                    {
                        self.Dlandmarktwo = Dlandmarktwofinalvalue
                    }

                    DispatchQueue.main.async
                        {
                            self.productfinaltabelview.reloadData()
                            let defaultssingelvalue = UserDefaults.standard
                          defaultssingelvalue.set(self.self.DeliveryLandmarkstringvalue, forKey:"dland")
                            defaultssingelvalue.set(self.deliveryJsonDictLocationstring, forKey:"Dlocation")
                            defaultssingelvalue.set(self.DeliverysaveAsstringvalue, forKey:"Dlocationsave")
                           defaultssingelvalue.set(self.billingMylandmarkstring, forKey:"biland")
                            defaultssingelvalue.set(self.billingLocationstringvalue, forKey:"bilocation")
                            defaultssingelvalue.set(self.billingsaveAsstringvalue, forKey:"bilsave")
                            
                            
                            
                            defaultssingelvalue.set(self.Dlocationsavetwo, forKey:"Deliverysavetwo")
                            defaultssingelvalue.set(self.Dlocationtwo, forKey:"Dlocationtwo")
                            defaultssingelvalue.set(self.Dlandmarktwo, forKey:"Dlandmarktwo")
                            defaultssingelvalue.set(self.sellerDueamount, forKey:"sellerDueamount")
                            defaultssingelvalue.set(self.sellerCreditamount, forKey:"sellerCreditamount")
                       
                            defaultssingelvalue.synchronize()
                          
                       }
                }
                break
            case .failure(_):
                break
            }
        }
    }

    
    @IBAction func processedConfirm(_ sender: UIButton)
    {

        DispatchQueue.main.async
            {
                let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"ConfirmthisorderViewController")as!ConfirmthisorderViewController
                viewfinal.sellernamesingelvalue    = self.Sellersitemname[0]
                viewfinal.superstockoutlabelvalue    = self.Sellertype[0]
                viewfinal.shopNamelabellabelvalue    = self.ChekcoutShopName[0]
                //                viewfinal.Deliverysinglvalue    =  self.delivery_addressValue[indexPath.row] as! String
                viewfinal.amountlabelstring    =  self.Sellerrupees[0]
                viewfinal.Quantitylabelsstring    =  self.SellerQuantity[0]
                viewfinal.cashBackAArrayCheck = self.cashFinalVale
               // viewfinal.handleChargeCheck = self.
                let value1 =   self.SellerListfinlvalue[0]
                if let ProductDetailsfinalvalue:NSArray =    (value1 as AnyObject).value(forKey:"prod_details") as? NSArray
                {
                    self.ProductDetails = ProductDetailsfinalvalue
                    
                    let defaults = UserDefaults.standard
                    defaults.set(self.ProductDetails, forKey:"Myproductdetailsary")
                    defaults.synchronize()
                    
                }
                
                if let chargefinalvalue:NSArray =    (value1 as AnyObject).value(forKey:"charges") as? NSArray
                {
                    self.cashFinalVale = chargefinalvalue
                    
                    let defaults = UserDefaults.standard
                    defaults.set(self.cashFinalVale, forKey:"MyChargesdetailsary")
                    defaults.synchronize()
                    
                }
                
                
                
                if let ProductDetailsarrayonefinalvalue:NSArray =   self.ProductDetails as? NSArray
                {
                    self.ProductDetailsarrayone = ProductDetailsarrayonefinalvalue
                }
                
                if let ProductDetailsnamevalue: [String] =  self.ProductDetailsarrayone.value(forKey:"name") as? [String]
                {
                    self.nameProductvalue = ProductDetailsnamevalue
                }
                if let ProductDetailsnamevalue: [String] =  self.ProductDetailsarrayone.value(forKey:"price") as? [String]
                {
                    self.pricevalue = ProductDetailsnamevalue
                }
                if let ProductDetailsqtyvalue: [String] =  self.ProductDetailsarrayone.value(forKey:"qty") as? [String]
                {
                    self.qtyvalue = ProductDetailsqtyvalue
                }
                
                if let ProductDetailsqtyvalue: NSArray =  self.ProductDetailsarrayone.value(forKey:"cashback_breakup") as? NSArray
                {
                    self.CashBakbreakuparray = ProductDetailsqtyvalue
                    let defaults = UserDefaults.standard
                    defaults.set(self.CashBakbreakuparray, forKey:"Mycashbackarray")
                    defaults.synchronize()
                }
                viewfinal.Popcornname    =  self.nameProductvalue
                viewfinal.PopcornQunatitylabel =  self.qtyvalue
                viewfinal.PopcornTotalRupess =  self.pricevalue
                viewfinal.Deliveryadresssname    =  self.deliveryJsonDictLocationstring
                viewfinal.Deliveryadresssaveas = self.deliveryJsonDictlandmarkNamestring
                viewfinal.DeliveryadressDictconfirm =  self.deliveryJsonDictone
                viewfinal.Billingadresssname    =  self.billingJSOnLocationstring
                
                viewfinal.Billingadresssaveas =  self.billingJSOnlandmarkNamestring
                viewfinal.BillingadressDictform =  self.billingJSONDict
                viewfinal.DeliveryadressLandmark    =  self.DeliveryLandmarkstringvalue
                viewfinal.BillingadressLAndmark =  self.billingMylandmarkstring
                
                self.seller_idfinalvalueClik =  self.seller_id[0]
                
                viewfinal.int_count = 0

                let defaults = UserDefaults.standard
                defaults.set(self.seller_idfinalvalueClik, forKey:"Mycelleridfinalvalue")
                defaults.synchronize()
                
                
                self.present(viewfinal, animated: true, completion:nil)
                
                
                print(self.ProductDetailsarrayone)
                
                print(self.ProductDetails)
                
                
        }
    }
    
    @IBAction func Mybackbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    func showSpinner()
    {
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.view.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(imageView)
    }
    func removeSpinner()
    {
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()
    }
}
