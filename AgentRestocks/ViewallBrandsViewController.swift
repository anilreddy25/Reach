//
//  ViewallBrandsViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 20/08/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import Alamofire
import IQKeyboardManagerSwift

class ViewallBrandsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate,UIScrollViewDelegate
{
    @IBOutlet weak var topbrandview: UIView!
    @IBOutlet weak var Backview: UIView!
    @IBOutlet weak var Back: UIButton!
    @IBOutlet weak var Viewallbrandtabelview: UITableView!
    var Brandtaeblviewiamgeview = [UIImage]()
    var New_BrandItem = [String]()
    var NewBrandsimage = [UIImage]()
    var NewBrandsName = [String]()
    var addbuttonimage = [UIImage]()
    var NewBrandimagefinalvalue = [UIImage]()
    var QuantityProduct = [String]()
    var ProductPicks = [String]()
    var Explorecatageory_item = [String]()
    var ExploreBrand_image = [UIImage]()
    var ExploreBrand_Name = [String]()
    var  Abcdelements = [String]()
    var userQnty = [String]()
    var messageStockOut = String()
    var stockOutTitel = String()
    var producidclikHOMEstring = String()
    var timer = Timer()
    var productItems =  [String]()
    var itemDays =  [String]()
    var stockIn =  [String]()
    var cashBackfinal = [String]()
    var cashBackfinalTwo = NSString()
    var Recomendedname1 = String()
    @IBOutlet weak var mainPopAddView: UIView!
    @IBOutlet weak var adpopScrollView: UIScrollView!
    @IBOutlet weak var addStockView: UIView!
    @IBOutlet weak var lblMOCqty: UILabel!
    @IBOutlet weak var lblanotherQnty: UILabel!
    @IBOutlet weak var headerViewSold: UIView!
    @IBOutlet weak var lblSellerName: UILabel!
    @IBOutlet weak var tableSellerValue: UITableView!
    @IBOutlet weak var finalView: UIView!
    @IBOutlet weak var lblInStock: UILabel!
    @IBOutlet weak var stockTextField: UITextField!
    @IBOutlet weak var btnSellerName: UIButton!
    @IBOutlet weak var btnSellerID: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var btnAddCart: UIButton!
    @IBOutlet weak var topPickerView: UIView!
    var NewproductLauncharray = NSArray()
    var NEwproductIMage = [String]()
    var NEwproductItems = [String]()
    var Newproductoutlets = [String]()
    var NewproductsInstack = [String]()
    var NewproductsoffTakeDisplay = [String]()
    var NewproductsoffTake = [String]()
    var Newproductdays = [String]()
    var Newproduct_dealsstruck = [String]()
    var NewproductlabelMrp = [String]()
    var AvailabelQuantity = [String]()
    var ProductidValue = [String]()
    var producidclikstring = String()
    var soldSellerArray = NSArray()
    var soldSellerID = NSArray()
    var homeSoldFullFill = NSArray()
    var NewProductMOQ = [String]()
    var NewProductExculise = [String]()
    
    var dealEndtime1 = Int()
    var dealEndtimetwo = [NSNumber]()
    var timerIsOn = false
    var timeValue = Int()
    var coverView = UIView()
    var imageView = UIImageView()
    var modelData = [String]()
    let customWidth:CGFloat = 100
    let customHeight:CGFloat = 100
    var di_count = 1
    var rotationAngle:CGFloat!
    
    
    @IBOutlet weak var lblTimertext: UILabel!
    
    @IBOutlet weak var Recomendedproduct: UILabel!
    var statusLikeviewall = NSNumber()
    
    var favouritestring = [String]()
    var valueDays = Int()
     var useridbiling = String()
    
    var viewstatusLikeviewall = NSNumber()
    @IBOutlet weak var viewBrandtabelview: UITableView!
    
    var viewallproducidclikHOMEstring = String()
    
    
    var viewalluseridbilingvaluesingel = String()
    
      var viewallHomestatusLikeviewallone = NSNumber()
    
    var productidtotalvalue = String()
    
    var productdescriptionViewall = String()
    var userquantioty = [String]()
    
    
    var viewone = UIView()
    var NEwproductCODDisplay = [String]()

    
    var Bulkarray = NSArray()
    
    var LTSarray = NSArray()
    
    var SchemeSarray = NSArray()
    var comboSarray = NSDictionary()
    
    
    var LTsDisplay = String()
    var BulkDisplay = String()
    var ComboDisplay = String()
    var scheme_display = String()
    var LTsName = String()
    var BulkNAme = String()
    var ComboName = String()
    var scheme_name = String()

    var ssold_filledbyarray = NSArray()
    var ssold_filledbyNoramlarray = NSArray()
    var sold_filledbyIdarray = [String]()
    var sold_filledbydefarray = [String]()
    var sold_filledbydiscriptionarray = [String]()
    var sold_filledbyheroarray = [String]()
    var sold_filledbynamearray = [String]()
    var sold_filledbyseller_idarray = [String]()
    
    var Homeuseridstringvalue = String()
    
    var postStringfinalvalue = String()

    
    var particularadd = String()
    var percentLL = String()
  
    @IBOutlet weak var soldfillfiledbystring: UILabel!
    
    let  ViewallHomecellReuseIdentifier = "cell"

    @IBOutlet weak var soldview: UIView!
    
    @IBOutlet weak var soldtabelview: UITableView!
    var cellerid = String()

    var user_updatevalue = String()

    var selectedint :Int?

   var viewallQuantity = String()
    
    var VisibleIndexquntity:IndexPath = IndexPath(row: 0, section: 0)

    var index = Int()

    
    @IBOutlet weak var cartcountlabel: UILabel!
    
    var cartcount = NSNumber()

    
    @IBOutlet weak var cartcountbuttonvalue: UIButton!
    
    
    
    
    ///// view all popscreen Design
    
    
    @IBOutlet weak var viewallpopview: UIView!
    @IBOutlet weak var viewallTop: UIView!
    @IBOutlet weak var selectmargintabelview: UITableView!
    @IBOutlet weak var viewallbottomview: UIView!
    @IBOutlet weak var menuview: UIView!
    @IBOutlet weak var viewallcancelbutton: UIButton!
    @IBOutlet weak var viewallokbutton: UIButton!
    @IBOutlet weak var singviewallpopview: UIView!
    var Langagefinalstring = [String]()
    var selectimagestring = [UIImage]()
    var selectedIndex :Int?
   
    @IBOutlet weak var singelpopupscrollview: UIScrollView!
    
    
    @IBOutlet weak var demototalview: UIView!
    
    
    var NewBrandofferprize = [String]()
    
    let null = NSNull()
    
    var ViewallTotalfinal = UIView()
    
    @IBOutlet weak var myrecomendedview: UIImageView!
    
    @IBOutlet weak var labelinstacklabel: UILabel!
    
    @IBOutlet weak var instackview: UIView!
    @IBOutlet weak var demotwo: UIView!
    
    @IBOutlet weak var Totaldemoviewfinal: UIView!
    
    @IBOutlet weak var Totalview: UIView!
    
    
 var celldealEndtime = [Int]()

    var celldealEndtimeone = Int()

    var viewalltimer = Timer()
    
    var viewalltimerIsOn = false

  var AcessTokenfinalstring = String()
    
  var myagentTotalvalue = String()
    
   
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.index = 0
        Langagefinalstring  = ["COD - 15% for cash on delivery","7D - 14% for 7 days credit","15D - 13% for 15 days credit","30D - 11% for 30 days credit"]
        selectimagestring = [#imageLiteral(resourceName: "TickMark"),#imageLiteral(resourceName: "TickMark"),#imageLiteral(resourceName: "TickMark"),#imageLiteral(resourceName: "TickMark")]
      self.topbrandview.layer.addShadow()
        lblTimertext.layer.cornerRadius = 5.0
        viewBrandtabelview.showsVerticalScrollIndicator = true
        if Recomendedname1 == "TodayDeals"
        {
            Recomendedproduct.frame = CGRect(x: self.view.frame.origin.x + 70, y: 0, width: self.view.frame.size.width, height: 15)
            Recomendedproduct.font = UIFont(name: "Arial", size: 14.5)
            Recomendedproduct.text = Recomendedname1
            self.lblTimertext.text = self.stringFromTimeInterval(interval: TimeInterval(self.dealEndtime1)) as String
            if !timerIsOn
            {
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countDowntwo), userInfo: nil, repeats: true)
                timerIsOn = true
                
                print(timer)
                print(timerIsOn)
            }
        }else{
            Recomendedproduct.text = Recomendedname1
            lblTimertext.isHidden = true
        }
        rotationAngle = -90 * (.pi/180)
        
        let originalFrame = pickerView.frame
        pickerView.delegate = self
        pickerView.transform =  CGAffineTransform(rotationAngle: rotationAngle)
        pickerView.frame = originalFrame
        modelData = ["0","1","2","3","4","5","6","7","8","9","10+"]
        
        stockTextField.delegate = self
        stockTextField.addTarget(self, action: #selector(ViewallBrandsViewController.textFieldDidChange(_:)), for: .editingChanged)
        
        
        
        DispatchQueue.main.async {
            self.ViewallProducts()
        }
        
         self.soldtabelview.register(UITableViewCell.self, forCellReuseIdentifier: ViewallHomecellReuseIdentifier)
        
        let defaults = UserDefaults.standard
        
        if let Mycartcountvalue:NSNumber = defaults.value(forKey:"Mycartcountstring")as?NSNumber
        {
            self.cartcountlabel.text = Mycartcountvalue.stringValue
            self.cartcountlabel.isHidden = false
            self.cartcountlabel.layer.cornerRadius = 6.0
            self.cartcountlabel.layer.masksToBounds = true
            //            self.cartlabelsingel.roundCorners([.topLeft, .topRight], radius: 5)
            //            self.cartbuttonfinalvalue.setBackgroundImage(#imageLiteral(resourceName: "cartfilled"), for:.normal)
        }
        else
        {
            self.cartcountlabel.isHidden = true
            self.cartcountbuttonvalue.setBackgroundImage(#imageLiteral(resourceName: "Cart"), for:.normal)
        }
        
        
        self.menuview.layer.cornerRadius = 6.0
       self.menuview.layer.masksToBounds = true
        
        self.viewallTop.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        self.viewallbottomview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.8)

        self.viewallpopview.roundedButton()
        self.viewallTop.roundedButton()

        self.selectmargintabelview.dataSource = self
        self.selectmargintabelview.delegate = self
        self.addStockView.roundedButton()
        
        cartcountlabel.layer.cornerRadius = cartcountlabel.frame.size.width/2
        cartcountlabel.layer.masksToBounds = true
        self.instackview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        topbrandview.layer.shadowOffset = CGSize(width: 0, height: 3)
        topbrandview.layer.shadowOpacity = 0.6
        topbrandview.layer.shadowRadius = 3.0
        topbrandview.layer.shadowColor = UIColor.color2().cgColor
        
        
        
        let markettap = UITapGestureRecognizer(target: self, action: #selector(self.markethandleTapContactfinalvalueviewall(_:)))
        
        Totaldemoviewfinal.addGestureRecognizer(markettap)
        
        Totaldemoviewfinal.isUserInteractionEnabled = true
        
        self.Totalview.layer.cornerRadius = 12.0
        self.Totalview.layer.masksToBounds = true

    }

    @objc func markethandleTapContactfinalvalueviewall(_ sender: UIGestureRecognizer)
    {
        self.Totaldemoviewfinal.isHidden = true
        self.Totalview.isHidden = true
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.pickerView.selectRow(1, inComponent: 0, animated: true)
        
    }
    
    
    
    @IBAction func viewallback(_ sender: UIButton)
    {
        self.ViewallTotalfinal.isHidden = true
        let defaults = UserDefaults.standard
        defaults.set("delete", forKey:"Mydelete")
        defaults.synchronize()
        self.viewone.isHidden = true
        self.view.removeFromSuperview()

    }
    @IBAction func searchbutton(_ sender: UIButton)
    {
        self.Totaldemoviewfinal.isHidden = false
        self.Totalview.isHidden = false
    }
    
    
    @IBAction func btnAddCartAction(_ sender: UIButton)
    {
        self.adpopScrollView.isHidden  = true
        let bottomSheet = JXBottomSheetView(contentView:self.adpopScrollView as! UIScrollView)
        bottomSheet.defaultMaxinumDisplayHeight  =  0
        bottomSheet.defaultMininumDisplayHeight = 0
        //bottomSheet.defaultMininumDisplayHeight = 240
        bottomSheet.displayState = .minDisplay
        
        bottomSheet.frame = self.view.bounds
        self.view.addSubview(bottomSheet)
     
            DispatchQueue.main.async
                {
                    self.viewalladdtoanotherquantitylabel()
            }
    }
    
    @IBAction func Cart(_ sender: UIButton)
    {
    let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"CartViewController")as!CartViewController
        self.present(viewfinal, animated: true, completion:nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == viewBrandtabelview
        {
            return self.NewproductLauncharray.count

        }
        if tableView == selectmargintabelview
        {
            return self.Langagefinalstring.count
            
        }
        else
        {
                return self.sold_filledbynamearray.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if tableView == viewBrandtabelview
        {
            let cell  = viewBrandtabelview.dequeueReusableCell(withIdentifier: "ViewallBrandTableViewCell", for: indexPath) as! ViewallBrandTableViewCell
            cell.selectionStyle = .none
            
            let Newprodcutoff_Takefinal = self.NewproductsoffTake[indexPath.row]
            if  Newprodcutoff_Takefinal.count == 0
            {
                cell.lblDays.isHidden = true
                cell.imgArrow.isHidden = true
                cell.lblStock.frame = CGRect(x: cell.lblDays.frame.origin.x, y: cell.lblDays.frame.origin.y, width: cell.lblStock.frame.size.width, height: cell.lblStock.frame.size.height)
                
            }
            if Newprodcutoff_Takefinal.count > 1
            {
                cell.imgArrow.isHidden = false
                cell.lblDays.text = self.NewproductsoffTake[indexPath.row]
            }
            
            let finalavailabelvaluesingel = self.AvailabelQuantity[indexPath.row]
            
            if finalavailabelvaluesingel == "Out of Stock"
            {
                cell.btnAdd.setBackgroundImage(#imageLiteral(resourceName: "Notification"), for:.normal)
                cell.btnAdd.addTarget(self, action: #selector(addViewAllUserQnty), for: .touchUpInside)
                cell.NewBrandlabel.isHidden = true
                cell.cashback_text.isHidden = true
                cell.imgArrow.isHidden = true
                cell.cashbacklabel.isHidden = true
                cell.lblStock.frame = CGRect(x: cell.cashbacklabel.frame.origin.x, y: cell.cashbacklabel.frame.origin.y, width: cell.lblStock.frame.size.width, height: cell.lblStock.frame.size.height)
                cell.imgNew.isHidden = true
                cell.imgStockOut.isHidden = false
                cell.imgProduct.alpha = 0.3
                cell.lblStock.text = finalavailabelvaluesingel
            }else{
                if finalavailabelvaluesingel == "0"
                {
                    cell.NewBrandlabel.isHidden = true
                    cell.btnAdd.setBackgroundImage(#imageLiteral(resourceName: "add"), for:.normal)
                    cell.btnAdd.addTarget(self, action: #selector(addViewAllUserQnty), for: .touchUpInside)
                    
                    cell.lblStock.text = self.AvailabelQuantity[indexPath.row]
                    cell.imgStockOut.isHidden = true
                    
                }
                if finalavailabelvaluesingel >= "1"
                {
                    cell.NewBrandlabel.isHidden = false
                    cell.btnAdd.addTarget(self, action: #selector(addViewAllUserQnty), for: .touchUpInside)
                    
                    cell.btnAdd.setBackgroundImage(#imageLiteral(resourceName: "cart_edit"), for:.normal)
                    cell.NewBrandlabel.text = self.userQnty[indexPath.row]
                    cell.lblStock.text = self.AvailabelQuantity[indexPath.row]
                    cell.imgStockOut.isHidden = true
                }
                
                let stockValueBell = self.userQnty[indexPath.row]
                
                if stockValueBell == "0" {
                    cell.NewBrandlabel.isHidden = true
                    cell.btnAdd.addTarget(self, action: #selector(addViewAllUserQnty), for: .touchUpInside)
                    
                    cell.btnAdd.setBackgroundImage(#imageLiteral(resourceName: "add"), for:.normal)
                    cell.imgStockOut.isHidden = true
                    
                    
                }else{
                    cell.NewBrandlabel.text = self.userQnty[indexPath.row]
                    cell.imgStockOut.isHidden = true
                    cell.NewBrandlabel.isHidden = false
                    
                }
                
            }
            
            let statusVa = self.NewProductExculise[indexPath.row]
            
            if statusVa == "0" {
                cell.imgExclusive.isHidden = true
            }else{
                cell.imgExclusive.isHidden = false
                
            }
            
            let favouritemore = self.favouritestring[indexPath.row]
            print(favouritemore)
            
            if favouritemore == "0" {
                cell.btnFavor.setBackgroundImage(#imageLiteral(resourceName: "Heart"), for:.normal)
                cell.btnFavor.isSelected = true
            }
            if favouritemore == "1" {
                cell.btnFavor.setBackgroundImage(#imageLiteral(resourceName: "favourite"), for:.normal)
                cell.btnFavor.isSelected = false
                
            }
            
            
            var string1 = self.NEwproductItems
            if string1 == ["null"]
            {
                cell.lblProduct.text = string1[indexPath.row]
            }
            if string1 != ["null"]
            {
                cell.lblProduct.text = string1[indexPath.row]
            }
            
            let Newproductcollection = self.NEwproductIMage[indexPath.item]
            cell.imgProduct.sd_setImage(with: URL(string:Newproductcollection), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
            
            cell.btnAdd.tag = indexPath.row
            
            
            let codDisplay = self.NEwproductCODDisplay[indexPath.row]
            print(codDisplay)
            
            if codDisplay == "0" {
                cell.TotalBrandview.isHidden = true
            }
            if codDisplay == "1" {
                cell.TotalBrandview.isHidden = false
            }
            
            
            
            
            let valuefinal = self.Newproduct_dealsstruck[indexPath.row]
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string:valuefinal as String)
            attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            cell.lblStrick.attributedText = attributeString
            
//            let numberValue : NSNumber = self.NewBrandofferprize[indexPath.row] as NSNumber
//            let text : String = numberValue.stringValue
//            cell.Percentagelabel.text = text
            
        
            
//            if self.NewproductLauncharray.value(forKey:"margin")as? String !=  null {
//                cell.Percentagelabel.text  =  self.NewBrandofferprize[indexPath.row]
//            }else{
//                cell.Percentagelabel.isHidden = true
//            }
            
            
                cell.Percentagelabel.isHidden = true
          
            cell.cashbacklabel.text =  self.cashBackfinal[indexPath.row]
            cell.lblRate.text = self.Newproductoutlets[indexPath.row]
            cell.lblMRP.text = self.NewproductlabelMrp[indexPath.row]
            cell.btnFavor.tag = indexPath.row
            cell.btnFavor.addTarget(self, action: #selector(ViewallBrandsViewController.connected(sender:)), for: .touchUpInside)
            let tapviewall = UITapGestureRecognizer(target: self, action: #selector(self.handleTapview(_:)))
            cell.TotalBrandview.addGestureRecognizer(tapviewall)
             cell.TotalBrandview.isUserInteractionEnabled = true
            cell.TotalBrandview.layer.cornerRadius = 4.0
            cell.TotalBrandview.layer.masksToBounds = true
            
            if self.celldealEndtime.count > 0
            {
                cell.labeltimerlabel.isHidden = false
            if let productratingpercentfinalvalue:Int = self.celldealEndtime[indexPath.row]as? Int
                {
                    self.celldealEndtimeone  = productratingpercentfinalvalue
                    if self.celldealEndtimeone > 0
                    {
                        let strvalue = self.stringFromTimeInterval(interval: TimeInterval(self.celldealEndtimeone)) as String
                        cell.labeltimerlabel.text = strvalue
                        if !viewalltimerIsOn {
                            viewalltimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countDownfinal), userInfo: nil, repeats: true)
                            viewalltimerIsOn = true
                        }

                    }
                }
            }
            else
            {
                cell.labeltimerlabel.isHidden = true
            }
            
            return cell
        }
        else if tableView == selectmargintabelview
        {
            let cell  = selectmargintabelview.dequeueReusableCell(withIdentifier: "LanguageTableViewCell", for: indexPath) as! LanguageTableViewCell
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
       else 
        {
            let cell:UITableViewCell = (self.soldtabelview.dequeueReusableCell(withIdentifier: ViewallHomecellReuseIdentifier))!
            cell.textLabel?.text = self.sold_filledbynamearray[indexPath.row]
            cell.textLabel?.font = UIFont(name: "Arial", size: 14.5)!
            
            cell.textLabel?.textColor =  UIColor.black
            return cell
        }
       
    }
    
    @objc func connected(sender: UIButton)
    {
            let button = sender.tag
            let buttonTag = sender
            self.selectedint = button
            self.productidtotalvalue  = ProductidValue[sender.tag]
            if(buttonTag.isSelected == true)
            {
                sender.setBackgroundImage(#imageLiteral(resourceName: "favourite"), for:.normal)
                producidclikstring = self.ProductidValue[button]
                for i in 0..<self.favouritestring.count {
                    let add = self.favouritestring[i]
                    if i == self.selectedint {
                        self.favouritestring[i] =  "1"
                    }
                }
                print(producidclikstring)
                DispatchQueue.main.async {
                    self.ViewallproductHOMELikeProduct()
                }
                buttonTag.isSelected = false
            }
            else
            {
                sender.setBackgroundImage(#imageLiteral(resourceName: "Heart"), for:.normal)
                for i in 0..<self.favouritestring.count {
                    let add = self.favouritestring[i]
                    if i == self.selectedint {
                        self.favouritestring[i] =  "0"
                    }
                }
                DispatchQueue.main.async {
                    self.ViewallHOMEunLikeProduct()
                }
                buttonTag.isSelected = true
            }
        }
    @objc func handleTapview(_ sender: UITapGestureRecognizer)
    {
        self.singviewallpopview.isHidden = false
        self.singelpopupscrollview.isHidden = false
        let bottomSheet = JXBottomSheetView(contentView:singelpopupscrollview as! UIScrollView)
        singelpopupscrollview.delegate = self
        bottomSheet.defaultMaxinumDisplayHeight  = 676
        bottomSheet.defaultMininumDisplayHeight = 0
        bottomSheet.displayState = .maxDisplay
        bottomSheet.frame = self.view.bounds
        self.demototalview.addSubview(bottomSheet)
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if tableView == viewBrandtabelview
        {
            DispatchQueue.main.async {
                let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"ProductDescriptionViewController")as!ProductDescriptionViewController
                viewfinal.productdemoidfinalvalue =  self.ProductidValue[indexPath.row]
                self.present(viewfinal, animated: true, completion:nil)
            }
        }
      
        if tableView == soldtabelview
        {
            let titlestring = self.sold_filledbynamearray[indexPath.row]
            
            self.cellerid  = self.sold_filledbyseller_idarray[indexPath.row]
            //            self.NumberMalltitlelabel.text = titlestring
            self.soldview.isHidden = true
            self.soldtabelview.isHidden = true
            self.btnSellerID.tag  = 1
            
        }
        if tableView == selectmargintabelview
        {
                selectedIndex = indexPath.item
                selectmargintabelview.reloadData()
        }
    }
    
    @IBAction func Moreproductscomingsoon(_ sender: UIButton)
    {
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if tableView == viewBrandtabelview
        {
            return 110
        }
        if tableView == selectmargintabelview
        {
            return 50
        }
        else
        {
            return 60
        }
    }
   
    @objc func textFieldDidChange(_ textField: UITextField?) {
        
        textField?.layer.borderColor = (UIColor(red: 241/255, green: 242/255, blue: 244/255, alpha: 1.0) as! CGColor)
        textField?.layer.cornerRadius = 5.0
        
        
        lblanotherQnty.text = textField?.text
        
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return modelData.count
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 80
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
        
        
        let middleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
        middleLabel.text = modelData[row]
        middleLabel.textColor = UIColor.red
        middleLabel.textAlignment = .center
        middleLabel.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.thin)
        view.addSubview(middleLabel)
        if  di_count == row {
            middleLabel.textColor = UIColor.red
        }
        else{
            middleLabel.textColor = UIColor.gray
        }
        view.transform =  CGAffineTransform(rotationAngle: 90 * (.pi/180))
        return view
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        lblanotherQnty.text = modelData[row]
        pickerView.selectRow(row, inComponent:0, animated: true)
        return modelData[row] as String
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
         self.viewallQuantity = ""
       
        let finalstring = modelData[row]
        if finalstring == "10+"
        {
            topPickerView.isHidden = true
            finalView.isHidden = false
            self.viewallQuantity = "10"

        }
        else
        {
             self.viewallQuantity = modelData[row]
        }
        
        self.index = Int(self.viewallQuantity)!

        
        
        pickerView.selectRow(row, inComponent:0, animated: true)
        lblanotherQnty.text = modelData[row]
        stockTextField.text = modelData[row]
        di_count = row
        pickerView.reloadAllComponents()
        
    }
    func ViewallProducts()
    {
        
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let defaults = UserDefaults.standard
        if let Reviewfinaluseroid:String = defaults.value(forKey: "myuseridvaluefinal")as?String
        {
            self.productdescriptionViewall = Reviewfinaluseroid
        }
        if let Reviewfinaluseroid:String = defaults.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        //   let postString = "method=landingPage&userid=511111117"
    let postString =  String(format: "method=%@&userid=%@&widget=%@","viewAll",self.productdescriptionViewall,Recomendedname1)
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
                    DispatchQueue.main.async
                        {
                            self.myrecomendedview.isHidden = true
                    }
                    self.removeSpinner()

                    print(dict)
                    
        self.NewproductLauncharray = dict.value(forKey:"prd_list") as! NSArray
                    print(self.NewproductLauncharray)


            if let NEwproductIMagefinal:[String] = self.NewproductLauncharray.value(forKey:"image")as?[String]
                    {
                       self.NEwproductIMage = NEwproductIMagefinal
                    }
                    print(self.NEwproductIMage)

                    if let NewBrandofferprizefinal:[String] = self.NewproductLauncharray.value(forKey:"margin")as? [String]
                    {
                       self.NewBrandofferprize = NewBrandofferprizefinal
                    }
                    
                    
               if let NEwproductItemsfinal:[String] = self.NewproductLauncharray.value(forKey:"name")as?[String]
                    {
                        self.NEwproductItems = NEwproductItemsfinal
                    }
               
                    if let Newproductoutletsfinal:[String] = self.NewproductLauncharray.value(forKey:"price")as?[String]
                    {
                        self.Newproductoutlets = Newproductoutletsfinal
                    }
                    
                    if let NewproductexlImage:[String] = self.NewproductLauncharray.value(forKey:"exclusive")as?[String]
                    {
                        self.NewProductExculise = NewproductexlImage
                    }
                    
                    if let Newproductoutletsfinal:[String] = self.NewproductLauncharray.value(forKey:"price")as?[String]
                    {
                        self.Newproduct_dealsstruck = Newproductoutletsfinal
                    }
                    
                    
                    if let Newproduct_dealsstruckfinal:[String] = self.NewproductLauncharray.value(forKey:"MRP")as?[String]
                    {
                        self.Newproduct_dealsstruck = Newproduct_dealsstruckfinal
                    }
                    
                    if let NewproductsInstackfinal:[String] = self.NewproductLauncharray.value(forKey:"available_qty")as?[String] //1
                    {
                        self.NewproductsInstack = NewproductsInstackfinal
                    }
                    
                    self.NewProductMOQ = self.NewproductLauncharray.value(forKey:"moq_calc") as! [String]

                    
                    if let NEwproductCODfinal:[String] = self.NewproductLauncharray.value(forKey:"cod_display")as?[String]
                    {
                        self.NEwproductCODDisplay = NEwproductCODfinal
                    }
                    print(self.NEwproductCODDisplay)
                    
                    
                    
                    if let NewproductsQnty:[String] = self.NewproductLauncharray.value(forKey:"user_qty")as?[String] //1
                    {
                        self.userQnty = NewproductsQnty
                    }
                    
                    if self.Recomendedname1 == "TodayDeals" {
                        
                        self.dealEndtimetwo = self.NewproductLauncharray.value(forKey:"dealExpTime")as! [NSNumber]
                    }
//                    for i in 0 ..< self.dealEndtimetwo.count {
//                        self.dealEndtime = Int( truncating: self.dealEndtimetwo[i])
//                        print(self.dealEndtime)
//                        self.lblTimertext.text = self.stringFromTimeInterval(interval: TimeInterval(self.dealEndtime)) as String
//                    }
                    
                    
                    
                    
                    if let NewproductsoffTakeDisplayfinal:[String] = self.NewproductLauncharray.value(forKey:"off_take_display")as?[String]
                    {
                        self.NewproductsoffTakeDisplay = NewproductsoffTakeDisplayfinal
                    }
                    if let NewproductsoffTakefinal:[String] = self.NewproductLauncharray.value(forKey:"off_take")as?[String]
                    {
                        self.NewproductsoffTake = NewproductsoffTakefinal
                    }
             
                    if let cashBackfinalfinal:[String] = self.NewproductLauncharray.value(forKey:"cash_back")as?[String]
                    {
                        self.cashBackfinal = cashBackfinalfinal
                    }
               
                    if let NewproductlabelMrpfinal:[String] = self.NewproductLauncharray.value(forKey:"weight_mrp")as?[String]
                    {
                        self.NewproductlabelMrp = NewproductlabelMrpfinal
                    }
                if let AvailabelQuantityfinal:[String] = self.NewproductLauncharray.value(forKey:"available_qty_disp")as?[String] //2
                    {
                        self.AvailabelQuantity = AvailabelQuantityfinal
                    }
                    if let ProductidValuefinal:[String] = self.NewproductLauncharray.value(forKey:"prodId")as?[String]
                    {
                        self.ProductidValue = ProductidValuefinal
                    }
                    if let favouritestringfinal:[String] = self.NewproductLauncharray.value(forKey:"fav")as?[String]
                    {
                        self.favouritestring = favouritestringfinal
                    }
                    if let userquantiotyfinal:[String] = self.NewproductLauncharray.value(forKey:"user_qty")as?[String]
                    {
                        self.userquantioty = userquantiotyfinal
                    }

//                    cartcount
                    
                    
                    
                    DispatchQueue.main.async {
                        self.viewBrandtabelview.isHidden = false
                        self.viewBrandtabelview.reloadData()
                        DispatchQueue.main.async
                            {
                                self.myrecomendedview.isHidden = true
                        }
                        
                    }
                }
                break
            case .failure(_):
                DispatchQueue.main.async
                    {
                        self.myrecomendedview.isHidden = true
                }
                break
            }
        }
    }
    
    func ViewallproductHOMELikeProduct()
    {
        
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.viewalluseridbilingvaluesingel = Reviewfinaluseroid
        }
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        
    let postString =  String(format: "method=%@&idProductInfo=%@&userid=%@&select=%@","AddToFav", self.productidtotalvalue,self.viewalluseridbilingvaluesingel,"1")
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
                    //                    method=AddToFav&idProductInfo=48&userid=50867&select=Vim
                    print(dict)
                    
                    self.viewallHomestatusLikeviewallone = dict.value(forKey:"status")as!NSNumber
                    print(self.viewallHomestatusLikeviewallone)
                    
                    let sttussucessstring =  self.viewallHomestatusLikeviewallone.stringValue
                    
                    
                    print(sttussucessstring)
                    if sttussucessstring == "1"
                    {
                        
                    }
                }
                break
            case .failure(_):
                break
            }
      
        }
    }
    func ViewallHOMEunLikeProduct()
    {
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        //   let postString = "method=landingPage&userid=511111117"
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.viewalluseridbilingvaluesingel = Reviewfinaluseroid
        }
        // method=AddToFav&idProductInfo=1&userid=124&select=1
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        

        
    let postString =  String(format: "method=%@&idProductInfo=%@&userid=%@&select=%@","AddToFav", self.productidtotalvalue,self.viewalluseridbilingvaluesingel,"0")
        
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
                    //                    method=AddToFav&idProductInfo=48&userid=50867&select=Vim
                    print(dict)
                    
                    self.viewallHomestatusLikeviewallone = dict.value(forKey:"status")as!NSNumber
                    print(self.viewallHomestatusLikeviewallone)
                    
                    let sttussucessstring =  self.viewallHomestatusLikeviewallone.stringValue
                    print(sttussucessstring)
                    if sttussucessstring == "1"
                    {
                    }
                    
                    
                }
                break
            case .failure(_):
                break
            }
            
        }
    }
    
    @objc func addViewAllUserQnty(sender: UIButton)
    {
        let btntag = sender.tag
        self.mainPopAddView.isHidden = true
        self.lblInStock.text = "\(self.NewproductsInstack[btntag]) Instock"
        self.labelinstacklabel.text = "\(self.NewproductsInstack[btntag]) Instock"
//        Lblinstacklabel
        self.lblMOCqty.text = "\(self.NewProductMOQ[btntag]) X"
        if self.userQnty[btntag] == "0" {
            lblanotherQnty.text = "\(self.modelData[1])"
            self.pickerView.selectRow(1, inComponent: 0, animated: true)

        }else{
            lblanotherQnty.text = self.userQnty[btntag]
            let invalue = Int(self.userQnty[btntag])
            self.pickerView.selectRow(invalue!, inComponent: 0, animated: true)
        }
        self.particularadd = ""
        self.particularadd = self.ProductidValue[btntag]
        print(self.particularadd)
        self.Postmethodaddfinalvalue()
         self.viewallQuantity = ""
       self.viewallQuantity = self.userQnty[btntag]
        
        print(self.userQnty)
        print(self.viewallQuantity)
        
        self.selectedint = nil
        
        self.selectedint  = btntag
        
        self.index = Int(self.viewallQuantity)!
        
        
        if self.AvailabelQuantity[btntag] == "Out of Stock"
        {
            
            self.stockOutTitel = self.NEwproductItems[btntag]
            producidclikHOMEstring = self.ProductidValue[btntag]
             sender.setBackgroundImage(#imageLiteral(resourceName: "notificationfinalvalue"), for:.normal)
            self.stockOutOrderValue()
            
            self.addStockView.isHidden = true
            
        }
        self.adpopScrollView.isHidden = false
        
        let bottomSheet = JXBottomSheetView(contentView:self.adpopScrollView as! UIScrollView)
        bottomSheet.defaultMaxinumDisplayHeight  = self.view.frame.size.height
        bottomSheet.defaultMininumDisplayHeight = 0
        bottomSheet.displayState = .maxDisplay
        bottomSheet.frame = self.view.bounds
        self.view.addSubview(bottomSheet)
        
        topPickerView.isHidden = false
        finalView.isHidden = true
     
    }
     @objc func stockOutOrderAction(sender: UIButton) {
        
        
        
    }
    
    
    func showSpinner(){
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
//        self.otpView.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(imageView)
    }
    func removeSpinner(){
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()
    }
    
    
    func stringFromTimeInterval(interval: TimeInterval) -> NSString
    {
        let ti = NSInteger(interval)
        let value = (ti / 1000)
        let seconds = value % 60
        let minutes = (value / 60) % 60
        let hours = (value / 3600)
        return NSString(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
    }
    
    @objc func countDowntwo()
    {
            dealEndtime1 -= 1
            print(dealEndtime1)
            let ti = NSInteger(dealEndtime1)
            let seconds = ti % 60
            print(seconds)
            let minutes = (ti / 60) % 60
            print(minutes)
            let hours = (ti / 3600000)
            print(hours)
            
            lblTimertext.text = String(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
    }
    
    @objc func countDownfinal()
    {
        dealEndtime1 -= 1
        print(dealEndtime1)
        let ti = NSInteger(dealEndtime1)
        let seconds = ti % 60
        print(seconds)
        let minutes = (ti / 60) % 60
        print(minutes)
        let hours = (ti / 3600000)
        print(hours)
        
        
        lblTimertext.text = String(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
    }
    func viewalladdtoanotherquantitylabel()
    {
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let defaults = UserDefaults.standard
        if let Myagentidfinal:String = defaults.value(forKey:"MyLoginfinalvalue")as?String
        {
            self.Homeuseridstringvalue = Myagentidfinal
        }
        if self.cellerid.count > 0
        {
            if self.sold_filledbyseller_idarray.count > 0
            {
                let arrayvalue = NSString(format:"%@%@-%@-%@","[",particularadd,self.viewallQuantity,"]")
                print(arrayvalue)
                postStringfinalvalue =  String(format: "method=%@&idProductInfo=%@&userid=%@&sellerId=%@&schemeId=%@&bulkId=%@","AddToCartDynamic",arrayvalue,Homeuseridstringvalue,self.cellerid,"","")
                print(postStringfinalvalue)
            }
        }
            else
            {
                let arrayvalue = NSString(format:"%@%@-%@-%@","[",particularadd,self.viewallQuantity,"]")
                print(arrayvalue)
                postStringfinalvalue =  String(format: "method=%@&idProductInfo=%@&userid=%@&sellerId=%@&schemeId=%@&bulkId=%@","AddToCartDynamic",arrayvalue,Homeuseridstringvalue,"1","","")
                print(postStringfinalvalue)
            }
        let defaulst = UserDefaults.standard
        
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }

        print(postStringfinalvalue)
        request.httpBody = postStringfinalvalue.data(using: .utf8)
        request.addValue(AcessTokenfinalstring, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                if let dict:NSDictionary = response.result.value as? NSDictionary
                {
                    print(dict)
                    if let cart_Countvaluefinal:NSNumber = dict.value(forKey: "CartCount") as? NSNumber
                    {
//                        self.cart_Countvalue = cart_Countvaluefinal
//                        self.cartlabelsingel.isHidden = false
//                        self.cartlabelsingel.layer.cornerRadius = 6.0
//                        self.cartlabelsingel.layer.masksToBounds = true
//                        self.cartlabelsingel.text =   self.cart_Countvalue.stringValue
                    }
    
    
                    if let user_updatevaluefinal:String = dict.value(forKey: "user_qty") as? String
                    {
                        self.user_updatevalue = user_updatevaluefinal
                        self.VisibleIndexquntity = IndexPath(row: self.selectedint!, section: 0)
                        print(self.VisibleIndexquntity)
                            for i in 0..<self.userQnty.count
                            {
                                let add = self.userQnty[i]
                                if i == self.selectedint {
                                    self.userQnty[i] =  self.user_updatevalue
                                }
                            }
                        DispatchQueue.main.async
                            {
                            self.viewBrandtabelview.reloadData()
                        }
                    }
                }
                break
            case .failure(_):
                break
            }
    
        }
    }
    
    func stockOutOrderValue()
    {
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.productdescriptionViewall = Reviewfinaluseroid
        }
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let postString =  String(format: "method=%@&ActorId=%@&prodId=%@&flag=%@","RestockAlertMe",self.productdescriptionViewall,self.producidclikHOMEstring,"1")
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
                    
                    let str:String = dict.value(forKey: "Message") as! String
                    let strVal = str.dropLast()
                    let strvalue = strVal.dropLast()
                    
                    self.messageStockOut = "\(String(describing: strvalue))\(self.stockOutTitel) }"
                    let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
                    popOverVC.alertTitleString = "alert Request"
                    popOverVC.alertMessageString = self.messageStockOut as NSString
                    self.addChildViewController(popOverVC)
                    popOverVC.view.frame = self.view.frame
                    self.view.addSubview(popOverVC.view)
                    popOverVC.didMove(toParentViewController: self)
                    
                    let bottomSheettwo = JXBottomSheetView(contentView:(self.adpopScrollView)!)
                    bottomSheettwo.defaultMaxinumDisplayHeight  = self.view.frame.size.height
                    bottomSheettwo.defaultMininumDisplayHeight = 0
                    bottomSheettwo.displayState = .minDisplay
                    bottomSheettwo.frame = self.view.bounds
                    self.view.addSubview(bottomSheettwo)
                }
            case .failure(_):
                print("anilreddy")
            }
        }
    }
    func Postmethodaddfinalvalue()
    {
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let defaults = UserDefaults.standard
        if let Myagentidfinal:String = defaults.value(forKey:"MyLoginfinalvalue")as?String
        {
            self.Homeuseridstringvalue = Myagentidfinal
        }
        let defaulst = UserDefaults.standard
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }

        postStringfinalvalue =  String(format: "method=%@&userid=%@&productId=%@&deviceType=%@&VendorId=%@","moreProductDetails",Homeuseridstringvalue,particularadd,"mobile","")
        print(postStringfinalvalue)
        request.httpBody = postStringfinalvalue.data(using: .utf8)
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
                    
                    if let ComboDisplayfinal:String = dict.value(forKey: "combo_display") as? String
                    {
                        
                        self.ComboDisplay = ComboDisplayfinal
                    }
                    
                    if let LTsDisplayfinal:String = dict.value(forKey: "LTS_display") as? String
                    {
                        
                        self.LTsDisplay = LTsDisplayfinal
                    }
                    
                    if let BulkDisplayNAmefinal:String = dict.value(forKey: "bulk_display") as? String
                    {
                        
                        self.BulkDisplay = BulkDisplayNAmefinal
                    }
                    
                    
                    if let scheme_displayfinal:String = dict.value(forKey: "scheme_display") as? String
                    {
                        
                        self.scheme_display = scheme_displayfinal
                    }
                    
                    
                    
                    
                    
                    if let ComboDisplayfinal:String = dict.value(forKey: "combo_display") as? String
                    {
                        
                        self.ComboDisplay = ComboDisplayfinal
                    }
                    
                    if let LTsDisplayfinal:String = dict.value(forKey: "LTS_display") as? String
                    {
                        
                        self.LTsDisplay = LTsDisplayfinal
                    }
                    
                    if let BulkDisplayNAmefinal:String = dict.value(forKey: "bulk_display") as? String
                    {
                        
                        self.BulkDisplay = BulkDisplayNAmefinal
                    }
                    
                    
                    if let Bulkarrayfinal:NSArray = dict.value(forKey: "BULK") as? NSArray
                    {
                        
                        self.Bulkarray = Bulkarrayfinal
                    }
                    
                    if let LTSarrayfinal:NSArray = dict.value(forKey: "LTS") as? NSArray
                    {
                        
                        self.LTSarray = LTSarrayfinal
                    }
                    if let SchemeSarrayfinal:NSArray = dict.value(forKey: "Scheme") as? NSArray
                    {
                        
                        self.SchemeSarray = SchemeSarrayfinal
                    }
                    
                    if let comboSarrayfinal:NSDictionary = dict.value(forKey: "combo") as? NSDictionary
                    {
                        
                        self.comboSarray = comboSarrayfinal
                    }
                    
                    
                    
                    
                    //// Bulk Quantity
                    
                    if let BulkNAmefinal:String = dict.value(forKey: "BULK") as? String
                    {
                        self.BulkNAme = BulkNAmefinal
                    }
                    
                    if let LTsNamefinal:String = dict.value(forKey: "LTS") as? String
                    {
                        
                        self.LTsName = LTsNamefinal
                    }
                    if let scheme_namefinal:String = dict.value(forKey: "Scheme") as? String
                    {
                        
                        self.scheme_name = scheme_namefinal
                    }
                    
                    if let ComboNamefinal:String = dict.value(forKey: "combo") as? String
                    {
                        
                        self.ComboName = ComboNamefinal
                    }
                    
                    if let sold_filledbyarrayfinal:NSArray = dict.value(forKey: "sold_filledby") as? NSArray
                    {
                        self.ssold_filledbyNoramlarray = sold_filledbyarrayfinal
                        print(self.ssold_filledbyarray)
                        if let sold_filledbyIdarrayfinalvalue: [String]  =  self.ssold_filledbyNoramlarray.value(forKey: "seller_id") as? [String]
                        {
                            self.sold_filledbyIdarray = sold_filledbyIdarrayfinalvalue
                        }
                        print(self.sold_filledbyIdarray)
                        if let sold_filledbynamearrayfinalvalue: [String]  =  self.ssold_filledbyNoramlarray.value(forKey: "name") as? [String]
                        {
                            self.sold_filledbynamearray = sold_filledbynamearrayfinalvalue
                        }
                        print(self.sold_filledbynamearray)
                        if let sold_filledbyheroarrayfinalvalue: [String]  =  self.ssold_filledbyNoramlarray.value(forKey: "hero") as? [String]
                        {
                            self.sold_filledbyheroarray = sold_filledbyheroarrayfinalvalue
                        }
                        print(self.sold_filledbyheroarray)
                        if let sold_filledbydefarrayfinalvalue: [String]  =  self.ssold_filledbyNoramlarray.value(forKey: "def") as? [String]
                        {
                            self.sold_filledbydefarray = sold_filledbydefarrayfinalvalue
                        }
                        if let sold_filledbydiscriptionarrayfinalvalue: [String]  =  self.ssold_filledbyNoramlarray.value(forKey: "discription") as? [String]
                        {
                            self.sold_filledbydiscriptionarray = sold_filledbydiscriptionarrayfinalvalue
                            if self.sold_filledbydiscriptionarray.count > 0
                            {
                                self.lblSellerName.text = self.sold_filledbydiscriptionarray[0].htmlToString
                            }
                            else{
                                self.lblSellerName.text = "Sold by"
                            }
                        }
                        if let sold_filledbyseller_idarrayfinalvalue: [String]  =  self.ssold_filledbyNoramlarray.value(forKey: "Id") as? [String]
                        {
                            self.sold_filledbyseller_idarray = sold_filledbyseller_idarrayfinalvalue
                        }
                    }
                    
//                    self.cartcount =  dict.value(forKey:"cartCount")as!NSNumber
                    if let Descriptioncavailable_qty_disp:NSNumber = dict.value(forKey: "cartCount") as?NSNumber
                    {
                        self.cartcount = Descriptioncavailable_qty_disp
                        self.cartcountlabel.text = self.cartcount.stringValue
                        self.cartcountlabel.isHidden = false
                        self.cartcountlabel.layer.cornerRadius = 6.0
                        self.cartcountlabel.layer.masksToBounds = true
                        self.cartcountlabel.text =  self.cartcount.stringValue
                    }
                    
                    if let Descriptioncavailable_qty_disp:String = dict.value(forKey: "cartCount") as?String
                    {
                        self.cartcountlabel.text = Descriptioncavailable_qty_disp
                        self.cartcountlabel.isHidden = false
                        self.cartcountlabel.layer.cornerRadius = 6.0
                        self.cartcountlabel.layer.masksToBounds = true
                        self.cartcountlabel.text =  self.cartcount.stringValue
                    }
                    
                    if let dealEndtimefinalvaluetwo:[Int] = dict.value(forKey: "expire") as? [Int] {
                        self.celldealEndtime = dealEndtimefinalvaluetwo
                    }

                    
                  

                    
                    DispatchQueue.main.async {
                        self.soldtabelview.reloadData()
                    }
                }
                break
            case .failure(_):
                break
            }
            
        }
        
    }
    @IBAction func buttonsellerNAme(_ sender: UIButton)
    {
        self.soldview.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.soldview.layer.shadowOpacity = 0.3
        self.soldview.layer.shadowRadius = 1.0
        self.soldview.layer.borderColor = UIColor.color2().cgColor
        self.soldview.layer.shadowColor = UIColor.color2().cgColor
        
        IQKeyboardManager.sharedManager().enable = true
        IQKeyboardManager.sharedManager().enableAutoToolbar = true
        IQKeyboardManager.sharedManager().shouldShowToolbarPlaceholder = true
        
        
        
        if btnSellerID.tag == 0
        {
            self.soldview.isHidden = false
            self.soldtabelview.isHidden = false
            self.soldtabelview.layer.borderWidth = 1.0
            self.soldtabelview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
            btnSellerID.tag = 1
        }
        else if btnSellerID.tag == 1
        {
            self.soldview.isHidden = true
            self.soldtabelview.isHidden = true
            btnSellerID.tag = 0
        }
    }
  
    @IBAction func backbuttonvalue(_ sender: UIButton)
    {
        self.index = Int(self.viewallQuantity)!+1

        if self.index < 10
        {
            let myString = String(self.index)
            self.viewallQuantity = myString
             pickerView.selectRow(self.index, inComponent:0, animated: true)
            self.lblanotherQnty.text = self.viewallQuantity
              pickerView.reloadAllComponents()
        }
        else{
                topPickerView.isHidden = true
                finalView.isHidden = false
                self.viewallQuantity = "10"
               self.stockTextField.text = self.viewallQuantity
            self.lblanotherQnty.text = self.viewallQuantity
        }
    }
    @IBAction func viewallcancelbutton(_ sender: UIButton)
    {
        self.singviewallpopview.isHidden = true
        self.singelpopupscrollview.isHidden = true
    }
    
    @IBAction func Viewallokbutton(_ sender: UIButton)
    {
        self.singviewallpopview.isHidden = true
        self.singelpopupscrollview.isHidden = true
        self.ViewallTotalfinal.isHidden = true
    
    }
    @IBAction func totalseacrhbutton(_ sender: UIButton)
    {
        DispatchQueue.main.async {
            let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"productscanViewController")as!productscanViewController
            self.present(viewfinal, animated: true, completion:nil)
        }
    }
    @IBAction func totalfileters(_ sender: UIButton)
    {
        self.Totaldemoviewfinal.isHidden = true
        self.Totalview.isHidden = true
    }
}

