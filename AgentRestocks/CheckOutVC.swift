//
//  CheckOutVC.swift
//  AgentRestocks
//
//  Created by apple on 9/17/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class CheckOutVC: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var btnPopaction: UIButton!
    @IBOutlet weak var lblCheckOut: UILabel!
    @IBOutlet weak var lblItems: UILabel!
    @IBOutlet weak var lblQty: UILabel!
    @IBOutlet weak var billingView: UIView!
    @IBOutlet weak var lblBillingAddress: UILabel!
    @IBOutlet weak var deliveryView: UIView!
    @IBOutlet weak var lblDeliveryAddress: UILabel!
    @IBOutlet weak var btnAddAction: UIButton!
    
    @IBOutlet weak var billingAddressView: UIView!
    @IBOutlet weak var btnBillingRadio: UIButton!
    @IBOutlet weak var lblBillingStoreName: UILabel!
    @IBOutlet weak var lblBillingStoreAddress: UILabel!
    @IBOutlet weak var btnBillingMenu: UIButton!
    
    @IBOutlet weak var deliveryAddress1View: UIView!
    @IBOutlet weak var btnDelivery1Radio: UIButton!
//    @IBOutlet weak var lblDeliveryStore1Name: UILabel!
//    @IBOutlet weak var lblDeliveryStore1Address: UILabel!
    @IBOutlet weak var btnDelivery1Menu: UIButton!
    @IBOutlet weak var lblVerifyAddress: UILabel!
    
    @IBOutlet weak var deliveryAddress2View: UIView!
    @IBOutlet weak var btnDelivery2Radio: UIButton!
//    @IBOutlet weak var lblDeliveryStore2Name: UILabel!
//    @IBOutlet weak var lblDeliveryStore2Address: UILabel!
    @IBOutlet weak var lblVerify2Address: UILabel!
    @IBOutlet weak var btnDelivery2Menu: UIButton!
    
    @IBOutlet weak var moreView: UIView!
    @IBOutlet weak var btnMore: UIButton!
    @IBOutlet weak var btn2More: UIButton!
    @IBOutlet weak var btnNextAction: UIButton!

    @IBOutlet weak var BillingEDView: UIView!
    
    @IBOutlet weak var Delivery1EDView: UIView!
    
    @IBOutlet weak var Delivery2EDView: UIView!
    
    var storeName = String()
    var locationAddress = String ()
    var verifiedAddress = String()
    var notVerifyAddress = String()
    
    @IBOutlet weak var btnbackpopicon: UIButton!
    
   var useridbilingstringfinal = String()
    /// chekout Billing adress calculation
    
    
    var billingJSONDictValue = NSDictionary()
    
    
    var billingJSONDictaddressone = String()
    var billingJSONDictenabledsone = NSNumber()
    var billingJSONDicthps_nosone = String()

    var billingjsindictfinal = NSDictionary()

    var areadictfinal = String()
    var citydictfinal = String()

    var districtdictfinal = String()
    var localitydictfinal = String()
    var pincodedictfinal = String()

    var statedictfinal = String()

    
    
    var landmarkdictfinal = String()

    var locationdictfinal = String()

    var mapLatdictfinal = String()

    var mapLongdictfinal = String()
    var pincodetwodictfinal = String()
    var saveAsdictfinal = String()


    
    //// Delivery json
    
    var deliveryjsondict = NSDictionary()
    
    var delAddress1dict = NSDictionary()

    var delAddress1one = String()

    var delAddresschecked = String()

    var delAddressenabled = String()

    var delAddresshps_no = String()
    /// Delivery json
    
    var delAddresjson = NSDictionary()

    var delAddresjsonone = NSDictionary()

    var delAddresareaone = String()
    
    var delAddrescityone = String()
    
    var delAddresdistrictone = String()

    var delAddreslocalityone = String()

    var delAddrespincodeone = String()

    var delAddresstateone = String()

    /// delivery landmark
    
    
    var delAddresslandmarkone = String()
    
    var delAddresslocationone = String()
    var delAddressmapLatone = String()

    var delAddressmapmapLongone = String()

    var delAddresspincodeone = String()
    var delAddresssaveAseone = String()
    var delAddressstatuseone = String()
    
    var delAddressstatus_coloreone = String()

    
    
    
    
    
    
    //// Delivery json two
    
    var deliveryjsondicttwo = NSDictionary()
    
    var delAddress1dicttwo = NSDictionary()
    
    var delAddress1onetwo = String()
    
    var delAddresscheckedtwo = String()
    
    var delAddressenabledtwo = String()
    
    var delAddresshps_notwo = String()
    /// Delivery json two
    
    var delAddresjsontwo = NSDictionary()
    
    var delAddresjsononetwo = NSDictionary()
    
    var delAddresareaonetwo = String()
    
    var delAddrescityonetwo = String()
    
    var delAddresdistrictonetwo = String()
    
    var delAddreslocalityonetwo = String()
    
    var delAddrespincodeonetwo = String()
    
    var delAddresstateonetwo = String()
    
    /// delivery landmark two
    
    
    var delAddresslandmarkonetwo = String()
    
    var delAddresslocationonetwo = String()
    var delAddressmapLatonetwo = String()
    
    var delAddressmapmapLongonetwo = String()
    
    var delAddresspincodeonetwo = String()
    var delAddresssaveAseonetwo = String()
    var delAddressstatuseonetwo = String()
    
    var delAddressstatus_coloreonetwo = String()
    
    
    
    
    
    
    @IBOutlet weak var deliveryadressstorename: UILabel!
    
    @IBOutlet weak var deliverystoreadress: UILabel!
    
    
    
 
    
    @IBOutlet weak var deliverystorenametwo: UILabel!
    
    @IBOutlet weak var devliverystoreadresstwo: UILabel!
    
    
  //  @IBOutlet weak var devliverystoreadresstwo: UILabel!

    @IBOutlet weak var verfyalertview: UIView!
    var coverView = UIView()
    var imageView = UIImageView()
    
    @IBOutlet weak var demoviewone: UIView!
    
    @IBOutlet weak var setdelivervioew: UIView!
    
    @IBOutlet weak var setdeliverLocationbutton: UIButton!
    
    
    var cartitems = NSString()
    var cartquantity = NSString()
    var cartTotalrupess = NSString()
    
    @IBOutlet weak var totalrupeeslabel: UILabel!
    
    
    var adressfinalvalue = String()
    
    var AcessTokenfinalstring = String()
    
    var myagentTotalvalue  = String()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
      let defaults = UserDefaults.standard
        
        if let MycartQuantity_qty_disp:String =  defaults.value(forKey:"MycartQuantity")as? String
        {
            self.lblQty.text = MycartQuantity_qty_disp
        }
        if let Mytotal_cart_qty_disp:String =  defaults.value(forKey:"Mytotal_cart")as? String
        {
            self.totalrupeeslabel.text = Mytotal_cart_qty_disp
        }
        if let MyMycartCountdisp:String = defaults.value(forKey:"MycartCount")as? String
        {
            self.lblItems.text = String(format:"%@%@",MyMycartCountdisp,"Items")
        }
        
        
        
    
        
//          let str2 = cartTotalrupess.stringValue
//        
//        self.totalrupeeslabel.text = str2
        
        


      
//        method=AddToCartDynamic&idProductInfo=154-7-@&userid=127&sellerId=1&schemeId=&bulkId=
//        
        
        
        self.headerView.layer.addShadow()
        
//        btnBillingRadio.setBackgroundImage(UIImage(named: "radio_grey.png"), for: .normal)
//        btnDelivery1Radio.setBackgroundImage(UIImage(named: "radio_grey.png"), for: .normal)
//        btnDelivery2Radio.setBackgroundImage(UIImage(named: "radio_grey.png"), for: .normal)
//        btn2More.setBackgroundImage(UIImage(named: "uparrow.png"), for: .normal)
        BillingEDView.isHidden = true
        Delivery1EDView.isHidden = true
        Delivery2EDView.isHidden = true
        btnAddAction.isHidden = true
        
        
       
        
      
        
//        @IBOutlet weak var BillingEDView: UIView!
//
//        @IBOutlet weak var Delivery1EDView: UIView!
//
//        @IBOutlet weak var Delivery2EDView: UIView!
//
        
        self.BillingEDView.layer.borderWidth = 0.4
        self.BillingEDView.layer.borderColor = UIColor.black.cgColor
        self.BillingEDView.layer.masksToBounds = true
        
        self.Delivery1EDView.layer.borderWidth = 0.4
        self.Delivery1EDView.layer.borderColor = UIColor.black.cgColor
        self.Delivery1EDView.layer.masksToBounds = true
        
        self.Delivery2EDView.layer.borderWidth = 0.4
        self.Delivery2EDView.layer.borderColor = UIColor.black.cgColor
        self.Delivery2EDView.layer.masksToBounds = true
        self.checkoutproductValue()
        
        
        let tapTwo = UITapGestureRecognizer(target: self, action: #selector(self.handleTapcheckout(_:)))
        view.addGestureRecognizer(tapTwo)
        view.isUserInteractionEnabled = true
    }
    
    @objc func handleTapcheckout(_ sender: UITapGestureRecognizer)
    {
        self.BillingEDView.isHidden = true
        self.Delivery1EDView.isHidden = true
        self.Delivery2EDView.isHidden = true
    }
    
    @IBAction func btnBillingMenuAction(_ sender: Any) {
    
        if btnBillingMenu.tag == 0
        {
            BillingEDView.isHidden = false
            self.Delivery1EDView.isHidden = true
            self.Delivery2EDView.isHidden = true

            btnBillingMenu.tag = 1
            
        }
        else if btnBillingMenu.tag == 1
        {
            BillingEDView.isHidden = true
            self.Delivery1EDView.isHidden = true
            self.Delivery2EDView.isHidden = true
            
            btnBillingMenu.tag = 0
        }
  }
    @IBAction func btnDelivery1Menu(_ sender: Any) {
    
        if btnDelivery1Menu.tag == 0
        {
            self.BillingEDView.isHidden = true
            self.Delivery1EDView.isHidden = false
            self.Delivery2EDView.isHidden = true
            
            btnDelivery1Menu.tag = 1
            
        }
        else if btnDelivery1Menu.tag == 1
        {
            self.BillingEDView.isHidden = true
            self.Delivery1EDView.isHidden = true
            self.Delivery2EDView.isHidden = true
            
            btnDelivery1Menu.tag = 0
        }
    }
    
    @IBAction func btnDelivery2menu(_ sender: Any) {
   

        if btnDelivery2Menu.tag == 0
        {
            Delivery2EDView.isHidden = false
            self.BillingEDView.isHidden = true
            self.Delivery1EDView.isHidden = true
            btnDelivery2Menu.tag = 1
            
        }
        else if btnDelivery2Menu.tag == 1
        {
            self.Delivery2EDView.isHidden = true
            self.BillingEDView.isHidden = true
            self.Delivery1EDView.isHidden = true
            
            btnDelivery2Menu.tag = 0
        }
        
    
    }
    
    @IBAction func btnAddressNumber(_ sender: Any) {
   
//        if btnAddAction.tag == 0
//        {
//            deliveryAddress2View.isHidden = false
//            btnAddAction.tag = 1
//            btnAddAction.isHidden = true
//            btn2More.setBackgroundImage(UIImage(named: "uparrow.png"), for: .normal)
//        }
//        else if btnAddAction.tag == 1
//        {
//            deliveryAddress2View.isHidden = true
//            btnAddAction.tag = 0
//            btn2More.setBackgroundImage(UIImage(named: "angle-arrow-down.png"), for: .normal)
//        }
        
        DispatchQueue.main.async {
            let DeliveryAddressVCfinal = self.storyboard?.instantiateViewController(withIdentifier:"DeliveryAddressVC")as!DeliveryAddressVC
            DeliveryAddressVCfinal.demostringvalue = "ButtonDeliverytwoadressvalue"
            self.present(DeliveryAddressVCfinal, animated: true, completion:nil)
        }
    }
    
    @IBAction func btnMoreAction(_ sender: Any) {
        if btnMore.tag == 0
        {
            deliveryAddress2View.isHidden = false
//            btnAddAction.isHidden = false
            self.deliveryAddress2View.isHidden = false
            self.deliveryAddress2View.frame = CGRect(x:self.deliveryAddress2View.frame.origin.x , y: self.moreView.frame.origin.y, width: self.deliveryAddress2View.frame.size.width, height: self.deliveryAddress2View.frame.size.height)
             self.moreView.isHidden = false
         self.moreView.frame = CGRect(x:self.moreView.frame.origin.x , y:150, width: self.moreView.frame.size.width, height: self.moreView.frame.size.height)
//            btn2More.setBackgroundImage(UIImage(named: "uparrow.png"), for: .normal)
          
              btn2More.setBackgroundImage(#imageLiteral(resourceName: "angelarrowDown"), for:.normal)
            btn2More.isHidden = false
            
            
                btnMore.tag = 1
        }
        else if btnMore.tag == 1
        {
//            btnAddAction.isHidden = false
            self.deliveryAddress2View.isHidden = true
            btn2More.setBackgroundImage(UIImage(named: "angle-arrow-down.png"), for: .normal)
//            btn2More.setBackgroundImage(#imageLiteral(resourceName: "angelarrowDown"), for:.normal)
          btn2More.setBackgroundImage(#imageLiteral(resourceName: "angle-arrow-down"), for:.normal)
            
//            self.deliveryAddress2View.frame = CGRect(x:self.deliveryAddress2View.frame.origin.x , y: self.deliveryAddress2View.frame.origin.y, width: self.deliveryAddress2View.frame.size.width, height: self.deliveryAddress2View.frame.size.height)
             self.deliveryAddress2View.isHidden = true
            self.moreView.frame = CGRect(x:self.moreView.frame.origin.x , y:82, width: self.moreView.frame.size.width, height: self.moreView.frame.size.height)
            btn2More.isHidden = false
          btnMore.tag = 0
        }
    }
    
    @IBAction func btnRadioAction(_ sender: Any) {
    
//        if btnBillingRadio.tag == 0
//        {
//            btnBillingRadio.setBackgroundImage(UIImage(named: "radio_grey.png"), for: .normal)
//            btnBillingRadio.tag = 1
//        }
//        else if btnBillingRadio.tag == 1
//        {
//            btnBillingRadio.setBackgroundImage(UIImage(named: "radio_blue.png"), for: .normal)
//            btnBillingRadio.tag = 0
//        }
        
          btnBillingRadio.setBackgroundImage(#imageLiteral(resourceName: "Radioon"), for:.normal)
        
       //// Radioon
    }
    
    @IBAction func btnRadioDelivery1Address(_ sender: Any) {
         self.btnNextAction.isHidden = false
       
        let defaults = UserDefaults.standard
        defaults.set( self.delAddress1one, forKey:"Myadressone")
        defaults.synchronize()
        
         btnDelivery1Radio.setBackgroundImage(#imageLiteral(resourceName: "Radioon"), for:.normal)
        btnDelivery2Radio.setBackgroundImage(#imageLiteral(resourceName: "Radiooff"), for:.normal)
        
        self.btnNextAction.isHidden = false
    }
    
    @IBAction func btnRadioDelivery2Address(_ sender: Any) {
    
        let defaults = UserDefaults.standard
        defaults.set(self.delAddress1onetwo, forKey:"Myadressone")
        defaults.synchronize()
        

        btnDelivery1Radio.setBackgroundImage(#imageLiteral(resourceName: "Radiooff"), for:.normal)
        btnDelivery2Radio.setBackgroundImage(#imageLiteral(resourceName: "Radioon"), for:.normal)
        self.btnNextAction.isHidden = false

    }
    

  
    
    @IBAction func btnDelivery1DeleteAction(_ sender: UIButton)
    {
        self.deliveryAddress1View.removeFromSuperview()
        self.deletedelveryadress()
   self.deliveryAddress2View.frame = CGRect(x:self.deliveryAddress2View.frame.origin.x , y:self.deliveryAddress1View.frame.origin.y, width: self.deliveryAddress2View.frame.size.width, height: self.deliveryAddress2View.frame.size.height)
        self.moreView.isHidden = true
        self.btnAddAction.isHidden = false
        
    }
    
    @IBAction func btnDelivery2EditAction(_ sender: UIButton)
    {
        DispatchQueue.main.async {
            let DeliveryAddressVCfinal = self.storyboard?.instantiateViewController(withIdentifier:"DeliveryAddressVC")as!DeliveryAddressVC
            DeliveryAddressVCfinal.demostringvalue = "ButtonDeliverytwoadressvalue"
            self.present(DeliveryAddressVCfinal, animated: true, completion:nil)
        }
    }
    
    @IBAction func btnDelivery2DeleteAction(_ sender: Any) {
        self.deliveryAddress2View.removeFromSuperview()
        self.deletedelveryadressTwo()
        self.deliveryAddress1View.frame = CGRect(x:self.deliveryAddress1View.frame.origin.x , y:self.deliveryAddress1View.frame.origin.y, width: self.moreView.frame.size.width, height: self.moreView.frame.size.height)
        btnAddAction.isHidden = false

         self.moreView.isHidden = true
        
//  self.moreView.frame = CGRect(x:self.moreView.frame.origin.x , y:self.deliveryAddress2View.frame.origin.y, width: self.moreView.frame.size.width, height: self.moreView.frame.size.height)
//        btnAddAction.isHidden = false
        self.btnAddAction.isHidden = false


    }
    @IBAction func backbuton(_ sender: UIButton)
    {
        self.dismiss(animated: true
            , completion:nil)
    }
    func checkoutproductValue()
    {
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        //   let postString = "method=landingPage&userid=511111117"
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.useridbilingstringfinal = Reviewfinaluseroid
        }
//        else{
//            self.useridbilingstringfinal = "127"
//        }
        // method=AddToFav&idProductInfo=1&userid=124&select=1
        print(self.useridbilingstringfinal)
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }

        let postString =  String(format: "method=%@&agentid=%@","getAddresses",self.useridbilingstringfinal)
        
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
                    print(dict.count)
                    
                    
                    if dict.count >= 2
                    {
                        self.btnAddAction.isHidden = true
                    }
                    else{
                        self.btnAddAction.isHidden = false

                    }
                    self.billingJSONDictValue = dict.value(forKey:"billingJSON")as!NSDictionary
                    self.billingJSONDictaddressone =  self.billingJSONDictValue.value(forKey:"addressone")as!String
                     self.billingJSONDictenabledsone =  self.billingJSONDictValue.value(forKey:"enabled")as! NSNumber
                    self.billingJSONDicthps_nosone =  self.billingJSONDictValue.value(forKey:"hps_no")as!String

                    self.billingjsindictfinal =   self.billingJSONDictValue.value(forKey:"json")as!NSDictionary


                    if let areadictfinalavailable_qty_disp:String = self.billingjsindictfinal.value(forKey: "area") as? String {
                        self.areadictfinal = areadictfinalavailable_qty_disp
                    }

                    if let citydictfinaltwo:String = self.billingjsindictfinal.value(forKey: "city") as? String {
                        self.citydictfinal = citydictfinaltwo
                    }
                    if let districtdictfinaltwo:String = self.billingjsindictfinal.value(forKey: "district") as? String {
                        self.districtdictfinal = districtdictfinaltwo
                    }

                    if let localitydictfinaltwo:String = self.billingjsindictfinal.value(forKey: "locality") as? String {
                        self.localitydictfinal = localitydictfinaltwo
                    }

                    if let pincodetwodictfinaltwo:String = self.billingjsindictfinal.value(forKey: "pincode") as? String {
                        self.pincodetwodictfinal = pincodetwodictfinaltwo
                    }

                    if let statedictfinaltwo:String = self.billingjsindictfinal.value(forKey: "state") as? String {
                        self.statedictfinal = statedictfinaltwo
                    }



                    if let saveAsdictfinalvaluetwo:String = self.billingJSONDictValue.value(forKey: "saveAs") as? String {
                        self.saveAsdictfinal = saveAsdictfinalvaluetwo
                    }

                    if let pincodedictfinalvalue:String = self.billingJSONDictValue.value(forKey: "pincode") as? String {
                        self.pincodedictfinal = pincodedictfinalvalue
                    }
                    if let mapLongdictfinaltwo:String = self.billingJSONDictValue.value(forKey: "mapLong") as? String {
                        self.mapLongdictfinal = mapLongdictfinaltwo
                    }

                    if let mapLatdictfinaltwo:String = self.billingJSONDictValue.value(forKey: "mapLat") as? String {
                        self.mapLatdictfinal = mapLatdictfinaltwo
                    }

                    if let locationdictfinaltwo:String = self.billingJSONDictValue.value(forKey: "location") as? String {
                        self.locationdictfinal = locationdictfinaltwo
                    }

                    if let landmarkdictfinalvalue:String = self.billingJSONDictValue.value(forKey: "landmark") as? String {
                        self.landmarkdictfinal = landmarkdictfinalvalue
                    }

                    ///// Delivery adress one

              
        if let deliveryjsondictfinalvalue:NSDictionary = dict.value(forKey:"deliveryJson") as? NSDictionary {
                        self.deliveryjsondict = deliveryjsondictfinalvalue
                    }
                    print(self.deliveryjsondict)
                    if self.deliveryjsondict.count == 0
                    {
                        self.demoviewone.isHidden = true
                        self.setdelivervioew.isHidden = false
                    }
                    if self.deliveryjsondict.count == 1
                    {
                        self.demoviewone.isHidden = false
                        self.setdelivervioew.isHidden = true
                        self.deliveryAddress2View.isHidden = true
                        self.moreView.isHidden = true
                        self.btnAddAction.isHidden = false
                    }
                    if self.deliveryjsondict.count == 2
                    {
                        self.demoviewone.isHidden = false
                        self.setdelivervioew.isHidden = true
                        self.deliveryAddress2View.isHidden = true
                        self.moreView.isHidden = false
                        self.btnAddAction.isHidden = true
                    }
                    if let delAddress1dictfinalvalue:NSDictionary =  self.deliveryjsondict.value(forKey: "delAddress1") as? NSDictionary {
                        self.delAddress1dict = delAddress1dictfinalvalue
                    }

                    if let delAddresscheckeddictfinalvalue:String =  self.delAddress1dict.value(forKey: "checked") as? String {
                        self.delAddresschecked = delAddresscheckeddictfinalvalue
                    }

                    if let delAddress1onedictfinalvalue:String =  self.delAddress1dict.value(forKey: "addressone") as? String {
                        self.delAddress1one = delAddress1onedictfinalvalue
                    }

                    if let delAddressenabledfinalvalue:String =  self.delAddress1dict.value(forKey: "enabled") as? String {
                        self.delAddressenabled = delAddressenabledfinalvalue
//                        self.btnNextAction.isHidden = false
                    }

                    if let delAddresshps_nofinalvalue:String =  self.delAddress1dict.value(forKey: "hps_no") as? String {
                        self.delAddresshps_no = delAddresshps_nofinalvalue
                    }

                    if let delAddresshps_nofinalvalue:NSDictionary =  self.deliveryjsondict.value(forKey: "json") as? NSDictionary {
                        self.delAddresjson = delAddresshps_nofinalvalue
                    }

                    if let delAddresareaonefinalvalue:String =  self.deliveryjsondict.value(forKey: "area") as? String {
                        self.delAddresareaone = delAddresareaonefinalvalue
                    }

                    if let delAddrescityonefinalvalue:String =  self.deliveryjsondict.value(forKey: "city") as? String {
                        self.delAddrescityone = delAddrescityonefinalvalue
                    }

                    if let delAddresdistrictonefinalvalue:String =  self.deliveryjsondict.value(forKey: "district") as? String {
                        self.delAddresdistrictone = delAddresdistrictonefinalvalue
                    }
                    if let delAddreslocalityonefinalvalue:String =  self.deliveryjsondict.value(forKey: "locality") as? String {
                        self.delAddreslocalityone = delAddreslocalityonefinalvalue
                    }
                    if let delAddrespincodeonefinalvalue:String =  self.deliveryjsondict.value(forKey: "pincode") as? String {
                        self.delAddrespincodeone = delAddrespincodeonefinalvalue
                    }

                    if let delAddresstateonefinalvalue:String =  self.deliveryjsondict.value(forKey: "state") as? String {
                        self.delAddresstateone = delAddresstateonefinalvalue
                    }

                    if let delAddresslandmarkonefinalvalue:String =  self.delAddress1dict.value(forKey: "landmark") as? String {
                        self.delAddresslandmarkone = delAddresslandmarkonefinalvalue
                    }

                    if let delAddresslocationonefinalvalue:String =  self.delAddress1dict.value(forKey: "location") as? String {
                        self.delAddresslocationone = delAddresslocationonefinalvalue
                    }


                    if let delAddressmapLatonefinalvalue:String =  self.delAddress1dict.value(forKey: "mapLat") as? String {
                        self.delAddressmapLatone = delAddressmapLatonefinalvalue
                    }

                    if let delAddressmapmapLongonefinalvalue:String =  self.delAddress1dict.value(forKey: "mapLong") as? String {
                        self.delAddressmapmapLongone = delAddressmapmapLongonefinalvalue
                    }

                    if let delAddresspincodeonefinalvalue:String =  self.delAddress1dict.value(forKey: "pincode") as? String {
                        self.delAddresspincodeone = delAddresspincodeonefinalvalue
                    }


                    if let delAddresssaveAseonefinalvalue:String =  self.delAddress1dict.value(forKey: "saveAs") as? String {
                        self.delAddresssaveAseone = delAddresssaveAseonefinalvalue
                    }

                    if let delAddressstatuseonefinalvalue:String =  self.delAddress1dict.value(forKey: "status") as? String {
                        self.delAddressstatuseone = delAddressstatuseonefinalvalue
                    }

                    if let delAddressstatus_coloreonefinalvalue:String =  self.delAddress1dict.value(forKey: "status_color") as? String {
                        self.delAddressstatus_coloreone = delAddressstatus_coloreonefinalvalue
                    }

                    
                    
                   
                    
                    
                    /// delivery jsontwo
                    
                    if let deliveryjsondicttwotfinalvalue:NSDictionary =  self.deliveryjsondict.value(forKey:"delAddress2") as? NSDictionary {
                        self.deliveryjsondicttwo = deliveryjsondicttwotfinalvalue
                    }
                    print(self.deliveryjsondicttwo)

                    if let delAddresscheckedtwofinalvalue:String =  self.deliveryjsondicttwo.value(forKey: "checked") as? String
                    {
                        self.delAddresscheckedtwo = delAddresscheckedtwofinalvalue
                    }
                    
                    if let delAddress1onetwofinalvalue:String =  self.deliveryjsondicttwo.value(forKey: "addressone") as? String {
                        self.delAddress1onetwo = delAddress1onetwofinalvalue
                    }
                    
                    if let delAddressenabledtwofinalvalue:String =  self.deliveryjsondicttwo.value(forKey: "enabled") as? String {
                        self.delAddressenabledtwo = delAddressenabledtwofinalvalue
                    }
                    
                    if let delAddresshps_notwofinalvalue:String =  self.deliveryjsondicttwo.value(forKey: "hps_no") as? String {
                        self.delAddresshps_notwo = delAddresshps_notwofinalvalue
                    }
                
                    if let delAddresjsontwofinalvalue:NSDictionary =  self.deliveryjsondicttwo.value(forKey: "json") as? NSDictionary {
                        self.delAddresjsontwo = delAddresjsontwofinalvalue
                    }
                   
                    if let delAddresareaonetwofinalvalue:String =  self.delAddresjsontwo.value(forKey: "area") as? String {
                        self.delAddresareaonetwo = delAddresareaonetwofinalvalue
                    }
                   
                    if let delAddrescityonetwofinalvalue:String =  self.delAddresjsontwo.value(forKey: "city") as? String {
                        self.delAddrescityonetwo = delAddrescityonetwofinalvalue
                    }
                    
                    if let delAddresdistrictonetwofinalvalue:String =  self.delAddresjsontwo.value(forKey: "district") as? String {
                        self.delAddresdistrictonetwo = delAddresdistrictonetwofinalvalue
                    }
                    if let delAddreslocalityonetwofinalvalue:String =  self.delAddresjsontwo.value(forKey: "locality") as? String {
                        self.delAddreslocalityonetwo = delAddreslocalityonetwofinalvalue
                    }
                    
                    
                    if let delAddrespincodeonetwofinalvalue:String =  self.delAddresjsontwo.value(forKey: "pincode") as? String {
                        self.delAddrespincodeone = delAddrespincodeonetwofinalvalue
                    }
                    
                    if let delAddresstateonetwofinalvalue:String =  self.delAddresjsontwo.value(forKey: "state") as? String {
                        self.delAddresstateonetwo = delAddresstateonetwofinalvalue
                    }
                 
                    
                    
                    if let delAddresslandmarkonetwofinalvalue:String =  self.deliveryjsondicttwo.value(forKey: "landmark") as? String {
                        self.delAddresslandmarkonetwo = delAddresslandmarkonetwofinalvalue
                    }
                    
                    if let delAddresslocationonetwotwofinalvalue:String =  self.deliveryjsondicttwo.value(forKey: "location") as? String {
                        self.delAddresslocationonetwo = delAddresslocationonetwotwofinalvalue
                    }
                    
                    
                    if let delAddressmapLatonetwofinalvalue:String =  self.deliveryjsondicttwo.value(forKey: "mapLat") as? String {
                        self.delAddressmapLatonetwo = delAddressmapLatonetwofinalvalue
                    }
                    
                    if let delAddressmapmapLongonetwofinalvalue:String =  self.deliveryjsondicttwo.value(forKey: "mapLong") as? String {
                        self.delAddressmapmapLongonetwo = delAddressmapmapLongonetwofinalvalue
                    }
                    
                    if let delAddresspincodeonetwofinalvalue:String =  self.deliveryjsondicttwo.value(forKey: "pincode") as? String {
                        self.delAddresspincodeonetwo = delAddresspincodeonetwofinalvalue
                    }
                   
                    if let delAddresssaveAseonetwofinalvalue:String =  self.deliveryjsondicttwo.value(forKey: "saveAs") as? String {
                        self.delAddresssaveAseonetwo = delAddresssaveAseonetwofinalvalue
                    }
                    
                    if let delAddressstatuseonetwofinalvalue:String =  self.deliveryjsondicttwo.value(forKey: "status") as? String {
                        self.delAddressstatuseonetwo = delAddressstatuseonetwofinalvalue
                    }
                    
                    if let delAddressstatus_coloreonetwofinalvalue:String =  self.deliveryjsondicttwo.value(forKey: "status_color") as? String
                    {
                        self.delAddressstatus_coloreonetwo = delAddressstatus_coloreonetwofinalvalue
                    }
              
                    DispatchQueue.main.async
                   {
                    self.lblBillingStoreAddress.text = self.locationdictfinal
                    self.lblBillingStoreName.text = self.saveAsdictfinal
                    self.deliveryadressstorename.text = self.delAddresslocationone
                    self.deliverystoreadress.text = self.delAddresssaveAseone
                    self.deliverystorenametwo.text = self.delAddresslocationonetwo
                    self.devliverystoreadresstwo.text = self.delAddresssaveAseonetwo
                    self.lblVerifyAddress.text = self.delAddressstatuseone
                    self.lblVerify2Address.text = self.delAddressstatuseonetwo
                    
                    }
                }
                break
            case .failure(_):
                break
            }
        
        }
    }
    
    func deletedelveryadress()
    {
        
        self.showSpinner()
        
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        //   let postString = "method=landingPage&userid=511111117"
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.useridbilingstringfinal = Reviewfinaluseroid
        }

        print(self.useridbilingstringfinal)
        
        let postString =  String(format: "method=%@&agentid=%@","deleteDeliveryAddress1",self.useridbilingstringfinal)
        
        print(postString)
        
        request.httpBody = postString.data(using: .utf8)
        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    self.removeSpinner()

                }
                break
            case .failure(_):
                break
            }
            
        }
    }
    
    func deletedelveryadressTwo()
    {
        self.showSpinner()
        
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        //   let postString = "method=landingPage&userid=511111117"
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.useridbilingstringfinal = Reviewfinaluseroid
        }
//        else{
//            self.useridbilingstringfinal = "127"
//        }
        // method=AddToFav&idProductInfo=1&userid=124&select=1
        print(self.useridbilingstringfinal)
        
        let postString =  String(format: "method=%@&agentid=%@","deliveryAddress2",self.useridbilingstringfinal)
        
        print(postString)
        
        request.httpBody = postString.data(using: .utf8)
        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    print(dict)
                    self.removeSpinner()

                }
                break
            case .failure(_):
                break
            }
            
        }
    }
    @IBAction func buttonnextaction(_ sender: UIButton)
    {
        DispatchQueue.main.async {
    let CheckOut1VCfinal = self.storyboard?.instantiateViewController(withIdentifier:"CheckoutViewController")as!CheckoutViewController
          self.present(CheckOut1VCfinal, animated: true, completion:nil)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.checkoutproductValue()
    }
    
    func showSpinner(){
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        self.verfyalertview.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(imageView)
    }
    func removeSpinner(){
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()
    }
    
    @IBAction func setdeliveryLocationone(_ sender: UIButton)
    {
        DispatchQueue.main.async {
            let DeliveryAddressVCfinal = self.storyboard?.instantiateViewController(withIdentifier:"DeliveryAddressVC")as!DeliveryAddressVC
            DeliveryAddressVCfinal.demostringvalue = "ButtonDeliveradressvalue"
            self.present(DeliveryAddressVCfinal, animated: true, completion:nil)
        }
    }
    
    @IBAction func btnBillingEditAction(_ sender: UIButton)
    {
        DispatchQueue.main.async {
            let DeliveryAddressVCfinal = self.storyboard?.instantiateViewController(withIdentifier:"DeliveryAddressVC")as!DeliveryAddressVC
            DeliveryAddressVCfinal.demostringvalue = "ButtonBillingadressvalue"
            self.present(DeliveryAddressVCfinal, animated: true, completion:nil)
        }
    }
    
    
    @IBAction func btnBillingDeleteAction(_ sender:UIButton)
    {
        self.billingAddressView.removeFromSuperview()
    }
    
    @IBAction func btnDelivery1EditAction(_ sender: UIButton) {
        DispatchQueue.main.async {
            let DeliveryAddressVCfinal = self.storyboard?.instantiateViewController(withIdentifier:"DeliveryAddressVC")as!DeliveryAddressVC
            DeliveryAddressVCfinal.demostringvalue = "ButtonDeliveradressvalue"
            self.present(DeliveryAddressVCfinal, animated: true, completion:nil)
        }
        
    }
    
    
    
}
