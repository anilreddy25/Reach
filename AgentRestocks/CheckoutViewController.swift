//
//  CheckoutViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 18/09/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import LocalAuthentication
import Alamofire
import AlamofireImage

public  func convertStringtoArabic(_ paramString: String) -> String {
    var finalString: String = paramString
    finalString = finalString.replacingOccurrences(of: "٠", with: "0")
    finalString = finalString.replacingOccurrences(of: "١", with: "1")
    finalString = finalString.replacingOccurrences(of: "٢", with: "2")
    finalString = finalString.replacingOccurrences(of: "٣", with: "3")
    finalString = finalString.replacingOccurrences(of: "٤", with: "4")
    finalString = finalString.replacingOccurrences(of: "٥", with: "5")
    finalString = finalString.replacingOccurrences(of: "٦", with: "6")
    finalString = finalString.replacingOccurrences(of: "٧", with: "7")
    finalString = finalString.replacingOccurrences(of: "٨", with: "8")
    return finalString
}



class CheckoutViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate
{
    @IBOutlet weak var Topview: UIView!
    @IBOutlet weak var checkoutofthetwo: UILabel!
    @IBOutlet weak var from3sellerslabel: UILabel!
    @IBOutlet weak var totalamountlabel: UILabel!
    @IBOutlet weak var sixteenitemslabel: UILabel!
    @IBOutlet weak var quntitylabel: UILabel!
    @IBOutlet weak var dropbutton: UIButton!
    @IBOutlet weak var Cashdeliveryview: UIView!
    @IBOutlet weak var progressbar: UIProgressView!
    var profileprogressValue = 0.0
    var Agentstore = [String]()
    var AgentItems = [String]()
    var AgentQuantity = [String]()
    var AgentQuantityRupees = [String]()
    var AgentNumberMallShipment = [String]()
    var AgentNumberMallShipmentItems = [String]()
    var AgentNumberMallShipmentQuantity = [String]()
    var AgentNumberMallShipmentQuantityRupees = [String]()
    var AgentNumberMallShipmentcodLimitlabel = [String]()
    var AgentNumberMallShipmentExedLimitrupes = [String]()

   
    
    @IBOutlet weak var checkouttabelview: UITableView!
    
    @IBOutlet weak var confrimthisorder: UIButton!
    
    var selectedCells:[Int] = []
    var select_index : Int!
    
    
    @IBOutlet weak var rajakumartraders: UIButton!
    
    @IBOutlet weak var progressbartwo: UIProgressView!
    
    @IBOutlet weak var tabelviewtwo: UITableView!
    
    
    @IBOutlet weak var demoscrollview: UIScrollView!
    
    @IBOutlet weak var applaypromocode: UIButton!
    
    
    @IBOutlet weak var cashdeliverytwo: UIView!
    
    @IBOutlet weak var availabelcodLimit: UIView!
    
    @IBOutlet weak var fingerprintview: UIView!
    
    @IBOutlet weak var useauthorisationview: UIView!
    
    @IBOutlet weak var confirmorderfinalview: UIView!
    
    @IBOutlet weak var usepinview: UIView!
    
   
    
    @IBOutlet weak var pleaseplacefingerprint: UILabel!
    @IBOutlet weak var usetouchid: UILabel!
    
    @IBOutlet weak var usepin: UIButton!
    
    @IBOutlet weak var fingerprintbutton: UIButton!
    
    
    @IBOutlet weak var closebutton: UIButton!
    
    @IBOutlet weak var pinviewtwo: UIView!
    
    @IBOutlet weak var pintopview: UIView!
    
    @IBOutlet weak var textfiledone: UITextField!
    @IBOutlet weak var viewone: UIView!
    
    
    @IBOutlet weak var viewtwo: UIView!
    
    @IBOutlet weak var textfiledtwo: UITextField!
    
    @IBOutlet weak var viewthree: UIView!
    
    @IBOutlet weak var textfiledthree: UITextField!
    
    @IBOutlet weak var viewfour: UIView!
    
    @IBOutlet weak var textfiledfour: UITextField!
    
    @IBOutlet weak var viewfive: UIView!
    
    
    @IBOutlet weak var textfiledfive: UITextField!
    
    @IBOutlet weak var viewsix: UIView!
    
    @IBOutlet weak var textfiledsix: UITextField!
    
    @IBOutlet weak var closetwo: UIButton!
    
    @IBOutlet weak var forgetpin: UIButton!
    
    var timersingel = Timer()

    var CheckoutViewControllerstringfinal = String()
    

    
    /// sellers
    
    
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
    
    
//// text alignment
    
    var sellerscheckbox_text1 = [String]()

    var sellerscheckbox_text2 = [String]()

    var sellerscheckbox_text3 = [String]()

    var sellerscheckbox_text3_color1 = [String]()
    var sellerscheckbox_text3_color2 = [String]()

    
    var typesNsarryay = NSArray()
    
    
    var optionsTypesarrayfinal = NSArray()

    
    var sellerListTypesarrayfinal = NSArray()

    
    @IBOutlet weak var cashdeliverylabel: UILabel!
    
    var selleropinion = NSArray()
    
    
    var textone = NSArray()
    
    var texttwo = NSArray()
    
    var textthree = NSArray()

    
    @IBOutlet weak var numbermallshipment: UILabel!
    
    @IBOutlet weak var myrajakumartraders: UIButton!
    
    @IBOutlet weak var cashcollectiopn: UILabel!
    
    @IBOutlet weak var topviewfinal: UIView!
    
    @IBOutlet weak var demoscroolview: UIScrollView!
    
    @IBOutlet weak var demotwo: UIScrollView!
    
    @IBOutlet weak var conformthisorderfinalvalueis: UIButton!
    
    var fristtwo = String()
    
    var orginalpinvalue = String()

   var checkoputselectedint = Int()
    
    
    @IBOutlet weak var imagethumbvalue: UIImageView!
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
   
     //   self.perform(#selector(updateProgresstwo), with: nil, afterDelay: 0.01)

        Agentstore = ["Rajadhani traders","Rajadhani tradersfinalvalue"]
        AgentItems = ["2 items","4 items"]
        AgentQuantity = ["4 Qty","6 Qty"]
        AgentQuantityRupees = ["₹1,313.42","₹1,453.42"]
       
        AgentNumberMallShipment = ["Rajadhani traders"]
        AgentNumberMallShipmentItems = ["2 items"]
        AgentNumberMallShipmentQuantity = ["4 Qty"]
        AgentNumberMallShipmentQuantityRupees = ["- ₹1,986"]
        
        AgentNumberMallShipmentcodLimitlabel = ["₹15,000"]
        AgentNumberMallShipmentExedLimitrupes = ["₹25,000"]

//        demoscrollview.contentInset = UIEdgeInsetsMake(0, 0,self.demoscrollview.frame.size.height+100, 0)
//        demoscrollview.isScrollEnabled = true
//        demoscrollview.showsVerticalScrollIndicator = false
        progressbar.transform = progressbar.transform.scaledBy(x: 1, y:1.5)
        progressbartwo.transform = progressbartwo.transform.scaledBy(x: 1, y: 1.5)
        self.useauthorisationview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
           self.usepinview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)

        self.viewone.layer.cornerRadius = self.viewone.frame.size.width/2
        self.viewtwo.layer.cornerRadius = self.viewtwo.frame.size.width/2
        self.viewthree.layer.cornerRadius = self.viewthree.frame.size.width/2
        self.viewfour.layer.cornerRadius = self.viewfour.frame.size.width/2
        self.viewfive.layer.cornerRadius = self.viewfive.frame.size.width/2
        self.viewsix.layer.cornerRadius = self.viewsix.frame.size.width/2

        self.textfiledone.layer.cornerRadius = self.textfiledone.frame.size.width/2
        self.textfiledtwo.layer.cornerRadius = self.textfiledtwo.frame.size.width/2
        self.textfiledthree.layer.cornerRadius = self.textfiledthree.frame.size.width/2
        self.textfiledfour.layer.cornerRadius = self.textfiledfour.frame.size.width/2
        self.textfiledfive.layer.cornerRadius = self.textfiledfive.frame.size.width/2
        self.textfiledsix.layer.cornerRadius = self.textfiledsix.frame.size.width/2
        self.pintopview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        
        textfiledone.keyboardType = .asciiCapableNumberPad
        textfiledtwo.keyboardType = .asciiCapableNumberPad
        textfiledthree.keyboardType = .asciiCapableNumberPad
        textfiledfour.keyboardType = .asciiCapableNumberPad
        textfiledfive.keyboardType = .asciiCapableNumberPad
        textfiledsix.keyboardType = .asciiCapableNumberPad

        textfiledone.delegate = self
//        textfiledone.addTarget(self, action: #selector(CheckoutViewController.textFieldDidChange(_:)), for: .editingChanged)
//
        textfiledtwo.delegate = self
//        textfiledtwo.addTarget(self, action: #selector(CheckoutViewController.textFieldDidChange(_:)), for: .editingChanged)
//
        textfiledthree.delegate = self
//        textfiledthree.addTarget(self, action: #selector(CheckoutViewController.textFieldDidChange(_:)), for: .editingChanged)
        textfiledfour.delegate = self
//        textfiledfour.addTarget(self, action: #selector(CheckoutViewController.textFieldDidChange(_:)), for: .editingChanged)
        textfiledfive.delegate = self
//        textfiledfive.addTarget(self, action: #selector(CheckoutViewController.textFieldDidChange(_:)), for: .editingChanged)
        textfiledsix.delegate = self
//        textfiledsix.addTarget(self, action: #selector(CheckoutViewController.textFieldDidChange(_:)), for: .editingChanged)
//        
        textfiledone.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClicked))

         textfiledtwo.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClicked))
        textfiledthree.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClicked))
        textfiledfour.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClicked))
        textfiledfour.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClicked))
        textfiledfive.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClicked))
        textfiledsix.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClicked))

        DispatchQueue.main.async {
            self.checkoutadress()
        }
        
        let defaults = UserDefaults.standard
        if let MycartQuantity_qty_disp:String =  defaults.value(forKey:"MycartQuantity")as? String
        {
              self.sixteenitemslabel.text = MycartQuantity_qty_disp
        }
        if let Mytotal_cart_qty_disp:String =  defaults.value(forKey:"Mytotal_cart")as? String
        {
            self.totalamountlabel.text = Mytotal_cart_qty_disp
        }
        if let MyMycartCountdisp:String = defaults.value(forKey:"MycartCount")as? String
        {
          self.quntitylabel.text = String(format:"%@%@",MyMycartCountdisp,"Items")
        }
        
        
         self.topviewfinal.isHidden = true
        
      self.cashdeliverytwo.frame = CGRect(x:self.cashdeliverytwo.frame.origin.x, y: self.topviewfinal.frame.origin.y, width: self.cashdeliverytwo.frame.size.width, height: self.cashdeliverytwo.frame.size.height)

//        let bottomSheettwo = JXBottomSheetView(contentView:(demotwo)!)
//        bottomSheettwo.defaultMaxinumDisplayHeight  = 550
//        bottomSheettwo.defaultMininumDisplayHeight = 0
//        bottomSheettwo.displayState = .maxDisplay
//        bottomSheettwo.frame = self.view.bounds
//        self.view.addSubview(bottomSheettwo)
        
        let defaultstwo = UserDefaults.standard
    
        if let fristqty_disp:String = defaultstwo.value(forKey: "Myadressone") as? String {
            self.fristtwo = fristqty_disp
        }
        print(self.fristtwo)
        
       // self.pingerprintvalue()

        
        let CahttapView = UITapGestureRecognizer(target: self, action: #selector(self.chekcouthandleNumberChatview(_:)))
        imagethumbvalue.addGestureRecognizer(CahttapView)
        imagethumbvalue.isUserInteractionEnabled = true
        
        
    }
    @objc func chekcouthandleNumberChatview(_ sender: UITapGestureRecognizer)
    {
        print("hello there!.. You have clicked the touch ID")
        
        let myContext = LAContext()
        let myLocalizedReasonString = "Biometric Authntication testing !! "
        
        var authError: NSError?
        if #available(iOS 8.0, macOS 10.12.1, *) {
            if myContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
                myContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: myLocalizedReasonString) { success, evaluateError in
                    
                    DispatchQueue.main.async {
                        if success {
                            // User authenticated successfully, take appropriate action
                            //                            self.pleaseplacefingerprint.text = "User authenticated successfully "
                            
                            
                            self.pingerprintvalue()
                            
                        } else {
                            // User did not authenticate successfully, look at error and take appropriate action
                            self.pleaseplacefingerprint.text = "Sorry!!... User did not authenticate successfully"
                        }
                    }
                }
            } else {
                // Could not evaluate policy; look at authError and present an appropriate message to user
                pleaseplacefingerprint.text = "Sorry!!.. Could not evaluate policy."
            }
        } else {
            // Fallback on earlier versions
            
            pleaseplacefingerprint.text = "Ooops!!.. This feature is not supported."
        }
        
    }

    
    
    @objc func doneButtonClicked(_ sender: Any) {
        
   
        
        if textfiledone.text != "" && textfiledtwo.text != "" && textfiledthree.text != "" && textfiledfour.text != "" && textfiledfive.text != "" && textfiledsix.text != ""
         {
            timersingel = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerActioncheckout), userInfo: nil, repeats: false)
            
            
            
        }
      
        
    }
    @objc func timerActioncheckout()
    {
        DispatchQueue.main.async {
            let view = self.storyboard?.instantiateViewController(withIdentifier:"orederconfirmListViewController")as! orederconfirmListViewController
            self.present(view, animated:true, completion:nil)
            
        }
    }
    
//    @objc func textFieldDidChange(_ textField: UITextField?) {
//
//        if textField == textfiledone
//        {
//            textField?.backgroundColor = UIColor.red
//            textField?.textColor = UIColor.red
//viewone.backgroundColor =  UIColor.red
//        }
//        if textField == textfiledtwo
//        {
//            textField?.backgroundColor = UIColor.red
//            textField?.textColor = UIColor.red
//            viewtwo.backgroundColor =  UIColor.red
//
//
//        }
//        if textField == textfiledthree
//        {
//            textField?.backgroundColor = UIColor.red
//            textField?.textColor = UIColor.red
//            viewthree.backgroundColor =  UIColor.red
//
//        }
//        if textField == textfiledfour
//        {
//            textField?.backgroundColor = UIColor.red
//            textField?.textColor = UIColor.red
//            viewfour.backgroundColor =  UIColor.red
//
//        }
//        if textField == textfiledfive
//        {
//            textField?.backgroundColor = UIColor.red
//            textField?.textColor = UIColor.red
//            viewfive.backgroundColor =  UIColor.red
//
//        }
//        if textField == textfiledsix
//        {
//            textField?.backgroundColor = UIColor.red
//            textField?.textColor = UIColor.red
//            viewsix.backgroundColor =  UIColor.red
//
//        }
//
//
//    }
    @objc func updateProgress() {
        profileprogressValue = profileprogressValue + 0.01
        self.progressbar.progress = Float(profileprogressValue)
        progressbar.progress = 1.0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dropbutton(_ sender: UIButton)
    {
        if dropbutton.tag == 0
        {
            self.Cashdeliveryview.isHidden = true

            self.cashdeliverytwo.frame = CGRect(x:self.cashdeliverytwo.frame.origin.x, y: self.Cashdeliveryview.frame.origin.y, width: self.cashdeliverytwo.frame.size.width, height:self.cashdeliverytwo.frame.size.height)
            self.availabelcodLimit.isHidden = false
            self.availabelcodLimit.frame = CGRect(x:self.availabelcodLimit.frame.origin.x, y: self.availabelcodLimit.frame.origin.y, width: self.availabelcodLimit.frame.size.width, height:self.availabelcodLimit.frame.size.height)
             self.applaypromocode.frame = CGRect(x:self.applaypromocode.frame.origin.x, y: self.applaypromocode.frame.origin.y, width: self.availabelcodLimit.frame.size.width, height:self.availabelcodLimit.frame.size.height)
            
            dropbutton.tag = 1
            dropbutton.setBackgroundImage(#imageLiteral(resourceName: "dropdownvalue"), for:.normal)

        }
        else if dropbutton.tag == 1
        {
            self.Cashdeliveryview.isHidden = false
            self.availabelcodLimit.isHidden = true
          self.cashdeliverytwo.frame = CGRect(x:self.cashdeliverytwo.frame.origin.x, y: 237, width: self.cashdeliverytwo.frame.size.width, height:self.cashdeliverytwo.frame.size.height)
            self.availabelcodLimit.frame = CGRect(x:self.availabelcodLimit.frame.origin.x, y: self.availabelcodLimit.frame.origin.y, width: self.availabelcodLimit.frame.size.width, height:self.availabelcodLimit.frame.size.height)
            self.applaypromocode.frame = CGRect(x:self.applaypromocode.frame.origin.x, y: self.applaypromocode.frame.origin.y, width: self.availabelcodLimit.frame.size.width, height:self.availabelcodLimit.frame.size.height)
             dropbutton.tag = 0
            dropbutton.setBackgroundImage(#imageLiteral(resourceName: "angle-arrowup"), for:.normal)

        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int
    {
        if tableView == checkouttabelview
        {
              return 1
        }
        else{
             return 1
        }
      
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if tableView == checkouttabelview
        {
            return self.Agentstore.count
        }
        else
        {
            return self.sellerscheckbox_texttwo.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        if tableView == checkouttabelview
        {
        let cell : CheckoutTableViewCell = checkouttabelview.dequeueReusableCell(withIdentifier: "CheckoutTableViewCell", for: indexPath) as! CheckoutTableViewCell
//
//            cell.shopName.text = self.Agentstore[indexPath.row]
//            cell.itemslabel.text = self.AgentItems[indexPath.row]
//            cell.quantitylabel.text = self.AgentQuantity[indexPath.row]
//
//            cell.rupeeslabel.text = self.AgentQuantityRupees[indexPath.row]
//            cell.select_index = indexPath.row
//            if select_index != nil {
//                if select_index == 0 {
//                    cell.chekmarkimageview.image = #imageLiteral(resourceName: "verifiedred")
//
//                }
//                else if select_index == 1 {
//                    cell.chekmarkimageview.image = #imageLiteral(resourceName: "verifiedgreen")
//                }
//            }
//            else {
//                if self.selectedCells.contains(indexPath.row) {
//                    cell.chekmarkimageview.image = #imageLiteral(resourceName: "verifiedred")
//                }
//                else{
//                    cell.chekmarkimageview.image = #imageLiteral(resourceName: "verifiedgreen")
//                }
//
//            }
            
            
            
            return cell
        }
        else{
            let cell : checkouttabelviewtwoTableViewCell = tabelviewtwo.dequeueReusableCell(withIdentifier: "checkouttabelviewtwoTableViewCell", for: indexPath) as! checkouttabelviewtwoTableViewCell
   
            cell.shopName.text = self.sellerscheckbox_texttwo[indexPath.row] as? String
         cell.quantitylabel.text = self.sellerscheckbox_itemstwo[indexPath.row] as? String
      cell.itemslabel.text = self.sellerscheckbox_quantitytwo[indexPath.row] as? String
            cell.rupeeslabel.text = self.sellerscheckbox_amounttwo[indexPath.row] as? String
            
            
        
            
//              cell.codLimitlabel.text = self.AgentNumberMallShipmentcodLimitlabel[indexPath.row]
//            cell.ExedLimitrupes.text = self.AgentNumberMallShipmentExedLimitrupes[indexPath.row]

            cell.select_index = indexPath.row
            let  value = self.sellerscheckedtwo[indexPath.row]as?String
            if value == "1"
            {
                cell.chekcoutfinaltwo.setBackgroundImage(#imageLiteral(resourceName: "verifiedred"), for:.normal)
                cell.chekcoutfinaltwo.isSelected = false
            }
            else{
                cell.chekcoutfinaltwo.setBackgroundImage(#imageLiteral(resourceName: "box"), for:.normal)
                cell.chekcoutfinaltwo.isSelected = true

            }
            cell.chekcoutfinaltwo.tag = indexPath.row
            cell.chekcoutfinaltwo.addTarget(self, action: #selector(CheckoutViewController.Checkouttabelviewtwocheckout(sender:)), for: .touchUpInside)
            
            return cell
        }
       
    }
    
    @objc func Checkouttabelviewtwocheckout(sender: UIButton){
        let button = sender.tag
        let buttonTag = sender
        
        print(self.sellerscheckedtwo.count)
        print(self.sellerscheckedtwo)

        if(buttonTag.isSelected == true)
        {
           sender.setBackgroundImage(#imageLiteral(resourceName: "verifiedred"), for:.normal)
            self.checkoputselectedint  = button
            let value: Int = self.checkoputselectedint
            let string = String(describing: value)
            self.conformthisorderfinalvalueis.isHidden = false
            for i in 0..<self.sellerscheckedtwo.count {
                let add = self.sellerscheckedtwo[i]
                if i == self.checkoputselectedint {
//              self.sellerscheckedtwo[i] =  1
                }
            }
            buttonTag.isSelected = false
        }
        else  if(buttonTag.isSelected == false)
        {
            self.conformthisorderfinalvalueis.isHidden = true
            sender.setBackgroundImage(#imageLiteral(resourceName: "box"), for:.normal)
            buttonTag.isSelected = true
        }
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
      
        if tableView == checkouttabelview
        {
            self.select_index = nil
            if self.selectedCells.contains(indexPath.row) {
                
                self.selectedCells.remove(at: self.selectedCells.index(of: indexPath.row)!)
            } else {
                self.selectedCells.append(indexPath.row)
            }
            self.checkouttabelview.reloadData()
        }
        else{
            self.select_index = nil
            if self.selectedCells.contains(indexPath.row) {
                
                self.selectedCells.remove(at: self.selectedCells.index(of: indexPath.row)!)
            } else {
                self.selectedCells.append(indexPath.row)
            }
            self.tabelviewtwo.reloadData()
        }
        
    }
    
    
    @IBAction func Confrimthisorder(_ sender: UIButton)
    {
        self.demotwo.isHidden = false
        //self.demoscroolview.isHidden = false
                self.confirmorderfinalview.isHidden = false
                self.fingerprintview.isHidden = false
        self.pinviewtwo.isHidden = true
        self.demoscroolview.backgroundColor = UIColor.red
        let bottomSheettwo = JXBottomSheetView(contentView:(demotwo)!)
        bottomSheettwo.defaultMaxinumDisplayHeight  = self.view.frame.size.height
        bottomSheettwo.defaultMininumDisplayHeight = 0
        bottomSheettwo.displayState = .maxDisplay
        bottomSheettwo.frame = self.view.bounds
        self.view.addSubview(bottomSheettwo)
   self.confirmorderfinalview.isHidden = false
 self.fingerprintview.isHidden = false
    }
    @IBAction func applaypromocode(_ sender: UIButton)
    {
    }
    
    @IBAction func Rajakumartraders(_ sender: UIButton)
    {
    }
    @IBAction func usepinvalue(_ sender: UIButton)
    {
        self.confirmorderfinalview.isHidden = false
        self.pinviewtwo.isHidden = false
        self.fingerprintview.isHidden = true
        textfiledone.becomeFirstResponder()
    }
    @IBAction func Closebutton(_ sender: UIButton)
    {
        self.demotwo.isHidden = true
        self.confirmorderfinalview.isHidden = true
        self.fingerprintview.isHidden = true
        self.pinviewtwo.isHidden = true
        
        let bottomSheettwo = JXBottomSheetView(contentView:(demotwo)!)
        bottomSheettwo.defaultMaxinumDisplayHeight  = self.view.frame.size.height
        bottomSheettwo.defaultMininumDisplayHeight = 0
        bottomSheettwo.displayState = .minDisplay
        bottomSheettwo.frame = self.view.bounds
        self.view.addSubview(bottomSheettwo)
        }
    @IBAction func closetwo(_ sender: UIButton)
    {
        self.confirmorderfinalview.isHidden = true
        self.pinviewtwo.isHidden = true
        self.fingerprintview.isHidden = true
        self.demotwo.isHidden = true
        
        let bottomSheettwo = JXBottomSheetView(contentView:(demotwo)!)
        bottomSheettwo.defaultMaxinumDisplayHeight  = self.view.frame.size.height
        bottomSheettwo.defaultMininumDisplayHeight = 0
        bottomSheettwo.displayState = .minDisplay
        bottomSheettwo.frame = self.view.bounds
        self.view.addSubview(bottomSheettwo)
        
    }
   
    func checkoutadress()
    {
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        //   let postString = "method=landingPage&userid=511111117"
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.CheckoutViewControllerstringfinal = Reviewfinaluseroid
        }
        print(self.CheckoutViewControllerstringfinal)
        let postString =  String(format: "method=%@&userid=%@","checkoutSummary",self.CheckoutViewControllerstringfinal)
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
                    
                    
                    if let sellers_header_qty_disp = dict.value(forKey: "sellers_header") as? String {
                        self.sellers_header = sellers_header_qty_disp
                        self.from3sellerslabel.text =  self.sellers_header
                    }

                    
                    if let typesNsarryayfinal:NSArray = dict.value(forKey: "types") as? NSArray {
                        self.types = typesNsarryayfinal
                    }
                    
                    let dictfinalvalue = self.types[0] as! NSDictionary
                    
                    print(dictfinalvalue)
                    
                    
                    if let typesNsarryayfinal:NSArray = dictfinalvalue.value(forKey: "options") as? NSArray {
                        self.optionsTypesarrayfinal = typesNsarryayfinal
                    }
                    print(self.optionsTypesarrayfinal)

                    print(self.optionsTypesarrayfinal)
                    if let sellerListTypesarrayfinalarryayfinal:NSArray =  self.optionsTypesarrayfinal.value(forKey: "sellersList") as? NSArray {
                        self.sellerListTypesarrayfinal = sellerListTypesarrayfinalarryayfinal
                    }
                    
                    print(self.sellerListTypesarrayfinal)
                    
                    if let sellersidarryayfinal:NSArray =  self.sellerListTypesarrayfinal.value(forKey: "id") as? NSArray {
                        self.sellersid = sellersidarryayfinal
                    }
                    print(self.sellersid)

                    
                    if let sellerscheckedarryayfinal:NSArray =  self.sellerListTypesarrayfinal.value(forKey: "checked") as? NSArray  {
                        self.sellerschecked = sellerscheckedarryayfinal
                    }
                    if let sellerscheckbox_textarryayfinal:NSArray =  self.sellerListTypesarrayfinal.value(forKey: "checkbox_text") as? NSArray  {
                        self.sellerscheckbox_text = sellerscheckbox_textarryayfinal
                    }
                 
                    
                    print(self.sellerscheckbox_text)
                    
                    
                    if let sellerscheckbox_itemsarryayfinal:NSArray =  self.sellerListTypesarrayfinal.value(forKey: "items") as? NSArray {
                        self.sellerscheckbox_items = sellerscheckbox_itemsarryayfinal
                    }
                    
                    if let sellerscheckbox_quantityarryayfinal:NSArray =  self.sellerListTypesarrayfinal.value(forKey: "quantity") as? NSArray  {
                        self.sellerscheckbox_quantity = sellerscheckbox_quantityarryayfinal
                    }
                    if let sellerscheckbox_amountarryayfinal:NSArray =  self.sellerListTypesarrayfinal.value(forKey: "amount") as? NSArray {
                        self.sellerscheckbox_amount = sellerscheckbox_amountarryayfinal as NSArray
                    }
                
                    self.sellersidtwo =  self.sellersid[0] as! NSArray
                    self.sellerscheckedtwo =  self.sellerschecked[0] as! NSArray
                    self.sellerscheckbox_texttwo =  self.sellerscheckbox_text[0] as! NSArray
                    self.sellerscheckbox_itemstwo =  self.sellerscheckbox_items[0] as! NSArray
                 self.sellerscheckbox_quantitytwo =  self.sellerscheckbox_quantity[0] as! NSArray
                      self.sellerscheckbox_amounttwo =  self.sellerscheckbox_amount[0] as! NSArray
                   
                    
                    
                    
                    if let sellerscheckbox_text1arryayfinal:[String] =  self.sellerListTypesarrayfinal.value(forKey: "limit_text1") as? [String]
                    {
                        self.sellerscheckbox_text1 = sellerscheckbox_text1arryayfinal
                    }
                    
                    if let sellerscheckbox_text2arryayfinal:[String] =  self.sellerListTypesarrayfinal.value(forKey: "limit_text2") as? [String]  {
                        self.sellerscheckbox_text2 = sellerscheckbox_text2arryayfinal
                    }
                    if let sellerscheckbox_text2arryayfinal:[String] =  self.sellerListTypesarrayfinal.value(forKey: "limit_text3") as? [String]  {
                        self.sellerscheckbox_text2 = sellerscheckbox_text2arryayfinal
                    }
                    if let sellerscheckbox_text3_color1arryayfinal:[String] =  self.sellerListTypesarrayfinal.value(forKey: "limit_text2_color") as? [String]  {
                        self.sellerscheckbox_text3_color1 = sellerscheckbox_text3_color1arryayfinal
                    }
                    
                    if let sellerscheckbox_text3_color2arryayfinal:[String] =  self.sellerListTypesarrayfinal.value(forKey: "limit_text3_color") as? [String]  {
                        self.sellerscheckbox_text3_color2 = sellerscheckbox_text3_color2arryayfinal
                    }
                    print(self.optionsTypesarrayfinal.value(forKey: "option"))
                    if let selleropinionarryayfinal:NSArray =  self.optionsTypesarrayfinal.value(forKey: "option") as? NSArray  {
                        self.selleropinion = selleropinionarryayfinal
                        self.cashdeliverylabel.text =  self.selleropinion[0] as? String
                        
                    }
                    
                    if let selleropinionarryayfinal:NSArray =  self.optionsTypesarrayfinal.value(forKey: "option") as? NSArray  {
                        self.selleropinion = selleropinionarryayfinal
                        self.cashdeliverylabel.text =  self.selleropinion[0] as? String
                        
                    }
                    
                    
                    
                    if let text1arryayfinal:NSArray =  self.types.value(forKey: "text1") as? NSArray
                    {
                        self.textone = text1arryayfinal
                        self.numbermallshipment.text = self.textone[0] as? String
                    }
                    
                    if let texttwoarryayfinal:NSArray =  self.types.value(forKey: "text2") as? NSArray
                    {
                        self.texttwo = texttwoarryayfinal
                        self.cashcollectiopn.text = self.texttwo[0] as? String
                    }
                    
                    if let text3arryayfinal:NSArray =  self.types.value(forKey: "text3") as? NSArray
                    {
                        self.textthree = text3arryayfinal
                        self.myrajakumartraders.setTitle( self.textthree[0] as? String, for:.normal)
                    }
                    
                    DispatchQueue.main.async {
                        self.tabelviewtwo.reloadData()
//                        self.checkouttabelview.reloadData()

                    }

                }
               
                break
            case .failure(_):
                break
            }
            
        }
    }
    
    
    
    
    func pingerprintvalue()
    {
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        //   let postString = "method=landingPage&userid=511111117"
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.CheckoutViewControllerstringfinal = Reviewfinaluseroid
        }
//        {"method":"makePayment","pin":"986532","Promo":"","addressID":"1852","paymentIDS":"[1]","userid":"69839"}
        
        
//        "method=makePayment&pin="+pin+"&Promo="+st+"&addressID="+ClassicSingleton.selectedAddress+"&paymentIDS="+getIDS()+"&userid="+userId;
//
//
        /// https://asrt.gluege.boerde.de//
        print(self.CheckoutViewControllerstringfinal)
        
    let value = self.sellersidtwo[0]
       
        print(value)
        
        let aStr = String(format: "%@%@%@", "[",value as! CVarArg,"]")
        print(aStr)
    let postString =  String(format: "method=%@&pin=%@@&Promo=%@&addressID=%@&paymentIDS=%@&userid=%@","makePayment","xxxxxx","",fristtwo,aStr,self.CheckoutViewControllerstringfinal)
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
                    
            DispatchQueue.main.async {
                let OrderDoneView = self.storyboard?.instantiateViewController(withIdentifier:"OrderDoneViewController")as!OrderDoneViewController
                self.present(OrderDoneView, animated:true, completion:nil)
                    }
                }
                
                break
            case .failure(_):
                break
            }
            
        }
    }
    @IBAction func fingerprintfinal(_ sender: UIButton)
    {
        print("hello there!.. You have clicked the touch ID")
        
        let myContext = LAContext()
        let myLocalizedReasonString = "Biometric Authntication testing !! "
        
        var authError: NSError?
        if #available(iOS 8.0, macOS 10.12.1, *) {
            if myContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
                myContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: myLocalizedReasonString) { success, evaluateError in
                    
                    DispatchQueue.main.async {
                        if success {
                            // User authenticated successfully, take appropriate action
//                            self.pleaseplacefingerprint.text = "User authenticated successfully "

                            
                          self.pingerprintvalue()
                            
                        } else {
                            // User did not authenticate successfully, look at error and take appropriate action
                            self.pleaseplacefingerprint.text = "Sorry!!... User did not authenticate successfully"
                        }
                    }
                }
            } else {
                // Could not evaluate policy; look at authError and present an appropriate message to user
                pleaseplacefingerprint.text = "Sorry!!.. Could not evaluate policy."
            }
        } else {
            // Fallback on earlier versions
            
            pleaseplacefingerprint.text = "Ooops!!.. This feature is not supported."
        }
        
        
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        var result = true
//            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")
//            let characterSet = CharacterSet(charactersIn: string)
//            let maxLength = 1
//            let currentString: NSString = textField.text! as NSString
//            let newString: NSString =
//                currentString.replacingCharacters(in: range, with: string) as NSString
//
//            return allowedCharacters.isSuperset(of: characterSet) && newString.length <= maxLength
//
//        return result
//    }
    @IBAction func forgetopin(_ sender: UIButton)
    {
        let forgetview = self.storyboard?.instantiateViewController(withIdentifier:"ForgotPasswordVC")as!ForgotPasswordVC
        self.present(forgetview, animated: true, completion:nil)
    }
    
    @IBAction func Mybackbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    
    @IBAction func Confoirmthisordervalue(_ sender: UIButton)
    {
        self.demotwo.isHidden = false
        self.confirmorderfinalview.isHidden = false
        self.fingerprintview.isHidden = false
        self.pinviewtwo.isHidden = true
        let bottomSheettwo = JXBottomSheetView(contentView:(demotwo)!)
        bottomSheettwo.defaultMaxinumDisplayHeight  = self.view.frame.size.height
        bottomSheettwo.defaultMininumDisplayHeight = 0
        bottomSheettwo.displayState = .maxDisplay
        bottomSheettwo.frame = self.view.bounds
        self.view.addSubview(bottomSheettwo)
         self.pleaseplacefingerprint.text = "Please place your fingertip on the scanner to verify your identity"
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if ((textField.text?.count)! < 1 ) && (string.count > 0) {
            if textField == textfiledone {
                textfiledone.backgroundColor = UIColor.red
                textfiledone.textColor = UIColor.red
                viewone.backgroundColor =  UIColor.red
                textfiledtwo.becomeFirstResponder()
            }
            
            if textField == textfiledtwo
            {
                textfiledtwo.backgroundColor = UIColor.red
                textfiledtwo.textColor = UIColor.red
                viewtwo.backgroundColor =  UIColor.red
                textfiledthree.becomeFirstResponder()
            }
            
            if textField == textfiledthree
            {
                textfiledthree.backgroundColor = UIColor.red
                textfiledthree.textColor = UIColor.red
                viewthree.backgroundColor =  UIColor.red
                textfiledfour.becomeFirstResponder()
            }
            
            if textField == textfiledfour
            {
                textfiledfour.backgroundColor = UIColor.red
                textfiledfour.textColor = UIColor.red
                viewfour.backgroundColor =  UIColor.red
                textfiledfive.becomeFirstResponder()
            }
            
            if textField == textfiledfive
            {
                textfiledfive.backgroundColor = UIColor.red
                textfiledfive.textColor = UIColor.red
                viewfive.backgroundColor =  UIColor.red
                textfiledsix.becomeFirstResponder()
            }
            if textField == textfiledsix
            {
                textfiledsix.backgroundColor = UIColor.red
                textfiledsix.textColor = UIColor.red
                viewsix.backgroundColor =  UIColor.red
                textfiledsix.resignFirstResponder()
            }
            
            textField.text = string

            if (textfiledone.text?.count)! > 0 && (textfiledtwo.text?.count)! > 0 &&  (textfiledthree.text?.count)! > 0 && (textfiledfour.text?.count)! > 0 &&  (textfiledfive.text?.count)! > 0 && (textfiledsix.text?.count)! > 0
            {
                let stringNewpin = NSString(format:"%@%@%@%@%@%@",textfiledone.text!,textfiledtwo.text!,textfiledthree.text!,textfiledfour.text!,textfiledfive.text!,textfiledsix.text!)
                print(stringNewpin)
               
                let defaultsfinalvalue = UserDefaults.standard
                if let Description_qty_disp:String = defaultsfinalvalue.value(forKey: "Mypinvalue") as? String {
                    self.orginalpinvalue = Description_qty_disp
                }
                
                print(defaultsfinalvalue.value(forKey: "Mypinvalue"))
                print(self.orginalpinvalue)
                print(stringNewpin)

                if stringNewpin as String ==  self.orginalpinvalue
                {
                    DispatchQueue.main.async {
                        self.Resetprintvalue()
                    }
                }
                
                else
                {
                    self.textfiledone.backgroundColor = UIColor.textfiledbottomcolorside()
                   self.textfiledone.textColor = UIColor.textfiledbottomcolorside()
                    self.viewone.backgroundColor =  UIColor.textfiledbottomcolorside()
                     self.textfiledone.text = ""
                    
                    self.textfiledtwo.backgroundColor = UIColor.textfiledbottomcolorside()
                    self.textfiledtwo.textColor = UIColor.textfiledbottomcolorside()
                    self.viewtwo.backgroundColor =  UIColor.textfiledbottomcolorside()
                    self.textfiledtwo.text = ""
                    

                    self.textfiledthree.backgroundColor = UIColor.textfiledbottomcolorside()
                    self.textfiledthree.textColor = UIColor.textfiledbottomcolorside()
                    self.viewthree.backgroundColor =  UIColor.textfiledbottomcolorside()
                    self.textfiledthree.text = ""
                    

                    self.textfiledfour.backgroundColor = UIColor.textfiledbottomcolorside()
                    self.textfiledfour.textColor = UIColor.textfiledbottomcolorside()
                    self.viewfour.backgroundColor =  UIColor.textfiledbottomcolorside()
                    self.textfiledfour.text = ""

                  
                    self.textfiledfive.backgroundColor = UIColor.textfiledbottomcolorside()
                    self.textfiledfive.textColor = UIColor.textfiledbottomcolorside()
                    self.viewfive.backgroundColor =  UIColor.textfiledbottomcolorside()
                    self.textfiledfive.text = ""

                    
                    self.textfiledsix.backgroundColor = UIColor.textfiledbottomcolorside()
                    self.textfiledsix.textColor = UIColor.textfiledbottomcolorside()
                    self.viewsix.backgroundColor =  UIColor.textfiledbottomcolorside()
                    
                    self.textfiledsix.text = ""
                    self.demotwo.isHidden = true
                    self.confirmorderfinalview.isHidden = true
                    self.fingerprintview.isHidden = true
                    self.pinviewtwo.isHidden = true

                    let bottomSheettwo = JXBottomSheetView(contentView:(demotwo)!)
                    bottomSheettwo.defaultMaxinumDisplayHeight  = self.view.frame.size.height
                    bottomSheettwo.defaultMininumDisplayHeight = 0
                    bottomSheettwo.displayState = .minDisplay
                    bottomSheettwo.frame = self.view.bounds
                    self.view.addSubview(bottomSheettwo)
                    

                    let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
                    popOverVC.alertMessageString = "Login Failed"
                    popOverVC.alertTitleString = "Alert"
                    self.addChildViewController(popOverVC)
                    popOverVC.view.frame = self.view.frame
                    self.view.addSubview(popOverVC.view)
                    popOverVC.didMove(toParentViewController: self)
                    
//                    self.textfiledone.becomeFirstResponder()
                    
                }
        }
            
             return false
        }
        else if ((textField.text?.count)! >= 1) && (string.count == 0)
        {
            if textField == textfiledone
            {
                textfiledone.backgroundColor = UIColor.lightGray
                textfiledone.textColor = UIColor.lightGray
                viewone.backgroundColor =  UIColor.lightGray
                textfiledone.resignFirstResponder()
            }
            
            if textField == textfiledtwo
            {
                textfiledtwo.backgroundColor = UIColor.lightGray
                textfiledtwo.textColor = UIColor.lightGray
                viewtwo.backgroundColor =  UIColor.lightGray
                textfiledone.becomeFirstResponder()
                
            }
            
            if textField == textfiledthree {
                textfiledthree.backgroundColor = UIColor.lightGray
                textfiledthree.textColor = UIColor.lightGray
                viewthree.backgroundColor =  UIColor.lightGray
                textfiledtwo.becomeFirstResponder()
                
                
            }
            
            if textField == textfiledfour
            {
                textfiledfour.backgroundColor = UIColor.lightGray
                textfiledfour.textColor = UIColor.lightGray
                viewfour.backgroundColor =  UIColor.lightGray
                textfiledthree.becomeFirstResponder()
            }
            
            if textField == textfiledfive
            {
                textfiledfive.backgroundColor = UIColor.lightGray
                textfiledfive.textColor = UIColor.lightGray
                viewfive.backgroundColor =  UIColor.lightGray
                textfiledfour.becomeFirstResponder()
            }
            if textField == textfiledsix
            {
                textfiledsix.backgroundColor = UIColor.lightGray
                textfiledsix.textColor = UIColor.lightGray
                viewsix.backgroundColor =  UIColor.lightGray
//                textfiledfive.becomeFirstResponder()
                
                textfiledfive.becomeFirstResponder()

            }
            textField.text = ""
            return false
            
        }
        else if (textField.text?.count)! >= 1
        {
            textField.text = string
            return false
        }
        
        return true
    }
    func Resetprintvalue()
    {
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        //   let postString = "method=landingPage&userid=511111117"
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.CheckoutViewControllerstringfinal = Reviewfinaluseroid
        }
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }

        let stringNewpin = NSString(format:"%@%@%@%@%@%@",textfiledone.text!,textfiledtwo.text!,textfiledthree.text!,textfiledfour.text!,textfiledfive.text!,textfiledsix.text!)
        print(stringNewpin)
        let value = self.sellersidtwo[0]
        
        print(value)
        
        let aStr = String(format: "%@%@%@", "[",value as! CVarArg,"]")
        print(aStr)
        let postString =  String(format: "method=%@&pin=%@@&Promo=%@&addressID=%@&paymentIDS=%@&userid=%@","makePayment",stringNewpin,"",fristtwo,aStr,self.CheckoutViewControllerstringfinal)
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
                    
                    DispatchQueue.main.async {
                        let OrderDoneView = self.storyboard?.instantiateViewController(withIdentifier:"OrderDoneViewController")as!OrderDoneViewController
                        self.present(OrderDoneView, animated:true, completion:nil)
                       
                    }
                }
                
                break
            case .failure(_):
                break
            }
            
        }
    }

//    @IBAction func chekcoutfinalvalue(_ sender: UIButton) {
//    }
    
    }
    
extension CheckoutViewController: UIGestureRecognizerDelegate
{
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
