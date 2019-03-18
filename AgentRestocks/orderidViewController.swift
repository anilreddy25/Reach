//
//  orderidViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 20/09/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit

class orderidViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var orderview: UIView!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var morebutton: UIButton!
    @IBOutlet weak var adresslabel: UILabel!
    @IBOutlet weak var soldbyview: UIView!
    @IBOutlet weak var soldbynumbermall: UILabel!
    @IBOutlet weak var fullfilledbynumbermall: UILabel!
    @IBOutlet weak var orderidview: UIView!
    @IBOutlet weak var orderidlabel: UILabel!
    @IBOutlet weak var orderdatelabel: UILabel!
    @IBOutlet weak var deliverylabel: UILabel!
    @IBOutlet weak var deliveryboylabel: UILabel!
    
    @IBOutlet weak var productscrollview: UIScrollView!
    
    @IBOutlet weak var Itemsquantityview: UIView!
    
    @IBOutlet weak var itemslabel: UILabel!
    
    @IBOutlet weak var quntitylabel: UILabel!

    @IBOutlet weak var amountlabel: UILabel!
    
    @IBOutlet weak var rupeeslabel: UILabel!
    
    
    var orderidstr = [String]()
    var orderdatestr = [String]()
    var Deliverystr = [String]()
    var Deliveryboystr = [String]()
    
    
    var itemsstr = [String]()
    var quantitystr = [String]()
    var Amountstr = [String]()
    var Rupessstr = [String]()

    @IBOutlet weak var itemviewone: UIView!
    
    @IBOutlet weak var ietmviewtwo: UIView!
    
    @IBOutlet weak var orderidtabelview: UITableView!
    
    var popconnamestring = [String]()
    var quantitylabelstring = [String]()
    var sellernamelabelstring = [String]()
    var rupeesproducttring = [String]()
    var returnedlabeltring = [String]()

    
    @IBOutlet weak var PAYMENTSUMMARY: UIView!
    
    @IBOutlet weak var payementsummaryfinalview: UIView!
    
    @IBOutlet weak var angelarrowdown: UIButton!
    
    @IBOutlet weak var Handlingchargeslabel: UILabel!
    
    @IBOutlet weak var gstchargeslabel: UILabel!
    @IBOutlet weak var promocode: UILabel!
    
    @IBOutlet weak var promocoderupeeslabel: UILabel!
    
    @IBOutlet weak var Totalamountchargeslabel: UILabel!
    
    @IBOutlet weak var dropcashback: UIButton!
    
    
    @IBOutlet weak var Toatalamountrupeeslabel: UILabel!
    
    @IBOutlet weak var cashbackrupeeslabel: UILabel!
    
    
    @IBOutlet weak var Newcashbacklabel: UILabel!
    
    @IBOutlet weak var Newcashbackcharge: UILabel!
    
    @IBOutlet weak var Newwalletcharge: UILabel!
    
    @IBOutlet weak var payLinkcharge: UILabel!
    
    @IBOutlet weak var Newcashview: UIView!
    
    var Rupeesstring = [String]()
    var offerstring = [String]()
    var percentagestring = [String]()
    
    
    
    @IBOutlet weak var orderidlabelvalue: UILabel!
    
    
    var orderidstring = String()
    
    @IBOutlet weak var bottomview: UIView!
    
    
    @IBOutlet weak var invoice: UIButton!
    
    @IBOutlet weak var reepeat: UIButton!
    
    @IBOutlet weak var Track: UIButton!
    
    @IBOutlet weak var Help: UIButton!
    
    
    /// strings decleration
    
    var soldfillfiledbystring = String()
    var soldfillfiledbyorderidstring = String()
    var orderdatelaebelstring = String()
    var deliverylabelstring = String()
    var deliveryboylabelstring = String()

    var itemname = String()
    var itemquntity = String()
    var itemAmount = String()

    var productname = NSArray()
    var productRupees = NSArray()
    var productQuantity = NSArray()
    var productsoldfilledby = NSArray()
    var productorderconfirmed = NSArray()
    var productordercolor = NSArray()
    @IBOutlet weak var totalviewfinal: UIView!
    
    
    
 

    @IBOutlet weak var subtotalitemlabel: UILabel!
    
    @IBOutlet weak var gstchargesofthelabel: UILabel!
    @IBOutlet weak var mytotakamountalbel: UILabel!
    
    @IBOutlet weak var cashbacktwoitems: UIButton!
    
    @IBOutlet weak var cashbacklabel: UILabel!

    
    @IBOutlet weak var viewthreeitems: UIButton!
    
    @IBOutlet weak var angelaarrowdown: UIButton!
    @IBOutlet weak var totalcancelview: UIView!
    
    
    @IBOutlet weak var Middelview: UIView!
    
    var subtotalstring = NSArray()
    var HandlingchargseString = NSArray()
    
    //    var Handlingchargsevalue_colrString = String()
    //    var HandlingGSTcharges_colrString = String()
    //
    //    var TotalamountString = String()
    //    var CashbackString = String()
    //    var subtotalstringcolor = String()
    
    var deliveryadressarray = String()
    var deliveryShopnamearray = String()
    var Billingadressarray = String()
    var BillingShopnamearray = String()
    var deliverymobilenumber = String()
    var BillingMobilenumber = String()
    
    @IBOutlet weak var mydeluiveryadressarray: UIView!
    
    @IBOutlet weak var mybillingadressarray: UIView!
    
    @IBOutlet weak var deliveryadresssname: UILabel!
    
    @IBOutlet weak var deliveryadress: UILabel!
    
    @IBOutlet weak var deliveryadressphonenumber: UILabel!
    
    
    @IBOutlet weak var billingadressname: UILabel!
    
    @IBOutlet weak var billingadresslabel: UILabel!
    
    @IBOutlet weak var billingadressphonenumber: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        bottomview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        orderview.layer.shadowOffset = CGSize(width: 0, height: 2)
        orderview.layer.shadowOpacity = 0.3
        orderview.layer.shadowRadius = 1.0
        orderview.layer.borderColor = UIColor.color2().cgColor
        orderview.layer.shadowColor = UIColor.color2().cgColor
        
        orderidview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        orderidview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        
        //Itemsquantityview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        Itemsquantityview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        
        if self.view.frame.size.height < 800
        {
            productscrollview.contentInset = UIEdgeInsetsMake(0, 0,self.productscrollview.frame.size.height+1100, 0)
            productscrollview.isScrollEnabled = true
            productscrollview.showsVerticalScrollIndicator = false
        }

        itemsstr = ["3 ITEMS"]
        quantitystr = ["2 QTY"]
        Amountstr = ["AMOUNT:"]
        Rupessstr = ["₹1,313.42"]

        itemslabel.text = itemsstr[0]
        quntitylabel.text =  quantitystr[0]
        amountlabel.text = Amountstr[0]
        rupeeslabel.text = Rupessstr[0]
   
        orderidstr = ["621451241"]
        orderdatestr = ["25 May 2017 03:30 PM"]
        Deliverystr = ["28 May 2017 04:20 PM"]
        Deliveryboystr = ["Suresh"]
   
        orderidlabel.text = orderidstr[0]
        orderdatelabel.text =  orderdatestr[0]
        deliverylabel.text = Deliverystr[0]
        deliveryboylabel.text = Deliveryboystr[0]
     
        self.itemviewone.layer.cornerRadius = self.itemviewone.frame.size.width/2
        self.ietmviewtwo.layer.cornerRadius = self.ietmviewtwo.frame.size.width/2

        
        popconnamestring = ["Popicorn piri piri masala","Popicorn piri piri masala","Popicorn piri piri masala"]
        rupeesproducttring = ["₹114.00","₹174.00","₹194.00"]
        sellernamelabelstring = ["Seller: NumberMall - Fullfilled by : NumberMall","Seller: NumberMall - Fullfilled by : NumberMall","Seller: NumberMall - Fullfilled by : NumberMall"]
        quantitylabelstring = ["44 Qty","20 Qty","24 Qty"]
        returnedlabeltring = ["Returned","Returned","Returned"]
         PAYMENTSUMMARY.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        
        print(orderidstring)
      
        self.orderidlabelvalue.text = orderidstring
        self.soldbynumbermall.text = soldfillfiledbystring
        self.orderidlabel.text = soldfillfiledbyorderidstring
        self.orderdatelabel.text = orderdatelaebelstring
        self.deliverylabel.text = deliverylabelstring
        self.deliveryboylabel.text = deliveryboylabelstring
        itemslabel.text = itemname
        quntitylabel.text = itemquntity
        amountlabel.text = itemAmount

        subtotalitemlabel.text = (self.subtotalstring[0] as! String)
        Handlingchargeslabel.text = self.subtotalstring[1] as? String
        gstchargesofthelabel.text = self.subtotalstring[2] as? String
        promocoderupeeslabel.text = self.subtotalstring[3] as? String
        mytotakamountalbel.text = self.subtotalstring[4] as? String
        cashbacklabel.text = self.subtotalstring[5] as? String
        Newcashbackcharge.text = self.subtotalstring[6] as? String
        
        
        deliveryadresssname.text = self.deliveryShopnamearray
        deliveryadress.text = self.deliveryadressarray
        billingadressname.text = self.BillingShopnamearray
        billingadresslabel.text = self.Billingadressarray
        
        Middelview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        
        Middelview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)

        
        let tapThree = UITapGestureRecognizer(target: self, action: #selector(self.handleTapcatgeoryorders(_:)))
        
        self.totalcancelview.addGestureRecognizer(tapThree)
        
        self.totalcancelview.isUserInteractionEnabled = true
    }

    @objc func handleTapcatgeoryorders(_ sender: UITapGestureRecognizer)
    {
        self.totalcancelview.isHidden = true

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func Back(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    @IBAction func Morebutton(_ sender: UIButton)
    {
        DispatchQueue.main.async {
            let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"FilterViewController")as!FilterViewController
            self.present(viewfinal, animated: true, completion:nil)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
       
        return productname.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
            let cell : orderidTableViewCell = orderidtabelview.dequeueReusableCell(withIdentifier: "orderidTableViewCell", for: indexPath) as! orderidTableViewCell
            cell.returnedlabel.isHidden = false

        cell.popconname.text = self.productname[indexPath.row] as? String
        cell.quantitylabel.text = self.productQuantity[indexPath.row] as? String
        cell.sellernamelabel.text = self.productsoldfilledby[indexPath.row] as?String
        cell.rupeesproduct.text =  self.productRupees[indexPath.row] as? String
        cell.returnedlabel.text =  self.productorderconfirmed[indexPath.row] as? String
        
        let productcolorvalue = self.productordercolor[indexPath.row]
        
        
        cell.returnedlabel.textColor = hexStringToUIColor(hex:productcolorvalue as! String)
        
            return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        DispatchQueue.main.async {
            let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"ProductDescriptionViewController")as!ProductDescriptionViewController
            self.present(viewfinal, animated: true, completion:nil)
        }
        
    }
    
    @IBAction func angelarrowdown(_ sender: UIButton) {
    }
    
    @IBAction func Freepromocode(_ sender: UIButton) {
    }
    
    @IBAction func Totalamountdropdown(_ sender: UIButton) {
    }
    @IBAction func Invoicebutton(_ sender: UIButton)
    {
        invoice.backgroundColor = UIColor.textfiledbottomcolorside()
        reepeat.backgroundColor = UIColor.productidbackgrouncolor()
        Track.backgroundColor = UIColor.productidbackgrouncolor()
        Help.backgroundColor = UIColor.productidbackgrouncolor()

    }
    @IBAction func Repetbutton(_ sender: UIButton)
    {
        invoice.backgroundColor = UIColor.productidbackgrouncolor()
        reepeat.backgroundColor = UIColor.textfiledbottomcolorside()
        Track.backgroundColor = UIColor.productidbackgrouncolor()
        Help.backgroundColor = UIColor.productidbackgrouncolor()
        
        let valueone = "Cartfianl"
        
//        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
//        popOverVC.alertTitleString = "Order"
//        popOverVC.alertMessageString = "Reason for canceling this order" as NSString
//        popOverVC.valueFinal = valueone as NSString
//        self.addChildViewController(popOverVC)
//        popOverVC.view.frame = self.view.frame
//        self.view.addSubview(popOverVC.view)
//        popOverVC.didMove(toParentViewController: self)
        
        self.totalcancelview.isHidden = false
        
        
    }
    @IBAction func Track(_ sender: UIButton)
    {
        invoice.backgroundColor = UIColor.productidbackgrouncolor()
        reepeat.backgroundColor = UIColor.productidbackgrouncolor()
        Track.backgroundColor = UIColor.textfiledbottomcolorside()
        Help.backgroundColor = UIColor.productidbackgrouncolor()
    }
    @IBAction func Help(_ sender: UIButton)
    {
        invoice.backgroundColor = UIColor.productidbackgrouncolor()
        reepeat.backgroundColor = UIColor.productidbackgrouncolor()
        Track.backgroundColor = UIColor.productidbackgrouncolor()
        Help.backgroundColor = UIColor.textfiledbottomcolorside()
        DispatchQueue.main.async
            {
            let ComplaintVCfinal = self.storyboard?.instantiateViewController(withIdentifier:"ComplaintVC")as!ComplaintVC
                self.present(ComplaintVCfinal, animated:true, completion:nil)
        }
    }
    
    @IBAction func cashbackviewtwoitems(_ sender: UIButton) {
    }
    @IBAction func viewthreeitems(_ sender: UIButton) {
    }
    
    
    
    @IBAction func Nobutton(_ sender: UIButton)
    {
        self.totalcancelview.isHidden = true

    }
    
    @IBAction func yesbutton(_ sender: UIButton)
    {
        DispatchQueue.main.async
            {
            let ComplaintVCfinal = self.storyboard?.instantiateViewController(withIdentifier:"CartViewController")as!CartViewController
                self.present(ComplaintVCfinal, animated:true, completion:nil)
        }
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
