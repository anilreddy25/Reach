//
//  ConfirmthisorderViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 28/11/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import FullMaterialLoader
import Alamofire
import AlamofireImage


class ConfirmthisorderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,YSSegmentedControlDelegate,UITextFieldDelegate
{
    @IBOutlet weak var sellerName: UILabel!
    @IBOutlet weak var sellertype: UILabel!
    @IBOutlet weak var tradersname: UILabel!
    var ProductName = [String]()
    var productQuantity = [String]()
    var productRupees = [String]()
    @IBOutlet weak var confirmtabelview: UITableView!
    @IBOutlet weak var Itemslabel: UILabel!
    @IBOutlet weak var Qtylabel: UILabel!
    @IBOutlet weak var Cashondelivery: UILabel!
    @IBOutlet weak var viewtopview: UIView!
    @IBOutlet weak var verifyscrollview: UIScrollView!
    
    @IBOutlet weak var numbermallfsegmentview: UIView!
    
    @IBOutlet weak var creditviewfinal: UIView!
    
    @IBOutlet weak var upiview: UIView!
    @IBOutlet weak var creditview: UIView!
    
    
    
    @IBOutlet weak var credittabelview: UITableView!
    
    
    var Numbermallcreditname = [String]()
    
    var AvailableCreditLimit = [String]()

    var rupoesscredit = [String]()
    
    @IBOutlet weak var confirmthisorder: UIButton!
    
    @IBOutlet weak var lblSubTotalAmount: UILabel!
    
    
    @IBOutlet weak var viewthreeitemslabel: UIButton!
    
    @IBOutlet weak var handlingchargelabel: UILabel!
    

    @IBOutlet weak var taxbreakup: UIButton!
    
    
    @IBOutlet weak var taxbreaklabel: UILabel!
    
    @IBOutlet weak var cashbacklabel: UILabel!
    
    @IBOutlet weak var cashback: UIButton!
    
    
    @IBOutlet weak var Heroview: UIView!
    
    @IBOutlet weak var addbaankaccount: UIButton!
    
    @IBOutlet weak var bankaccountview: UIView!
    
    
    @IBOutlet weak var Banktabelview: UITableView!
    
    
    var images = [UIImage]()
    
  //  var logoImages = [UIImage]()
//    var logoImages = Array<UIImage>()

    var logoImages = Array<UIImage>()

    
    var BankName = [String]()
    
    var cashBackAArrayCheck = NSArray()
    
    

    
    @IBOutlet weak var TOPVIEW: UIView!
    
    @IBOutlet weak var CLOSEBUTTON: UIButton!
    
    @IBOutlet weak var promocodetextfiled: UITextField!
    
    @IBOutlet weak var closebuttontwo: UIButton!

    @IBOutlet weak var promocodeview: UIView!
    
    @IBOutlet weak var applaypromcode: UIButton!
    
    var indicator: MaterialLoadingIndicator!

    var SELECTBANKtimertwo = Timer()
    
    
    
    @IBOutlet weak var promocodeLoadingview: UIView!
    var ConfirmthisorderView = Timer()

    @IBOutlet weak var invalidpromocodeview: UIView!
    
    
    @IBOutlet weak var removepromocode: UIButton!
    
    
    @IBOutlet weak var freslabel: UILabel!
    
    @IBOutlet weak var promocodenotapplicabel: UILabel!
    
    @IBOutlet weak var invalidcodelabel: UILabel!
    var ConfirmLogoimagevalue = [UIImage]()
    
    
    @IBOutlet weak var changedeliverytimings: UIButton!
    
    
    @IBOutlet weak var bottomboarderview: UIView!
    
    @IBOutlet weak var Topview: UIView!
    
    @IBOutlet weak var bottomviewfinal: UIView!
    
    @IBOutlet weak var myscrolview: UIScrollView!
    
    @IBOutlet weak var Timingsview: UIView!
    
    
    @IBOutlet weak var shopviewfinal: UIView!
    
    
    
    @IBOutlet weak var deliveryadressview: UIView!
    
    @IBOutlet weak var crossxbutton: UIButton!
    
    @IBOutlet weak var adreesviewone: UIView!
    
    @IBOutlet weak var adressviewtwo: UIView!
    
    @IBOutlet weak var adressonename: UILabel!
    
    @IBOutlet weak var adresslocationone: UILabel!
    
    @IBOutlet weak var radiobuttonadressone: UIButton!
    @IBOutlet weak var editadressradiobutton: UIButton!
    
    
    @IBOutlet weak var adressshopnametwo: UILabel!
    
    
    @IBOutlet weak var adressLocationnametwo: UILabel!
    
    @IBOutlet weak var editadresstwo: UIButton!
   
    @IBOutlet weak var delivertopview: UIView!
    
    @IBOutlet weak var deliverybottomview: UIView!
    
    
    
    @IBOutlet weak var bankac: UIView!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var deliveryadressfinalvalue: UIView!
    
    
    @IBOutlet weak var singelviewonly: UIView!
    
   
    @IBOutlet weak var myradiobuttonadresstwo: UIButton!
    
    
    @IBOutlet weak var singlesupersocket: UIView!
    
    @IBOutlet weak var TimingTopview: UIView!
    
    @IBOutlet weak var singellineTopview: UIView!
    
    
    @IBOutlet weak var confirmthisorderfinalvalue: UIButton!
    
    @IBOutlet weak var confirmfirstordervalue: UIButton!
    
    @IBOutlet weak var totalconfirmscreenvalue: UIView!
    
    @IBOutlet weak var lblHandleSave: UILabel!
    
    
    var sellernamesingelvalue = String()
    var superstockoutlabelvalue = String()
    var shopNamelabellabelvalue = String()
    var Deliverysinglvalue = String()
    
    var billingadressstring = String()
    var rajadhanilabelstring = String()

    var Quantitylabelsstring = String()
    var amountlabelstring = String()
    
    

    @IBOutlet weak var sellernamesingel: UILabel!
    @IBOutlet weak var superstockoutlabel: UILabel!
    @IBOutlet weak var shopNamelabel: UILabel!
   
    
    
    @IBOutlet weak var billingadresslabel: UILabel!
    @IBOutlet weak var rajadhanilabel: UILabel!
     ///// popcorn Details screen
    
    var Popcornname = [String]()
    
    var PopcornQunatitylabel = [String]()

    var PopcornTotalRupess = [String]()

    
    
    /// Delivery adress Confirmation
    
    var Deliveryadresssname = String()
    
    var Deliveryadresssaveas = String()
    
    var DeliveryadressDictconfirm = NSDictionary()
    
    var DeliveryadressLandmark = String()

    

    /// Billing adress Confirmation

    var Billingadresssname = String()
    
    var Billingadresssaveas = String()
    
    var BillingadressDictform = NSDictionary()
    
    var BillingadressLAndmark = String()

    
    
    //// Dleivry adresstwo
    
    
    
    var Deliveryadressnametwo = String()
    var Deliveryadresslocationtwo = String()
    var DeliverySaveastwo = String()
    
    
    var SellerDueamount = [String]()

    var SellerCreditamount = [String]()

    

    
    
    @IBOutlet weak var Totalamountlabel: UILabel!
    
    @IBOutlet weak var dueamountlabel: UILabel!
    
    var Cashbackarayfinalvalue = NSArray()
    var cashBackPriceList = NSArray()
    
    var ProductDetailsarrayone = NSArray()
    var productdetailname = NSArray()
    var cashBackDictVal = [String: Any]()
    
    var Radiobutton = String()
    var varyKeyValue = String()
    var soldPriceTotal = String()
    var handlePriceTotal = String()
    var handleSave = String()
    var handleDisplay = String()
    var gstPriceTotal = String()
    var cbPriceTotal = String()
    var btnCBTitle = String()
    var totalAmontVal = String()
    
    
    @IBOutlet weak var Totaldemoview: UIView!
    
    var User_name1 = String()
    
    var selleritemTotalvalue = String()
    
    
    @IBOutlet weak var eroorviewtotal: UIView!
    @IBOutlet weak var myapplaybutton: UIButton!
    
    @IBOutlet weak var crossbutton: UIButton!
    
    var coverView = UIView()
    var imageView = UIImageView()

    
    var timersingel = Timer()
    
    var CheckoutViewControllerstringfinal = String()
    
    var  sellers_header = String ()
    
    var  amountsellers_header = String ()
    
    var itemssellers_header = String ()
    
    var itemssellersquantity_header = String ()
    
    var itemssellersquantity_message = String ()
    var itemssellersquantity_Status = String ()
    var itemssellersquantity_StatusMsg = String ()
    var types = NSArray()
    var typesDict = NSDictionary()
    var sellersList = NSArray()
    var sellersid = NSArray()
    var sellerschecked = NSArray()
    var sellerscheckbox_text = NSArray()
    var sellerscheckbox_items = NSArray()
    var sellerscheckbox_quantity = NSArray()
    var sellerscheckbox_amount = NSArray()
    var sellersidtwo = NSArray()
    var sellerscheckedtwo = NSArray()
    var sellerscheckbox_texttwo = NSArray()
    var sellerscheckbox_itemstwo = NSArray()
    var sellerscheckbox_quantitytwo = NSArray()
    var sellerscheckbox_amounttwo = NSArray()
    var sellerscheckbox_optiuon = String()
    var sellerscheckbox_text1 = [String]()
    var sellerscheckbox_text2 = [String]()
    var sellerscheckbox_text3 = [String]()
    var sellerscheckbox_text3_color1 = [String]()
    var sellerscheckbox_text3_color2 = [String]()
    var typesNsarryay = NSArray()
    var optionsTypesarrayfinal = NSArray()
    var sellerListTypesarrayfinal = NSArray()
    var selleropinion = NSArray()
    var textone = NSArray()
    var texttwo = NSArray()
    var textthree = NSArray()
    
    var fristtwo = String()
    
    var orginalpinvalue = String()
    
    var checkoputselectedint = Int()
    
    var viewfinalvalue = UIView()
    
    
    
    @IBOutlet weak var totalconfirmscrennvaluetwo: UIView!
    
    var MycelleridTotalvalue = String()
    var Chekoutadressid = String()
    
    
    var MypinvaluTotalTotalvalue = String()
    
    var Username1 = String()
    
    var Reviewfinaluseroid = String()
    
    
    var StatusCodestring  = String()
    
    var amountstring  = String()

    var Msgstring  = String()

    var int_count = NSInteger()

    var AcessTokenfinalstring = String()
    
    var myagentTotalvalue  = String()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        Topview.layer.shadowOffset = CGSize(width: 0, height: 2)
        Topview.layer.shadowOpacity = 0.3
        Topview.layer.shadowRadius = 1.0
        Topview.layer.borderColor = UIColor.color2().cgColor
        Topview.layer.shadowColor = UIColor.color2().cgColor
//        confirmthisorder.layer.cornerRadius = 6
//        confirmthisorder.clipsToBounds = true
        ProductName = ["Popicorn piri piri masala","Popicorn piri piri masala","Popicorn piri piri masala"]
        productQuantity = ["4 Qty","4 Qty","4 Qty"]
        productRupees = ["₹900.00","₹1200.00","₹1200.00"]
        
        
        self.viewtopview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        
        if self.view.frame.size.height < 800
        {
            verifyscrollview.contentInset = UIEdgeInsetsMake(0,0,2300,0)
            verifyscrollview.isScrollEnabled = true
            verifyscrollview.showsVerticalScrollIndicator = false
            
            myscrolview.contentInset = UIEdgeInsetsMake(0,0,180,0)
            myscrolview.isScrollEnabled = true
            myscrolview.showsVerticalScrollIndicator = false
        }
        
        
        
        let segmented = YSSegmentedControl(
            frame: CGRect(
                x: 0,
                y:10,
                width: self.creditviewfinal.frame.size.width,
                height: 40),
            titles: [
                "Credit",
                "UPI"
            ],
            
            action: {
                control, index in
                
        })
        segmented.delegate = self
        self.creditviewfinal.addSubview(segmented)
        
        Numbermallcreditname = ["NumberMall Credit"]
        AvailableCreditLimit = ["Available Credit Limit: "]
        rupoesscredit = ["₹0.00 "]
        self.Banktabelview.dataSource = self
        self.Banktabelview.delegate = self
        BankName = ["State bank of india","Axis bank","HDFC bank"]
//        logoImages = [UIImage(named:"SBI.png"),UIImage(named:"Axis.png"),UIImage(named:"HDFC.png")] as! [UIImage]
        
        self.TOPVIEW.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        
        promocodetextfiled.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        promocodetextfiled.keyboardType = .numberPad
        
        removepromocode.layer.cornerRadius = 5
        removepromocode.clipsToBounds = true
        removepromocode.layer.borderColor = UIColor.red.cgColor
        removepromocode.layer.borderWidth = 1.0
        
        
        let SBI = UIImage(named: "SBI.png")
        let Axis = UIImage(named: "Axis.png")
        let HDFC = UIImage(named: "SBI.png")
        
         ConfirmLogoimagevalue = [UIImage(named:"SBI.png"),UIImage(named:"axis-bank.png"),UIImage(named:"HDFC.png"),] as! [UIImage]
        
        //// bottom boarder
        self.bottomboarderview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        
        
        self.bottomviewfinal.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
    
        let tapTwo = UITapGestureRecognizer(target: self, action: #selector(self.handleTapselectLocation(_:)))
        shopviewfinal.addGestureRecognizer(tapTwo)
        shopviewfinal.isUserInteractionEnabled = true
        
        self.delivertopview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        self.deliverybottomview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        bankac.roundedButton()
        singelviewonly.layer.cornerRadius = 5.0
        singelviewonly.layer.masksToBounds = true
      
        deliveryadressfinalvalue.roundedButton()
    
        self.viewtopview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        self.viewtopview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        
        promocodeview.roundedButton()
        promocodeLoadingview.roundedButton()
        TimingTopview.roundedButton()
        
        singellineTopview.layer.cornerRadius = 4.0
        singellineTopview.layer.masksToBounds = true
        
        confirmthisorderfinalvalue.layer.cornerRadius = 4.0
        confirmthisorderfinalvalue.clipsToBounds = true
        
        confirmfirstordervalue.layer.cornerRadius = 4.0
        confirmfirstordervalue.clipsToBounds = true
   
        self.sellernamesingel.text = self.sellernamesingelvalue
        self.superstockoutlabel.text = self.superstockoutlabelvalue
        self.shopNamelabel.text = self.shopNamelabellabelvalue

        self.billingadresslabel.text = self.Deliverysinglvalue
        self.rajadhanilabel.text = self.sellernamesingelvalue
        
//        "quantity": "21 Qty",
//        "amount": "₹4,665.77",
//        "items": "2 items",
//        "quantity": "11 Qty",
        
        
       
        self.Cashondelivery.text = self.Quantitylabelsstring
        let defaultsfinalvalue = UserDefaults.standard
        
        if let BillingadressLAndmarkfinalvalue: String =  defaultsfinalvalue.value(forKey: "biland") as? String
        {
            self.BillingadressLAndmark = BillingadressLAndmarkfinalvalue
            
        }
        if let Billingadresssnamefinalvalue: String  =  defaultsfinalvalue.value(forKey: "bilocation") as? String
        {
            self.Billingadresssname = Billingadresssnamefinalvalue
    
            self.billingadresslabel.text = self.Billingadresssname
        }
        if let Billingadresssaveasfinalvalue: String  =  defaultsfinalvalue.value(forKey: "bilsave") as? String
        {
      
            self.Billingadresssaveas = Billingadresssaveasfinalvalue
        }
            if let Deliveryadresssnamearrayfinalvalue: String  =  defaultsfinalvalue.value(forKey: "Dlocation") as? String
            {
      
            self.Deliveryadresssname = Deliveryadresssnamearrayfinalvalue
                self.adresslocationone.text =  self.Deliveryadresssname
          }
    
    if let Deliveryadresssaveasarrayfinalvalue: String  =  defaultsfinalvalue.value(forKey: "Dlocationsave") as? String
                {
   
            self.Deliveryadresssaveas = Deliveryadresssaveasarrayfinalvalue
        }
    if let DeliveryadressLandmarkarrayfinalvalue: String  =  defaultsfinalvalue.value(forKey: "dland") as? String
        {
            self.DeliveryadressLandmark = DeliveryadressLandmarkarrayfinalvalue
                        self.adressonename.text =  self.DeliveryadressLandmark
        }
        
        if let DeliveryadressLandmarkarrayfinalvalue: String  =  defaultsfinalvalue.value(forKey: "Deliverysavetwo") as? String
        {
            self.DeliverySaveastwo = DeliveryadressLandmarkarrayfinalvalue
        }
        if let DeliveryadressLandmarkarrayfinalvalue: String  =  defaultsfinalvalue.value(forKey: "Dlocationtwo") as? String
        {
            
            self.Deliveryadressnametwo = DeliveryadressLandmarkarrayfinalvalue
            self.adressLocationnametwo.text =  self.Deliveryadressnametwo

        }
        if let DeliveryadressLandmarkarrayfinalvalue: String  =  defaultsfinalvalue.value(forKey: "Dlandmarktwo") as? String
        {
            
            self.Deliveryadresslocationtwo = DeliveryadressLandmarkarrayfinalvalue
            self.adressshopnametwo.text =  self.Deliveryadresslocationtwo
        }
        
        if let SellerDueamountfinalvalue: [String]  =  defaultsfinalvalue.value(forKey: "sellerDueamount") as? [String]
        {
            self.SellerDueamount = SellerDueamountfinalvalue
            if  self.SellerDueamount.count > 0
            {
                self.dueamountlabel.text = self.SellerDueamount[int_count]

            }
        }
        
        if let SellerCreditamountfinalvalue: [String]  =  defaultsfinalvalue.value(forKey: "sellerCreditamount") as? [String]
        {
            
            self.SellerCreditamount = SellerCreditamountfinalvalue
            if  self.SellerCreditamount.count > 0
            {
                self.Totalamountlabel.text =  self.SellerCreditamount[int_count ]
            }
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
        
         self.Qtylabel.text = "\(String(self.ProductDetailsarrayone.count)) Items"
        
        if let ProductDetailsnamevalue: NSArray =  self.Cashbackarayfinalvalue.value(forKey:"cashback_breakup") as? NSArray
        {
            self.productdetailname = ProductDetailsnamevalue
        }
       let str = self.productdetailname.count
        let myString = String(str)
        let aStr = String(format: "%@%@%@", "View",myString,"item(s)")
        self.viewthreeitemslabel.setTitle(aStr, for:.normal)
        
        
        
        if let chargefinalvalue:NSArray =    defaultsvaluesingel.value(forKey:"MyChargesdetailsary") as? NSArray
        {
            self.cashBackPriceList = chargefinalvalue
        }
        
        for i in 0 ..< self.cashBackPriceList.count {
            
            if let dictVal:[String: Any] = self.cashBackPriceList[i] as? [String: Any]{
                self.cashBackDictVal = dictVal
            }
            
            if let strVal: String = self.cashBackDictVal["key"] as? String {
                
               self.varyKeyValue = strVal
                
            }
            
            if self.varyKeyValue == "Sub total" {
                if let soldValue : String = self.cashBackDictVal["value"] as? String{
                    self.soldPriceTotal = soldValue
                }
                
            }
            
            if self.varyKeyValue == "Handling charges" {
                if let soldValue : String = self.cashBackDictVal["value"] as? String{
                    self.handlePriceTotal = soldValue
                }
            
                if let handlingSave: String = self.cashBackDictVal["hero_display"] as? String{
                    self.handleDisplay = handlingSave
                }
                if let handlingSave: String = self.cashBackDictVal["hero_text"] as? String{
                    self.handleSave = handlingSave
                }
                
            }
            
            
            if self.varyKeyValue == "GST charges" {
                if let soldValue : String = self.cashBackDictVal["value"] as? String{
                    self.gstPriceTotal = soldValue
                }
            }
            
            if self.varyKeyValue == "Cashback" {
                if let soldValue : String = self.cashBackDictVal["value"] as? String{
                    self.cbPriceTotal = soldValue
                }
                if let  btnTitelCash : String = self.cashBackDictVal["view_item"] as? String{
                    self.btnCBTitle = btnTitelCash
                }
                
                
            }
        lblSubTotalAmount.text = self.soldPriceTotal
        handlingchargelabel.text = self.handlePriceTotal
        lblHandleSave.text = self.handleSave
            
            taxbreaklabel.text = self.gstPriceTotal
            cashbacklabel.text =  self.cbPriceTotal
            Totalamountlabel.text = self.totalAmontVal
            self.cashback.setTitle(self.btnCBTitle, for: .normal)
            
        }
        
        if self.Popcornname.count == 0
        {
            self.Totaldemoview.frame = CGRect(x:self.Totaldemoview.frame.origin.x, y:250, width:self.Totaldemoview.frame.size.width, height: self.Totaldemoview.frame.size.height)
            
        }
        if self.Popcornname.count == 1
        {
            self.Totaldemoview.frame = CGRect(x:self.Totaldemoview.frame.origin.x, y:290, width:self.Totaldemoview.frame.size.width, height: self.Totaldemoview.frame.size.height)
            
        }
        if self.Popcornname.count == 2
        {
            self.Totaldemoview.frame = CGRect(x:self.Totaldemoview.frame.origin.x, y:330, width:self.Totaldemoview.frame.size.width, height: self.Totaldemoview.frame.size.height)
            
        }
        if self.Popcornname.count == 3
        {
              self.Totaldemoview.frame = CGRect(x:self.Totaldemoview.frame.origin.x, y:370, width:self.Totaldemoview.frame.size.width, height: self.Totaldemoview.frame.size.height)
        }
        if self.Popcornname.count == 4
        {
              self.Totaldemoview.frame = CGRect(x:self.Totaldemoview.frame.origin.x, y:410, width:self.Totaldemoview.frame.size.width, height: self.Totaldemoview.frame.size.height)
        }
        if self.Popcornname.count  > 5
        {
             self.Totaldemoview.frame = CGRect(x:self.Totaldemoview.frame.origin.x, y:450, width:self.Totaldemoview.frame.size.width, height: self.Totaldemoview.frame.size.height)
        }
        let defaultsmenu = UserDefaults.standard
        
        if let User_name1finalvalue:String = defaultsmenu.value(forKey:"User_name") as? String
        {
            self.Username1 = User_name1finalvalue
            
            self.shopNamelabel.text =  self.User_name1
        }
        
        eroorviewtotal.clipsToBounds = true
        eroorviewtotal.layer.cornerRadius = 10

        crossbutton.layer.cornerRadius = 10
        crossbutton.clipsToBounds = true

    }
    
    @objc func handleTapselectLocation(_ sender: UITapGestureRecognizer)
    {
        
        self.deliveryadressview.isHidden = false
        
    }
    @objc func textFieldDidChange(_ textField: UITextField)
    {
        if promocodetextfiled.text?.count == 6
        {
            promocodetextfiled.resignFirstResponder()
            self.ConfirmconfigViews()
        }
    }
    @IBAction func Backbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    
    
    @IBAction func confirmthisorder(_ sender: Any)
    {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == confirmtabelview
        {
            return self.Popcornname.count
        }
        if tableView == Banktabelview
        {
            return self.BankName.count
        }
        else
        {
            return self.Numbermallcreditname.count

        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if tableView  == confirmtabelview
        {
            let cell  = confirmtabelview.dequeueReusableCell(withIdentifier:"ConfrimationTableViewCell", for: indexPath) as! ConfrimationTableViewCell
            cell.selectionStyle = .none
            cell.productName.text = self.Popcornname[indexPath.row]                                                                                                                                                                                                                                                                              
           cell.quantitylabel.text = self.PopcornQunatitylabel[indexPath.row] as? String
            cell.rupeeslabel.text = self.PopcornTotalRupess[indexPath.row] as? String
            return cell
        }
            else if tableView == Banktabelview
        {
            let cell  = Banktabelview.dequeueReusableCell(withIdentifier:"BankTableViewCell", for: indexPath) as! BankTableViewCell
            cell.selectionStyle = .none
            cell.BankName.text = self.BankName[indexPath.row] as? String
         cell.Bankimageview.image = self.ConfirmLogoimagevalue[indexPath.row] as? UIImage
            return cell
        }
        else
        {
            let cell  = credittabelview.dequeueReusableCell(withIdentifier:"creditTableViewCell", for: indexPath) as! creditTableViewCell
            cell.selectionStyle = .none
            cell.numbernallname.text = self.Numbermallcreditname[indexPath.row] as? String
            cell.availabelcreditlabel.text = self.AvailableCreditLimit[indexPath.row] as? String
            cell.rupesslabel.text = self.rupoesscredit[indexPath.row] as? String
            cell.mycheckmarkbutton.tag = indexPath.row
            cell.mycheckmarkbutton.addTarget(self, action: #selector(ConfirmaddFrequentUserQnty), for: .touchUpInside)
            return cell
        }
    }
    
    @objc func ConfirmaddFrequentUserQnty(sender: UIButton)
    {
        if sender.tag == 0
        {
            
//            sender.setBackgroundImage(ver, for:.normal)
            
            sender.tag = 1
        }
        else if sender.tag == 1
        {
//            sender.setBackgroundImage(<#T##image: UIImage?##UIImage?#>, for:.normal)

            sender.tag = 0

        }
        
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 65
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //        if tableView == viewBrandtabelview
        //        {
        //            DispatchQueue.main.async {
        //                let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"ProductDescriptionViewController")as!ProductDescriptionViewController
        //                viewfinal.productdemoidfinalvalue =  self.ProductidValue[indexPath.row]
        //                self.present(viewfinal, animated: true, completion:nil)
        //            }
        //        }
    }
    func segmentedControlWillPressItemAtIndex(_ segmentedControl: YSSegmentedControl, index: Int)
    {
        if index == 0
        {
            credittabelview.isHidden = false
            creditview.isHidden = false
            upiview.isHidden = true
        }
        if index == 1
        {
            credittabelview.isHidden = true
            creditview.isHidden = true
            upiview.isHidden = false
        }
    }
    
   
    @IBAction func addbankaccount(_ sender: UIButton)
    {
        self.bankaccountview.isHidden = false

    }
    @IBAction func CLOSEBUTTON(_ sender: UIButton)
    {
        self.bankaccountview.isHidden = true
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        if scrollView == verifyscrollview
        {
            if   verifyscrollview.contentOffset.y >= 600
            {
                self.verifyscrollview.contentOffset.y  = 600
            }
            else
            {
                self.verifyscrollview.isScrollEnabled = true
            }
        }
}
    @IBAction func Closebuttontwo(_ sender: UIButton)
    {
        self.promocodeview.isHidden = true
    }
    @IBAction func applaypromocode(_ sender: UIButton)
    {
        self.promocodeview.isHidden = false
        
//        self.PromoCodeTotalvalueis()
    }
    func ConfirmconfigViews()
    {
        
        DispatchQueue.main.async {
            self.PromoCodeTotalvalueis()

        }
        indicator = MaterialLoadingIndicator(frame: CGRect(x:290, y:100, width: 30, height: 30))
        indicator.indicatorColor = [UIColor.red.cgColor]
        //        indicator.center = self.view.center
        self.promocodeLoadingview.addSubview(indicator)
        indicator.startAnimating()
        ConfirmthisorderView = Timer.scheduledTimer(timeInterval:5.0, target: self, selector: #selector(ConfirmthisorderViewtimerAction), userInfo: nil, repeats: false)
        
        

        
    }
    @objc func ConfirmthisorderViewtimerAction()
    {
        indicator.stopAnimating()
        indicator.isHidden = true
        self.invalidpromocodeview.isHidden = false
    }
    
    
    @IBAction func Removepromocode(_ sender: UIButton)
    {
        self.invalidpromocodeview.isHidden = true
    }
    
    @IBAction func addanotherBankaccount(_ sender: UIButton)
    {
        DispatchQueue.main.async
            {
         let Bankvaluetwo = self.storyboard?.instantiateViewController(withIdentifier:"BankViewController")as!BankViewController
        self.present(Bankvaluetwo, animated: true, completion:nil)
        }
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.promocodeview.isHidden = true
        self.bankaccountview.isHidden = true

    }
    
    
    @IBAction func chnagedeliverytimings(_ sender: UIButton)
    {
        self.Timingsview.isHidden = false

    }
    
    @IBAction func Cancelbutton(_ sender: UIButton)
    {
        self.Timingsview.isHidden = true
        
    }
    @IBAction func okbutton(_ sender: UIButton)
    {
        self.Timingsview.isHidden = true

    }
    @IBAction func crossxbutton(_ sender: UIButton)
    {
        self.deliveryadressview.isHidden = true
    }

    @IBAction func EditadressRadiobuttonone(_ sender: UIButton)
    {
        DispatchQueue.main.async
        {
            let DeliveryAddressVCfinal = self.storyboard?.instantiateViewController(withIdentifier:"DeliveryAddressVC")as!DeliveryAddressVC
            DeliveryAddressVCfinal.demostringvalue = "ButtonBillingadressvalue"
            self.present(DeliveryAddressVCfinal, animated: true, completion:nil)
        }
    }
    @IBAction func Editadressradiobuttontwo(_ sender: UIButton)
    {
        DispatchQueue.main.async
            {
            let DeliveryAddressVCfinal = self.storyboard?.instantiateViewController(withIdentifier:"DeliveryAddressVC")as!DeliveryAddressVC
            DeliveryAddressVCfinal.demostringvalue = "ButtonDeliveradressvalue"
            self.present(DeliveryAddressVCfinal, animated: true, completion:nil)
        }
    }
    @IBAction func Canceladressbutton(_ sender: UIButton)
    {
        self.deliveryadressview.isHidden = true
    }
    
    @IBAction func Okadressbutton(_ sender: UIButton)
    {
        self.deliveryadressview.isHidden = true
        
        if self.Radiobutton == "1"
        {
            self.billingadresslabel.text =  self.Billingadresssname
        }
        else if self.Radiobutton == "2"
        {
            self.billingadresslabel.text =  self.Deliveryadresssname
        }
    }
    @IBAction func Radioadressbutton(_ sender: UIButton)
    {
        
        Radiobutton = "1"
        
        if radiobuttonadressone.tag == 0
        {
            radiobuttonadressone.setBackgroundImage(#imageLiteral(resourceName: "Radioon"), for:.normal)
            myradiobuttonadresstwo.setBackgroundImage(#imageLiteral(resourceName: "Radiooff"), for:.normal)
            
            radiobuttonadressone.tag = 0
        }
        else if radiobuttonadressone.tag == 1
        {
            myradiobuttonadresstwo.setBackgroundImage(#imageLiteral(resourceName: "Radioon"), for:.normal)
            radiobuttonadressone.setBackgroundImage(#imageLiteral(resourceName: "Radiooff"), for:.normal)
            radiobuttonadressone.tag = 1
        }
    }
    
    @IBAction func Radioadressbuttontwo(_ sender: UIButton)
    {
        
        Radiobutton = "2"
 
        if myradiobuttonadresstwo.tag == 0
        {
            myradiobuttonadresstwo.setBackgroundImage(#imageLiteral(resourceName: "Radioon"), for:.normal)
            radiobuttonadressone.setBackgroundImage(#imageLiteral(resourceName: "Radiooff"), for:.normal)
            myradiobuttonadresstwo.tag = 1
        }
        else if myradiobuttonadresstwo.tag == 1
        {
            radiobuttonadressone.setBackgroundImage(#imageLiteral(resourceName: "Radioon"), for:.normal)
            myradiobuttonadresstwo.setBackgroundImage(#imageLiteral(resourceName: "Radiooff"), for:.normal)
            myradiobuttonadresstwo.tag = 0
        }
    }
    
    @IBAction func Taxbreakup(_ sender: UIButton)
    {
        let taxBreak:checkTaxBreakVC = self.storyboard?.instantiateViewController(withIdentifier:"checkTaxBreakVC") as! checkTaxBreakVC
         taxBreak.Cashbackarayfinalvalue = self.Cashbackarayfinalvalue
         taxBreak.strValed = self.gstPriceTotal
        self.present(taxBreak, animated: true, completion: nil)
    }
    @IBAction func Handlingchargebutton(_ sender: UIButton)
    {
        let handlingCharge = self.storyboard?.instantiateViewController(withIdentifier:"HandlingChargeVC") as! HandlingChargeVC
         handlingCharge.Cashbackarayfinalvalue = self.Cashbackarayfinalvalue
         handlingCharge.strValed = self.handlePriceTotal
        self.present(handlingCharge, animated: true, completion: nil)
    }
    @IBAction func cashbackitems(_ sender: UIButton)
    {
        let cashBackVal = self.storyboard?.instantiateViewController(withIdentifier:"cashBackItemVC") as! cashBackItemVC
        cashBackVal.Cashbackarayfinalvalue = self.Cashbackarayfinalvalue
         cashBackVal.strVlad = self.cbPriceTotal
        self.present(cashBackVal, animated: true, completion: nil)
    }
       @IBAction func Confirmthisordervalue(_ sender: UIButton)
    {
//        self.totalconfirmscreenvalue.isHidden = false
//        let ThumbViewControllerViewControllerfinal = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"ThumbViewController") as! ThumbViewController
//        ThumbViewControllerViewControllerfinal.viewfinalvalue = self.totalconfirmscreenvalue
//        self.addChildViewController(ThumbViewControllerViewControllerfinal)
//        ThumbViewControllerViewControllerfinal.view.frame = CGRect(x: 0, y:0, width: self.view.frame.size.width, height: self.view.frame.size.height)
//    self.totalconfirmscreenvalue.addSubview(ThumbViewControllerViewControllerfinal.view)
//        ThumbViewControllerViewControllerfinal.didMove(toParentViewController: self)
    
            self.showSpinner()
            
            var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
            request.httpMethod = "POST"
            let defaulst = UserDefaults.standard
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }

            if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
            {
                self.CheckoutViewControllerstringfinal = Reviewfinaluseroid
            }
            
            
            if let ChekoutadressidTotal:String = defaulst.value(forKey: "MyadressoneTotal")as?String
            {
                self.Chekoutadressid = ChekoutadressidTotal
            }
            
            
            if let MypinvaluTotalTotalvalueis:String = defaulst.value(forKey: "MypinvaluTotal")as?String
            {
                self.MypinvaluTotalTotalvalue = MypinvaluTotalTotalvalueis
            }
        if let MycelleridTotalvalue:String = defaulst.value(forKey: "Mycelleridfinalvalue")as?String
        {
            self.MycelleridTotalvalue = MycelleridTotalvalue
        }
          ///  let aStr = String(format: "%@%@%@", "[",self.MycelleridTotalvalue,"]")
        
        let aStr = String(format: "%@",self.MycelleridTotalvalue)

            print(aStr)
            let postString =  String(format: "method=%@&pin=%@&Promo=%@&addressID=%@&paymentIDS=%@&userid=%@","makePayment",self.MypinvaluTotalTotalvalue,"",self.Chekoutadressid,aStr,self.CheckoutViewControllerstringfinal)
        
       /// method=makePayment&pin=@&Promo=&addressID=3085&paymentIDS=[]&userid=69901

            print(postString)
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
                        print(dict)
                        self.removeSpinner()
                        
                        
                        //        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BackalertViewController") as! BackalertViewController
                        //        self.addChildViewController(popOverVC)
                        //        popOverVC.view.frame = self.view.frame
                        //        self.view.addSubview(popOverVC.view)
                        //        popOverVC.didMove(toParentViewController: self)
                        
                        
                        
                        DispatchQueue.main.async {
                            let OrderDoneView = self.storyboard?.instantiateViewController(withIdentifier:"OrderDoneViewController")as!OrderDoneViewController
                            self.present(OrderDoneView, animated:true, completion:nil)
                        }
                    }
                    
                    break
                case .failure(_):
                    self.removeSpinner()

                    break
                }
                
            }
       
        
    }
    
    func PromoCodeTotalvalueis()
     {
//    self.showSpinner()
    
    var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
    request.httpMethod = "POST"
    let defaulst = UserDefaults.standard
    
    if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
    {
        self.CheckoutViewControllerstringfinal = Reviewfinaluseroid
    }
    
        if let ReviewfinaluseroidTotal:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.Reviewfinaluseroid = ReviewfinaluseroidTotal
        }
        
        
        
    
    if let ChekoutadressidTotal:String = defaulst.value(forKey: "MyadressoneTotal")as?String
    {
        self.Chekoutadressid = ChekoutadressidTotal
    }
        let defaultsmenu  = UserDefaults.standard
        
        if let User_name1finalvalue:String = defaultsmenu.value(forKey:"User_name") as? String
        {
            self.User_name1 = User_name1finalvalue
        }
    
    if let MypinvaluTotalTotalvalueis:String = defaulst.value(forKey: "MypinvaluTotal")as?String
    {
        self.MypinvaluTotalTotalvalue = MypinvaluTotalTotalvalueis
    }
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
    
    let aStr = String(format: "%@%@%@", "[",self.MycelleridTotalvalue,"]")
    print(aStr)
//        method:checkPromoCode
//        promoCode:good
//        username:A81
//        userid:A81
//        ActorId:127
//        AgentID:A81
//        ActorRoleID:4
//        VersionCode:3.0-37
//        ProductPrice:
//        appType:Direct
        
    let postString =  String(format: "method=%@&promoCode=%@&username=%@&userid=%@&ActorId=%@&AgentID=%@&ActorRoleID=%@&VersionCode=%@&ProductPrice=%@&appType=%@","checkPromoCode",promocodetextfiled.text!,self.User_name1,self.CheckoutViewControllerstringfinal,self.CheckoutViewControllerstringfinal,self.Reviewfinaluseroid,"4","3.0-37","","Direct")
    print(postString)
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
                print(dict)
                self.removeSpinner()
                
                if let StatusCodestring_disp = dict.value(forKey: "StatusCode") as? String {
                    self.StatusCodestring = StatusCodestring_disp
                }
                
                if let amountstringTotal_disp = dict.value(forKey: "amount") as? String {
                    self.amountstring = amountstringTotal_disp
                }
                
                if let MsgstringTotal_disp = dict.value(forKey:"Msg") as? String
                {
                    self.Msgstring = MsgstringTotal_disp
                    self.promocodenotapplicabel.text =  self.Msgstring
                }
            
            }
            
            break
        case .failure(_):
            break
        }
        
    }

    }
    @IBAction func DownarrowTotal(_ sender: UIButton)
    {
        
        self.deliveryadressview.isHidden = false
    }
    @IBAction func button(_ sender: UIButton) {
    }
    
    func showSpinner(){
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.view.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(imageView)
    }
    func removeSpinner(){
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()
        
    }
    
}
extension UIView
{
    func roundCorners(_ corners: CACornerMask, radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat)
    {
        self.layer.maskedCorners = corners
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
}
extension UIView
{
    func roundedButton()
    {
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.topLeft , .topRight],
                                     cornerRadii: CGSize(width:14, height: 14))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
}
