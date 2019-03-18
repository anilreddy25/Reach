//
//  OrdersVC.swift
//  AgentRestocks
//
//  Created by apple on 9/19/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class OrdersVC: UIViewController,UITableViewDelegate,UITableViewDataSource
{
     var coverView = UIView()
     var useridbiling = String()
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var btnPopBack: UIButton!
    @IBOutlet weak var lblOrder: UILabel!
    @IBOutlet weak var btnSetting: UIButton!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var tableListOrder: UITableView!

    var deliveryDate =  [String]()
    var ordervalue = [String]()
    var storeName = [String]()
    var qntyList = [String]()
    var priceList = [String]()
    
    var CheckoutViewControllerstringfinal = String()
    
    var OrdersHist = NSArray()
    var Orderstatus = NSArray()
    var status_color = String()
    var txn_id = String()

    var name = String()
    var due_color = String()

    var due = String()
    var details = String()
    var order_details = NSArray()
    var address = [String]()
    var sold_by = [String]()
    var order_id = [String]()
    var order_date = [String]()
    var deliveredOnDate = [String]()
    var deliveredOnTime = [String]()
    var del_boy = [String]()

    var tot_qty = [String]()
    var imagePath = [String]()
    
    var tot_items = [String]()
    var tot_amount = [String]()
    
    var detailsaray = NSArray()

    var orderdue = NSArray()
    var orderduecolor = NSArray()
    var orderNAme = NSArray()

    var sold_byidvalue = [String]()
   var  order_datefinalvalue = [String]()
    var deliveredOnDatestring = [String]()
    var deliveryboydate = [String]()
   var  itemnamefinal = [String]()

    var itemtot_qtydatefinalfinal = [String]()
    var itemttot_amount = [String]()

    //prodetails array
    
    var productdetailsaray = NSArray()
    var productdetailsName = NSArray()
    var productdetailsRupees = NSArray()
    var productdetailsQuantity = NSArray()
    var productdetailssoldfilledby = NSArray()
    var productdetailsorderconfirmed = NSArray()
    var productdetailsordercolor = NSArray()

    
    //// Handling charges array
    
    
    var chargesarrayfinalvalue  = NSArray()
    var Subtotal  = NSArray()
    var Handlingchargse  = NSArray()
    var GSTcharges  = NSArray()
    var Totalamount  = NSArray()
    var Cashback  = NSArray()


    
    
    /// Ordees adress
    
    
    var deliveryadressarray1 = NSArray()
    var deliveryShopnamearray1 = NSArray()
    var Billingadressarray1 = NSArray()
    var BillingShopnamearray1 = NSArray()
    var deliverymobilenumber1 = NSArray()
    var BillingMobilenumber1 = NSArray()
    var orderdictfinalavlue = NSArray()
    var oredersselectedIndex :Int?
    var productdictfinalavlue = [Any]()
   var productSubChargeValue = NSArray()
    var  credit_text_string = [String]()
    var detailStatusaray = [String]()
    var detailCrditDisply = [String]()
    var detailCODisply = [String]()
    var orderDueDis = [String]()
    var detailCrditaray = [String]()
    var detailCODTextaray = [String]()
    var detailCrdamtDisp = [String]()
    
    @IBOutlet weak var emptycartview: UIView!
    
    var AcessTokenfinalstring = String()
    
    var myagentTotalvalue  = String()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableListOrder.delegate = self
        tableListOrder.dataSource = self
        
//        shadowView.layer.shadowOffset = CGSize(width: 0, height: 3)
//        shadowView.layer.shadowOpacity = 0.6
//        shadowView.layer.shadowRadius = 2.0
//        shadowView.layer.shadowColor = UIColor.color3().cgColor
        
        // Do any additional setup after loading the view.
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 3)
        shadowView.layer.shadowOpacity = 0.6
        shadowView.layer.shadowRadius = 3.0
        shadowView.layer.shadowColor = UIColor.color2().cgColor
        
        headerView.layer.shadowOffset = CGSize(width: 0, height: 3)
        headerView.layer.shadowOpacity = 0.6
        headerView.layer.shadowRadius = 3.0
        headerView.layer.shadowColor = UIColor.color2().cgColor
        
        
        deliveryDate = ["Mon 13 Aug 2018","Mon 18 Aug 2018","Mon 18 Sep 2018"]
        ordervalue = ["1000533433","1000232322","100000304424"]
        storeName = ["Venkataramana traders","Rajadhani Traders","OmSai Traders"]
        qntyList = ["2 items - 12 Qty - Britannia, PopiCorn", "5 items - 12 Qty - Britannia, PopiCorn","50 items - 12 Qty - Britannia, PopiCorn"]
        
       
        let rupee = "\u{20B9}"
        let rupeeOne = "21000.00"
        let rupeeTwo = "25000.00"
        let rupeeThree = "25000.00"

        let finalvalue = NSString(format:"%@%@",rupee,rupeeOne)
        let finalvlue = NSString(format:"%@%@",rupee,rupeeTwo)
        let finalThree = NSString(format:"%@%@",rupee,rupeeThree)

        priceList = [finalvalue,finalvlue,finalThree] as [String]
        
        DispatchQueue.main.async {
            self.orderdeatilsviewscreen()
        }
    }

 

    @IBAction func btnSettingAction(_ sender: Any) {
  
        let filterActive: FilterViewController = self.storyboard?.instantiateViewController(withIdentifier: "FilterViewController") as! FilterViewController
        self.present(filterActive, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.Orderstatus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell : orderListCell = tableListOrder.dequeueReusableCell(withIdentifier: "orderListCell") as! orderListCell

        tableCell.lblOrderNumber.text = self.order_id[indexPath.row]as?String
        tableCell.lblStoreName.text = self.orderNAme[indexPath.row]as?String
        
        tableCell.lblValueOfOrder.text = self.orderdue[indexPath.row]as?String
        tableCell.lblDeliveryOn.text = self.detailStatusaray[indexPath.row] as? String
        tableCell.lblQuantityList.text = self.detailsaray[indexPath.row] as?String
        tableCell.selectionStyle = .none
        
//        if self.credit_text_string.count > 0
//        {
//            let totalvaluefinal = self.credit_text_string[indexPath.row] as?String
//            if let Descriptioncb_cash_back:String = totalvaluefinal as? String
//            {
//                tableCell.lblDue.isHidden = true
//                tableCell.numbermalltotal.text = Descriptioncb_cash_back
//            }
//            else{
//                tableCell.lblDue.isHidden = false
//                tableCell.numbermalltotal.text = "Numbermall"
//            }
//        }
//        else{
//            tableCell.lblDue.isHidden = false
//            tableCell.numbermalltotal.text = "Numbermall"
//
//        }
        
        
        let strDisp : String = self.orderDueDis[indexPath.row]
        
        if strDisp == "0" {
            tableCell.lblDue.isHidden = true
        }
        if strDisp == "1" {
            tableCell.lblDue.isHidden = false
            
        }
        
        let strValeDue : String = self.detailCrditDisply[indexPath.row]
        
        let strDue : String = self.detailCODisply[indexPath.row]
        
        let strCreditAmt : String = self.detailCrdamtDisp[indexPath.row]
        
        if (strValeDue == "1" && strDue == "0" && strCreditAmt == "1" ) {
            tableCell.numbermalltotal.text = self.detailCrditaray[indexPath.row]
            tableCell.lblDue.isHidden = false

        }
        
        if (strValeDue == "0" && strDue == "1" && strCreditAmt == "0") {
            tableCell.numbermalltotal.text = self.detailCODTextaray[indexPath.row]
        }
        
        if (strValeDue == "1" && strDue == "0" && strCreditAmt == "0") {
            tableCell.numbermalltotal.text = self.detailCODTextaray[indexPath.row]
        }
        
        if (strValeDue == "0" && strDue == "1" && strCreditAmt == "1") {
            tableCell.numbermalltotal.text = self.detailCODTextaray[indexPath.row]
            tableCell.lblDue.isHidden = false

        }
        
        if (strValeDue == "0" && strDue == "0" && strCreditAmt == "0") {
            tableCell.numbermalltotal.text = self.detailCrditaray[indexPath.row]
        }
        
        return tableCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {

            
            DispatchQueue.main.async {
                let selectedOrderVCfinalvalue = self.storyboard?.instantiateViewController(withIdentifier:"selectedOrderVC")as!selectedOrderVC
                selectedOrderVCfinalvalue.deliveryadressarray = self.deliveryadressarray1[indexPath.row] as! String
                selectedOrderVCfinalvalue.billingadressarray = self.deliveryadressarray1[indexPath.row] as! String
                selectedOrderVCfinalvalue.orderidsingel = self.order_id[indexPath.row] as! String
                selectedOrderVCfinalvalue.oredersselectedIndex = indexPath.row
                selectedOrderVCfinalvalue.orderSelectPriceList = self.productSubChargeValue
                self.present(selectedOrderVCfinalvalue, animated:true, completion:nil)
            }
        
    }
    
    @IBAction func PopupBack(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
        
    }
    func orderdeatilsviewscreen()
    {
        self.showSpinner()
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.useridbiling = Reviewfinaluseroid
        }
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        var request = URLRequest(url: URL(string:AgentConstants.DescriptionBaseurl)!)
        request.httpMethod = "POST"
        
       let postString = String(format: "method=%@&userid=%@&txntype=%@&filterStartDate=%@&filterEndDate=%@&CustomSearch=%@&pageno=%@&pagesize=%@","orderHistory",self.useridbiling,"","","","","1","10")
        
        request.httpBody = postString.data(using: .utf8)
      
        request.addValue(AcessTokenfinalstring, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    DispatchQueue.main.async {
                        self.removeSpinner()
                        self.emptycartview.isHidden = true
                        self.tableListOrder.isHidden = false
                    }
                    
                    print(dict)
                    
                    if let DescriptionMRP:NSArray = dict.value(forKey: "OrdersHist") as? NSArray
                    {
                        self.OrdersHist = DescriptionMRP
                    }
                    
                    if let OrdersHistfinal:NSArray = self.OrdersHist.value(forKey: "status") as? NSArray {
                        self.Orderstatus = OrdersHistfinal
                    }
                    
                    if let detailsarayfinal:NSArray = self.OrdersHist.value(forKey: "details") as? NSArray {
                        self.detailsaray = detailsarayfinal
                    }
                    
                    
                    if let detailsarayStatusfinal:[String] = self.OrdersHist.value(forKey: "orderStatusInList") as? [String] {
                        self.detailStatusaray = detailsarayStatusfinal
                    }
                
                    if let detailsarayCODfinal:[String] = self.OrdersHist.value(forKey: "cod_display") as? [String] {
                        self.detailCODisply = detailsarayCODfinal
                    }
                    
                    
                    if let detailsarayCODfinal:[String] = self.OrdersHist.value(forKey: "cod_text") as? [String] {
                        self.detailCODTextaray = detailsarayCODfinal
                    }
                    
                    
                    if let detailsarayCreditfinal:[String] = self.OrdersHist.value(forKey: "credit_display") as? [String] {
                        self.detailCrditDisply = detailsarayCreditfinal
                    }
                    
                    if let detailsarayCreditfinal:[String] = self.OrdersHist.value(forKey: "credit_text") as? [String] {
                        self.detailCrditaray = detailsarayCreditfinal
                    }
                    
                    //
                    
                    if let detailsarayCreditfinal:[String] = self.OrdersHist.value(forKey: "credit_amount_display") as? [String] {
                        self.detailCrdamtDisp = detailsarayCreditfinal
                    }
                    
                    
                    if let order_idfinal:[String] = self.OrdersHist.value(forKey: "due_display") as? [String]
                    {
                        self.orderDueDis = order_idfinal
                    }
                    
                    
                    if let orderduecolorfinal:NSArray = self.OrdersHist.value(forKey: "due_color") as? NSArray
                    {
                        self.orderduecolor = orderduecolorfinal
                    }
                    if let order_idfinal:NSArray = self.OrdersHist.value(forKey: "due") as? NSArray
                    {
                        self.orderdue = order_idfinal
                    }
                    
                    if let orderNAmefinal:NSArray = self.OrdersHist.value(forKey: "name") as? NSArray
                    {
                        self.orderNAme = orderNAmefinal
                    }
                    
                    if let OrdersHistfinal:NSArray = self.OrdersHist.value(forKey: "order_details") as? NSArray
                    {
                        self.order_details = OrdersHistfinal
                    }

                    if let order_idfinal:[String] = self.order_details.value(forKey: "order_id") as? [String]
                    {
                        self.order_id = order_idfinal
                    }
                    if let order_datefinal:[String] = self.order_details.value(forKey: "order_date") as? [String]
                    {
                        self.order_datefinalvalue = order_datefinal
                    }
                    if let deliveredOnDatefinal:[String] = self.order_details.value(forKey: "deliveredOnDate") as? [String]
                    {
                        self.deliveredOnDatestring = deliveredOnDatefinal
                    }
                    if let deliveryboydatefinal:[String] = self.order_details.value(forKey: "del_boy") as? [String]
                    {
                        self.deliveryboydate = deliveryboydatefinal
                    }
                    
                    if let itemnamefinaldatefinal:[String] = self.order_details.value(forKey: "tot_items") as? [String]
                    {
                        self.itemnamefinal = itemnamefinaldatefinal
                    }
                    if let credit_text_stringfinal:[String] = self.order_details.value(forKey: "credit_text") as? [String] {
                        self.credit_text_string = credit_text_stringfinal
                    }
                    
                    if let tot_qtydatefinal:[String] = self.order_details.value(forKey: "tot_qty") as? [String]
                    {
                        self.itemtot_qtydatefinalfinal = tot_qtydatefinal
                    }
                    
                    if let tot_amountdatefinal:[String] = self.order_details.value(forKey: "tot_amount") as? [String]
                    {
                        self.itemttot_amount = tot_amountdatefinal
                    }
                    
                    if let sold_byidvaluefinal:[String] = self.order_details.value(forKey: "sold_by") as? [String]
                    {
                        self.sold_byidvalue = sold_byidvaluefinal
                    }
                  
                    /// product details
                    
                    
                    if let productdetailsarayfinal:NSArray = self.OrdersHist.value(forKey: "prod_details") as? NSArray
                    {
                        self.productdetailsaray = productdetailsarayfinal
                    }
                    if let productdetailsNamefinal:NSArray = self.productdetailsaray.value(forKey: "name") as? NSArray
                    {
                        self.productdetailsName = productdetailsNamefinal
                    }

                    
                    if let productdetailsRupeesfinal:NSArray = self.productdetailsaray.value(forKey: "price") as? NSArray
                    {
                        self.productdetailsRupees = productdetailsRupeesfinal
                    }
                    
                    if let productdetailsQuantityfinal:NSArray = self.productdetailsaray.value(forKey: "qty") as? NSArray
                    {
                        self.productdetailsQuantity = productdetailsQuantityfinal
                    }
                    
                    if let productdetailssoldfilledbyfinal:NSArray = self.productdetailsaray.value(forKey: "sold_by") as? NSArray
                    {
                        self.productdetailssoldfilledby = productdetailssoldfilledbyfinal
                    }
                    
                    if let productdetailsorderconfirmedfinal:NSArray = self.productdetailsaray.value(forKey: "status") as? NSArray
                    {
                        self.productdetailsorderconfirmed = productdetailsorderconfirmedfinal
                    }
                    if let productdetailsordercolorfinal:NSArray = self.productdetailsaray.value(forKey: "status_color") as? NSArray
                    {
                        self.productdetailsordercolor = productdetailsordercolorfinal
                    }

                    ///// handling charges
                    
                    if let chargesarrayfinal:NSArray = self.OrdersHist.value(forKey: "charges") as? NSArray
                    {
                        self.chargesarrayfinalvalue = chargesarrayfinal
                    }
                    if let Handlingchargsearrayfinal:NSArray = self.chargesarrayfinalvalue.value(forKey: "key") as? NSArray
                    {
                        self.Handlingchargse = Handlingchargsearrayfinal
                    }
                    if let Subtotalarrayfinal:NSArray = self.chargesarrayfinalvalue.value(forKey: "value") as? NSArray
                    {
                        self.Subtotal = Subtotalarrayfinal
                    }
                    
                    
                    if let deliveryadressarray1final:NSArray = self.OrdersHist.value(forKey: "delivery_address") as? NSArray
                    {
                        self.deliveryadressarray1 = deliveryadressarray1final
                    }
                    
                    if let Billingadressarray1final:NSArray = self.OrdersHist.value(forKey: "billing_address") as? NSArray
                    {
                        self.Billingadressarray1 = Billingadressarray1final
                    }
                    if let deliveryShopnamearray1final:NSArray = self.OrdersHist.value(forKey: "delShopName") as? NSArray
                    {
                        self.deliveryShopnamearray1 = deliveryShopnamearray1final
                    }
                    
                    if let BillingShopnamearray1final:NSArray = self.OrdersHist.value(forKey: "billShopName") as? NSArray
                    {
                        self.BillingShopnamearray1 = BillingShopnamearray1final
                    }
               
                    DispatchQueue.main.async
                        {
                        self.tableListOrder.reloadData()
                    }
                    
                    if let productdetailsordercolorfinal:NSArray =  self.OrdersHist.value(forKey: "order_details") as? NSArray
                    {
                        self.orderdictfinalavlue = productdetailsordercolorfinal
                        let defautsfinalavalue = UserDefaults.standard
                        defautsfinalavalue.set(self.orderdictfinalavlue, forKey:"orderdictfinalavlue")
                        defautsfinalavalue.synchronize()
                        
                    }
                    
                    
                    if let productdictfinalavluefinal:NSArray =  self.OrdersHist.value(forKey: "prod_details") as? NSArray
                    {
                        
                        self.productdictfinalavlue =  productdictfinalavluefinal as! [Any]

                        let defautsfinalavalue = UserDefaults.standard

                        defautsfinalavalue.set(self.productdictfinalavlue, forKey: "Myproductdictfinalavlue")

                        defautsfinalavalue.synchronize()

                    }
                    
                    if let productdictChargefinal:NSArray =  self.OrdersHist.value(forKey: "charges") as? NSArray
                    {
                        self.productSubChargeValue = productdictChargefinal
                        let defautsfinalavalue = UserDefaults.standard
                        defautsfinalavalue.set(self.productSubChargeValue, forKey:"MyproductdictChargeValue")
                        defautsfinalavalue.synchronize()
                    }
                }
                
                else{
                    DispatchQueue.main.async {
                        self.removeSpinner()
                        self.emptycartview.isHidden = false
                        self.tableListOrder.isHidden = true
                    }
                }
                break
            case .failure(_):
                DispatchQueue.main.async {
                    self.removeSpinner()
                    self.emptycartview.isHidden = false
                    self.tableListOrder.isHidden = true
                }
                break
            }
        }
    }
    func showSpinner(){
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.view.addSubview(self.coverView)
        let imageview = UIImageView()
        imageview.frame = CGRect(x:screenSize.width/2-25,y:screenSize.height/2-25,width:50,height:50)
        imageview.image = UIImage.gif(name: "loader2")
        self.coverView.addSubview(imageview)
    }
    func removeSpinner(){
        self.coverView.removeFromSuperview()
    }
    
}
