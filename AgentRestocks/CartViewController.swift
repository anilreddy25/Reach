//
//  CartViewController.swift
//  AgentRestocks
//
//  Created by apple on 8/31/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//
import UIKit
import IQKeyboardManagerSwift
import SwiftyJSON
import Alamofire
import AlamofireImage
import SDWebImage

class CartViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate
{
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var subCartView: UIView!
    @IBOutlet weak var chartView: UIView!
    @IBOutlet weak var showView: UIView!
    @IBOutlet weak var btnClearCart: UIButton!
    @IBOutlet weak var btnPopAction: UIButton!
    @IBOutlet weak var tableCart: UITableView!
    
    @IBOutlet weak var lblCart: UILabel!
    @IBOutlet weak var lblItems: UILabel!
    @IBOutlet weak var subTotalView: UIView!
    @IBOutlet weak var lblSubTotal: UILabel!
    @IBOutlet weak var lblSellPrice: UILabel!
    
    @IBOutlet weak var handlingView: UIView!
    @IBOutlet weak var lblHandling: UILabel!
    @IBOutlet weak var lblHCharge: UILabel!
    
    @IBOutlet weak var GSTView: UIView!
    @IBOutlet weak var lblGST: UILabel!
    @IBOutlet weak var lblGSTValue: UILabel!
    
    @IBOutlet weak var cashBackView: UIView!
    @IBOutlet weak var lblCashBack: UILabel!
    
    @IBOutlet weak var lblCahback: UILabel!
    
    @IBOutlet weak var btnShowMore: UIButton!
    
    @IBOutlet weak var bntMore: UIButton!
    
    @IBOutlet weak var btnCheckout: UIButton!
    
    @IBOutlet weak var btnAmnt: UIButton!
    
    var array = [String] ()
    var rateMRP = [String]()
    var finalValue = [String]()
    var sellerValue = [String]()
    var InstockValue = [String]()
    var editCartValue = [String]()
    var rowNum = Int()
    
    var insert_rows = [Int]()
    var insert_cells = [String]()
    
    var insert_rowstwo = [Int]()
    var insert_cellstwo = [String]()
    
    var arrayTWo = [String]()
    var rateMRPTWo = [String]()
    var finalValueTwo = [String]()
    var sellerValueTwo = [String]()
    var InstockValueTwo = [String]()
    var editCartValueValueTwo = [String]()

    var inserts = 0
    var timer = Timer()
    
    @IBOutlet weak var undoviewfinal: UIView!
    
    @IBOutlet weak var ItemsRemovedfinalvalue: UIButton!
    
    
    @IBOutlet weak var Demoscrollviewfinal: UIScrollView!
    
    @IBOutlet weak var cartviewtwo: UIView!
    
    @IBOutlet weak var cartviewtabelviewtwo: UITableView!
    
    
    @IBOutlet weak var saveforlaterItemslabel: UILabel!
    
    @IBOutlet weak var saveforlaterview: UIView!
    var producidclikstring = String()
    
    @IBOutlet weak var mianpopupview: UIView!
    @IBOutlet weak var mainpopupscrooview: UIScrollView!
    @IBOutlet weak var subjectview: UIView!
    @IBOutlet weak var singquantitylabel: UILabel!
    @IBOutlet weak var anotherquntitylabel: UILabel!
    let customWidth:CGFloat = 100
    let customHeight:CGFloat = 100
    @IBOutlet weak var demofinalvalue: UIView!
    @IBOutlet weak var mytextfiledcolor: UITextField!
    @IBOutlet weak var finalchangecolor: UIView!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet weak var topviewfinal: UIView!
    var di_count = 0
    var productdemoidfinalvalue = String()
    var rotationAngle:CGFloat!
    var modelData = [String]()
    
    @IBOutlet weak var drop: UIButton!
    
    @IBOutlet weak var soldview: UIView!
    
    @IBOutlet weak var soldtabelview: UITableView!
    var soldbytabelarray1 = [String]()
    
    let cellReuseIdentifier = "cell"

    @IBOutlet weak var NumberMalltitlelabel: UILabel!
    
    @IBOutlet weak var Brand: UILabel!
    
    @IBOutlet weak var distibutionlabel: UILabel!
    
    @IBOutlet weak var updatebutton: UIButton!
    
    
    @IBOutlet weak var deltebutton: UIButton!
    
    @IBOutlet weak var Confirm: UIButton!
    
    
    @IBOutlet weak var saveforlater: UIButton!
    
    var getcartidstringvalue = String()
    
//// cart List array
    
   var cartListarray = NSArray()
    
//    var cartListarray = Array<Any>()
    
    var cartListarraysingel:Array<Any> = []

    var cartListNsmuatbelarray: NSMutableArray = []
    var iscombostring = [String]()
    var isParentstring = [String]()
    var parentIDstring = [String]()
    var PTRstring = [NSNumber]()
    var qtyCountstring = [String]()
    var qtyAvailabilitystring = [String]()
    var qtyDispstring = [String]()

    var idstring = [String]()
    var namestring = [String]()
    var pricestring = [String]()
    var stockstring = NSArray()
    var stock_colorstring = NSArray()
    var sellerstring = [String]()
    var additionalDatastring = NSDictionary()
    
    
    /// sellerstring
    var seller_infostring = NSArray()
    var seller_idstring = [String]()
    var seller_namestring = [String]()
    var seller_herostring = [String]()
    var seller_defstring = [String]()
    var seller_Idstring = [String]()
    var seller_discriptionstring = [String]()
    
    
    /// sold_filledby string
    
    var sold_filledbystring = NSArray()
    var sold_filledbyseller_id = [String]()
    var sold_filledbyname = [String]()
    var sold_filledbyhero = [String]()
    var sold_filledbydef = [String]()
    var sold_filledbyId = [String]()
    var sold_filledbydiscription = [String]()

    
    
    /// quantitystring
    // var quantitystring = NSArray()
    
    var quantitystring = [NSNumber]()

    var MOQstring = NSArray()
    var sellerIdstring = NSArray()
    var cashbackstring = [NSNumber]()
    var taxesstring = [NSNumber]()
    var handlingstring = [NSNumber]()
    var shippingstring = [NSNumber]()
    var hamalistring = [NSNumber]()
    var QTYAvailablestring = [String]()
    var pphidstring = [String]()

    
    
    //// additional information
    
    /// selller informstion
    
    var additionalDatadict = NSDictionary()
    var additionalseller_infoarray = NSArray()
    var additionalseller_idstring = [String]()
    var additionalseller_namestring = [String]()
    var additionalseller_herostring = [String]()
    var additionalseller_defstring = [String]()
    var additionalseller_discriptionstring = [String]()


    /// sold fillfiled by
    
    var additionalsold_filledbyarray = NSArray()
    var additionalsold_filledby_idstring = [String]()
    var additionalsold_filledby_namestring = [String]()
    var additionalsold_filledby_herostring = [String]()
    var additionalsold_filledby_defstring = [String]()
    var additionalsold_filledby_discriptionstring = [String]()
    
    /// cart count
    
    var cartcount = NSNumber()
    
    /// cart quantity
    
    var cartQuantitystring = NSString()
    
    /// Total cart
    
    var total_cartstring = NSString()

    
    // summary details
    
    var SummaryDetailsaray = NSArray()
    
    var SummaryDetailsSubHeading = [String]()

    var SummaryDetailsSubValue = [String]()

    
    //// saved List array
    
    var savedListarray = NSArray()
    
    
    @IBOutlet weak var labelcashbackfinal: UILabel!
    
    
    
    /// clear cart
    
    @IBOutlet weak var nocartview: UIView!
    
   

    var postString1 = String()
    var normalproductstring = String()
    
    var Movetocartproductstring = String()

    var Movetocartproductidstringfinalvalue = String()

    var Demostring = String()

    var selectedIndexcart :Int?

    

    
    
    
    
    //// saved forlater
    var cartListarraytwo:Array<Any> = []

    
    var cartListarray1 = NSArray()
    var cartListNsmuatbelarray1: NSMutableArray = []
    var iscombostring1 = [String]()
    var isParentstring1 = [String]()
    var parentIDstring1 = [String]()
    var PTRstring1 = [NSNumber]()
    var qtyCountstring1 = [String]()
    var qtyAvailabilitystring1 = [String]()
    var qtyDispstring1 = [String]()
    
    var idstring1 = [String]()
    var namestring1 = [String]()
    var pricestring1 = [String]()
    var stockstring1 = [String]()
    var stock_colorstring1 = [String]()
    var sellerstring1 = [String]()
    var additionalDatastring1 = NSDictionary()
    
    
    /// sellerstring
    var seller_infostring1 = NSArray()
    var seller_idstring1 = [String]()
    var seller_namestring1 = [String]()
    var seller_herostring1 = [String]()
    var seller_defstring1 = [String]()
    var seller_Idstring1 = [String]()
    var seller_discriptionstring1 = [String]()
    
    
    /// sold_filledby string
    
    var sold_filledbystring1 = NSArray()
    var sold_filledbyseller_id1 = [String]()
    var sold_filledbyname1 = [String]()
    var sold_filledbyhero1 = [String]()
    var sold_filledbydef1 = [String]()
    var sold_filledbyId1 = [String]()
    var sold_filledbydiscription1 = [String]()
    
    
    
    /// quantitystring
//    var quantitystring1 = [String]()
    var quantitystring1 = [NSNumber]()

    var MOQstring1 = NSArray()
    var sellerIdstring1 = NSArray()
    var cashbackstring1 = [NSNumber]()
    var taxesstring1 = [NSNumber]()
    var handlingstring1 = [NSNumber]()
    var shippingstring1 = [NSNumber]()
    var hamalistring1 = [NSNumber]()
    var QTYAvailablestring1 = [String]()
    var pphidstring1 = [String]()
    
    
    
    //// additional information
    
    /// selller informstion
    
    var additionalDatadict1 = NSDictionary()
    var additionalseller_infoarray1 = NSArray()
    var additionalseller_idstring1 = [String]()
    var additionalseller_namestring1 = [String]()
    var additionalseller_herostring1 = [String]()
    var additionalseller_defstring1 = [String]()
    var additionalseller_discriptionstring1 = [String]()
    
    
    /// sold fillfiled by
    
    var additionalsold_filledbyarray1 = NSArray()
    var additionalsold_filledby_idstring1 = [String]()
    var additionalsold_filledby_namestring1 = [String]()
    var additionalsold_filledby_herostring1 = [String]()
    var additionalsold_filledby_defstring1 = [String]()
    var additionalsold_filledby_discriptionstring1 = [String]()
    
    /// cart count
    
    var cartcount1 = NSNumber()
    
    /// cart quantity
    
    var cartQuantitystring1 = NSString()
    
    /// Total cart
    
    var total_cartstring1 = NSString()
    
    var AcessTokenfinalstring = String()
    
    var myagentTotalvalue  = String()
    
    // summary details
    
    var SummaryDetailsaray1 = NSArray()
    
    var SummaryDetailsSubHeading1 = [String]()
    
    var SummaryDetailsSubValue1 = [String]()
    
    
    var selectedidstring = String()
    
    var Deletecartproductstring = String()

    var DeleteSaveproductstring = String()

    var Deleteselectedidstring = String()
    var Deletecartselectedidstring = String()

    var clikedtabelview = String()
    
    var clikedRestorestring = String()

    var clikedRestorestringtwo = String()

     var clikedtypeone = String()
    
    
    var saveforlatername = String()
    var movetocatname = String()
    var savelforlater = String()

    var Movetocartstring = String()

    @IBOutlet weak var tableHeightConstraint: NSLayoutConstraint!

    
    @IBOutlet weak var bottomtopviewfinal: UIView!
    
    
    
    var Demotabelarry = NSArray()
    
    @IBOutlet weak var Numbermalltopdropbutton: UIButton!
    
    @IBOutlet weak var Maximumorderview: UIView!
    
    @IBOutlet weak var numbermallbarndview: UIView!
    
    var middleLabel = UILabel()
    
    var updatebuttonstring  = String()
    
    var cartselledidfinlvalue  = String()

    var cartidupdate  = String()
    var cartidQunatityvalue  = String()
    
    
    @IBOutlet weak var demoviewfinalvalue: UIView!
    

    
    var editquantitydelete = String()
    var editquantitysavelater = String()
    
    
    var dletecartintvalue = Int()
    var Saveforlaterintvalue = Int()

    @IBOutlet weak var mybackbutton: UIButton!
 
    
    
    @IBOutlet weak var veryalertview: UIView!
    var coverView = UIView()
    var imageView = UIImageView()
    
    var Totalitems = NSString()
    
    var cartcountstriongone = NSNumber()

    var cartcountstringTwo = String()

   var countTotalDemo  = String()
    
    
    
    @IBOutlet weak var landingfinalview: UIImageView!
    
    var productindividulaidvalue = [String]()
    
    

    
    override func viewDidLoad()
    
    {
        super.viewDidLoad()

        self.Demostring = "Demostring"
       // self.normalproductstring = "normalproductstring"

        // Do any additional setup after loading the view.
        
//         headerView.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness: 0.6)
//
//
//        self.headerView.dropShadow()
        headerView.layer.shadowOffset = CGSize(width: 0, height:1)
        headerView.layer.shadowOpacity = 0.6
        headerView.layer.shadowRadius = 1.0
        headerView.layer.shadowColor = UIColor.color2().cgColor


        
        
       // headerView.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness: 0.6)

//
//        array = ["PopiCorn","Bingo","Halidram","Horlicks","Dettol"]
//
//
//
//        arrayTWo = ["PopiCorn","Bingo","Halidram","Horlicks","Dettol"]
//
//                let rupee = "\u{20B9}"
//        let rupeeTwo = "99999.00"
//        let rupeeThree = "999.00"
//        let rupeefour = "75.00"
//        let rupeefive = "30.00"
//        let rupeesix = "5.00"
//        finalValue = [String(format:"%@%@%",rupee,rupeeTwo),String(format:"%@%@%",rupee,rupeeThree),String(format:"%@%@%",rupee,rupeefour),String(format:"%@%@%",rupee,rupeefive),String(format:"%@%@%",rupee,rupeesix)]
//          finalValueTwo = [String(format:"%@%@%",rupee,rupeeTwo),String(format:"%@%@%",rupee,rupeeThree),String(format:"%@%@%",rupee,rupeefour),String(format:"%@%@%",rupee,rupeefive),String(format:"%@%@%",rupee,rupeesix)]
//        InstockValue = ["9999Instock","999Instock","99Instock","10Instock","5Instock"]
//        InstockValueTwo = ["9999Instock","999Instock","99Instock","10Instock","5Instock"]
//        editCartValueValueTwo = ["5555","999","77","10","5"]
//        editCartValue = ["5555","999","77","10","5"]
       
        subCartView.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness: 0.6)
       
        if self.view.frame.size.height < 800 {
            Demoscrollviewfinal.contentInset = UIEdgeInsetsMake(0, 0, self.Demoscrollviewfinal.frame.size.height+400, 0)
            Demoscrollviewfinal.isScrollEnabled = true
//            Demoscrollviewfinal.showsVerticalScrollIndicator = false
        }

        self.saveforlaterview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        rotationAngle = -90 * (.pi/180)
        let originalFrame = pickerView.frame
        pickerView.transform =  CGAffineTransform(rotationAngle: rotationAngle)
        pickerView.frame = originalFrame
        modelData = ["0","1","2","3","4","5","6","7","8","9","10+"]
         soldbytabelarray1 = ["NumberMall","Venkata Ramana Traders"]
        self.soldtabelview.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        
        mytextfiledcolor.delegate = self
        mytextfiledcolor.addTarget(self, action: #selector(CartViewController.textFieldDidChangefinal(_:)), for: .editingChanged)
        
//        self.finalchangecolor.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
//         self.finalchangecolor.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
//        
        
        DispatchQueue.main.async {
            self.savecart()
        }
        
        DispatchQueue.main.async {
            self.getcartvalue()
        }
        
        self.bottomtopviewfinal.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        
        self.pickerView.selectRow(1, inComponent: 0, animated: true)
        
        self.mytextfiledcolor.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor

        self.updatebuttonstring = ""

        let bottomSheet = JXBottomSheetView(contentView:mainpopupscrooview as! UIScrollView)
        bottomSheet.defaultMininumDisplayHeight = 0
        bottomSheet.defaultMaxinumDisplayHeight = self.view.frame.size.height
        bottomSheet.displayState = .maxDisplay
        bottomSheet.frame = self.view.bounds
        bottomSheet.delegate = self as? JXBottomSheetViewDelegate
        mainpopupscrooview.delegate = self
        self.demoviewfinalvalue.addSubview(bottomSheet)
        
//        let tapThree = UITapGestureRecognizer(target: self, action: #selector(self.carthandleTapcatgeory(_:)))
//
//        mainpopupscrooview.addGestureRecognizer(tapThree)
        
//        mainpopupscrooview.isUserInteractionEnabled = true
       
        
        editquantitydelete = ""
        editquantitysavelater = ""
        
        self.subjectview.roundedButton()
        
        let CahttapViewTotal = UITapGestureRecognizer(target: self, action: #selector(self.cartTotalTapcatgeory(_:)))
        chartView.addGestureRecognizer(CahttapViewTotal)
        chartView.isUserInteractionEnabled = true
        
        
        
        
        
 2   }
    
    
    @objc func cartTotalTapcatgeory(_ sender: UITapGestureRecognizer)
    {
        DispatchQueue.main.async
            {
                let checkoufinalViewControllervalue = self.storyboard?.instantiateViewController(withIdentifier:"checkoufinalViewController")as!checkoufinalViewController
                self.present(checkoufinalViewControllervalue, animated: true, completion:nil)
        }
    }
    
    @objc func carthandleTapcatgeory(_ sender: UITapGestureRecognizer)
    {
//        self.demoviewfinalvalue.isHidden = true
//        
//        self.mainpopupscrooview.isHidden = true

    }
    @objc func textFieldDidChangefinal(_ textField: UITextField?)
    {
        anotherquntitylabel.text = textField?.text
    }
    
    
    @objc func timerActionfinalvalue()
    {
    self.undoviewfinal.isHidden = true
        
        
    }
    
    @IBAction func cartdropbutton(_ sender: UIButton)
    {
        self.soldview.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.soldview.layer.shadowOpacity = 0.3
        self.soldview.layer.shadowRadius = 1.0
        self.soldview.layer.borderColor = UIColor.color2().cgColor
        self.soldview.layer.shadowColor = UIColor.color2().cgColor
        
        IQKeyboardManager.sharedManager().enable = true
        IQKeyboardManager.sharedManager().enableAutoToolbar = true
        IQKeyboardManager.sharedManager().shouldShowToolbarPlaceholder = true
        
        
        
        if drop.tag == 0
        {
            self.soldview.isHidden = false
            self.soldtabelview.isHidden = false
            self.soldtabelview.layer.borderWidth = 1.0
            self.soldtabelview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
             drop.tag = 1
        }
        else if drop.tag == 1
        {
            self.soldview.isHidden = true
            self.soldtabelview.isHidden = true
            drop.tag = 0
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Button Action
    
    @IBAction func btnClearCart(_ sender: Any)
    {
    
    let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "deletecartViewController") as! deletecartViewController
    self.addChildViewController(popOverVC)
    popOverVC.view.frame = self.view.frame
    self.view.addSubview(popOverVC.view)
    
    popOverVC.didMove(toParentViewController: self)
     
    }
    
    @IBAction func btnShowMore(_ sender: Any)
    {
     let viewfinalvalue = self.storyboard?.instantiateViewController(withIdentifier:"HomeViewController")as!HomeViewController
        self.present(viewfinalvalue, animated:true, completion:nil)
    }
    @IBAction func Backbutton(_ sender: UIButton)
    {
//        let valuecart = "valuecart"
//        
//        let defaults = UserDefaults.standard
//        defaults.set(valuecart, forKey: "Myvaluecart")
//        defaults.synchronize()
        
        self.dismiss(animated:true, completion:nil)
    }
    
    @IBAction func btnCheckOut(_ sender: Any)
    {
//        DispatchQueue.main.async {
//            let CheckOutVCfinalvalue = self.storyboard?.instantiateViewController(withIdentifier:"CheckOutVC")as!CheckOutVC
//           
//            self.present(CheckOutVCfinalvalue, animated: true, completion:nil)
//        }
        DispatchQueue.main.async
            {
                let checkoufinalViewControllervalue = self.storyboard?.instantiateViewController(withIdentifier:"checkoufinalViewController")as!checkoufinalViewController
                self.present(checkoufinalViewControllervalue, animated: true, completion:nil)
        }
    }
    
    @IBAction func Undofunction(_ sender: UIButton) {
        
        
        if self.clikedtypeone == "clikedtypeone1"
        {
            self.normalproductstring = ""
            self.Movetocartproductstring = ""
            self.Deletecartproductstring = ""
            self.Demostring = ""
//            self.DeleteSaveproductstring = ""
            self.Deletecartproductstring = ""
            
            self.clikedRestorestring = ""
            self.updatebuttonstring = ""
     
            
            self.editquantitydelete = ""
            self.editquantitysavelater = ""
            self.clikedRestorestring = "clikedRestorestring"
            
            // http://172.31.0.13/NumberMall/agent_Gwy.php??method=restoreCart&userid=127&productid=3&isparent=0&sellerID=&quantity=
            self.undoviewfinal.isHidden = true
            self.nocartview.isHidden = true

            self.getcartvalue()
        }
        if self.clikedtypeone == "clikedtypeone2"
        {
            self.updatebuttonstring = ""
            self.editquantitydelete = ""
            self.editquantitysavelater = ""
            
            self.normalproductstring = ""
            self.Movetocartproductstring = ""
            self.Deletecartproductstring = ""
            self.Demostring = ""
            self.DeleteSaveproductstring = ""
//            self.Deletecartproductstring = ""
            self.clikedRestorestring = ""

            
            self.clikedRestorestring = "clikedRestorestringtwo"
            
            // http://172.31.0.13/NumberMall/agent_Gwy.php??method=restoreCart&userid=127&productid=3&isparent=0&sellerID=&quantity=
            self.undoviewfinal.isHidden = true
             self.nocartview.isHidden = true
            self.getcartvalue()
            
        }
    }
    
    
    //MARK: UITableView Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableCart
        {
           // return self.cartListarraysingel.count
            return self.cartListarraysingel.count
//            self.cartListarraysingel

        }
        
        if tableView == cartviewtabelviewtwo
        {
            print(self.cartListNsmuatbelarray1.count)

            return self.cartListarraytwo.count
          //  return self.cartListNsmuatbelarray1.count

        }
        else{
            
            return additionalsold_filledby_namestring1.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableCart
        {
            let cell: CartCell = tableCart.dequeueReusableCell(withIdentifier: "CartCell") as! CartCell
            if self.namestring.count > 0
            {
                cell.productTitle.text = self.namestring[indexPath.row] as String
                cell.sellPrice.text = self.pricestring[indexPath.row] as String
                print(self.stockstring)
                
                if self.stockstring.count > 0
                {
//                    cell.lblInStock.text = self.stockstring[indexPath.row] as! String
//                    print(self.stockstring)
//
                    if let Descriptionfav:String = self.stockstring[indexPath.row] as? String {
                        
//                        self.discriptioonFavourite.append(Descriptionfav)
                        cell.lblInStock.text = Descriptionfav
                    }
                    
                    
//                    let valuetotal =  self.stockstring[indexPath.row] as! String
//                    if valuetotal.count > 0
//                    {
//                        cell.lblInStock.text = valuetotal
//                    }
                    
                }
                if self.stock_colorstring.count > 0
                {
                    if let DescriptionfavTotal:String = self.stock_colorstring[indexPath.row] as? String
                    {
                    let value = self.hexStringToUIColor(hex:DescriptionfavTotal)
                        cell.lblInStock.textColor =  value
                    }
                }
                let value =  self.quantitystring
              let valueis = self.quantitystring[indexPath.row] as? NSNumber
                  cell.editCart.text = valueis?.stringValue
//                cell.editCart.text = self.quantitystring[indexPath.row] as? String
                cell.selectionStyle = .none
                print(self.iscombostring)
                print(self.isParentstring)
                if self.isParentstring.count > 0 || self.parentIDstring.count > 0
                {
                    let parentidfinal =                 self.parentIDstring[indexPath.row]
                    
                     let parentvalue =                 self.isParentstring[indexPath.row]
                    
                    if parentvalue.count > 0
                    {
                      cell.btnEdit.setBackgroundImage(#imageLiteral(resourceName: "cart_edit"), for:.normal)
                    }
                    if parentidfinal.count > 0
                    {
                        cell.btnEdit.setBackgroundImage(#imageLiteral(resourceName: "count_grey"), for:.normal)
//                        cell.isUserInteractionEnabled = false

                    }
                    else{
                          cell.btnEdit.setBackgroundImage(#imageLiteral(resourceName: "cart_edit"), for:.normal)
                    }
                }
            
               clikedtabelview  = "tableCart"
                
           
                if self.cartListNsmuatbelarray.count > 0
                {
                    if indexPath.row == self.cartListarraysingel.count - 1 {
                        
                        
                    }
                }
               
                cell.btnEdit.tag = indexPath.row
                cell.btnEdit.addTarget(self, action: #selector(CartViewController.connected(sender:)), for: .touchUpInside)
                }
               
          
            
            return cell
        }
        if tableView == soldtabelview
        {
            let cell:UITableViewCell = (self.soldtabelview.dequeueReusableCell(withIdentifier: cellReuseIdentifier))!
            cell.textLabel?.text = self.additionalsold_filledby_namestring1[indexPath.row]
            cell.textLabel?.font = UIFont(name: "Arial", size: 14.5)!
            
            cell.textLabel?.textColor =  UIColor.black
            return cell
        }
            
        else
        {
            let cell: CartCell = cartviewtabelviewtwo.dequeueReusableCell(withIdentifier: "CartCell") as! CartCell
            
            
            if self.namestring1.count > 0
            {
                print(self.namestring1.count)
                cell.productTitle.text = self.namestring1[indexPath.row] as String
                cell.sellPrice.text = self.pricestring1[indexPath.row] as String
                cell.lblInStock.text = self.stockstring1[indexPath.row] as String
                let color1label = self.hexStringToUIColor(hex:self.stock_colorstring1[indexPath.row])
                cell.lblInStock.textColor =  color1label
                
                if self.quantitystring1.count > 0
                {
                     let valueis = self.quantitystring1[indexPath.row]as? NSNumber
                     cell.editCart.text = valueis?.stringValue
//                    if let quantitystring1Namefinal:String = self.quantitystring1[indexPath.row] as? String
//                    {
////                        self.ComboName = quantitystring1Namefinal
//                           cell.editCart.text = quantitystring1Namefinal
//                    }
                }
               
                cell.selectionStyle = .none
                clikedtabelview  = "cartviewtabelviewtwo"
                cell.btnEdit.setBackgroundImage(#imageLiteral(resourceName: "cart_edit"), for:.normal)
                cell.btnEdit.tag = indexPath.row
//                cell.btnEdit.addTarget(self, action: #selector(CartViewController.connected(sender:)), for: .touchUpInside)
            }
           
            return cell
        }
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == tableCart
        {
            return 75

        }
        if tableView == soldtabelview
        {
            return 35
            
        }
        else{
            return 75
        }
    }
    @objc func connected(sender: UIButton)
    {
        let buttonTag = sender.tag
        
        let parentidfinaltwo = self.parentIDstring[buttonTag]
        if parentidfinaltwo.count > 0
        {
        }
        else{
            if self.MOQstring.count > 0
            {
                self.undoviewfinal.isHidden = true
                  let MOQstrings2 = self.MOQstring[buttonTag]
              
                let s:String = String(format:"%@ %@", MOQstrings2 as! CVarArg,"X")
                self.singquantitylabel.text = s as! String
                
                
                let valueis = self.quantitystring[buttonTag] as! NSNumber
                
                self.anotherquntitylabel.text =  valueis.stringValue
                
                if self.additionalsold_filledby_discriptionstring1.count > 0
                {
//                    print(self.additionalsold_filledby_discriptionstring1[buttonTag])
//                    self.NumberMalltitlelabel.text = self.additionalsold_filledby_discriptionstring1[buttonTag]
                }
                self.finalchangecolor.isHidden = false
                self.demofinalvalue.isHidden = true
                middleLabel.textColor = UIColor.red
                self.Confirm.isHidden = true
                self.saveforlater.isHidden = true
                self.updatebutton.isHidden = false
                
                let sellerIdstring2:String =  self.sellerIdstring[buttonTag] as! String
                
                
                self.cartselledidfinlvalue  = sellerIdstring2
                self.cartidupdate = self.idstring[buttonTag]
                
                
              let Totalvaluefinal = self.quantitystring[buttonTag] as! NSNumber
              
                  self.cartidQunatityvalue = Totalvaluefinal.stringValue
                
                let valuefinal = self.quantitystring[buttonTag]as!NSNumber
               
                let invalue = Int(valuefinal.stringValue)
                
                self.pickerView.selectRow(invalue!, inComponent: 0, animated: true)
                self.selectedidstring  = ""
                self.selectedidstring = self.idstring[buttonTag]
                self.Deletecartselectedidstring = ""
                
                self.Deletecartselectedidstring = self.idstring[buttonTag]

            }
            
            
            
            //        producidclikstring = self.ProductidValue[buttonTag]
            //        print(producidclikstring)
//            self.demoviewfinalvalue.isHidden = false

            self.mainpopupscrooview.isHidden  = false
            let bottomSheet = JXBottomSheetView(contentView:mainpopupscrooview as! UIScrollView)
            bottomSheet.defaultMininumDisplayHeight = 0
            bottomSheet.defaultMaxinumDisplayHeight = self.view.frame.size.height
            bottomSheet.displayState = .maxDisplay
            bottomSheet.frame = self.view.bounds
            self.view.addSubview(bottomSheet)
            
         
          
        }
            
            
   
    }
    
//    @IBOutlet weak var Brand: UILabel!
//
//    @IBOutlet weak var distibutionlabel: UILabel!
//
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if tableView == soldtabelview
        {
            let titlestring = self.soldbytabelarray1[indexPath.row]
            self.NumberMalltitlelabel.text = titlestring
            self.soldview.isHidden = true
            self.soldtabelview.isHidden = true
            self.drop.tag  = 1
            
            if titlestring == "NumberMall"
            {
                self.NumberMalltitlelabel.frame = CGRect(x: self.NumberMalltitlelabel.frame.origin.x, y: self.NumberMalltitlelabel.frame.origin.y, width: self.NumberMalltitlelabel.frame.size.width, height: self.NumberMalltitlelabel.frame.size.height)
                self.Brand.frame = CGRect(x:95, y: self.Brand.frame.origin.y, width: self.Brand.frame.size.width, height: self.Brand.frame.size.height)
            }
            if titlestring == "Venkata Ramana Traders"
            {
                self.NumberMalltitlelabel.frame = CGRect(x: self.NumberMalltitlelabel.frame.origin.x, y: self.NumberMalltitlelabel.frame.origin.y, width: self.NumberMalltitlelabel.frame.size.width+70, height: self.NumberMalltitlelabel.frame.size.height)
                self.Brand.frame = CGRect(x: self.Brand.frame.origin.x+84, y: self.Brand.frame.origin.y, width: self.Brand.frame.size.width, height: self.Brand.frame.size.height)
            }
        }
        else{
            DispatchQueue.main.async
                {
                let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"ProductDescriptionViewController")as!ProductDescriptionViewController
                    viewfinal.productdemoidfinalvalue  = self.productindividulaidvalue[indexPath.row]
                self.present(viewfinal, animated:true, completion:nil)
            }
        }

    }
//    func tableView(_ tableView: UITableView,
//                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
//    {
//        if tableView == tableCart
//        {
//            let closeAction = UIContextualAction(style: .normal, title:  "Close", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
//                print("Added to cart")
//
//                success(true)
////                let tex =  self.array[indexPath.row]
////                self.insert_cells.append(tex)
////                self.array.remove(at: indexPath.row)
////                self.insert_rows.append(indexPath.row)
////                self.tableCart.reloadData()
//
//            })
//            closeAction.image = UIImage(named: "Delete.png")
//            closeAction.backgroundColor = UIColor.red
//            let addToCarttitle = UIContextualAction(style: .normal, title: "") { (action, view, nil) in
//                print("Added to cart")
//
//                self.DeleteSaveproductstring = "DeleteSaveproductstring"
//
//                self.normalproductstring = ""
//                self.Movetocartproductstring = ""
//                self.Demostring = ""
//                self.Movetocartproductstring = ""
//                self.Deletecartproductstring = ""
//                 self.selectedidstring = ""
//                self.clikedRestorestring = ""
//                self.clikedRestorestringtwo = ""
//                self.updatebuttonstring = ""
//                self.editquantitydelete = ""
//                self.editquantitysavelater = ""
//                print(self.idstring)
//                self.Deleteselectedidstring = self.idstring[indexPath.row]
//
//                self.selectedIndexcart = indexPath.row
//
//                  self.dletecartintvalue = indexPath.row
//
//
//
//                self.saveforlatername  = self.namestring[indexPath.row]
//
//                print(indexPath.row)
//                print(self.selectedIndexcart)
//
//                self.cartListarraysingel.remove(at:indexPath.row)
//                self.clikedtypeone = "clikedtypeone1"
//         self.tableCart.reloadData()
//
//                DispatchQueue.main.async {
//                    self.getcartvalue()
//                }
//
//            }
//
//
//            addToCarttitle.backgroundColor = UIColor.red
//            addToCarttitle.title = "Delete"
//             let parentidfinaltwo = self.parentIDstring[indexPath.row]
//            if parentidfinaltwo.count > 0
//            {
//                let stringvalue = String(format:"%@%@%@","Combo Product"," ","Removed from cart")
//                self.ItemsRemovedfinalvalue.setTitle(stringvalue, for:.normal)
//                return nil
//            }
//            else{
//                let stringvalue = String(format:"%@%@%@",self.saveforlatername," ","Removed from cart")
//
//
//
//                return UISwipeActionsConfiguration(actions: [addToCarttitle,closeAction])
//            }
//
//        }
//        else
//        {
//            let closeAction = UIContextualAction(style: .normal, title:  "Close", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
//                print("delete 20 More productsiamge")
//
//                success(true)
//
//            })
//
//            closeAction.image = UIImage(named:"delete.png")
//            closeAction.backgroundColor = UIColor.red
//            let addToCarttitle = UIContextualAction(style: .normal, title: "") { (action, view, nil) in
//                print("delete 20 More productsDeleteimage")
//
//                self.normalproductstring = ""
//                self.Movetocartproductstring = ""
//                self.Demostring = ""
//                self.selectedIndexcart = indexPath.row
//
//                self.Movetocartproductstring = ""
//                self.Deletecartproductstring = "Deletecartproductstring"
//                self.DeleteSaveproductstring = ""
//                 self.selectedIndexcart = nil
//                self.clikedRestorestring = ""
//                self.clikedRestorestring = ""
//                self.clikedRestorestringtwo = "clikedRestorestringtwo"
//                self.clikedtypeone = "clikedtypeone2"
//                self.updatebuttonstring = ""
//                self.editquantitydelete = ""
//                self.editquantitysavelater = ""
////clikedtwoRestorestring
//                DispatchQueue.main.async {
//                    self.getcartvalue()
//                }
//                self.selectedIndexcart = indexPath.row
//                         self.movetocatname  = self.namestring1[indexPath.row]
//
//    let stringvalue = String(format:"%@%@%@",self.movetocatname," ","Removed from cart")
//                self.ItemsRemovedfinalvalue.setTitle(stringvalue, for:.normal)
//                self.cartListarraytwo.remove(at:indexPath.row)
//                self.Deletecartselectedidstring  = self.idstring1[indexPath.row]
//                self.cartviewtabelviewtwo.reloadData()
//                self.undoviewfinal.isHidden = false
//
//                self.timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(self.timerActionfinalvalue), userInfo: nil, repeats: false)
//
//            }
//            addToCarttitle.backgroundColor = UIColor.red
//            addToCarttitle.title = "Delete"
//
//            return UISwipeActionsConfiguration(actions: [addToCarttitle,closeAction])
//        }
//
//
//    }
//
//    func tableView(_ tableView: UITableView,
//                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
//    {
//        if tableView == tableCart
//        {
//
//
//            let parentidfinaltwo = self.parentIDstring[indexPath.row]
//            if parentidfinaltwo.count > 0
//            {
//                return nil
//            }
//            else{
//
//
//
//                let modifyAction = UIContextualAction(style: .normal, title:  "Update", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
//                    self.cartviewtwo.isHidden = false
//                    print("upgradeaction")
//                    success(true)
//                })
//
//
//          modifyAction.image =  #imageLiteral(resourceName: "delete-1")
//
//             //   deltebutton.setBackgroundImage(#imageLiteral(resourceName: "delete-1"), for:.normal)
//
//
//                modifyAction.backgroundColor = UIColor.SwipetosavecolorValiue()
//
//                let removeAction = UIContextualAction(style: .normal,
//                                                      title: "Save for later",
//                                                      handler: { (action: UIContextualAction, view: UIView, success :(Bool) -> Void) in
//                                                        success(true)
//                                                        self.cartviewtwo.isHidden = false
//                                                        print("Method called")
//
//
//
//
//
//
//
//
//
//
//                let parentvalue = self.isParentstring[indexPath.row]
//
//              if parentvalue.count > 0
//              {
//
//                let stringvalue = String(format:"%@%@%@","Combo product"," ","Can Not Saved")
//                self.ItemsRemovedfinalvalue.setTitle(stringvalue, for:.normal)
//                self.undoviewfinal.isHidden = false
//
//                self.timer = Timer.scheduledTimer(timeInterval:1, target: self, selector: #selector(self.timerActionfinalvalue), userInfo: nil, repeats: false)
//
//            }
//              else{
//                DispatchQueue.main.async {
//                    self.selectedIndexcart = indexPath.row
//
//                     self.Saveforlaterintvalue = indexPath.row
//
//                    print(self.cartListarray)
//                    print(self.cartListNsmuatbelarray)
//                    print( self.selectedIndexcart)
//                    self.clikedRestorestring = ""
//                    self.Movetocartproductstring = ""
//                    self.Demostring = ""
//                    self.editquantitydelete = ""
//                    self.editquantitysavelater = ""
//                    self.Movetocartproductstring = ""
//                    self.Deletecartproductstring = ""
//                    self.DeleteSaveproductstring = ""
//                    self.updatebuttonstring = ""
//
//                    self.cartListarraysingel.remove(at:indexPath.row)
//                    self.tableCart.reloadData()
//                    self.selectedidstring = ""
//
//                    self.selectedidstring = self.idstring[indexPath.row]
//                    self.normalproductstring = "normalproductstring"
//
//                    self.clikedRestorestringtwo = ""
//
//
//                    self.savelforlater = self.namestring[indexPath.row]
//                    let stringvalue = String(format:"%@%@%@",self.savelforlater," ","to savefor later")
//                    self.ItemsRemovedfinalvalue.setTitle(stringvalue, for:.normal)
//                    self.undoviewfinal.isHidden = false
//
//                    self.timer = Timer.scheduledTimer(timeInterval:1, target: self, selector: #selector(self.timerActionfinalvalue), userInfo: nil, repeats: false)
//
//                    self.getcartvalue()
//                }
//                }
//
//
//
//                })
//
//                removeAction.title = "Save for later"
//                removeAction.backgroundColor = UIColor.SwipetosavecolorValiue()
//                return UISwipeActionsConfiguration(actions: [removeAction,modifyAction])
//            }
//
//
//
//
//
//
////            let parentidfinaltwo = self.parentIDstring[indexPath.row]
////            if parentidfinaltwo.count > 0
////            {
////                return nil
////            }
////            else{
////                 return UISwipeActionsConfiguration(actions: [removeAction,modifyAction])
////            }
////
//
//
//
//
//        }
//
//        else
//        {
//            let modifyAction = UIContextualAction(style: .normal, title:  "Movecart title", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
//
//                print("Movecart titleimage")
//                success(true)
//            })
//            modifyAction.image = UIImage(named:"shopping-cart.png")
//            modifyAction.backgroundColor = UIColor.SwipetosavecolorValiue()
//
//            let removeAction = UIContextualAction(style: .normal,
//                                                  title: "Move to cart",
//                                                  handler: { (action: UIContextualAction, view: UIView, success :(Bool) -> Void) in
//                                                    success(true)
//
//                self.normalproductstring = ""
//                self.Movetocartproductstring = "Movetocartproductstring";
//                self.Demostring = ""
//                self.DeleteSaveproductstring = ""
//                self.clikedRestorestring = ""
//                self.clikedRestorestringtwo = ""
//
//                                                    self.editquantitydelete = ""
//                                                    self.editquantitysavelater = ""
//                                                    self.updatebuttonstring = ""
//
//                        self.selectedidstring = self.idstring1[indexPath.row]
//
//            self.movetocatname = self.namestring1[indexPath.row]
//
//
//let stringvalue = String(format:"%@%@%@",self.movetocatname," ","to movecart")
//    self.ItemsRemovedfinalvalue.setTitle(stringvalue, for:.normal)
//                                                    self.timer = Timer.scheduledTimer(timeInterval:1, target: self, selector: #selector(self.timerActionfinalvalue), userInfo: nil, repeats: false)
//
//            self.undoviewfinal.isHidden = false
//
//                    DispatchQueue.main.async
//                        {
//                        self.getcartvalue()
//
//                        }
//                self.selectedIndexcart = nil
//
//            self.selectedIndexcart = indexPath.row
//            print( self.selectedIndexcart)
//            self.cartListarraytwo.remove(at:indexPath.row)
//            self.cartviewtabelviewtwo.reloadData()
//
//            print( self.cartListNsmuatbelarray)
//
//            })
//            removeAction.title = "Move to cart"
//            removeAction.backgroundColor = UIColor.SwipetosavecolorValiue()
////            let parentidfinaltwo = self.parentIDstring1[indexPath.row]
////            if parentidfinaltwo == ""
////            {
//                 return UISwipeActionsConfiguration(actions: [removeAction,modifyAction])
////
////            }
////            else{
////
////                 return nil
////            }
//
//
//
//        }
//    }
//    public func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle
//    {
//
//        if clikedtabelview == "tableCart"
//        {
//            if self.parentIDstring.count > 0
//            {
//
//                if let parentidfinaltwofinal:String = self.parentIDstring[indexPath.row]as!String
//                {
////                    self.variantMRPDisplayQuantity = parentidfinaltwofinal
//                    return UITableViewCellEditingStyle.none
//                }
//
//
////                 let parentidfinaltwo = self.parentIDstring[indexPath.row]
//            }
////            let parentidfinaltwo = self.parentIDstring[indexPath.row]
////            if parentidfinaltwo.count > 0
////            {
////                return UITableViewCellEditingStyle.none
////            }
//            else{
//                return UITableViewCellEditingStyle(rawValue: -1)!
//
//            }
//        }
//        else{
//                return UITableViewCellEditingStyle.none
//        }
//    }
    
    
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        if tableView == tableCart
        {
            let closeAction = UIContextualAction(style: .normal, title:  "Close", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                
                success(true)
                //                let tex =  self.array[indexPath.row]
                //                self.insert_cells.append(tex)
                //                self.array.remove(at: indexPath.row)
                //                self.insert_rows.append(indexPath.row)
                //                self.tableCart.reloadData()
                
            })
            
            
          
        //    closeAction.image =   #imageLiteral(resourceName: "selectdelete")
            
            closeAction.image =   #imageLiteral(resourceName: "Deletefinalvalue.png")

          
           // closeAction.image = UIImage(named: "Delete.png")

            closeAction.backgroundColor = UIColor.red
            let addToCarttitle = UIContextualAction(style: .normal, title: "") { (action, view, nil) in
                
                self.DeleteSaveproductstring = "DeleteSaveproductstring"
                
                self.normalproductstring = ""
                self.Movetocartproductstring = ""
                self.Demostring = ""
                self.Movetocartproductstring = ""
                self.Deletecartproductstring = ""
                self.selectedidstring = ""
                self.clikedRestorestring = ""
                self.clikedRestorestringtwo = ""
                self.updatebuttonstring = ""
                self.editquantitydelete = ""
                self.editquantitysavelater = ""
                self.Deleteselectedidstring = self.idstring[indexPath.row]
                
                self.selectedIndexcart = indexPath.row
                
                self.dletecartintvalue = indexPath.row
                
                
                
                self.saveforlatername  = self.namestring[indexPath.row]
                
            
                self.cartListarraysingel.remove(at:indexPath.row)
                self.clikedtypeone = "clikedtypeone1"
                self.tableCart.reloadData()
                
                DispatchQueue.main.async {
                    self.getcartvalue()
                }
                
            }
            
            
            addToCarttitle.backgroundColor = UIColor.red
            addToCarttitle.title = "Delete"
            let parentidfinaltwo = self.parentIDstring[indexPath.row]
            if parentidfinaltwo.count > 0
            {
                let stringvalue = String(format:"%@%@%@","Combo Product"," ","Removed from cart")
                self.ItemsRemovedfinalvalue.setTitle(stringvalue, for:.normal)
                return nil
            }
            else{
                let stringvalue = String(format:"%@%@%@",self.saveforlatername," ","Removed from cart")
                
                
                
                return UISwipeActionsConfiguration(actions: [addToCarttitle,closeAction])
            }
            
        }
        else
        {
            let closeAction = UIContextualAction(style: .normal, title:  "Close", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                
                success(true)
                
            })
//            closeAction.image = UIImage(named: "Delete.png")
            
//            closeAction.image = UIImage(named: "delete.png")
            
              closeAction.image =   #imageLiteral(resourceName: "Deletefinalvalue.png")

            closeAction.backgroundColor = UIColor.red
            let addToCarttitle = UIContextualAction(style: .normal, title: "") { (action, view, nil) in
                
                self.normalproductstring = ""
                self.Movetocartproductstring = ""
                self.Demostring = ""
                self.selectedIndexcart = indexPath.row
                
                self.Movetocartproductstring = ""
                self.Deletecartproductstring = "Deletecartproductstring"
                self.DeleteSaveproductstring = ""
                self.selectedIndexcart = nil
                self.clikedRestorestring = ""
                self.clikedRestorestring = ""
                self.clikedRestorestringtwo = "clikedRestorestringtwo"
                self.clikedtypeone = "clikedtypeone2"
                self.updatebuttonstring = ""
                self.editquantitydelete = ""
                self.editquantitysavelater = ""
                //clikedtwoRestorestring
                DispatchQueue.main.async {
                    self.getcartvalue()
                }
                self.selectedIndexcart = indexPath.row
                self.movetocatname  = self.namestring1[indexPath.row]
                
                let stringvalue = String(format:"%@%@%@",self.movetocatname," ","Removed from cart")
                self.ItemsRemovedfinalvalue.setTitle(stringvalue, for:.normal)
                self.cartListarraytwo.remove(at:indexPath.row)
                self.Deletecartselectedidstring  = self.idstring1[indexPath.row]
                self.cartviewtabelviewtwo.reloadData()
                self.undoviewfinal.isHidden = false
                
                self.timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(self.timerActionfinalvalue), userInfo: nil, repeats: false)
                
            }
            addToCarttitle.backgroundColor = UIColor.red
            addToCarttitle.title = "Delete"
            
            return UISwipeActionsConfiguration(actions: [addToCarttitle,closeAction])
        }
        
        
    }
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        if tableView == tableCart
        {
            let parentidfinaltwo = self.parentIDstring[indexPath.row]
            if parentidfinaltwo.count > 0
            {
                return nil
            }
            else{
                
                
                
                let modifyAction = UIContextualAction(style: .normal, title:  "Update", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                    self.cartviewtwo.isHidden = false
                    success(true)
                })
                modifyAction.image = UIImage(named: "down-arrowDelete.png")
                
                
                modifyAction.backgroundColor = UIColor.SwipetosavecolorValiue()
                
                let removeAction = UIContextualAction(style: .normal,
                                                      title: "Save for later",
                                                      handler: { (action: UIContextualAction, view: UIView, success :(Bool) -> Void) in
                                                        success(true)
                                                        self.cartviewtwo.isHidden = false
                                                        
                                                       
                                                        
                                                        let parentvalue = self.isParentstring[indexPath.row]
                                                        
                                                        if parentvalue.count > 0
                                                        {
                                                            
                                                            let stringvalue = String(format:"%@%@%@","Combo product"," ","Can Not Saved")
                                                            self.ItemsRemovedfinalvalue.setTitle(stringvalue, for:.normal)
                                                            self.undoviewfinal.isHidden = false
                                                            
                                                            self.timer = Timer.scheduledTimer(timeInterval:1, target: self, selector: #selector(self.timerActionfinalvalue), userInfo: nil, repeats: false)
                                                            
                                                        }
                                                        else{
                                                            DispatchQueue.main.async {
                                                                self.selectedIndexcart = indexPath.row
                                                                
                                                                self.Saveforlaterintvalue = indexPath.row
                                                                
                                                                self.clikedRestorestring = ""
                                                                self.Movetocartproductstring = ""
                                                                self.Demostring = ""
                                                                self.editquantitydelete = ""
                                                                self.editquantitysavelater = ""
                                                                self.Movetocartproductstring = ""
                                                                self.Deletecartproductstring = ""
                                                                self.DeleteSaveproductstring = ""
                                                                self.updatebuttonstring = ""
                                                                
                                                                self.cartListarraysingel.remove(at:indexPath.row)
                                                                self.tableCart.reloadData()
                                                                self.selectedidstring = ""
                                                                
                                                                self.selectedidstring = self.idstring[indexPath.row]
                                                                self.normalproductstring = "normalproductstring"
                                                                
                                                                self.clikedRestorestringtwo = ""
                                                                
                                                                
                                                                self.savelforlater = self.namestring[indexPath.row]
                                                                let stringvalue = String(format:"%@%@%@",self.savelforlater," ","to savefor later")
                                                                self.ItemsRemovedfinalvalue.setTitle(stringvalue, for:.normal)
                                                                self.undoviewfinal.isHidden = false
                                                                
                                                                self.timer = Timer.scheduledTimer(timeInterval:1, target: self, selector: #selector(self.timerActionfinalvalue), userInfo: nil, repeats: false)
                                                                
                                                                self.getcartvalue()
                                                            }
                                                        }
                                                        
                                                        
                                                        
                })
                
                removeAction.title = "Save for later"
                removeAction.backgroundColor = UIColor.SwipetosavecolorValiue()
                return UISwipeActionsConfiguration(actions: [removeAction,modifyAction])
            }
            
            
            
            
            
            
            //            let parentidfinaltwo = self.parentIDstring[indexPath.row]
            //            if parentidfinaltwo.count > 0
            //            {
            //                return nil
            //            }
            //            else{
            //                 return UISwipeActionsConfiguration(actions: [removeAction,modifyAction])
            //            }
            //
            
            
            
            
        }
            
        else
        {
            let modifyAction = UIContextualAction(style: .normal, title:  "Movecart title", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                
                success(true)
            })
            modifyAction.image = UIImage(named:"shopping-cart.png")
            modifyAction.backgroundColor = UIColor.SwipetosavecolorValiue()
            
            let removeAction = UIContextualAction(style: .normal,
                                                  title: "Move to cart",
                                                  handler: { (action: UIContextualAction, view: UIView, success :(Bool) -> Void) in
                                                    success(true)
                                                    
                                                    self.normalproductstring = ""
                                                    self.Movetocartproductstring = "Movetocartproductstring";
                                                    self.Demostring = ""
                                                    self.DeleteSaveproductstring = ""
                                                    self.clikedRestorestring = ""
                                                    self.clikedRestorestringtwo = ""
                                                    
                                                    self.editquantitydelete = ""
                                                    self.editquantitysavelater = ""
                                                    self.updatebuttonstring = ""
                                                    
                                                    self.selectedidstring = self.idstring1[indexPath.row]
                                                    
                                                    self.movetocatname = self.namestring1[indexPath.row]
                                                    
                                                    
                                                    let stringvalue = String(format:"%@%@%@",self.movetocatname," ","to movecart")
                                                    self.ItemsRemovedfinalvalue.setTitle(stringvalue, for:.normal)
                                                    self.timer = Timer.scheduledTimer(timeInterval:1, target: self, selector: #selector(self.timerActionfinalvalue), userInfo: nil, repeats: false)
                                                    
                                                    self.undoviewfinal.isHidden = false
                                                    
                                                    DispatchQueue.main.async
                                                        {
                                                            self.getcartvalue()
                                                            
                                                    }
                                                    self.selectedIndexcart = nil
                                                    
                                                    self.selectedIndexcart = indexPath.row
                                                    self.cartListarraytwo.remove(at:indexPath.row)
                                                    self.cartviewtabelviewtwo.reloadData()
                                                    
                                                    
            })
            removeAction.title = "Move to cart"
            removeAction.backgroundColor = UIColor.SwipetosavecolorValiue()
            //            let parentidfinaltwo = self.parentIDstring1[indexPath.row]
            //            if parentidfinaltwo == ""
            //            {
            return UISwipeActionsConfiguration(actions: [removeAction,modifyAction])
            //
            //            }
            //            else{
            //
            //                 return nil
            //            }
            
            
            
        }
    }
    public func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle
    {
        
        if clikedtabelview == "tableCart"
        {
            if self.parentIDstring.count > 0
            {
                
                if let parentidfinaltwofinal:String = self.parentIDstring[indexPath.row]as!String
                {
                    //                    self.variantMRPDisplayQuantity = parentidfinaltwofinal
                    return UITableViewCellEditingStyle.none
                }
                
                
                //                 let parentidfinaltwo = self.parentIDstring[indexPath.row]
            }
                //            let parentidfinaltwo = self.parentIDstring[indexPath.row]
                //            if parentidfinaltwo.count > 0
                //            {
                //                return UITableViewCellEditingStyle.none
                //            }
            else{
                return UITableViewCellEditingStyle(rawValue: -1)!
                
            }
        }
        else{
            return UITableViewCellEditingStyle.none
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return modelData.count
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    {
        return 80
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
         middleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
        middleLabel.text = modelData[row]
        middleLabel.textColor = UIColor.red
        middleLabel.textAlignment = .center
        middleLabel.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.thin)
        view.addSubview(middleLabel)
        if  di_count == row {
            middleLabel.textColor = UIColor.red
        }
        else{
            middleLabel.textColor = UIColor.black
        }
        view.transform =  CGAffineTransform(rotationAngle: 90 * (.pi/180))
        return view
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        pickerView.selectRow(row, inComponent:0, animated: true)
        return modelData[row] as String
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let finalstring = modelData[row]
        if finalstring == "10+"
        {
            demofinalvalue.isHidden = false
            finalchangecolor.isHidden = true
        }
        anotherquntitylabel.text = modelData[row]
        
        
        if modelData[row] == "10+"
        {
            mytextfiledcolor.text = "10"
anotherquntitylabel.text! = "10"
        }
        else{
           
            mytextfiledcolor.text = modelData[row]

        }
        
         self.cartidQunatityvalue = anotherquntitylabel.text!
        
        
//         self.cartidQunatityvalue = "0"
//        self.cartidQunatityvalue = anotherquntitylabel.text!
//        let someString = String(anotherquntitylabel.text!)
//        if let myInteger = Int(someString) {
//            let myNumber = NSNumber(value:myInteger)
//            self.cartidQunatityvalue = myNumber
//        }
        

        di_count = row
        pickerView.reloadAllComponents()
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        pickerView.reloadAllComponents()
    }
    
    @IBAction func Updatebutton(_ sender: UIButton)
    {
        self.normalproductstring = ""
        self.Movetocartproductstring = ""
        self.Deletecartproductstring = ""
        self.Demostring = ""
        self.DeleteSaveproductstring = ""
        self.Deletecartproductstring = ""
        self.clikedRestorestring = ""
        self.clikedRestorestring = ""
        self.updatebuttonstring = "updatebuttonstring"
        self.demoviewfinalvalue.isHidden = true
        self.mainpopupscrooview.isHidden = true
        self.saveforlater.isHidden = true
        self.Confirm.isHidden = true

        
        self.mainpopupscrooview.isHidden  = false
        let bottomSheet = JXBottomSheetView(contentView:mainpopupscrooview as! UIScrollView)
        bottomSheet.defaultMininumDisplayHeight = 0
        bottomSheet.defaultMaxinumDisplayHeight = 0
        bottomSheet.displayState = .maxDisplay
        bottomSheet.frame = self.view.bounds
        self.view.addSubview(bottomSheet)
        
        
        
       self.getcartvalue()
    }
    
    @IBAction func Deletebutton(_ sender: UIButton)
    {
        if deltebutton.tag == 0
        {
            
            deltebutton.setBackgroundImage(#imageLiteral(resourceName: "selectdelete"), for:.normal)
            Confirm.isHidden = false
            saveforlater.isHidden = false
            updatebutton.isHidden = true
            deltebutton.tag = 1
        }
        else  if deltebutton.tag == 1
        {
            deltebutton.setBackgroundImage(#imageLiteral(resourceName: "Deletefinal"), for:.normal)
            Confirm.isHidden = true
            saveforlater.isHidden = true
            updatebutton.isHidden = false
            deltebutton.tag = 0
        }

    }
    
    @IBAction func Confrim(_ sender: UIButton)
    {
        self.normalproductstring = ""
        self.Movetocartproductstring = ""
        self.Deletecartproductstring = ""
        self.Demostring = ""
        self.DeleteSaveproductstring = ""
        self.clikedRestorestring = ""
        self.clikedRestorestring = ""
        self.updatebuttonstring = ""
        self.demoviewfinalvalue.isHidden = true
        self.mainpopupscrooview.isHidden  = true
        self.editquantitydelete = "editquantitydelete"
        self.editquantitysavelater = ""
        self.undoviewfinal.isHidden = true
        self.cartListarraysingel.remove(at:dletecartintvalue)
        self.cartviewtabelviewtwo.reloadData()
        self.tableCart.reloadData()
        self.getcartvalue()
        let bottomSheet = JXBottomSheetView(contentView:mainpopupscrooview as! UIScrollView)
        bottomSheet.defaultMininumDisplayHeight = 0
        bottomSheet.defaultMaxinumDisplayHeight = 0
        bottomSheet.displayState = .maxDisplay
        bottomSheet.frame = self.view.bounds
        bottomSheet.delegate = self as? JXBottomSheetViewDelegate
        mainpopupscrooview.delegate = self
        self.demoviewfinalvalue.addSubview(bottomSheet)
        
    }
    
    @IBAction func SaveforLater(_ sender: UIButton)
    {
        self.demoviewfinalvalue.isHidden = true
        self.mainpopupscrooview.isHidden  = true
        self.normalproductstring = ""
        self.Movetocartproductstring = ""
        self.Deletecartproductstring = ""
        self.Demostring = ""
        self.DeleteSaveproductstring = ""
        self.clikedRestorestring = ""
        self.clikedRestorestring = ""
        self.updatebuttonstring = ""
        
        self.editquantitydelete = ""
        self.editquantitysavelater = "editquantitysavelater"
        self.undoviewfinal.isHidden = true
        
    
        self.cartListarraysingel.remove(at:dletecartintvalue)
        self.tableCart.reloadData()
        
        let bottomSheet = JXBottomSheetView(contentView:mainpopupscrooview as! UIScrollView)
        bottomSheet.defaultMininumDisplayHeight = 0
        bottomSheet.defaultMaxinumDisplayHeight = 0
        bottomSheet.displayState = .maxDisplay
        bottomSheet.frame = self.view.bounds
        bottomSheet.delegate = self as? JXBottomSheetViewDelegate
        mainpopupscrooview.delegate = self
        self.demoviewfinalvalue.addSubview(bottomSheet)
        
        
        
        self.getcartvalue()

    }
    
    
    func savecart()
    {
        
         let defaulst = UserDefaults.standard
        
            var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
            request.httpMethod = "POST"
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }

        
         let postString =  String(format: "method=%@&userid=%@&deviceType=%@","getCartList","50867","mobile")
        
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
                        
                      
                        
                    }
                    
                    break
                case .failure(_):
                    DispatchQueue.main.async {
                        self.removeSpinner()
                    }
                    break
                }
                
                
            }
            
        }

    func showSpinner(){
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        //        self.otpView.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(veryalertview)
    }
    func removeSpinner(){
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()
        
    }
    
    func getcartvalue()
    {
      //  http://172.31.0.13/NumberMall/agent_Gwy.php?&method=getCartList&userid=127&productid=&updatedQuantity=&sellerID=
        
        DispatchQueue.main.async {
//            self.veryalertview.isHidden  = false
//            self.showSpinner()
            self.landingfinalview.isHidden = false
        }
        
        
        
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let defaults = UserDefaults.standard
        if let Reviewfinaluseroid:String = defaults.value(forKey: "myuseridvaluefinal")as?String
        {
            self.getcartidstringvalue = Reviewfinaluseroid
        }
        if self.editquantitysavelater == "editquantitysavelater"
        {
            postString1 =  String(format: "method=%@&userid=%@&productid=%@&isparent=%@&sellerID=%@&deviceType=%@","saveForLater",self.getcartidstringvalue,self.selectedidstring,"0","","mobile")
        }
        if self.normalproductstring == "normalproductstring"
        {

                postString1 =  String(format: "method=%@&userid=%@&productid=%@&isparent=%@&sellerID=%@&deviceType=%@","saveForLater",self.getcartidstringvalue,self.selectedidstring,"0","","mobile")
          
          
        }
        if self.Movetocartproductstring == "Movetocartproductstring"
        {
//            self.undoviewfinal.isHidden = true

            postString1 =  String(format: "method=%@&userid=%@&productid=%@&updatedQuantity=%@&sellerID=%@&deviceType=%@","moveToCart",self.getcartidstringvalue,self.selectedidstring,"0","","mobile")
        }
        if self.editquantitydelete == "editquantitydelete"
        {
            self.undoviewfinal.isHidden = true
            
            postString1 =  String(format: "method=%@&userid=%@&productid=%@&isparent=%@&sellerID=%@&deviceType=%@","deleteCart",self.getcartidstringvalue,self.selectedidstring,"0","","mobile")
        }
        if self.Deletecartproductstring == "Deletecartproductstring"
        {
      
                
                self.undoviewfinal.isHidden = true
                
                postString1 =  String(format: "method=%@&userid=%@&productid=%@&isparent=%@&sellerID=%@&deviceType=%@","deleteCart",self.getcartidstringvalue,self.selectedidstring,"0","","mobile")
      
        }
        if self.Demostring == "Demostring"
        {
            self.undoviewfinal.isHidden = true

            postString1 =  String(format: "method=%@&userid=%@&productid=%@&updatedQuantity=%@&sellerID=%@&deviceType=%@","getCartList",self.getcartidstringvalue,self.selectedidstring,"0","","mobile")
        }
        if self.DeleteSaveproductstring == "DeleteSaveproductstring"
        {
           
            
            postString1 =  String(format: "method=%@&userid=%@&productid=%@&isparent=%@&sellerID=%@&deviceType=%@","deleteCart",self.getcartidstringvalue,self.Deleteselectedidstring,"0","","mobile")
            self.undoviewfinal.isHidden = false
            
            self.timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(self.timerActionfinalvalue), userInfo: nil, repeats: false)
        }
        if self.Deletecartproductstring == "Deletecartproductstring"
        {
            self.undoviewfinal.isHidden = false
            
            self.timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(self.timerActionfinalvalue), userInfo: nil, repeats: false)
            postString1 =  String(format: "method=%@&userid=%@&productid=%@&isparent=%@&sellerID=%@&deviceType=%@","deleteSaved",self.getcartidstringvalue,self.Deletecartselectedidstring,"0","","mobile")
        }
        
        if self.clikedRestorestring == "clikedRestorestring"
        {
            self.undoviewfinal.isHidden = true

            postString1 =  String(format: "method=%@&userid=%@&productid=%@&isparent=%@&sellerID=%@&deviceType=%@","restoreCart",self.getcartidstringvalue,self.Deleteselectedidstring,"0","","mobile")
        }
        if self.clikedRestorestring == "clikedRestorestringtwo"
        {
            self.undoviewfinal.isHidden = true

            postString1 =  String(format: "method=%@&userid=%@&productid=%@&isparent=%@&sellerID=%@&deviceType=%@","restoreSaved",self.getcartidstringvalue,self.Deletecartselectedidstring,"0","","mobile")
        }

        if self.updatebuttonstring == "updatebuttonstring"
        {
          
        postString1 =  String(format: "method=%@&userid=%@&productid=%@&isparent=%@&sellerID=%@&quantity=%@","updateCartList",self.getcartidstringvalue, self.cartidupdate,"0",self.cartselledidfinlvalue,self.cartidQunatityvalue)
        }
        let defaulst  = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        

        print(postString1)
  
        request.httpBody = postString1.data(using: .utf8)
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
                    self.landingfinalview.isHidden = true
                    self.landingfinalview.isHidden = true

                    
                    print(dict.value(forKey:"cartQuantity"))
                    print(dict.value(forKey:"total_cart"))
                    print(dict.value(forKey:"cartCount"))

                    if let cartQuantitystring1finalvalue:String = dict.value(forKey:"cartQuantity")as?String {
                        self.cartQuantitystring1 = cartQuantitystring1finalvalue as NSString
                        
                    }
            
                    if let total_cartstring1finalvalue:NSString = dict.value(forKey:"total_cart")as?NSString
                    {
                        self.total_cartstring1 = total_cartstring1finalvalue
                    }
                    
                    if let cartcountfinalvalue:NSNumber = dict.value(forKey:"cartCount")as?NSNumber
                    {
                        self.cartcountstriongone = cartcountfinalvalue
                        self.cartcountstringTwo =  self.cartcountstriongone.stringValue
                    }
             
                    let defaults = UserDefaults.standard
                    
                    defaults.set(self.cartQuantitystring1, forKey:"MycartQuantity")
                    
                    defaults.set(self.total_cartstring1, forKey:"Mytotal_cart")

                    defaults.set(self.cartcountstringTwo, forKey:"MycartCount")

                    
                    self.veryalertview.isHidden = true
                    
                    DispatchQueue.main.async {
                        self.removeSpinner()
                    }
                    
                    
                    if let cartLisinglfinalvalue:NSArray = dict.value(forKey: "cartList") as? NSArray{
                        self.cartListarraysingel = (dict["cartList"] as? [Any])!
                        
                        if self.cartListarraysingel.count > 0
                        {
                            self.cartListarray = self.cartListarraysingel as NSArray
                            //                   self.cartListarray = dict.value(forKey:"cartList")as!NSArray
                            self.cartListNsmuatbelarray.removeAllObjects()
                            //self.cartListNsmuatbelarray.addingObjects(from: )
                            self.cartListNsmuatbelarray.add( self.cartListarray)
                            print(self.cartListNsmuatbelarray)
                            
                            if let iscombostringfinalvalue:[String] = self.cartListarray.value(forKey: "isCombo") as? [String] {
                                self.iscombostring = iscombostringfinalvalue
                            }
                            
                            if let isParentstringfinalvalue:[String] = self.cartListarray.value(forKey: "isParent") as? [String] {
                                self.isParentstring = isParentstringfinalvalue
                            }
                            
                            
                            if let parentIDstringfinalvalue:[String] = self.cartListarray.value(forKey: "parentID") as? [String] {
                                self.parentIDstring = parentIDstringfinalvalue
                            }
                            
                            print(self.parentIDstring)
                            
                            //                    self.PTRstring =  self.cartListarray.value(forKey:"PTR")as![NSNumber]
                            //                    print(self.PTRstring)
                            if let qtyCountstringfinalvalue:[String] = self.cartListarray.value(forKey: "qtyCount") as? [String] {
                                self.qtyCountstring = qtyCountstringfinalvalue
                            }
                            if let qtyAvailabilitystringfinalvalue:[String] = self.cartListarray.value(forKey: "qtyAvailability") as? [String]
                            {
                                self.qtyAvailabilitystring = qtyAvailabilitystringfinalvalue
                            }
                            
                            if let qtyDispstringfinalvalue:[String] = self.cartListarray.value(forKey: "qtyDisp") as? [String]
                            {
                                self.qtyDispstring = qtyDispstringfinalvalue
                            }
                            
                            if let idstringfinalvalue:[String] = self.cartListarray.value(forKey: "id") as? [String]
                            {
                                self.idstring = idstringfinalvalue
                            }
                            if let namestringfinalvalue:[String] = self.cartListarray.value(forKey: "name") as? [String]
                            {
                                self.namestring = namestringfinalvalue
                            }
                            
                            if let productindividulaidvalueTotal:[String] = self.cartListarray.value(forKey: "id") as? [String]
                            {
                                self.productindividulaidvalue = productindividulaidvalueTotal
                            }
                        
                            if let pricestringfinalvalue:[String] = self.cartListarray.value(forKey: "price") as? [String]
                            {
                                self.pricestring = pricestringfinalvalue
                            }
 
                            if let stockstringfinalvalue:NSArray = self.cartListarray.value(forKey: "stock") as? NSArray
                            {
                                self.stockstring = stockstringfinalvalue
                            }
                            print(self.stockstring)
                            
                            if let stock_colorstringfinalvalue:NSArray = self.cartListarray.value(forKey: "stock_color") as? NSArray
                            {
                                self.stock_colorstring = stock_colorstringfinalvalue
                            }
                            print(self.stock_colorstring)

                            
                            if let sellerstringfinalvalue:[String] = self.cartListarray.value(forKey: "seller") as? [String]
                            {
                                self.sellerstring = sellerstringfinalvalue
                            }
                            
                            self.cartListsingel()
                            self.sellerstring =  self.cartListarray.value(forKey:"seller")as![String]
                            print( self.sellerstring)
                            /// add number kranthi anna
//                            if let quantitystringfinalvalue:NSArray = self.cartListarray.value(forKey: "quantity") as? NSArray
//                            {
//                                self.quantitystring = quantitystringfinalvalue
//                            }
                            
                            print(self.quantitystring)
                            self.quantitystring =  self.cartListarray.value(forKey:"quantity")as! [NSNumber]
                            print(self.quantitystring)

                            
                            
                            
                            self.MOQstring =  self.cartListarray.value(forKey:"MOQ")as! NSArray
                            
                            
                            
                            self.sellerIdstring =  self.cartListarray.value(forKey:"sellerId")as!NSArray
                            self.cashbackstring =  self.cartListarray.value(forKey:"cashback")as![NSNumber]
                            self.taxesstring =  self.cartListarray.value(forKey:"taxes")as![NSNumber]
                            
                            self.handlingstring =  self.cartListarray.value(forKey:"handling")as![NSNumber]
                            self.shippingstring =  self.cartListarray.value(forKey:"shipping")as![NSNumber]
                            self.hamalistring =  self.cartListarray.value(forKey:"hamali")as![NSNumber]
                            
                            if let QTYAvailablestringfinalvalue:[String] = self.cartListarray.value(forKey: "QTYAvailable") as? [String]
                            {
                                self.QTYAvailablestring = QTYAvailablestringfinalvalue
                            }
                        
                            self.pphidstring =  self.cartListarray.value(forKey:"pphid")as![String]
                            self.cartcount =  dict.value(forKey:"cartCount")as!NSNumber
                            
                            let value = String(self.namestring.count)
                            
                            let str = String(format:"%@%@%@",value," ","items")
                            self.lblItems.text = str
                            
                            print(self.cartcount)
                            
                            self.cartQuantitystring =  dict.value(forKey:"cartQuantity")as!NSString
                            self.total_cartstring =  dict.value(forKey:"total_cart")as!NSString
                            self.SummaryDetailsaray = dict.value(forKey:"SummaryDetails")as!NSArray
                            self.SummaryDetailsSubHeading =  self.SummaryDetailsaray.value(forKey:"SubHeading")as![String]
                            self.SummaryDetailsSubValue =  self.SummaryDetailsaray.value(forKey:"SubValue")as![String]
                            
                            
                            
                            if self.DeleteSaveproductstring == "DeleteSaveproductstring"
                            {
                                self.tableCart.reloadData()
                                
                            }
                            DispatchQueue.main.async {
                                
                                //                            self.tableCart.frame = CGRect(x: self.tableCart.frame.origin.x, y: self.tableCart.frame.origin.y, width: self.tableCart.frame.size.width, height: self.tableCart.contentSize.height)
                                
                                print(self.SummaryDetailsSubHeading[0])
                                print(self.SummaryDetailsSubValue[0])
                                self.lblSubTotal.text = self.SummaryDetailsSubHeading[0]
                                self.lblSellPrice.text = self.SummaryDetailsSubValue[0]
                                self.lblHandling.text = self.SummaryDetailsSubHeading[1]
                                self.lblHCharge.text = self.SummaryDetailsSubValue[1]
                                self.lblGST.text = self.SummaryDetailsSubHeading[2]
                                self.lblGSTValue.text = self.SummaryDetailsSubValue[2]
                                self.lblCashBack.text = self.SummaryDetailsSubHeading[3]
                                self.labelcashbackfinal.text = self.SummaryDetailsSubValue[3]
                                let valuefinal = String(self.total_cartstring)
                                self.btnAmnt.setTitle(valuefinal, for:.normal)
                                
                                if self.Movetocartproductstring == "Movetocartproductstring"
                                {
                                    self.tableCart.reloadData()
                                    
                                }
                                //                        if self.Deletecartproductstring == "Deletecartproductstring"
                                //                        {
                                //                            self.tableCart.reloadData()
                                //                        }
                                
                                if self.Demostring == "Demostring"
                                {
                                    self.tableCart.reloadData()
                                }
                                if self.clikedRestorestring == "clikedRestorestring"
                                {
                                    self.tableCart.reloadData()
                                    
                                }
                                if self.clikedRestorestring == "clikedRestorestringtwo"
                                    
                                {
                                    self.tableCart.reloadData()
                                    
                                }
                                if self.updatebuttonstring == "updatebuttonstring"
                                {
                                    self.tableCart.reloadData()
                                    
                                }
                                
                                if self.editquantitydelete == "editquantitydelete"
                                {
                                    self.undoviewfinal.isHidden = true
                                    
                                    self.tableCart.reloadData()
                                    
                                }
                                
                            }
                        }
                    }
                
                    if self.cartListarraysingel.count <= 0
                    {
                        self.cartsingelfinalvalue()
                        if  self.cartcount == 0
                        {
                            
                            self.Demoscrollviewfinal.isHidden = true
                            
                            self.mainpopupscrooview.isHidden = true
                         
                            if self.clikedRestorestring == "clikedRestorestring"
                            {
//                                self.nocartview.isHidden = true
                            }
                            
                            
                        }
                    }
                
                   
                    if let cartListarray1viewfianl:NSArray = dict.value(forKey:"savedList")as?NSArray
                    {
                        print(cartListarray1viewfianl)
                        
                        self.cartListarraytwo =  (dict["savedList"] as? [Any])!
                        
                        if self.cartListarraytwo.count > 0
                        {
                            self.cartListarray1 = self.cartListarraytwo as NSArray
                            self.cartListNsmuatbelarray1.removeAllObjects()
                            //self.cartListNsmuatbelarray.addingObjects(from: )
                            self.cartListNsmuatbelarray1.add( self.cartListarray1)
                            print(self.cartListNsmuatbelarray1)
                            print(self.cartListNsmuatbelarray1.count)
                            print(self.cartListarray1.count)

                            if let iscombostringfinalvalue:[String] = self.cartListarray1.value(forKey: "isCombo") as? [String] {
                                self.iscombostring1 = iscombostringfinalvalue
                            }
                            
                            if let isParentstringfinalvalue:[String] = self.cartListarray1.value(forKey: "isParent") as? [String] {
                                self.isParentstring1 = isParentstringfinalvalue
                            }
                            
                            if let parentIDstringfinalvalue:[String] = self.cartListarray1.value(forKey: "parentIDstring") as? [String] {
                                self.parentIDstring1 = parentIDstringfinalvalue
                            }
                            if let qtyCountstring1finalvalue:[String] = self.cartListarray1.value(forKey: "qtyCount") as? [String] {
                                self.qtyCountstring1 = qtyCountstring1finalvalue
                            }
//                            self.qtyCountstring1 =  self.cartListarray1.value(forKey:"qtyCount")as![String]
//                            print(self.qtyCountstring1)
                            
                            if let qtyAvailabilitystring1finalvalue:[String] = self.cartListarray1.value(forKey: "qtyAvailability") as? [String] {
                                self.qtyAvailabilitystring1 = qtyAvailabilitystring1finalvalue
                            }
                            
                            
//                        self.qtyAvailabilitystring1 =  self.cartListarray1.value(forKey:"qtyAvailability")as![String]
                            if let qtyDispstring1finalvalue:[String] = self.cartListarray1.value(forKey: "qtyDisp") as? [String] {
                                self.qtyDispstring1 = qtyDispstring1finalvalue
                            }
                            
//                            self.qtyDispstring1 =  self.cartListarray1.value(forKey:"qtyDisp")as![String]
                            
                            if let idstring1finalvalue:[String] = self.cartListarray1.value(forKey: "id") as? [String] {
                                self.idstring1 = idstring1finalvalue
                            }
                            
//                            self.idstring1 =  self.cartListarray1.value(forKey:"id")as![String]
                            
                            if let namestring1finalvalue:[String] = self.cartListarray1.value(forKey: "name") as? [String] {
                                self.namestring1 = namestring1finalvalue
                            }
                            
//                            self.namestring1 =  self.cartListarray1.value(forKey:"name")as![String]
                            if let pricestring1finalvalue:[String] = self.cartListarray1.value(forKey: "price") as? [String] {
                                self.pricestring1 = pricestring1finalvalue
                            }
                            
//                            self.pricestring1 =  self.cartListarray1.value(forKey:"price")as![String]
                            
                            if let stockstring1finalvalue:[String] = self.cartListarray1.value(forKey: "stock") as? [String] {
                                self.stockstring1 = stockstring1finalvalue
                            }
//                            self.stockstring1 =  self.cartListarray1.value(forKey:"stock")as![String]
                            
                            
                            if let stock_colorstring1finalvalue:[String] = self.cartListarray1.value(forKey: "stock_color") as? [String] {
                                self.stock_colorstring1 = stock_colorstring1finalvalue
                            }
                            
                            
//                            self.stock_colorstring1 =  self.cartListarray1.value(forKey:"stock_color")as![String]
                            
                            if let sellerstring1finalvalue:[String] = self.cartListarray1.value(forKey: "seller") as? [String] {
                                self.sellerstring1 = sellerstring1finalvalue
                            }
                            
//                            self.sellerstring1 =  self.cartListarray1.value(forKey:"seller")as![String]
//                            if let quantitystring1finalvalue:[String] = self.cartListarray1.value(forKey: "quantity") as? [String] {
//                                self.quantitystring1 = quantitystring1finalvalue
//                            }
                            
                            self.quantitystring1 =  self.cartListarray1.value(forKey:"quantity")as![NSNumber]
                            if let MOQstring1finalvalue:NSArray = self.cartListarray1.value(forKey: "MOQ") as? NSArray{
                                self.MOQstring1 = MOQstring1finalvalue
                            }
                            
//                            self.MOQstring1 =  self.cartListarray1.value(forKey:"MOQ")as![String]
                            
                            if let sellerIdstring1finalvalue:NSArray = self.cartListarray1.value(forKey: "sellerId") as? NSArray {
                                self.sellerIdstring1 = sellerIdstring1finalvalue
                            }
                            
//                            self.sellerIdstring1 =  self.cartListarray1.value(forKey:"sellerId")as![String]
                            
                            if let cashbackstring1finalvalue:[NSNumber] = self.cartListarray1.value(forKey: "cashback") as? [NSNumber] {
                                self.cashbackstring1 = cashbackstring1finalvalue
                            }
//                            self.cashbackstring1 =  self.cartListarray1.value(forKey:"cashback")as![NSNumber]
                            
                            if let taxesstring1finalvalue:[NSNumber] = self.cartListarray1.value(forKey: "taxes") as? [NSNumber] {
                                self.taxesstring1 = taxesstring1finalvalue
                            }
                            
//                            self.taxesstring1 =  self.cartListarray1.value(forKey:"taxes")as![NSNumber]
                            
                            if let handlingstring1finalvalue:[NSNumber] = self.cartListarray1.value(forKey: "handling") as? [NSNumber] {
                                self.handlingstring1 = handlingstring1finalvalue
                            }
                            
//                            self.handlingstring1 =  self.cartListarray1.value(forKey:"handling")as![NSNumber]
                            if let shippingstring1finalvalue:[NSNumber] = self.cartListarray1.value(forKey: "shipping") as? [NSNumber] {
                                self.shippingstring1 = shippingstring1finalvalue
                            }
                           // self.shippingstring1 =  self.cartListarray1.value(forKey:"shipping")as![NSNumber]
                            
                            if let hamalistring1finalvalue:[NSNumber] = self.cartListarray1.value(forKey: "hamali") as? [NSNumber] {
                                self.hamalistring1 = hamalistring1finalvalue
                            }
//                            self.hamalistring1 =  self.cartListarray.value(forKey:"hamali")as![NSNumber]
                            
                            if let QTYAvailablestring1finalvalue:[String] = self.cartListarray1.value(forKey: "QTYAvailable") as? [String] {
                                self.QTYAvailablestring1 = QTYAvailablestring1finalvalue
                            }
                            
                            if let pphidstring1finalvalue:[String] = self.cartListarray1.value(forKey: "pphid") as? [String] {
                                self.pphidstring1 = pphidstring1finalvalue
                            }
                            
//                            self.QTYAvailablestring1 =  self.cartListarray1.value(forKey:"QTYAvailable")as![String]
//                            self.pphidstring1 =  self.cartListarray1.value(forKey:"pphid")as![String]
                            
                            
                            if let cartcount1finalvalue:NSNumber = dict.value(forKey:"cartCount")as?NSNumber {
                                self.cartcount1 = cartcount1finalvalue
                            }
                            
//                            self.cartcount1 =  dict.value(forKey:"cartCount")as!NSNumber
                            let value = String(self.namestring1.count)
                            
                            let str = String(format:"%@%@%@",value," ","items")
                            self.lblItems.text = str
                            print(self.cartcount1.stringValue)
                            let stringsavecount = String(self.cartListarraytwo.count)
                            print(stringsavecount)
                    let Saveforlaterfinal = String(format:"%@%@%@%@%@","Saved for later","(",stringsavecount,")","items")
                            
                            self.saveforlaterItemslabel.text = Saveforlaterfinal
                         
                            if let cartQuantitystring1finalvalue:NSString = dict.value(forKey:"cartQuantity")as?NSString {
                                self.cartQuantitystring1 = cartQuantitystring1finalvalue
                                
                            }
                            
                            
//                            self.cartQuantitystring1 =  dict.value(forKey:"cartQuantity")as!NSString
                            
                            if let total_cartstring1finalvalue:NSString = dict.value(forKey:"total_cart")as?NSString {
                                self.total_cartstring1 = total_cartstring1finalvalue
                                
                            }
              

                            
//                            self.total_cartstring1 =  dict.value(forKey:"total_cart")as!NSString
                            
                            if let SummaryDetailsaray1finalvalue:NSArray = dict.value(forKey:"SummaryDetails")as?NSArray {
                                self.SummaryDetailsaray1 = SummaryDetailsaray1finalvalue
                                
                            }

                            self.SummaryDetailsSubHeading1 =  self.SummaryDetailsaray1.value(forKey:"SubHeading")as![String]
                            self.SummaryDetailsSubValue1 =  self.SummaryDetailsaray1.value(forKey:"SubValue")as![String]
//                            self.cartviewtwo.isHidden = false
                            if self.cartcount.intValue > 0 || self.cartcount1.intValue > 0
                            {
                                self.nocartview.isHidden = true
                                self.Demoscrollviewfinal.isHidden = false
                                self.chartView.isHidden = false
                                self.mainpopupscrooview.isHidden = true
                                
                            }
//                            if  self.cartcount == 0
//                            {
//
//                                self.nocartview.isHidden = false
//                                self.Demoscrollviewfinal.isHidden = true
//                                self.chartView.isHidden = true
//                                //                                self.undoviewfinal.isHidden = true
//                                self.mainpopupscrooview.isHidden = true
//                                if self.DeleteSaveproductstring == "DeleteSaveproductstring"
//                                {
//                                    self.undoviewfinal.isHidden = false
//                                }
//                                if self.clikedRestorestringtwo == "clikedRestorestringtwo"
//                                {
//                                    self.undoviewfinal.isHidden = false
//                                }
//
//                                if self.cartcount1 == 0
//                            {
//                                self.nocartview.isHidden = false
//                                self.Demoscrollviewfinal.isHidden = true
//                                self.chartView.isHidden = true
//                                //                                self.undoviewfinal.isHidden = true
//                                self.mainpopupscrooview.isHidden = true
//                                if self.DeleteSaveproductstring == "DeleteSaveproductstring"
//                                {
//                                    self.undoviewfinal.isHidden = false
//                                }
//                                if self.clikedRestorestringtwo == "clikedRestorestringtwo"
//                                {
//                                    self.undoviewfinal.isHidden = false
//                                }
//                            }
//
//                            }
                            
                            DispatchQueue.main.async {
                                
                                print(self.SummaryDetailsSubHeading1[0])
                                print(self.SummaryDetailsSubValue1[0])
                                self.lblSubTotal.text = self.SummaryDetailsSubHeading1[0]
                                self.lblSellPrice.text = self.SummaryDetailsSubValue1[0]
                                self.lblHandling.text = self.SummaryDetailsSubHeading1[1]
                                self.lblHCharge.text = self.SummaryDetailsSubValue1[1]
                                self.lblGST.text = self.SummaryDetailsSubHeading1[2]
                                self.lblGSTValue.text = self.SummaryDetailsSubValue1[2]
                                self.lblCashBack.text = self.SummaryDetailsSubHeading1[3]
                                self.labelcashbackfinal.text = self.SummaryDetailsSubValue1[3]
                                let valuefinal = String(self.total_cartstring1)
                                self.btnAmnt.setTitle(valuefinal, for:.normal)
                                if self.normalproductstring == "normalproductstring"
                                {
                                    self.cartviewtabelviewtwo.isHidden = false
                                    self.cartviewtabelviewtwo.reloadData()
                                }
                                if self.Movetocartproductstring == "Movetocartproductstring"
                                {
                                    self.tableCart.isHidden = false
                                    self.tableCart.reloadData()
                                    self.cartviewtabelviewtwo.isHidden = false
                                    self.cartviewtabelviewtwo.reloadData()
                                }
                                if self.DeleteSaveproductstring == "DeleteSaveproductstring"
                                {
                                    self.cartviewtabelviewtwo.reloadData()
                                }
                                if self.Deletecartproductstring == "Deletecartproductstring"
                                {
                                    self.cartviewtabelviewtwo.reloadData()
                                }
                                if self.Demostring == "Demostring"
                                {
                                    self.cartviewtabelviewtwo.reloadData()
                                }
                                if self.clikedRestorestring == "clikedRestorestringtwo"
                                {
                                    self.cartviewtabelviewtwo.isHidden = false
                                    self.cartviewtabelviewtwo.reloadData()
                                }
                                if self.updatebuttonstring == "updatebuttonstring"
                                {
                                    self.tableCart.reloadData()
                                    
                                }
                                if self.editquantitysavelater == "editquantitysavelater"
                                {
                                    self.cartviewtabelviewtwo.isHidden = false
                                    self.cartviewtabelviewtwo.reloadData()
                                    
                                }
                        }
                    }
                        
                        if self.cartListarraytwo.count == 0
                        {
                            let Saveforlaterfinal = String(format:"%@%@%@%@%@","Saved for later","(","0",")","items")
                            self.saveforlaterItemslabel.text = Saveforlaterfinal
                          if self.cartListarraysingel.count <= 0
                            {
                            self.nocartview.isHidden = false
                            self.Demoscrollviewfinal.isHidden = true
                            self.chartView.isHidden = true
                            self.mainpopupscrooview.isHidden = true
                            self.btnClearCart.isHidden = true
                            self.lblItems.isHidden = true
                            }
                            
                        }
                    }
                    
                    if let additionalsold_filledbyarray1finalvalue:NSArray  =   self.cartListarray.value(forKey: "sold_filledby") as? NSArray
                    {
                        self.Demotabelarry = additionalsold_filledbyarray1finalvalue
                        
                        if self.Demotabelarry.count > 0
                        {
                            
                            if let additionalsold_filledbyarray1finalvalue:NSArray  =   self.Demotabelarry[0] as? NSArray
                             {
                                self.additionalsold_filledbyarray1 = additionalsold_filledbyarray1finalvalue
                            }
//                            self.additionalsold_filledbyarray1 = self.Demotabelarry[0] as! NSArray
                            print(self.Demotabelarry)
                            if let additionalsold_filledby_idstring1finalvalue: [String]  =  self.additionalsold_filledbyarray1.value(forKey: "seller_id") as? [String]
                            {
                                self.additionalsold_filledby_idstring1 = additionalsold_filledby_idstring1finalvalue
                            }
                            print(self.additionalsold_filledby_idstring1)
                            
                            
                            
                            if let additionalsold_filledby_namestring1finalvalue: [String]  =  self.additionalsold_filledbyarray1.value(forKey: "name") as? [String]
                            {
                                self.additionalsold_filledby_namestring1 = additionalsold_filledby_namestring1finalvalue
                            }
                            print(self.additionalsold_filledby_namestring1)
                            
                            if let additionalsold_filledby_herostring1finalvalue: [String]  =  self.additionalsold_filledbyarray1.value(forKey: "hero") as? [String]
                            {
                                self.additionalsold_filledby_herostring1 = additionalsold_filledby_herostring1finalvalue
                            }
                            print(self.additionalsold_filledby_herostring1)
                            
                            if let additionalsold_filledby_defstring1finalvalue: [String]  =  self.additionalsold_filledbyarray1.value(forKey: "def") as? [String]
                            {
                                self.additionalsold_filledby_defstring1 = additionalsold_filledby_defstring1finalvalue
                            }
                            if let additionalsold_filledby_discriptionstring1finalvalue: [String]  =  self.additionalsold_filledbyarray1.value(forKey: "discription") as? [String]
                            {
                                self.additionalsold_filledby_discriptionstring1 = additionalsold_filledby_discriptionstring1finalvalue
                            }
                            
                            
                            if let sold_filledbyId1finalvalue: [String]  =  self.additionalsold_filledbyarray1.value(forKey: "Id") as? [String]
                            {
                                self.sold_filledbyId1 = sold_filledbyId1finalvalue
                            }
                            
                        }
                        
                    DispatchQueue.main.async {
                        self.soldtabelview.reloadData()
                    }
                    }
                }
               
                break
            case .failure(_):
                
                DispatchQueue.main.async {
                    self.removeSpinner()
                    self.veryalertview.isHidden = true
                    self.landingfinalview.isHidden = true
                }

                
                break
            }
            
            
        }
        
    }
    
    
    func cartsingelfinalvalue()
    {
        if self.cartListarraysingel.count == 0
        {
            self.cartviewtwo.isHidden  = false
            self.cartviewtwo.frame = CGRect(x:0, y:5, width: self.cartviewtwo.frame.size.width, height: self.cartviewtwo.frame.size.height)
        }
        
   
    }
    func cartListsingel()
    {
        self.cartviewtwo.isHidden  = false
        if self.cartListarraysingel.count == 1
        {
            self.cartviewtwo.frame = CGRect(x:0, y:80, width: self.cartviewtwo.frame.size.width, height: self.cartviewtwo.frame.size.height)
            if self.view.frame.size.height < 800 {
                Demoscrollviewfinal.contentInset = UIEdgeInsetsMake(0, 0, self.Demoscrollviewfinal.frame.size.height-200, 0)
                Demoscrollviewfinal.isScrollEnabled = true
                //            Demoscrollviewfinal.showsVerticalScrollIndicator = false
            }

        }
        if self.cartListarraysingel.count == 2
        {
            self.cartviewtwo.frame = CGRect(x:0, y:160, width: self.cartviewtwo.frame.size.width, height: self.cartviewtwo.frame.size.height)
            if self.view.frame.size.height < 800 {
                Demoscrollviewfinal.contentInset = UIEdgeInsetsMake(0, 0, self.Demoscrollviewfinal.frame.size.height+20, 0)
                Demoscrollviewfinal.isScrollEnabled = true
                //            Demoscrollviewfinal.showsVerticalScrollIndicator = false
            }

        }
        if self.cartListarraysingel.count == 3
        {
            self.cartviewtwo.frame = CGRect(x:0, y:240, width: self.cartviewtwo.frame.size.width, height: self.cartviewtwo.frame.size.height)
            if self.view.frame.size.height < 800 {
                Demoscrollviewfinal.contentInset = UIEdgeInsetsMake(0, 0, self.Demoscrollviewfinal.frame.size.height+50, 0)
                Demoscrollviewfinal.isScrollEnabled = true
                //            Demoscrollviewfinal.showsVerticalScrollIndicator = false
            }

        }
        if self.cartListarraysingel.count == 4
        {
            self.cartviewtwo.frame = CGRect(x:0, y:320, width: self.cartviewtwo.frame.size.width, height: self.cartviewtwo.frame.size.height)
            if self.view.frame.size.height < 800 {
                Demoscrollviewfinal.contentInset = UIEdgeInsetsMake(0, 0, self.Demoscrollviewfinal.frame.size.height+100, 0)
                Demoscrollviewfinal.isScrollEnabled = true
                //            Demoscrollviewfinal.showsVerticalScrollIndicator = false
            }

        }
        if self.cartListarraysingel.count == 5
        {
            self.cartviewtwo.frame = CGRect(x:0, y:400, width: self.cartviewtwo.frame.size.width, height: self.cartviewtwo.frame.size.height)
            if self.view.frame.size.height < 800 {
                Demoscrollviewfinal.contentInset = UIEdgeInsetsMake(0, 0, self.Demoscrollviewfinal.frame.size.height+200, 0)
                Demoscrollviewfinal.isScrollEnabled = true
                //            Demoscrollviewfinal.showsVerticalScrollIndicator = false
            }

            
        }
        if self.cartListarraysingel.count == 6
        {
            self.cartviewtwo.frame = CGRect(x:0, y:480, width: self.cartviewtwo.frame.size.width, height: self.cartviewtwo.frame.size.height)
            if self.view.frame.size.height < 800 {
                Demoscrollviewfinal.contentInset = UIEdgeInsetsMake(0, 0, self.Demoscrollviewfinal.frame.size.height+250, 0)
                Demoscrollviewfinal.isScrollEnabled = true
                //            Demoscrollviewfinal.showsVerticalScrollIndicator = false
            }

            
        }
        if self.cartListarraysingel.count == 7
        {
            self.cartviewtwo.frame = CGRect(x:0, y:550, width: self.cartviewtwo.frame.size.width, height: self.cartviewtwo.frame.size.height)
            if self.view.frame.size.height < 800 {
                Demoscrollviewfinal.contentInset = UIEdgeInsetsMake(0, 0, self.Demoscrollviewfinal.frame.size.height+300, 0)
                Demoscrollviewfinal.isScrollEnabled = true
                //            Demoscrollviewfinal.showsVerticalScrollIndicator = false
            }

            
        }
        if self.cartListarraysingel.count == 8
        {
            self.cartviewtwo.frame = CGRect(x:0, y:630, width: self.cartviewtwo.frame.size.width, height: self.cartviewtwo.frame.size.height)
            if self.view.frame.size.height < 800 {
                Demoscrollviewfinal.contentInset = UIEdgeInsetsMake(0, 0, self.Demoscrollviewfinal.frame.size.height+330, 0)
                Demoscrollviewfinal.isScrollEnabled = true
                //            Demoscrollviewfinal.showsVerticalScrollIndicator = false
            }

        }
        if self.cartListarraysingel.count == 9
        {
            self.cartviewtwo.frame = CGRect(x:0, y:710, width: self.cartviewtwo.frame.size.width, height: self.cartviewtwo.frame.size.height)
            if self.view.frame.size.height < 800 {
                Demoscrollviewfinal.contentInset = UIEdgeInsetsMake(0, 0, self.Demoscrollviewfinal.frame.size.height+400, 0)
                Demoscrollviewfinal.isScrollEnabled = true
                //            Demoscrollviewfinal.showsVerticalScrollIndicator = false
            }

        }
        if self.cartListarraysingel.count == 10
        {
            self.cartviewtwo.frame = CGRect(x:0, y:780, width: self.cartviewtwo.frame.size.width, height: self.cartviewtwo.frame.size.height)
            if self.view.frame.size.height < 800 {
                Demoscrollviewfinal.contentInset = UIEdgeInsetsMake(0, 0, self.Demoscrollviewfinal.frame.size.height+450, 0)
                Demoscrollviewfinal.isScrollEnabled = true
                //            Demoscrollviewfinal.showsVerticalScrollIndicator = false
            }

        }
        if self.cartListarraysingel.count == 11
        {
            self.cartviewtwo.frame = CGRect(x:0, y:860, width: self.cartviewtwo.frame.size.width, height: self.cartviewtwo.frame.size.height)
            if self.view.frame.size.height < 800 {
                Demoscrollviewfinal.contentInset = UIEdgeInsetsMake(0, 0, self.Demoscrollviewfinal.frame.size.height+480, 0)
                Demoscrollviewfinal.isScrollEnabled = true
                            Demoscrollviewfinal.showsVerticalScrollIndicator = false
            }

        }
        if self.cartListarraysingel.count == 12
        {
            self.cartviewtwo.frame = CGRect(x:0, y:930, width: self.cartviewtwo.frame.size.width, height: self.cartviewtwo.frame.size.height)
            if self.view.frame.size.height < 800 {
                Demoscrollviewfinal.contentInset = UIEdgeInsetsMake(0, 0, self.Demoscrollviewfinal.frame.size.height+600, 0)
                Demoscrollviewfinal.isScrollEnabled = true
                            Demoscrollviewfinal.showsVerticalScrollIndicator = false
            }

        }
        if self.cartListarraysingel.count == 13
        {
            self.cartviewtwo.frame = CGRect(x:0, y:1000, width: self.cartviewtwo.frame.size.width, height: self.cartviewtwo.frame.size.height)
            if self.view.frame.size.height < 800 {
                Demoscrollviewfinal.contentInset = UIEdgeInsetsMake(0, 0, self.Demoscrollviewfinal.frame.size.height+640, 0)
                Demoscrollviewfinal.isScrollEnabled = true
                            Demoscrollviewfinal.showsVerticalScrollIndicator = false
            }

        }
        if self.cartListarraysingel.count == 14
        {
            self.cartviewtwo.frame = CGRect(x:0, y:1060, width: self.cartviewtwo.frame.size.width, height: self.cartviewtwo.frame.size.height)
            if self.view.frame.size.height < 800 {
                Demoscrollviewfinal.contentInset = UIEdgeInsetsMake(0, 0, self.Demoscrollviewfinal.frame.size.height+680, 0)
                Demoscrollviewfinal.isScrollEnabled = true
                            Demoscrollviewfinal.showsVerticalScrollIndicator = false
            }

        }
        if self.cartListarraysingel.count == 15
        {
            self.cartviewtwo.frame = CGRect(x:0, y:1130, width: self.cartviewtwo.frame.size.width, height: self.cartviewtwo.frame.size.height)
            if self.view.frame.size.height < 800 {
                Demoscrollviewfinal.contentInset = UIEdgeInsetsMake(0, 0, self.Demoscrollviewfinal.frame.size.height+720, 0)
                Demoscrollviewfinal.isScrollEnabled = true
                            Demoscrollviewfinal.showsVerticalScrollIndicator = false
            }

        }
        if self.cartListarraysingel.count == 16
        {
            self.cartviewtwo.frame = CGRect(x:0, y:1100, width: self.cartviewtwo.frame.size.width, height: self.cartviewtwo.frame.size.height)
            if self.view.frame.size.height < 800 {
                Demoscrollviewfinal.contentInset = UIEdgeInsetsMake(0, 0, self.Demoscrollviewfinal.frame.size.height+780, 0)
                Demoscrollviewfinal.isScrollEnabled = true
                            Demoscrollviewfinal.showsVerticalScrollIndicator = false
            }

        }
        if self.cartListarraysingel.count == 17
        {
            self.cartviewtwo.frame = CGRect(x:0, y:1150, width: self.cartviewtwo.frame.size.width, height: self.cartviewtwo.frame.size.height)
            if self.view.frame.size.height < 800 {
                Demoscrollviewfinal.contentInset = UIEdgeInsetsMake(0, 0, self.Demoscrollviewfinal.frame.size.height+840, 0)
                Demoscrollviewfinal.isScrollEnabled = true
                            Demoscrollviewfinal.showsVerticalScrollIndicator = false
            }

        }
        if self.cartListarraysingel.count == 18
        {
            self.cartviewtwo.frame = CGRect(x:0, y:1220, width: self.cartviewtwo.frame.size.width, height: self.cartviewtwo.frame.size.height)
            if self.view.frame.size.height < 800 {
                Demoscrollviewfinal.contentInset = UIEdgeInsetsMake(0, 0, self.Demoscrollviewfinal.frame.size.height+880, 0)
                Demoscrollviewfinal.isScrollEnabled = true
                            Demoscrollviewfinal.showsVerticalScrollIndicator = false
            }

        }
        if self.cartListarraysingel.count == 19
        {
            self.cartviewtwo.frame = CGRect(x:0, y:1300, width: self.cartviewtwo.frame.size.width, height: self.cartviewtwo.frame.size.height)
            if self.view.frame.size.height < 800 {
                Demoscrollviewfinal.contentInset = UIEdgeInsetsMake(0, 0, self.Demoscrollviewfinal.frame.size.height+920, 0)
                Demoscrollviewfinal.isScrollEnabled = true
                            Demoscrollviewfinal.showsVerticalScrollIndicator = false
            }

        }
        if self.cartListarraysingel.count == 20
        {
            self.cartviewtwo.frame = CGRect(x:0, y:1580, width: self.cartviewtwo.frame.size.width, height: self.cartviewtwo.frame.size.height)
            if self.view.frame.size.height < 800 {
                Demoscrollviewfinal.contentInset = UIEdgeInsetsMake(0, 0, self.Demoscrollviewfinal.frame.size.height+835, 0)
                Demoscrollviewfinal.isScrollEnabled = true
                            Demoscrollviewfinal.showsVerticalScrollIndicator = false
            }

        }
    }
    
    
    func hexStringToUIColor (hex:String) -> UIColor
    {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
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
    @IBAction func Buttonbackbutton(_ sender: UIButton)
    {
//        DispatchQueue.main.async {
//            let CheckOutVCfinalvalue = self.storyboard?.instantiateViewController(withIdentifier:"CheckOutVC")as!CheckOutVC
//            self.present(CheckOutVCfinalvalue, animated: true, completion:nil)
//
//        }
        DispatchQueue.main.async
            {
                let checkoufinalViewControllervalue = self.storyboard?.instantiateViewController(withIdentifier:"checkoufinalViewController")as!checkoufinalViewController
                self.present(checkoufinalViewControllervalue, animated: true, completion:nil)
        }
    
    }
    @IBAction func mybackbutton(_ sender: UIButton)
    {
        DispatchQueue.main.async
            {
                let checkoufinalViewControllervalue = self.storyboard?.instantiateViewController(withIdentifier:"checkoufinalViewController")as!checkoufinalViewController
                self.present(checkoufinalViewControllervalue, animated: true, completion:nil)
        }
    }
    //    override func viewDidLayoutSubviews()
//    {
//        tableCart.frame = CGRect(x: tableCart.frame.origin.x, y:  tableCart.frame.origin.y, width: tableCart.frame.size.width, height:100)
//         tableCart.reloadData()
//        
//        self.cartviewtwo.frame = CGRect(x: cartviewtwo.frame.origin.x, y:200, width: cartviewtwo.frame.size.width, height:cartviewtwo.frame.size.height)
//        
//    }
  
}
extension CartViewController: UIGestureRecognizerDelegate
{
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

