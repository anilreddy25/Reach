//
//  selectedOrderVC.swift
//  AgentRestocks
//
//  Created by apple on 12/18/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class selectedOrderVC: UIViewController,UIScrollViewDelegate,UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lblDeliveryBoyandDate: UILabel!
    @IBOutlet weak var lblTraderName: UILabel!
    @IBOutlet weak var lblsubTitletrader: UILabel!
    @IBOutlet weak var lblStoreName: UILabel!
    @IBOutlet weak var lblFullfilledbyTrader: UILabel!
    @IBOutlet weak var lblAddressDestination: UILabel!
    @IBOutlet weak var lblOrderNowithDay: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblItems: UILabel!
    @IBOutlet weak var lblQnty: UILabel!
    @IBOutlet weak var tableList: UITableView!
    @IBOutlet weak var lblSubTotalAmount: UILabel!
    @IBOutlet weak var lblHandlingAmount: UILabel!
    @IBOutlet weak var lblGSTAmount: UILabel!
    @IBOutlet weak var lblCBamount: UILabel!
    @IBOutlet weak var lblPromoCodeAmount: UILabel!
    @IBOutlet weak var lblTotalAmount: UILabel!
    @IBOutlet weak var lblNMCreditAmount: UILabel!
    @IBOutlet weak var lblUPIAmount: UILabel!
    @IBOutlet weak var lblDueAmount: UILabel!
    @IBOutlet weak var lblPreferedTime: UILabel!
    
    @IBOutlet weak var myscrollviewfinalvalue: UIScrollView!
    @IBOutlet weak var Deliveryscrollview: UIScrollView!
    @IBOutlet weak var deliverview: UIView!
    @IBOutlet weak var viewsingel: UIView!
    @IBOutlet weak var viewtop: UIView!
    @IBOutlet weak var viewbottom: UIView!
    @IBOutlet weak var Deliverybottomview: UIView!
    @IBOutlet weak var Deliveryareyousurewant: UILabel!
    @IBOutlet weak var selectordertabelview: UITableView!
    
    
    @IBOutlet weak var singelorderview: UIView!
    @IBOutlet weak var secondview: UIView!
    @IBOutlet weak var cancelordermiddleview: UIView!
    @IBOutlet weak var cancelorderbottomview: UIView!
    var Langagefinalstring = [String]()
    var selectimagestring = [UIImage]()
    
    @IBOutlet weak var lblTAmount: UILabel!
    
    @IBOutlet weak var lblHandleTview: UILabel!
    
    var selectedIndex :Int?
    
    @IBOutlet weak var btnCBView: UIButton!
    
    @IBOutlet weak var yesbutton: UIButton!
    
    @IBOutlet weak var btnHandle: UIButton!
    
    @IBOutlet weak var nobutton: UIButton!
    
    @IBOutlet weak var cancelbutton: UIButton!
    
    @IBOutlet weak var lblCBTView: UILabel!
    
    @IBOutlet weak var selectitemtocancel: UIButton!
    
    /// Delivery and billing adress
    
    var deliveryadressarray = String()
    
    var billingadressarray = String()
    
    var orderidsingel = String()
    var delShopNamestring = String()
    var orderDictfinalvalue = NSArray()
    var orderSubCharge = NSArray()
    
    var orderSelectPriceList = NSArray()
    
    var address = String()
    
    var sold_by = String()

    var order_id = String()
    var order_date = String()
    
    var deliveredOnDate = String()
    
    var deliveredOnTime = String()

    var del_boy = String()
    
    var delivery_details = String()
    var tot_qty = String()
    var imagePath = String()

    var trader_name = String()
    var trader_caption = String()
    var ordernumber_date = String()
    var tot_items = String()
    var tot_amount = String()
    var order_summary = String()
    var orderTotalavlueis = NSDictionary()

    var oredersselectedIndex :Int?
    
    

    @IBOutlet weak var singlorderidvalue: UILabel!
    
//    @IBOutlet weak var navigationbaridvalue: UILabel!
//
//    @IBOutlet weak var navigationbarorderTime: UILabel!
    
    var Myproductsingelvalue = NSArray()
    var MyproductChargevalue = NSArray()
    
    var detailsproductName = [String]()
    var arrayOrder = [Any]()
    var detailsproductImages = [String]()
    var detailsproductprice = [String]()
    var detailsproductqty = [String]()
    var detailsproductsold_by = [String]()
    var hamaliCharge = [Any]()
    var gstCharge = [Any]()
    var cbChargesVal = [Any]()
    var subTotalValue = [String]()
    var valueArray = NSArray()
    var keyValae = [String]()
    var chargesRelated = NSArray()
    
    var dictOFPrice = [String: Any]()
    var validateStrin = String()
    var valOFSubTOTAL = String()
    var valOFHandle = String()
    var handleBtntitle = String()
    var cashBtntitle = String()
    var valOFGST = String()
    var valOFPromoOffer =  String()
    var valOFCCb  = String()
    var valOFTotalAMount =  String()
    var valedoFFArr = NSArray()
    var cashBackDictVal = [String: Any]()
    
    //Hamali_breakup
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        scrollView.delegate = self
        middleView.addSubview(scrollView)
        if self.view.frame.size.height < 650
        {
            myscrollviewfinalvalue.contentInset = UIEdgeInsetsMake(0, 0,1000, 0)
            myscrollviewfinalvalue.isScrollEnabled = true
            myscrollviewfinalvalue.delegate = self
            myscrollviewfinalvalue.showsVerticalScrollIndicator = false
        }
        topView.layer.shadowOffset = CGSize(width: 0, height: 3)
        topView.layer.shadowOpacity = 0.6
        topView.layer.shadowRadius = 3.0
        topView.layer.shadowColor = UIColor.color2().cgColor
//
//        topView.dropShadow()
        
        self.viewbottom.layer.addBorder(edge:.top, color: UIColor.textfiledbottomcolorside(), thickness:0.7)
        self.viewbottom.layer.addBorder(edge:.bottom, color: UIColor.textfiledbottomcolorside(), thickness:0.7)

        Langagefinalstring  = ["Delay in delivery","Trying out NumberMall","Prices are high","Don’t need these items any more","Bought from another supplier","others"]
        selectimagestring = [#imageLiteral(resourceName: "TickMark"),#imageLiteral(resourceName: "TickMark"),#imageLiteral(resourceName: "TickMark"),#imageLiteral(resourceName: "TickMark"),#imageLiteral(resourceName: "TickMark"),#imageLiteral(resourceName: "TickMark")]
        
        self.selectordertabelview.dataSource = self
        self.selectordertabelview.delegate = self
        
         self.cancelordermiddleview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        self.cancelordermiddleview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        

        
        self.lblOrderNowithDay.text = self.ordernumber_date
        
        let defautsfinalavalue = UserDefaults.standard

        
        if let ComboNSArrayl:NSArray = defautsfinalavalue.value(forKey:"orderdictfinalavlue") as?
        NSArray
        {
            
            self.orderDictfinalvalue = ComboNSArrayl
            
        }
        
        if let Myproductarayfinalvalue:NSArray = defautsfinalavalue.value(forKey:"Myproductdictfinalavlue") as?
            NSArray
        {
            
            self.Myproductsingelvalue = Myproductarayfinalvalue
            
        }
        
        if let Myproductaraysubalvalue:NSArray = defautsfinalavalue.value(forKey:"MyproductdictChargeValue") as?
            NSArray
        {
            
            self.MyproductChargevalue = Myproductaraysubalvalue
            
        }
        
        if  self.orderDictfinalvalue.count > 0
        {
            if let addressfinal:String = (self.orderDictfinalvalue[oredersselectedIndex!] as AnyObject).value(forKey: "address") as? String
            {
                self.address = addressfinal
            }
            if let addressfinal:String = (self.orderDictfinalvalue[oredersselectedIndex!] as AnyObject).value(forKey: "sold_by") as? String
            {
                
                self.sold_by = addressfinal
            }
            if let order_idfinal:String = (self.orderDictfinalvalue[oredersselectedIndex!] as AnyObject).value(forKey: "order_id") as? String
            {
                
                self.order_id = order_idfinal
            }
            if let order_datefinal:String = (self.orderDictfinalvalue[oredersselectedIndex!] as AnyObject).value(forKey: "order_date") as? String
            {
                
                self.order_date = order_datefinal
            }
            if let deliveredOnDatefinal:String = (self.orderDictfinalvalue[oredersselectedIndex!] as AnyObject).value(forKey: "deliveredOnDate") as? String
            {
                
                self.deliveredOnDate = deliveredOnDatefinal
            }
            
            if let deliveredOnTimefinal:String = (self.orderDictfinalvalue[oredersselectedIndex!] as AnyObject).value(forKey: "deliveredOnTime") as? String
            {
                
                self.deliveredOnTime = deliveredOnTimefinal
            }
            
            if let del_boyfinal:String = (self.orderDictfinalvalue[oredersselectedIndex!] as AnyObject).value(forKey: "del_boy") as? String
            {
                
                self.del_boy = del_boyfinal
            }
            
            if let delivery_detailsfinal:String = (self.orderDictfinalvalue[oredersselectedIndex!] as AnyObject).value(forKey: "delivery_details") as? String
            {
                
                self.delivery_details = delivery_detailsfinal
            }
            
            if let tot_qtyfinal:String = (self.orderDictfinalvalue[oredersselectedIndex!] as AnyObject).value(forKey: "tot_qty") as? String
            {
                
                self.tot_qty = tot_qtyfinal
            }
            
            
            if let imagePathfinal:String = (self.orderDictfinalvalue[oredersselectedIndex!] as AnyObject).value(forKey: "imagePath") as? String
            {
                self.imagePath = imagePathfinal
            }
            if let trader_namefinal:String = (self.orderDictfinalvalue[oredersselectedIndex!] as AnyObject).value(forKey: "trader_name") as? String
            {
                self.trader_name = trader_namefinal
            }
            if let trader_captionfinal:String = (self.orderDictfinalvalue[oredersselectedIndex!] as AnyObject).value(forKey: "trader_caption") as? String
            {
                self.trader_caption = trader_captionfinal
            }
            if let ordernumber_datefinal:String = (self.orderDictfinalvalue[oredersselectedIndex!] as AnyObject).value(forKey: "ordernumber_date") as? String
            {
                self.ordernumber_date = ordernumber_datefinal
            }
            if let tot_itemsfinal:String = (self.orderDictfinalvalue[oredersselectedIndex!] as AnyObject).value(forKey: "tot_items") as? String
            {
                self.tot_items = tot_itemsfinal
            }
            if let tot_amountfinal:String = (self.orderDictfinalvalue[oredersselectedIndex!] as AnyObject).value(forKey: "tot_amount") as? String
            {
                self.tot_amount = tot_amountfinal
            }
            
            if let order_summaryfinal:String = (self.orderDictfinalvalue[oredersselectedIndex!] as AnyObject).value(forKey: "order_summary") as? String
            {
                self.order_summary = order_summaryfinal
            }
            
            if let orderSelectNM:NSArray = (self.orderDictfinalvalue[oredersselectedIndex!] as AnyObject).value(forKey: "charges") as? NSArray
            {
                self.chargesRelated = orderSelectNM
            }
            print(self.chargesRelated)
        }
        
        if  self.Myproductsingelvalue.count > 0
        {
            if let arraySelected: [Any] = self.Myproductsingelvalue[oredersselectedIndex!] as? [Any] {
                self.arrayOrder = arraySelected
            }
           
            
            if let detailsproductNamefinal:[String] = (self.Myproductsingelvalue[oredersselectedIndex!] as AnyObject).value(forKey: "name") as? [String]
            {
                self.detailsproductName = detailsproductNamefinal
            }
            if let detailsproductImagesfinal:[String] = ( self.Myproductsingelvalue[oredersselectedIndex!] as AnyObject).value(forKey: "Images") as? [String]
            {
                
                self.detailsproductImages = detailsproductImagesfinal
            }
            if let detailsproductpricefinal:[String] = ( self.Myproductsingelvalue[oredersselectedIndex!] as AnyObject).value(forKey: "price") as? [String]
            {
                self.detailsproductprice = detailsproductpricefinal
            }
            if let detailsproductqtyfinal:[String] = (self.Myproductsingelvalue[oredersselectedIndex!] as AnyObject).value(forKey: "qty") as? [String]
            {
                
                self.detailsproductqty = detailsproductqtyfinal
            }
            if let detailsproductsold_byfinal:[String] = (self.Myproductsingelvalue[oredersselectedIndex!] as AnyObject).value(forKey: "sold_by") as? [String]
            {
                
                self.detailsproductsold_by = detailsproductsold_byfinal
            }
            //Hamali_breakup
            
            if let hamdleFinal:[Any] = (self.Myproductsingelvalue[oredersselectedIndex!] as AnyObject).value(forKey: "Hamali_breakup") as? [Any]
            {
                
                self.hamaliCharge = hamdleFinal
            }
        }
        
       
        if let chargefinalvalue:NSArray =    defautsfinalavalue.value(forKey:"MyproductdictChargeValue") as? NSArray
        {
            self.MyproductChargevalue = chargefinalvalue
        }
        
        if let arrayLet:NSArray = self.orderSelectPriceList[oredersselectedIndex!] as? NSArray {
            self.valedoFFArr = arrayLet
        }
        
        
            for j in 0 ..< self.valedoFFArr.count {
            
                if let dictOFFARR:[String: Any] = self.valedoFFArr[j] as? [String: Any]{
                self.cashBackDictVal = dictOFFARR
                }
                if let strVal: String = self.cashBackDictVal["key"] as? String {
                    self.validateStrin = strVal
                    
                }
                if self.validateStrin == "Sub total" {
                    if let soldValue : String = self.cashBackDictVal["value"] as? String{
                        self.valOFSubTOTAL = soldValue
                    }
                }
                
                if self.validateStrin == "Handling charges" {
                    if let soldValue : String = self.cashBackDictVal["value"] as? String{
                        self.valOFHandle = soldValue
                    }
                    if let soldview_item : String = self.cashBackDictVal["view_item"] as? String{
                        self.handleBtntitle = soldview_item
                    }
                }
                if self.validateStrin == "GST charges" {
                    if let soldValue : String = self.cashBackDictVal["value"] as? String{
                        self.valOFGST = soldValue
                    }
                }
                
                if self.validateStrin == "Cashback" {
                    if let soldValue : String = self.cashBackDictVal["value"] as? String{
                        self.valOFCCb = soldValue
                    }
                    if let soldview_item : String = self.cashBackDictVal["view_item"] as? String{
                        self.cashBtntitle = soldview_item
                    }
                    
                }
                
                if self.validateStrin == "Promotional offer" {
                    if let soldValue : String = self.cashBackDictVal["value"] as? String{
                        self.valOFPromoOffer = soldValue
                    }
                }
                if self.validateStrin == "Total" {
                    if let soldValue : String = self.cashBackDictVal["value"] as? String{
                        self.valOFTotalAMount = soldValue
                    }
                }
                lblSubTotalAmount.text = self.valOFSubTOTAL
                lblHandlingAmount.text = self.valOFHandle
                lblGSTAmount.text = self.valOFGST
                lblCBamount.text = self.valOFCCb
                lblDueAmount.text = self.valOFTotalAMount
                lblTAmount.text = self.valOFTotalAMount
                
                if self.handleBtntitle.count > 0 {
                 btnHandle.setTitle(self.handleBtntitle, for: .normal)
                 lblHandleTview.text = "Handling Charges"
                }
                if self.handleBtntitle.count < 0 {
                    lblHandleTview.isHidden = true
                }
                
                if self.cashBtntitle.count > 0 {
                    lblCBTView.isHidden = false
                    lblCBTView.text = "Cashback"

                  btnCBView.setTitle(self.cashBtntitle, for: .normal)
                    
                }
                
                if self.cashBtntitle.count < 0 {
                    lblCBTView.isHidden = true
                }
                
            }
       // }
        singlorderidvalue.text = orderidsingel
        lblsubTitletrader.text =  self.trader_caption
        lblTraderName.text =  self.trader_name
        lblAddressDestination.text = self.address
        lblStoreName.text = self.delivery_details
        lblFullfilledbyTrader.text = self.sold_by
        lblDeliveryBoyandDate.text =  self.deliveredOnDate
        lblOrderNowithDay.text = self.ordernumber_date
        lblAmount.text = self.order_summary
        
    }

    @IBAction func btnBackPopAction(_ sender:UIButton)
    {
  
        self.dismiss(animated: true, completion: nil)
    
    }
    
    @IBAction func btnSelectedItrms(_ sender: UIButton)
    {
   
    
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == tableList
        {
            return self.detailsproductName.count
          
        }
        else
        {
            return self.Langagefinalstring.count

        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if tableView == tableList
        {
            let cell: selectedOrderCell = tableList.dequeueReusableCell(withIdentifier: "selectedOrderCell") as! selectedOrderCell
            cell.lblProductName.text = self.detailsproductName[indexPath.row] as? String
            cell.lblPrice.text = self.detailsproductprice[indexPath.row] as? String
            cell.lblQnty.text = self.detailsproductqty[indexPath.row] as? String
             cell.imgFreebie.isHidden = true
            cell.selectionStyle = .none
            cell.btnSelectionOrder.addTarget(self, action: #selector(actionBtnSelector), for: .touchUpInside)
//
//            var detailsproductName = [String]()
//            var detailsproductImages = [String]()
//            var detailsproductprice = [String]()
//            var detailsproductqty = [String]()
//            var detailsproductsold_by = [String]()

            return cell
        }
        else
        {

            let cell  = selectordertabelview.dequeueReusableCell(withIdentifier: "LanguageTableViewCell", for: indexPath) as! LanguageTableViewCell
            cell.Langagelabael.text = self.Langagefinalstring[indexPath.row]
            cell.LAngageviewone.layer.cornerRadius = cell.LAngageviewone.layer.frame.size.width/2
            
            if self.Langagefinalstring.count-1 == indexPath.row
            {
                cell.langaeviewtwo.isHidden = true
            }
            else{
                cell.langaeviewtwo.isHidden = false
            }
            
            if selectedIndex == nil
            {
                if indexPath.row == 0
                {
                    cell.imagefinal.isHidden = false
                    
                    cell.LAngageviewone.backgroundColor = UIColor.color2()
                    cell.langaeviewtwo.backgroundColor = UIColor.color2()
                    cell.Langagelabael.textColor = UIColor.black
                    cell.LAngageviewone.layer.cornerRadius = cell.LAngageviewone.layer.frame.size.width/2
                    cell.imagefinal.image = #imageLiteral(resourceName: "TickMark")
                    cell.LAngageviewone.isHidden = true
                    
                }
            }
                
            else
            {
                if indexPath.row == selectedIndex
                {
                    cell.imagefinal.isHidden = false
                    
                    cell.LAngageviewone.backgroundColor = UIColor.color2()
                    cell.langaeviewtwo.backgroundColor = UIColor.color2()
                    cell.Langagelabael.textColor = UIColor.black
                    cell.LAngageviewone.layer.cornerRadius = cell.LAngageviewone.layer.frame.size.width/2
                    cell.imagefinal.image = #imageLiteral(resourceName: "TickMark")
                    cell.LAngageviewone.isHidden = true
                    
                }
                else{
                    
                    cell.LAngageviewone.backgroundColor = UIColor.color2()
                    cell.langaeviewtwo.backgroundColor = UIColor.color2()
                    cell.Langagelabael.textColor = UIColor.black
                    cell.LAngageviewone.layer.cornerRadius = cell.LAngageviewone.layer.frame.size.width/2
                    cell.imagefinal.isHidden = true
                    cell.LAngageviewone.isHidden = false
                    
                    
                    
                }
            }
            return cell

        }
    }
    
    @objc func actionBtnSelector(sender: UIButton)
    {
        let btn = sender
        
        if btn.isSelected {
            btn.setImage(#imageLiteral(resourceName: "Multiselectionsquare"), for: .normal)
            self.selectitemtocancel.setTitle("Cancel this item", for:.normal)
            
            
            
            btn.isSelected = false
        }else{
            btn.setImage(#imageLiteral(resourceName: "verification-square-button"), for: .normal)
            btn.isSelected = true
            self.selectitemtocancel.setTitle("Select items to cancel", for:.normal)
        }
    }
    @IBAction func btnHandlingChargeAction(_ sender: UIButton)
    {
        
    let handlingCharge = self.storyboard?.instantiateViewController(withIdentifier: "HandlingChargeVC") as! HandlingChargeVC
        handlingCharge.Cashbackarayfinalvalue = self.arrayOrder as NSArray
        handlingCharge.strValed = self.valOFHandle
        self.present(handlingCharge, animated: true, completion: nil)
    }
    
    @IBAction func btnTaxBreakAction(_ sender: UIButton)
    {
        let taxBreak: taxBreakupVC = self.storyboard?.instantiateViewController(withIdentifier: "taxBreakupVC") as! taxBreakupVC
        taxBreak.Cashbackarayfinalvalue = self.arrayOrder as NSArray
        taxBreak.taxValeee = self.valOFGST
        self.present(taxBreak, animated: true, completion: nil)
    }
    
    @IBAction func btnCBAction(_ sender: UIButton)
    {
        let cashBack = self.storyboard?.instantiateViewController(withIdentifier: "cashBackItemVC") as! cashBackItemVC
        cashBack.Cashbackarayfinalvalue = self.arrayOrder as NSArray
        cashBack.strVlad = self.valOFCCb
        
        self.present(cashBack, animated: true, completion: nil)
  }
    
    @IBAction func btnDeliveryAddressAction(_ sender: Any)
    {
    
    
    }
    @IBAction func Nobutton(_ sender: UIButton)
    {
        self.Deliveryscrollview.isHidden = true
        let bottomSheet = JXBottomSheetView(contentView:Deliveryscrollview as! UIScrollView)
        bottomSheet.defaultMininumDisplayHeight = 0
        bottomSheet.defaultMaxinumDisplayHeight = 676
        bottomSheet.displayState = .minDisplay
        bottomSheet.frame = self.view.bounds
        self.view.addSubview(bottomSheet)
    }
    
    @IBAction func yesbutton(_ sender: UIButton)
    {
        self.Deliveryscrollview.isHidden = true
        let bottomSheet = JXBottomSheetView(contentView:Deliveryscrollview as! UIScrollView)
        bottomSheet.defaultMininumDisplayHeight = 0
        bottomSheet.defaultMaxinumDisplayHeight = 676
        bottomSheet.displayState = .minDisplay
        bottomSheet.frame = self.view.bounds
        self.view.addSubview(bottomSheet)
        self.singelorderview.isHidden = false
        self.secondview.isHidden = false

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == selectordertabelview
        {
            return 52
        }
        else
        {
            return 60
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if tableView == selectordertabelview
        {
            selectedIndex = indexPath.item
            
            selectordertabelview.reloadData()
        }
    }
 
    @IBAction func Mynobutton(_ sender: UIButton)
    {
        self.secondview.isHidden = true
        self.singelorderview.isHidden = true
    }
    
    @IBAction func Myyesbutton(_ sender: UIButton)
    {
        self.secondview.isHidden = true
        self.singelorderview.isHidden = true
        self.Deliveryscrollview.isHidden = true

    }
    @IBAction func Canclebuttonvalue(_ sender: UIButton)
    {
        self.secondview.isHidden = true
        self.singelorderview.isHidden = true
    }

    @IBAction func btnReturnItemsAction(_ sender: Any)
    {
                self.Deliveryscrollview.isHidden = false
                let bottomSheet = JXBottomSheetView(contentView:Deliveryscrollview as! UIScrollView)
                bottomSheet.defaultMininumDisplayHeight = 0
                bottomSheet.defaultMaxinumDisplayHeight = 676
                bottomSheet.displayState = .maxDisplay
                bottomSheet.frame = self.view.bounds
                self.view.addSubview(bottomSheet)
    }
    
}
