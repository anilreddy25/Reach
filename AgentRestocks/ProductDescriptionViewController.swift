//
//  ProductDescriptionViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 14/08/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//
///  scan Bar code Value

/// https://www.hackingwithswift.com/example-code/media/how-to-scan-a-barcode
import UIKit
import QuartzCore
import AFNetworking
import Alamofire
import SDWebImage
import IQKeyboardManagerSwift


func color(_ rgbColor: Int) -> UIColor{
    return UIColor(
        red:   CGFloat((rgbColor & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbColor & 0x00FF00) >> 8 ) / 255.0,
        blue:  CGFloat((rgbColor & 0x0000FF) >> 0 ) / 255.0,
        alpha: CGFloat(1.0)
    )
}

class ProductDescriptionViewController: UIViewController,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate,FaveButtonDelegate
{
    
    @IBOutlet weak var myheartbutton: FaveButton!
    
    @IBOutlet weak var topview: UIView!
    @IBOutlet weak var productlabel:
    UILabel!
    
    @IBOutlet weak var productdetailview: UIView!
    @IBOutlet weak var productscrollview: UIScrollView!
    
    @IBOutlet weak var lblSellerName: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrMain: UIScrollView!
    var EancodeValue = NSArray()
    var EancodeItemsarray = NSArray()
    @IBOutlet weak var lblInstockValue: UILabel!
    
    @IBOutlet weak var btnSellerId: UIButton!
    @IBOutlet weak var btnSellerName: UIButton!
    var arrImages = [UIImage]()
    
    @IBOutlet weak var Expandabelbutton: UIButton!
    @IBOutlet weak var Expandabelbuttontwo: UIButton!
    
    @IBOutlet weak var expandabelview: UIView!
    @IBOutlet weak var dealTimeView: UIView!
    
    @IBOutlet weak var lblTimerText: UILabel!
    
    @IBOutlet weak var ExPandabeltabelview: UITableView!
    
    @IBOutlet weak var Roundbuttonone: UIButton!
    
    @IBOutlet weak var roundbuttontwo: UIButton!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var Roundbuttonthree: UIButton!
    var Rupessstring = NSString()
    var Rupessstringfinal = String()
    
    @IBOutlet weak var variantview: UIView!
    
    var demoimagefinalvalue = [UIImage]()
    var particularadd = String()
    var postStringfinalvalue = String()

    
    @IBOutlet weak var gramslabel: UILabel!
    @IBOutlet weak var singeldemoview: UIView!
    
    @IBOutlet weak var Mrp10rupess8gramslabel: UILabel!
    var Mrpstring = String()
    var Mrps = String()

    @IBOutlet weak var quantitylabel: UILabel!
    var quantitystring = String()
    
    @IBOutlet weak var Rupeesalbel: UILabel!
    var struckrupees = String()

    @IBOutlet weak var struckofthelabel: UILabel!
    @IBOutlet weak var offerlabel: UILabel!
     var ooferPricestring = String()
    
    @IBOutlet weak var Discountexpandabelbutton: UIButton!
    
    @IBOutlet weak var discountviewlabel: UIView!
    var Expendabelstringsingel = String()

    @IBOutlet weak var Discountlabel: UILabel!
    var Discountrupeesstring = String()
    
    @IBOutlet weak var singelofferla: UILabel!
    
    @IBOutlet weak var cashbackpercentagelabel: UILabel!
    @IBOutlet weak var cashbackrupeeslabel: UILabel!
    
    var cshbackofferstring = String()
    
    @IBOutlet weak var subscribedeliveryview: UIView!
    
    
    @IBOutlet weak var subscribe: UIButton!
    
    
    @IBOutlet weak var outletsview: UIView!
    
    @IBOutlet weak var secondoutletview: UIView!
    @IBOutlet weak var dayslabel: UILabel!
    var dayslabelstring = String()
    
    @IBOutlet weak var largeamountofoutlets: UILabel!
    var largeamououtlets = String()
    
    var ratingstring = String()
    
    @IBOutlet weak var instocklabel: UILabel!
    var Instackstring = String()
    
    @IBOutlet weak var addbutton: UIButton!
    @IBOutlet weak var floatratingview: FloatRatingView!
    @IBOutlet weak var ratinglabel: UILabel!
    @IBOutlet weak var productserverrating: UILabel!
    
    @IBOutlet weak var googlereviewrating: UILabel!
    @IBOutlet weak var googlefloatingreview: FloatRatingView!
    
    @IBOutlet weak var noofoutletsrating: UILabel!
 
    var noofoutletstring = String()
    
    
    var progressValue = 0.0
    var progressValuetwo = 0.0
    var progressValuethree = 0.0
    var progressValuefour = 0.0
    var progressValuefive = 0.0

@IBOutlet weak var progressviewone: UIProgressView!
    @IBOutlet weak var progreesviewtwo: UIProgressView!
    
    @IBOutlet weak var progreeviewthree: UIProgressView!
    
    @IBOutlet weak var progreeviewfour: UIProgressView!
    @IBOutlet weak var progreeviewfive: UIProgressView!
  
    @IBOutlet weak var singelprogresslabel: UILabel!
    
    @IBOutlet weak var secondprogreeslabel: UILabel!
    @IBOutlet weak var fifthprogreeslabel: UILabel!
    
    @IBOutlet weak var fourthprogresslabel: UILabel!
    @IBOutlet weak var Thirdprogreeslabel: UILabel!
    
    @IBOutlet weak var Recentreview: UIView!
    
    @IBOutlet weak var twentyfourreviews: UIButton!
    
    var Reviewstring = String()
    
    @IBOutlet weak var Reviewstabelview: UITableView!
    var ReviewName = [String]()
    var ReviewRange = [String]()
    var ReviewTime = [String]()
    var ReviewDatefinal = [String]()
    var Reviewleftiamge = [UIImage]()
    var ReviewRightimage = [UIImage]()
   var clikedstring = String()
    
    @IBOutlet weak var Exculsiveoffer: UIImageView!
    
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var Roundimage: UIImageView!
    
    @IBOutlet weak var pagecontroller: UIPageControl!
    
    @IBOutlet weak var dotviewtwo: UIView!
    @IBOutlet weak var dotviewone: UIView!
    //    @IBOutlet weak var ratingpagecontroller: UIPageControl!
    
    @IBOutlet weak var ratethisproduct: UILabel!
    
    @IBOutlet weak var finishtextfiled: UITextField!
    
    @IBOutlet weak var finish: UIButton!
    
    
    @IBOutlet weak var singelfinalvalue: UIView!
    
    @IBOutlet weak var lblInstockValed: UILabel!
    
    @IBOutlet weak var nameoftheuser: UILabel!
    
    @IBOutlet weak var Niceapp: UILabel!
    @IBOutlet weak var ratedoflabel: UILabel!
    
    @IBOutlet weak var finishratingapp: FloatRatingView!
    @IBOutlet weak var graphview: UIView!
    var userName = String()
    var Niceappstring = String()
    var rateofstring = String()
    
    //StockOutOrder
    
    var messageStockOut = String()
    var stockOutTitel = String()
    var producidclikHOMEstring = String()

    @IBOutlet weak var Totalfinalvalue: UIView!
    
    
    @IBOutlet weak var viewCOD: UIView!
    
    @IBOutlet weak var lblCOD: UILabel!
    
    @IBOutlet weak var Readallreview: UIButton!
    
    @IBOutlet weak var btnCODArrow: UIButton!
    
    var buttonsingel = UIButton()
    var footerView = UIView()
    var footerView1 = UIView()
    var productdescriptiopntimer = Timer()
    
    
    var variantarray = NSArray()
    var variantDisplayQuantity = [String]()
    var variantMRPDisplayQuantity = [String]()
    var variantProductimage = NSArray()
    var variantProductimagefinal = NSArray()

    var variantProductimagefinalValue = [String]()
    var available_qtyfinalvalue = [String]()
    var available_qty_disp = [String]()
    var cash_back_string = [String]()
    var cb_displaystring = [String]()
    var Combostringfinal = NSArray()
    var Discount_string = [String]()
    var discount_disply_string = [String]()
    var discriptioonFavourite = [String]()
    var marginstring = [String]()
    var moq_calcstring = [String]()
    var productNameDescription = [String]()
    var off_take_displaystring = [String]()
    var Descriptionpricevalue = [String]()
    var DescriptionproductidValue = [String]()
    var Descriptionprod_rating = [String]()
    var product_detailsEanCode = [String]()
    var productdetailExculsive = [String]()
    var ProductDealTimeValue = [String]()
    
    var product_detailsvaluefinal = [String]()
    
    var product_detailsvaluearray = NSArray()
    var product_detailsratingString = NSArray()
    var prodcutrating_display = [String]()
    var DescriptionspecialOffers = [String]()

  var  Descriptionweightonly = [String]()

  var  Descriptionweigtmrpfinal = [String]()
    
    var  ProductDeatilsfinalarray = NSArray()
    var  Descriptionprod_ratingvaluearray = NSArray()

    var  DescriptionNamefinalvalue = [String]()
    var  DescriptionCODisplayfinal = [String]()
    var  DescriptionSoldByRating = [String]()

    @IBOutlet weak var soldbyNumberValue: UILabel!
    
    @IBOutlet weak var ProductNAmefinalvalue: UILabel!
    
  
    
    @IBOutlet weak var firstexpandtabelview: UITableView!
    
    var  variantMRPDisplayQuantityRupess = [String]()
    var  DescriptionofferfinalValue = [String]()
    var  DescrptionMarginfinalvalue = [String]()
    
    @IBOutlet weak var SoldByNumbervaluefinal: UIView!
    
    

    @IBOutlet weak var expandabelbuttonthree: UIButton!
    
    
    @IBOutlet weak var soldviewfinaltabel: UIView!
    
    @IBOutlet weak var soldviewtabelview: UITableView!
    var soldbytabelarray = [String]()
    let cellReuseIdentifier = "cell"

    @IBOutlet weak var soldbyselectingbutton: UIButton!
    
    
    @IBOutlet weak var Brandcontrolled: UILabel!
    var  CashBackMarginDescription = [String]()
    var democashback = [String]()
    var DemoOutLetsBackfinal = [String]()
    @IBOutlet weak var adpopupscroolview: UIScrollView!
    @IBOutlet weak var addpopupview: UIView!
    @IBOutlet weak var Maindescrptionpoupview: UIView!
    @IBOutlet weak var radiobutton: UIButton!
    @IBOutlet weak var radiobuttontwo: UIButton!
    @IBOutlet weak var scrollingcolletcionview: UICollectionView!
    var Productarray = [String]()
    let collectionMargin = CGFloat((UIScreen.main.bounds.width - (UIScreen.main.bounds.width * 0.27)) * 1.0)
    let itemSpacing = CGFloat(UIScreen.main.bounds.width * 0.32)
    let itemHeight = CGFloat(360)
    var itemWidth = CGFloat(0)
    var currentItem = 0
    @IBOutlet weak var singquantitylabel: UILabel!
    @IBOutlet weak var anotherquntitylabel: UILabel!
    @IBOutlet weak var addtocart: UIButton!
    
    
    var modelData = [String]()
    let customWidth:CGFloat = 100
    let customHeight:CGFloat = 100
    @IBOutlet weak var demoviewfinalvalue: UIView!
    @IBOutlet weak var mytextfiledcolor: UITextField!
    @IBOutlet weak var finalchangecolor: UIView!
    @IBOutlet var pickerView: UIPickerView!
    var rotationAngle:CGFloat!
    @IBOutlet weak var topviewfinal: UIView!
      var di_count = 0
    
    
    var productdemoidfinalvalue = String()

    
    var productdescriptionuseridbiling = String()
    
    var user_qtyfinalstring = String()

    @IBOutlet weak var countaddlabel: UILabel!
    
    @IBOutlet weak var offerlabelfinalvalue: UIImageView!
    
    
//// userquantity array
    
    var variantquntityarray = NSArray()

    
    //// specialofferslabel
    var specialofferarray = NSArray()

    var specialofferlabel = String()
    /// exclusive symboll
    var Exclusive = String()
    
    var Exclusiveofferarray = NSArray()
    
    var user_qtyfinalstringfinalvalue = String()
    var user_qtyfinalstringfinalarray = [String]()
    var user_qtyfinalstringfinalarray1 = [NSNumber]()

    @IBOutlet weak var imgExclusive: UIImageView!
    
    @IBOutlet weak var tapimageviewfinalview: UIView!
    
    @IBOutlet weak var tapimage: UIImageView!
    
    var imageone = UIImageView()
 
    @IBOutlet weak var Cancelbuttonfinalvalue: UIButton!
    
    
    @IBOutlet weak var variantalbel: UILabel!
    
    

    @IBOutlet weak var moqviewtwo: UIView!
    
    @IBOutlet weak var totalroundviewfinavalue: UIView!
    
    @IBOutlet weak var cashbackpercentage: UILabel!
    
    @IBOutlet weak var discountpercentage: UILabel!
    
    
    //// cashback offer

    var cashbackoffer = NSArray()
    var cashbackofferstring = String()

    //// discount offer
    
    var Discountoffer = NSArray()
    var Discountofferstring = String()
    
    //// offer
    
    var off_take = NSArray()
    var outletsBroughtone = NSArray()
    var available_qty_dispone = NSArray()

    
    @IBOutlet weak var stardarkgraey: UIImageView!
    
    @IBOutlet weak var daysiamgefinalvalue: UIImageView!
    
    
    /////Review demo
    
    var productratingpreview = NSArray()
    
    var productratedpreview = NSDictionary()

    var productratedpreview12 = NSNumber()

    var producttot_countpreview = NSNumber()
    var productuser_ratingpreview = NSNumber()
    var producttot_ratingpreview = String()
    var producttot_reviewspreview = String()
    var productrating_graphpreview = NSArray()

    var productratingcount = [String]()
    var productratingpercent = [String]()
    var productratingcolor = [String]()
    @IBOutlet weak var veryalertview: UIView!
    
    
    var coverView = UIView()
    var imageView = UIImageView()
    
    @IBOutlet weak var ownratingviewfinalvaluue: UIView!
    
    //// combo display
    
    
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
    
    
    var rating_Comments = NSArray()
    var rating_name = [String]()
    
    var ratingId = [String]()
    var comment = [String]()

    var rating1 = [String]()
    var time = [String]()

//    var upCount = [String]()
//
//    var DownCount = [String]()
    var upCount = [NSNumber]()

    var DownCount = [NSNumber]()

     var rating_idvalusingel = String()
    
    var Likecommentdict = NSDictionary()

    
    var upCount1 = NSNumber()
    var DownCount1 = NSNumber()

    // Product Add button
    var productUserIdValue = String()

    
    
    var productiondescriptionselectedIndex = Int()

    var productiondescriptionselectedIndextwo = Int()
    
    var productiondescriptionselectedstring = String()
    
    var productiondescriptionselectedIndextwostring = String()

    var Commentstringvalue = String()

    var CommentRatingstringvalue = String()


    @IBOutlet weak var favouritebutton: UIButton!
    
    var HomestatusLikeviewallone = NSNumber()
    
    var strotetextfiledvalue = String()
    
    var statusone = Bool()
    
    var commentidstring = String()
    
    var messagestring = String()
    
    
    @IBOutlet weak var sharebutton: UIButton!
 
    @IBOutlet weak var cartbutton: UIButton!
    
    
    @IBOutlet weak var shoutbuttonfinalvalue: UIButton!
    
    @IBOutlet weak var profilebuttonvalue: UIButton!
    
    var timerIsOn = false
    var dealEndtime = [NSNumber]()
    var timer = Timer()

    // favourite
    
   var  favouriterating = NSArray()
    
    var selectedint :Int?
    var VisibleIndexquntity:IndexPath = IndexPath(row: 0, section: 0)

    var Homeuseridstringvalue = String()
    
    let DescriptionHomecellReuseIdentifier = "cell"

    var cart_Countvalue = NSNumber()
    
    var user_updatevalue = String()
    
    @IBOutlet weak var cartcountlabel: UILabel!
    
    
    @IBOutlet weak var soldview: UIView!
    
    @IBOutlet weak var soldtabelview: UITableView!
    
    var cellerid = String()
    var userupdatevalueproduct = String()
    var Today_quantity = String()
    
    var AcessTokenfinalstring = String()
    
    var Myagnetidfinalstringvalue = String()

    @IBOutlet weak var productiamgeview: UIImageView!
    
    @IBOutlet weak var labeltimer: UILabel!
    
    
    @IBOutlet weak var poupsingelview: UIView!
    
    
  
    @IBOutlet weak var soldfilledlabel: UILabel!
    
    @IBOutlet weak var myinstacklabel: UILabel!
    
    
    @IBOutlet weak var middelTotal: UIView!
    
    
    @IBOutlet weak var backbuttontotal: UIButton!
    
//    var index :Int?
    var index = Int()

    
    var productindividulaidvalue = [String]()
    
    
    var myagentTotalvalue  = String()

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
 
        self.myheartbutton?.setSelected(selected: false, animated: false)

           self.topview.dropShadow()
        
        poupsingelview.layer.cornerRadius = 8.0
         poupsingelview.layer.masksToBounds = true
        addpopupview.roundedButton()
        
//        adpopupscroolview.roundedButton()

        
        rotationAngle = -90 * (.pi/180)
        
        let originalFrame = pickerView.frame
        
        pickerView.transform =  CGAffineTransform(rotationAngle: rotationAngle)
        pickerView.frame = originalFrame
        modelData = ["0","1","2","3","4","5","6","7","8","9","10"]
        
        soldviewfinaltabel.layer.shadowOffset = CGSize(width: 0, height: 3)
        soldviewfinaltabel.layer.shadowOpacity = 0.6
        soldviewfinaltabel.layer.shadowRadius = 3.0
        soldviewfinaltabel.layer.shadowColor = UIColor.color2().cgColor

        if UIScreen.main.bounds.size.height == 480
        {
            if self.view.frame.size.height < 800 {
                productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2000, 0)
                productscrollview.isScrollEnabled = true
                productscrollview.showsVerticalScrollIndicator = false
            }
        }
        if UIScreen.main.bounds.size.height == 568
        {
            if self.view.frame.size.height < 800 {
                productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2250, 0)
                productscrollview.isScrollEnabled = true
                productscrollview.showsVerticalScrollIndicator = false
            }
        }
        
        if  UIScreen.main.bounds.size.height == 736
        {
            if self.view.frame.size.height < 800 {
                productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2500, 0)
                productscrollview.isScrollEnabled = true
                productscrollview.showsVerticalScrollIndicator = false
            }
            
        }
        if UIScreen.main.bounds.size.height == 667
        {
            if self.view.frame.size.height < 800 {
                productscrollview.contentInset = UIEdgeInsetsMake(0, 0,1600, 0)
                productscrollview.isScrollEnabled = true
                productscrollview.showsVerticalScrollIndicator = false
            }
        }
    
        
        
      
     expandabelview.layer.addBorder(edge:.top, color: UIColor.color2(), thickness:0.6)
     expandabelview.layer.addBorder(edge:.bottom, color: UIColor.color2(), thickness:0.6)
        self.firstexpandtabelview.showsVerticalScrollIndicator = false

        Expandabelbuttontwo.setBackgroundImage(#imageLiteral(resourceName: "angle-arrow-down"), for: .normal)
        Expandabelbuttontwo.tag = 1

       Rupessstring = "9.00"
        
        let rupee = "\u{20B9}"
        let rupeeTwo = Rupessstring
        let finalvalue = NSString(format:"%@%@",rupee,rupeeTwo)
        
        Rupessstringfinal = finalvalue as String
        Roundbuttonone.setTitle(Rupessstringfinal, for:.normal)
        roundbuttontwo.setTitle(Rupessstringfinal, for:.normal)
        Roundbuttonthree.setTitle(Rupessstringfinal, for:.normal)

        
        let colorsingel = UIColor.color3()
        
      Roundbuttonthree.setTitleColor(UIColor.color3(), for: .normal)
      roundbuttontwo.setTitleColor(UIColor.color3(), for: .normal)
      Roundbuttonone.setTitleColor(UIColor.redcolor(), for: .normal)
        Roundbuttonone.setBackgroundImage(#imageLiteral(resourceName: "var_red"), for:.normal)
        
        gramslabel.textColor = UIColor.color3()
        Rupeesalbel.textColor = UIColor.black
         self.singeldemoview.layer.addBorder(edge:.top, color: UIColor.color2(), thickness:0.6)
        self.singeldemoview.layer.addBorder(edge:.bottom, color: UIColor.color2(), thickness:0.6)

   
        
        quantitystring = "MOQ 12pcs x 1 = 12pcs"
        quantitylabel.text = quantitystring
        struckrupees = "144.00"
//        Rupeesalbel.text = NSString(format:"%@%@",rupeesymboll,struckrupees) as String
        let strokeEffect: [NSAttributedStringKey : Any] = [
            NSAttributedStringKey.strikethroughStyle: NSUnderlineStyle.styleSingle.rawValue,
            NSAttributedStringKey.strikethroughColor: UIColor.color3(),
            ]

        discountviewlabel.layer.borderColor = UIColor.color2().cgColor
        discountviewlabel.layer.borderWidth = 1.0
        discountviewlabel.layer.cornerRadius = 4
        
        Discountrupeesstring = "Discount"

        cashbackpercentagelabel.text = "13%"
       // ExpndabelvalueTwo()
   
        subscribedeliveryview.layer.addBorder(edge:.top, color: UIColor.color2(), thickness:0.6)
        subscribedeliveryview.layer.addBorder(edge:.bottom, color: UIColor.color2(), thickness:0.6)
        
        self.SoldByNumbervaluefinal.layer.addBorder(edge:.top, color: UIColor.color2(), thickness:0.4)
        self.SoldByNumbervaluefinal.layer.addBorder(edge:.bottom, color: UIColor.color2(), thickness:0.4)

        dayslabelstring = "7days"
        
        dayslabel.text = dayslabelstring
        largeamououtlets = "1,624 Outlets bought"
        largeamountofoutlets.text = largeamououtlets
        
      
        instocklabel.text = ""
        
        Instackstring = "125 instock"
        instocklabel.text = Instackstring
        

         Recentreview.layer.addBorder(edge:.top, color: UIColor.color2(), thickness:0.6)
        Recentreview.layer.addBorder(edge:.bottom, color: UIColor.color2(), thickness:0.6)
        
        Reviewstring = "24reviews"
        twentyfourreviews.setTitle(Reviewstring, for:.normal)

        Reviewstabelview.showsVerticalScrollIndicator = false
        subscribe.layer.cornerRadius = 11.0
        
        self.dotviewone.layer.cornerRadius = self.dotviewone.layer.frame.size.width/2
        self.dotviewtwo.layer.cornerRadius = self.dotviewtwo.layer.frame.size.width/2
        self.dotviewone.layer.masksToBounds = true
        self.dotviewtwo.layer.masksToBounds = true
        self.dotviewone.layer.backgroundColor = UIColor.color3().cgColor
        self.dotviewtwo.layer.backgroundColor = UIColor.color3().cgColor

        submit.isEnabled = false
        
        DispatchQueue.main.async {
            self.ProductDescriptionValue()
        }
        soldbytabelarray = ["NumberMall","Venkata Ramana Traders"]
        self.soldviewtabelview.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
  // self.setupCollectionView()
        mytextfiledcolor.delegate = self
        mytextfiledcolor.addTarget(self, action: #selector(ProductDescriptionViewController.textFieldDidChange(_:)), for: .editingChanged)
        
        print(productdemoidfinalvalue)
  self.floatratingview.backgroundColor = UIColor.clear
        
       // self.floatratingview.editable = true
        
         self.floatratingview.delegate = self as? FloatRatingViewDelegate
        
        
        self.soldviewtabelview.register(UITableViewCell.self, forCellReuseIdentifier: DescriptionHomecellReuseIdentifier)

//        self.cartcountlabel.layer.cornerRadius = 6.0
        self.cartcountlabel.layer.cornerRadius = self.cartcountlabel.layer.frame.size.width/2
        self.cartcountlabel.layer.masksToBounds = true
        self.cartcountlabel.isHidden = false
        
        self.Reviewstabelview.dataSource = self
        self.Reviewstabelview.delegate = self

        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 1
         self.totalviewfinal.addGestureRecognizer(tap)
   adpopupscroolview.roundedButton()
        
        self.demoviewfinalvalue.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.8)

        self.progressviewone.transform = self.progressviewone.transform.scaledBy(x: 1, y: 4)
        self.progressviewone.clipsToBounds = true
        self.progressviewone.progressViewStyle = .bar
        
        self.progreesviewtwo.transform = self.progreesviewtwo.transform.scaledBy(x: 1, y: 4)
        self.progreesviewtwo.clipsToBounds = true
        self.progreesviewtwo.progressViewStyle = .bar
        self.progreeviewthree.transform = self.progreeviewthree.transform.scaledBy(x: 1, y: 4)
        self.progreeviewthree.progressViewStyle = .bar
        self.progreeviewthree.clipsToBounds = true
        self.progreeviewfour.transform = self.progreeviewfour.transform.scaledBy(x: 1, y: 4)
        self.progreeviewfour.progressViewStyle = .bar
        self.progreeviewfour.clipsToBounds = true
        self.progreeviewfive.transform = self.progreeviewfive.transform.scaledBy(x: 1, y: 5)
        self.progreeviewfive.progressViewStyle = .bar
        self.progreeviewfive.clipsToBounds = true
        self.index = 0
        

    }
    @IBAction func myheartbutton(_ sender: FaveButton)
    {
        if myheartbutton.tag == 0
        {
            self.myheartbutton?.setSelected(selected: true, animated: true)
            self.productHOMELikeProduct()

            myheartbutton.tag = 1
        }
        else if myheartbutton.tag == 1
        {
            self.myheartbutton?.setSelected(selected: false, animated: false)
            self.productHOMEunLikeProduct()

            
            myheartbutton.tag = 0
        }
    }
    let colors = [
        DotColors(first: color(0x7DC2F4), second: color(0xE2264D)),
        DotColors(first: color(0xF8CC61), second: color(0x9BDFBA)),
        DotColors(first: color(0xAF90F4), second: color(0x90D1F9)),
        DotColors(first: color(0xE9A966), second: color(0xF8C852)),
        DotColors(first: color(0xF68FA7), second: color(0xF6A2B8))
    ]
    
    func faveButton(_ faveButton: FaveButton, didSelected selected: Bool)
    {
        
    }
    
    func faveButtonDotColors(_ faveButton: FaveButton) -> [DotColors]?{
        if( faveButton === myheartbutton || faveButton === myheartbutton){
            return colors
        }
        return nil
    }
  
    @objc func textFieldDidChange(_ textField: UITextField?)
    {
        self.strotetextfiledvalue = (textField?.text)!
    }
    
    func setupCollectionView()
    {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        itemWidth =  UIScreen.main.bounds.width - collectionMargin * 2.0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.headerReferenceSize = CGSize(width: collectionMargin, height: 0)
        layout.footerReferenceSize = CGSize(width: collectionMargin, height: 0)
        layout.minimumLineSpacing = itemSpacing
        layout.scrollDirection = .horizontal
        scrollingcolletcionview!.collectionViewLayout = layout
        scrollingcolletcionview?.decelerationRate = UIScrollViewDecelerationRateFast
        let lastCell = IndexPath(item: Productarray.count-1, section: 0)
        scrollingcolletcionview.scrollToItem(at: lastCell, at: UICollectionViewScrollPosition.centeredHorizontally, animated: false)
        currentItem = Productarray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let numberOfItems = CGFloat(collectionView.numberOfItems(inSection: section))
        let combinedItemWidth = (numberOfItems * flowLayout.itemSize.width) + ((numberOfItems - 1)  * flowLayout.minimumInteritemSpacing)
        let padding = (collectionView.frame.width - combinedItemWidth) / 2
        return UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
    }

  
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    {
        
        if tableView == Reviewstabelview
        {
            footerView = UIView(frame: CGRect(x: 0, y: 0, width: Reviewstabelview.frame.size.width, height:80))
            buttonsingel = UIButton(frame: CGRect(x:100, y:-30, width:175, height:80))
            buttonsingel.titleLabel?.textAlignment = .center
            buttonsingel.contentHorizontalAlignment = .center
            buttonsingel.setTitle("Read all reviews", for: .normal)
            buttonsingel.setTitleColor(UIColor.Readallreviewsfinalvalue(), for:.normal)
            buttonsingel.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            // button.backgroundColor = UIColor.blue
            footerView.addSubview(buttonsingel)
            
         
            return footerView

        }
        else
        {
            footerView1 = UIView(frame: CGRect(x: 0, y: 0, width:firstexpandtabelview.frame.size.width, height:0))
            return footerView1

        }
       
      

    }
    

@objc func productdescriptiontimerAction()
{
    footerView.isHidden = true
    buttonsingel.isHidden = true

}
    @objc func buttonAction(_ sender: UIButton!)
    {
         productdescriptiopntimer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(productdescriptiontimerAction), userInfo: nil, repeats: false)
        footerView.isHidden = true
        clikedstring = "20"
        ReviewName.removeAll()
        ReviewRange.removeAll()
        ReviewTime.removeAll()
        ReviewDatefinal.removeAll()
        Reviewleftiamge.removeAll()
        ReviewRightimage.removeAll()
     
        sender.setTitle("", for:.normal)

        Reviewstabelview.reloadData()
        self.Reviewstabelview.frame = CGRect(x:self.Reviewstabelview.frame.origin.x, y:self.Reviewstabelview.frame.origin.y, width: self.Reviewstabelview.frame.size.width, height: self.Reviewstabelview.frame.size.height-10)
  
    }
    
    @objc func updateProgress() {
        progressValue = progressValue + 0.01
        self.progressviewone.progress = Float(progressValue)
       progressviewone.progress = 1.0
    }
    @objc func updateProgress1() {
       progressValuetwo = progressValuetwo + 0.01
        self.progreesviewtwo.progress = Float(progressValuetwo)

        progreesviewtwo.progress = 0.5
        
    }
    
    @objc func updateProgress2() {
        progressValuethree = progressValuethree + 0.01
        self.progreeviewthree.progress = Float(progressValuethree)
        progreeviewthree.progress = 0.5

        
      
    }
    
    @objc func updateProgress3() {
        progressValuefour = progressValuefour + 0.01
        self.progreeviewfour.progress = Float(progressValuefour)
      progreeviewfour.progress = 0.2
    }
    @objc func updateProgress4() {
        progressValuefive = progressValuefive + 0.01
        self.progreeviewfive.progress = Float(progressValuefive)
         progreeviewfive.progress = 0.2
       
    }
    
    
    
    
    @IBAction func Radiobutton(_ sender: UIButton)
    {
       
        if radiobutton.tag == 0
        {
            radiobutton.setBackgroundImage(#imageLiteral(resourceName: "Radiooff"), for:.normal)
             radiobutton.tag = 1
            
        }
        else if radiobutton.tag == 1
        {
            radiobutton.setBackgroundImage(#imageLiteral(resourceName: "Radioon"), for:.normal)

            radiobutton.tag = 0

        }
        
    }
    
    @IBAction func RadiobuttonTwo(_ sender: UIButton)
    {
        if radiobuttontwo.tag == 0
        {
            radiobuttontwo.setBackgroundImage(#imageLiteral(resourceName: "Radiooff"), for:.normal)
            radiobuttontwo.tag = 1
            
        }
        else if radiobuttontwo.tag == 1
        {
            radiobuttontwo.setBackgroundImage(#imageLiteral(resourceName: "Radioon"), for:.normal)
            
            radiobuttontwo.tag = 0
            
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    @IBAction func Back(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    @IBAction func Descriptioncart(_ sender: UIButton)
    {
        
    }
    func loadScrollView()
    {
      print(variantProductimage)
        self.variantProductimagefinal = self.variantProductimage[0] as! NSArray
        let pageCount : CGFloat = CGFloat(self.variantProductimagefinal.count)
        scrMain.backgroundColor = UIColor.clear
        scrMain.delegate = self
        scrMain.isPagingEnabled = true
        scrMain.contentSize = CGSize(width: scrMain.frame.size.width * pageCount, height: scrMain.frame.size.height)
        scrMain.showsHorizontalScrollIndicator = false
        pageControl.numberOfPages = Int(pageCount)
        pageControl.addTarget(self, action: #selector(self.pageChanged), for: .valueChanged)
        print(self.variantProductimage[0])
        for i in 0..<Int(pageCount) {
            let productCahttapView = UITapGestureRecognizer(target: self, action: #selector(self.imagehandleNumberChatview(_:)))
            self.imageone.addGestureRecognizer(productCahttapView)
            self.imageone.isUserInteractionEnabled = true
            
            print(self.scrMain.frame.size.width)
            self.imageone = UIImageView(frame: CGRect(x: self.scrMain.frame.size.width * CGFloat(i), y: 0, width: self.scrMain.frame.size.width, height: self.scrMain.frame.size.height))
//            image.image = variantProductimage[i] as! UIImage
            //image.contentMode = UIViewContentMode.scaleAspectFit
             self.imageone.sd_setImage(with: URL(string:self.variantProductimagefinal[i] as! String), placeholderImage:(UIImage(named:"AppIcon")), options: .refreshCached, completed: nil)
            self.scrMain.addSubview( self.imageone)
        }
        let productCahttapView = UITapGestureRecognizer(target: self, action: #selector(self.imagehandleNumberChatview(_:)))
        self.imageone.addGestureRecognizer(productCahttapView)
        self.imageone.isUserInteractionEnabled = true
        
    }
    @objc func imagehandleNumberChatview(_ sender: UITapGestureRecognizer)
    {
        self.tapimageviewfinalview.isHidden = false
        self.tapimage.image = imageone.image
        
       productscrollview.isScrollEnabled = false
        productscrollview.showsVerticalScrollIndicator = false
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        if scrollView == scrMain
        {
            let viewWidth: CGFloat = scrollView.frame.size.width
            let pageNumber = floor((scrollView.contentOffset.x - viewWidth / 50) / viewWidth) + 1
            pageControl.currentPage = Int(pageNumber)
        }
        else if scrollView == Reviewstabelview
        {
            self.Reviewstabelview.frame = CGRect(x:self.Reviewstabelview.frame.origin.x, y:self.Reviewstabelview.frame.origin.y, width: self.Reviewstabelview.frame.size.width, height: self.Reviewstabelview.frame.size.height)
            
            if UIScreen.main.bounds.size.height == 480
            {
                if self.view.frame.size.height < 800 {
                    productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2000, 0)
                    productscrollview.isScrollEnabled = true
                    productscrollview.showsVerticalScrollIndicator = false
                }
            }
            if UIScreen.main.bounds.size.height == 568
            {
                if self.view.frame.size.height < 800 {
                    productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2250, 0)
                    productscrollview.isScrollEnabled = true
                    productscrollview.showsVerticalScrollIndicator = false
                }
            }
            
            if  UIScreen.main.bounds.size.height == 736
            {
                if self.view.frame.size.height < 800 {
                    productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2500, 0)
                    productscrollview.isScrollEnabled = true
                    productscrollview.showsVerticalScrollIndicator = false
                }
                
            }
            if UIScreen.main.bounds.size.height == 667
            {
                if self.view.frame.size.height < 800 {
                    productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2350, 0)
                    productscrollview.isScrollEnabled = true
                    productscrollview.showsVerticalScrollIndicator = false
                }
            }
        }
     
        
    }
    
    
    @IBAction func Expandabelbutton(_ sender: UIButton)
    {

      Expendabelstringsingel = "2"
        if Expandabelbuttontwo.tag == 0
        {
            expandabelview.isHidden = false

            
            Expndabelvalue()
            Expandabelbuttontwo.setBackgroundImage(#imageLiteral(resourceName: "angle-arrow-down"), for: .normal)
      
            
            Expandabelbuttontwo.tag = 1
        }
        else if Expandabelbuttontwo.tag == 1
        {
            expandabelview.isHidden = true

            collapsebelvalue()
            Expandabelbuttontwo.setBackgroundImage(#imageLiteral(resourceName: "angle-arrowup"), for: .normal)
         
            
            Expandabelbuttontwo.tag = 0
        }
    }
    
    @objc func pageChanged() {
        let pageNumber = pageControl.currentPage
        var frame = scrMain.frame
        frame.origin.x = frame.size.width * CGFloat(pageNumber)
        frame.origin.y = 0
        scrMain.scrollRectToVisible(frame, animated: true)
    }
    func collapsebelvalue()
    {
      
            var newFrame : CGRect = expandabelview.frame
            newFrame.size.height = 145
            UIView.animate(withDuration: 0.50, animations:{
                self.expandabelview.frame = newFrame;
                self.expandabelview.isHidden = false
                self.variantview.frame = CGRect(x:0, y:430, width: self.variantview.frame.size.width, height: self.variantview.frame.size.height)
            },completion : nil)
       
    }
    func collapsebelvaluetwo()
    {
        
            var newFrame : CGRect = discountviewlabel.frame
            newFrame.size.height = 40
            
            UIView.animate(withDuration: 0.50, animations:{
                self.discountviewlabel.frame = newFrame;
                self.discountviewlabel.isHidden = false
            self.subscribedeliveryview.frame = CGRect(x:0, y:self.subscribedeliveryview.frame.origin.y+52, width: self.subscribedeliveryview.frame.size.width, height: self.subscribedeliveryview.frame.size.height)
                self.secondoutletview.frame = CGRect(x:0, y:self.secondoutletview.frame.origin.y+50, width: self.secondoutletview.frame.size.width, height: self.secondoutletview.frame.size.height)
                
            },completion : nil)
        }
        
    
    
    
    func Expndabelvalue()
    {
  
            var newFrame : CGRect = expandabelview.frame
            newFrame.size.height = 0
            
            UIView.animate(withDuration: 0.50, animations:{
                self.expandabelview.frame = newFrame;
                self.expandabelview.isHidden = true
                self.variantview.frame = CGRect(x:0, y:self.variantview.frame.origin.y-140, width: self.variantview.frame.size.width, height: self.variantview.frame.size.height)
                
                
            },completion : nil)
            
       
    }
    func ExpndabelvalueTwo()
    {
       
            var newFrame : CGRect = discountviewlabel.frame
            newFrame.size.height = 0
            
            UIView.animate(withDuration: 0.50, animations:
                {
                self.discountviewlabel.frame = newFrame;
                self.discountviewlabel.isHidden = true
                    self.subscribedeliveryview.frame = CGRect(x:0, y:215, width: self.subscribedeliveryview.frame.size.width, height: self.subscribedeliveryview.frame.size.height)
                     self.secondoutletview.frame = CGRect(x:0, y:320, width: self.secondoutletview.frame.size.width, height: self.secondoutletview.frame.size.height)
                
            },completion : nil)
        }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == Reviewstabelview
        {
           return  self.ratingId.count
        }
       
        else if tableView == firstexpandtabelview
        {
            return self.EancodeItemsarray.count

        }
        else if tableView == soldviewtabelview
        {
         return self.sold_filledbynamearray.count
        }
      
        
        else{
            
            return  self.ReviewDatefinal.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if tableView == Reviewstabelview
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath) as! ReviewTableViewCell
            cell.selectionStyle = .none
            
            if self.rating_name.count > 0
            {
                cell.Reviewlabel.text =  self.rating_name[indexPath.row]

            }
            cell.Dateoftheproduct.text =  self.comment[indexPath.row]
            cell.Timeoftheproduct.text =  self.time[indexPath.row]
            cell.Rangeoftheproduct.text =  self.comment[indexPath.row]
            print(self.upCount)
            print(self.DownCount)
            let upcountone = self.upCount[indexPath.row]
            let DownCountone = self.DownCount[indexPath.row]
            let valuecountup = upcountone.stringValue
            let valuecountDown = DownCountone.stringValue
            cell.upthumbbuttontwo.setTitle(valuecountup, for:.normal)
            cell.bottomthumbbuttontwo.setTitle(valuecountDown, for:.normal)
            let color = UIColor.color3()
            cell.Dateoftheproduct.textColor = UIColor.color3()
            cell.Timeoftheproduct.textColor = UIColor.color3()
            cell.Rangeoftheproduct.textColor = UIColor.color3()
            cell.upthumbbuttonone.tag = indexPath.row
//            cell.upthumbbuttonone.isSelected = true
            cell.upthumbbuttonone.setTitleColor(UIColor.clear, for:.normal)
            cell.bottomthumbbuttonone.setTitleColor(UIColor.clear, for:.normal)
            cell.upthumbbuttonone.addTarget(self, action: #selector(ProductDescriptionViewController.connectedproductdescriptionupvalue(sender:)), for: .touchUpInside)
             cell.upthumbbuttonone.tag = 1
            cell.bottomthumbbuttonone.tag = indexPath.row
            cell.bottomthumbbuttonone.addTarget(self, action: #selector(ProductDescriptionViewController.connectedproductdescriptionDownvaluevalue(sender:)), for: .touchUpInside)
            cell.bottomthumbbuttonone.tag = 1

            return cell
        }
            
        if tableView == soldtabelview
        {
            let cell:UITableViewCell = (self.soldtabelview.dequeueReusableCell(withIdentifier: DescriptionHomecellReuseIdentifier))!
            cell.textLabel?.text = self.sold_filledbynamearray[indexPath.row]
            cell.textLabel?.font = UIFont(name: "Arial", size: 14.5)!
            
            cell.textLabel?.textColor =  UIColor.black
            return cell
        }

        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandabeloneTableViewCell", for: indexPath) as! ExpandabeloneTableViewCell
            
//            cell.selectionStyle = .none
            
            print(self.EancodeItemsarray)
            
            let democodeone = self.EancodeItemsarray[indexPath.row]
            print(democodeone)
            
            cell.Eancodelabel.text = self.EancodeItemsarray[indexPath.row] as? String
            let democodeTwo = self.EancodeValue[indexPath.row]
            print(democodeTwo)

            cell.Expandabellabelone.text = self.EancodeValue[indexPath.row] as? String
            return cell
      
    }
    }
    
    @objc func connectedproductdescriptionupvalue(sender: UIButton)
    {
        let button = sender.tag
        let buttonTag = sender
        self.productiondescriptionselectedIndex = 0
        
         self.productiondescriptionselectedIndex =  sender.tag
        self.productiondescriptionselectedstring =  self.ratingId[sender.tag]
   
        
        print(self.productiondescriptionselectedIndex)
        
        
            self.Postcommentidvalue()
    }
    
    @objc func connectedproductdescriptionDownvaluevalue(sender: UIButton)
    {
        let button = sender.tag
        let buttonTag1 = sender
         self.productiondescriptionselectedIndextwo =  0
        self.productiondescriptionselectedIndextwo =  sender.tag
        self.productiondescriptionselectedIndextwostring =  self.ratingId[sender.tag]
      
     //  self.productiondescriptionselectedIndextwo =  self.ratingId[sender.tag]
               self.Postuncommentidvalue()
    }
    
    func Postcommentidvalue()
    {
        var request = URLRequest(url: URL(string:AgentConstants.DescriptionBaseurl)!)
        request.httpMethod = "POST"
        let defaults = UserDefaults.standard
        if let Reviewfinaluseroid:String = defaults.value(forKey: "myuseridvaluefinal")as?String
        {
            self.productdescriptionuseridbiling = Reviewfinaluseroid
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
        

  let postString =  String(format: "method=%@&actorid=%@&liketype=%@&snocomment=%@","commentLikeDislike", self.productdescriptionuseridbiling,"1",self.productiondescriptionselectedstring)
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
                    
                    
                    self.Likecommentdict = dict.value(forKey:"likecounts")as!NSDictionary
                    self.upCount1 = 0
                    self.DownCount1 = 0
                    self.upCount1 =  self.Likecommentdict.value(forKey:"likescount")as!NSNumber
                    self.DownCount1 =  self.Likecommentdict.value(forKey:"likescount")as!NSNumber
                    
                    print(self.upCount1)
                    print(self.DownCount1)
                    let section = 0
                    print(self.productiondescriptionselectedIndex)
                    let row1 = self.productiondescriptionselectedIndex
                    print(row1)
                    let Intfinalvalue = Int(row1)
                    print(Intfinalvalue)

                    let indexPath = IndexPath(row: Intfinalvalue, section: section)
                    print(indexPath)
                    if indexPath != nil
                    {
                        
                        if indexPath.count == 0
                        {
                            let cell: ReviewTableViewCell = self.Reviewstabelview.cellForRow(at: indexPath) as! ReviewTableViewCell
                            
                            if self.upCount1.intValue >= 1
                            {
                                let valueincrement = self.upCount1.stringValue
                                let valueDecrecrement = self.DownCount1.stringValue
                                
                                cell.upthumbbuttontwo.setTitle(valueincrement, for:.normal)
                                cell.bottomthumbbuttontwo.setTitle(valueDecrecrement, for:.normal)
                                self.view.makeToast("You can not like /dislike product more than once")
                            }
                                
                            else{
                                let valueincrement = self.upCount1.stringValue
                                let valueDecrecrement = self.DownCount1.stringValue
                                
                                cell.upthumbbuttontwo.setTitle(valueincrement, for:.normal)
                                cell.bottomthumbbuttontwo.setTitle(valueDecrecrement, for:.normal)
                            }
                        }
                        else{
                             self.view.makeToast("You can not like /dislike product more than once")
                        }
                    

                }
                }
                break
            case .failure(_):
                DispatchQueue.main.async {
                    self.veryalertview.isHidden = true
                    self.removeSpinner()
                }
                break
            }
            
            
            
        }
    }
    
    func Postuncommentidvalue()
    {
        var request = URLRequest(url: URL(string:AgentConstants.DescriptionBaseurl)!)
        request.httpMethod = "POST"
        let defaults = UserDefaults.standard
        if let Reviewfinaluseroid:String = defaults.value(forKey: "myuseridvaluefinal")as?String
        {
            self.productdescriptionuseridbiling = Reviewfinaluseroid
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

        
        let postString =  String(format: "method=%@&actorid=%@&liketype=%@&snocomment=%@","commentLikeDislike", self.productdescriptionuseridbiling,"2",self.productiondescriptionselectedIndextwostring)
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
                        self.Likecommentdict = dict.value(forKey:"likecounts")as!NSDictionary
                    self.upCount1 = 0
                    self.DownCount1 = 0
                    self.upCount1 =  self.Likecommentdict.value(forKey:"likescount")as!NSNumber
                    self.DownCount1 =  self.Likecommentdict.value(forKey:"likescount")as!NSNumber
                    let section = 0
                    print(self.productiondescriptionselectedIndex)
                    
                    let row1 = self.productiondescriptionselectedIndex
                    print(row1)
                    
                    let Intfinalvalue = Int(row1)
                    print(Intfinalvalue)
                    let indexPath = IndexPath(row: Intfinalvalue, section: section)
                    print(indexPath)
                    if indexPath != nil
                    {
                        if indexPath.count == 0
                        {
                            let cell: ReviewTableViewCell = self.Reviewstabelview.cellForRow(at: indexPath) as! ReviewTableViewCell
                            if self.upCount1.intValue >= 1
                            {
                                let valueincrement = self.upCount1.stringValue
                                let valueDecrecrement = self.DownCount1.stringValue
                                
                                cell.upthumbbuttontwo.setTitle(valueincrement, for:.normal)
                                cell.bottomthumbbuttontwo.setTitle(valueDecrecrement, for:.normal)
                                self.view.makeToast("You can not like /dislike product more than once")
                                
                            }
                            else{
                                let valueincrement = self.upCount1.stringValue
                                let valueDecrecrement = self.DownCount1.stringValue
                                
                                cell.upthumbbuttontwo.setTitle(valueincrement, for:.normal)
                                cell.bottomthumbbuttontwo.setTitle(valueDecrecrement, for:.normal)
                            }
                        }
                        else{
                            self.view.makeToast("You can not like /dislike product more than once")
                        }
                     
                     //   self.view.makeToast("You can not like /dislike product more than once")
//                        cell.bottomthumbbuttontwo.isSelected = false
//cell.bottomthumbbuttontwo.isSelected = false
                        
                    }
                    
                    

                }
                break
            case .failure(_):
                DispatchQueue.main.async {
                    self.veryalertview.isHidden = true
                    self.removeSpinner()
                }
                break
            }
            
            
            
        }
    }
   
    func productHOMELikeProduct()
    {
        
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
           self.productdescriptionuseridbiling = Reviewfinaluseroid
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
        
        let postString =  String(format: "method=%@&idProductInfo=%@&userid=%@&select=%@","AddToFav",productdemoidfinalvalue,self.productdescriptionuseridbiling,"1")
        
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
                    
                    self.HomestatusLikeviewallone = dict.value(forKey:"status")as!NSNumber
                    print(self.HomestatusLikeviewallone)
                    
                    let sttussucessstring =  self.HomestatusLikeviewallone.stringValue
                    
                    
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
    func productHOMEunLikeProduct()
    {
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        //   let postString = "method=landingPage&userid=511111117"
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.productdescriptionuseridbiling = Reviewfinaluseroid
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

        let postString =  String(format: "method=%@&idProductInfo=%@&userid=%@&select=%@","AddToFav",productdemoidfinalvalue,self.productdescriptionuseridbiling,"0")
        
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
                    
                    self.HomestatusLikeviewallone = dict.value(forKey:"status")as!NSNumber
                    print(self.HomestatusLikeviewallone)
                    
                    let sttussucessstring =  self.HomestatusLikeviewallone.stringValue
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
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if tableView == Reviewstabelview
        {
            return 88

        }
        if tableView == soldtabelview
        {
            return 40
            
        }
        else
        {
            return 34

        }
    }
    
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {

      
            if tableView == soldtabelview
            {
                let titlestring = self.sold_filledbynamearray[indexPath.row]
                
                self.cellerid  = self.sold_filledbyseller_idarray[indexPath.row]
                self.soldview.isHidden = true
                self.soldtabelview.isHidden = true
                self.btnSellerName.tag  = 1
                
            }
           
            
       
  
    }
    @IBAction func Buttonone(_ sender: UIButton)
    {
        pageControl.numberOfPages = Int(1)

        
        let colorsingel = UIColor.color2()
        let Redcolorsingel = UIColor.redcolor()
        Roundbuttonthree.setTitleColor(UIColor.color3(), for: .normal)
        roundbuttontwo.setTitleColor(UIColor.color3(), for: .normal)
        Roundbuttonone.setTitleColor(Redcolorsingel, for: .normal)
        Roundbuttonone.setBackgroundImage(#imageLiteral(resourceName: "var_red"), for:.normal)
        roundbuttontwo.setBackgroundImage(#imageLiteral(resourceName: "var_grey"), for:.normal)
        Roundbuttonthree.setBackgroundImage(#imageLiteral(resourceName: "var_grey_cross"), for:.normal)
        
        
//        let pageCount : CGFloat = CGFloat(1)
//        scrMain.backgroundColor = UIColor.clear
//        scrMain.delegate = self
//        scrMain.isPagingEnabled = true
//        scrMain.contentSize = CGSize(width: scrMain.frame.size.width * pageCount, height: scrMain.frame.size.height)
//        scrMain.showsHorizontalScrollIndicator = false
//        pageControl.numberOfPages = Int(pageCount)
//        pageControl.addTarget(self, action: #selector(self.pageChanged), for: .valueChanged)
//        pageControl.numberOfPages = Int(pageCount)
//        pageControl.addTarget(self, action: #selector(self.pageChanged), for: .valueChanged)
//
//        for i in 0..<Int(pageCount) {
//            print(self.scrMain.frame.size.width)
//            let image = UIImageView(frame: CGRect(x: self.scrMain.frame.size.width * CGFloat(i), y: 0, width: self.scrMain.frame.size.width, height: self.scrMain.frame.size.height))
//            image.image = arrImages[0]
//            self.scrMain.addSubview(image)
//
//        }
        
        print(variantProductimage)
        self.variantProductimagefinal = self.variantProductimage[0] as! NSArray
        let pageCount : CGFloat = CGFloat(self.variantProductimagefinal.count)
        scrMain.backgroundColor = UIColor.clear
        scrMain.delegate = self
        scrMain.isPagingEnabled = true
        scrMain.contentSize = CGSize(width: scrMain.frame.size.width * pageCount, height: scrMain.frame.size.height)
        scrMain.showsHorizontalScrollIndicator = false
        pageControl.numberOfPages = Int(pageCount)
        pageControl.addTarget(self, action: #selector(self.pageChanged), for: .valueChanged)
       
        for i in 0..<Int(pageCount) {
            let productCahttapView = UITapGestureRecognizer(target: self, action: #selector(self.imagehandleNumberChatview(_:)))
            self.imageone.addGestureRecognizer(productCahttapView)
            self.imageone.isUserInteractionEnabled = true
            
            print(self.scrMain.frame.size.width)
            self.imageone = UIImageView(frame: CGRect(x: self.scrMain.frame.size.width * CGFloat(i), y: 0, width: self.scrMain.frame.size.width, height: self.scrMain.frame.size.height))
            //            image.image = variantProductimage[i] as! UIImage
            //image.contentMode = UIViewContentMode.scaleAspectFit
            self.imageone.sd_setImage(with: URL(string:self.variantProductimagefinal[i] as! String), placeholderImage:(UIImage(named:"AppIcon")), options: .refreshCached, completed: nil)
            self.scrMain.addSubview( self.imageone)
        }
        let productCahttapView = UITapGestureRecognizer(target: self, action: #selector(self.imagehandleNumberChatview(_:)))
        self.imageone.addGestureRecognizer(productCahttapView)
        self.imageone.isUserInteractionEnabled = true
        
        self.firstPostion()
    }
    
    @IBAction func Buttontwo(_ sender: UIButton)
    {
        print(variantProductimage)
        self.variantProductimagefinal = self.variantProductimage[1] as! NSArray
        let pageCount : CGFloat = CGFloat(self.variantProductimagefinal.count)
        scrMain.backgroundColor = UIColor.clear
        scrMain.delegate = self
        scrMain.isPagingEnabled = true
        scrMain.contentSize = CGSize(width: scrMain.frame.size.width * pageCount, height: scrMain.frame.size.height)
        scrMain.showsHorizontalScrollIndicator = false
        pageControl.numberOfPages = Int(pageCount)
        pageControl.addTarget(self, action: #selector(self.pageChanged), for: .valueChanged)
        
        for i in 0..<Int(pageCount) {
            let productCahttapView = UITapGestureRecognizer(target: self, action: #selector(self.imagehandleNumberChatview(_:)))
            self.imageone.addGestureRecognizer(productCahttapView)
            self.imageone.isUserInteractionEnabled = true
            
            print(self.scrMain.frame.size.width)
            self.imageone = UIImageView(frame: CGRect(x: self.scrMain.frame.size.width * CGFloat(i), y: 0, width: self.scrMain.frame.size.width, height: self.scrMain.frame.size.height))
            //            image.image = variantProductimage[i] as! UIImage
            //image.contentMode = UIViewContentMode.scaleAspectFit
            self.imageone.sd_setImage(with: URL(string:self.variantProductimagefinal[i] as! String), placeholderImage:(UIImage(named:"AppIcon")), options: .refreshCached, completed: nil)
            self.scrMain.addSubview( self.imageone)
        }
        let productCahttapView = UITapGestureRecognizer(target: self, action: #selector(self.imagehandleNumberChatview(_:)))
        self.imageone.addGestureRecognizer(productCahttapView)
        self.imageone.isUserInteractionEnabled = true
        
     
        
        let colorsingel = UIColor.color3()
        let Redcolorsingel = UIColor.redcolor()
        Roundbuttonthree.setTitleColor(colorsingel, for: .normal)
        roundbuttontwo.setTitleColor(Redcolorsingel, for: .normal)
        Roundbuttonone.setTitleColor(colorsingel, for: .normal)
        
          Roundbuttonone.setBackgroundImage(#imageLiteral(resourceName: "var_grey"), for:.normal)
          roundbuttontwo.setBackgroundImage(#imageLiteral(resourceName: "var_red"), for:.normal)
          Roundbuttonthree.setBackgroundImage(#imageLiteral(resourceName: "var_grey_cross"), for:.normal)
        
        self.secondPosition()
        
    }
    
    @IBAction func Buttonthree(_ sender: UIButton)
    {
        print(variantProductimage)
        self.variantProductimagefinal = self.variantProductimage[2] as! NSArray
        let pageCount : CGFloat = CGFloat(self.variantProductimagefinal.count)
        scrMain.backgroundColor = UIColor.clear
        scrMain.delegate = self
        scrMain.isPagingEnabled = true
        scrMain.contentSize = CGSize(width: scrMain.frame.size.width * pageCount, height: scrMain.frame.size.height)
        scrMain.showsHorizontalScrollIndicator = false
        pageControl.numberOfPages = Int(pageCount)
        pageControl.addTarget(self, action: #selector(self.pageChanged), for: .valueChanged)
        
        for i in 0..<Int(pageCount) {
            let productCahttapView = UITapGestureRecognizer(target: self, action: #selector(self.imagehandleNumberChatview(_:)))
            self.imageone.addGestureRecognizer(productCahttapView)
            self.imageone.isUserInteractionEnabled = true
            
            print(self.scrMain.frame.size.width)
            self.imageone = UIImageView(frame: CGRect(x: self.scrMain.frame.size.width * CGFloat(i), y: 0, width: self.scrMain.frame.size.width, height: self.scrMain.frame.size.height))
            //            image.image = variantProductimage[i] as! UIImage
            //image.contentMode = UIViewContentMode.scaleAspectFit
            self.imageone.sd_setImage(with: URL(string:self.variantProductimagefinal[i] as! String), placeholderImage:(UIImage(named:"AppIcon")), options: .refreshCached, completed: nil)
            self.scrMain.addSubview( self.imageone)
        }
        let productCahttapView = UITapGestureRecognizer(target: self, action: #selector(self.imagehandleNumberChatview(_:)))
        self.imageone.addGestureRecognizer(productCahttapView)
        self.imageone.isUserInteractionEnabled = true
        

        Roundbuttonone.setBackgroundImage(#imageLiteral(resourceName: "var_grey"), for:.normal)
        roundbuttontwo.setBackgroundImage(#imageLiteral(resourceName: "var_grey"), for:.normal)
        Roundbuttonthree.setBackgroundImage(#imageLiteral(resourceName: "var_red_cross"), for:.normal)
        let colorsingel = UIColor.color3()
        let Redcolorsingel = UIColor.redcolor()
        Roundbuttonthree.setTitleColor(Redcolorsingel, for: .normal)
        roundbuttontwo.setTitleColor(colorsingel, for: .normal)
        Roundbuttonone.setTitleColor(colorsingel, for: .normal)
         self.thirdpostion()
    }
    
    @IBAction func Subscribe(_ sender: UIButton)
    {
        
        DispatchQueue.main.async {
       let secondvalue = self.storyboard?.instantiateViewController(withIdentifier:"HeroSubscriptionVC")as!HeroSubscriptionVC
            self.present(secondvalue, animated: true, completion:nil)
        }
    }
    
    @IBAction func Discountexpandabelbutton(_ sender: UIButton)
    {
       
        
        discountviewlabel.isHidden = false

        if Discountexpandabelbutton.tag == 0
        {
            discountviewlabel.isHidden = false
             collapsebelvaluetwo()
          
            Discountexpandabelbutton.setBackgroundImage(#imageLiteral(resourceName: "angle-arrowup"), for: .normal)
            
            
            Discountexpandabelbutton.tag = 1
        }
        else if Discountexpandabelbutton.tag == 1
        {
            discountviewlabel.isHidden = true
             ExpndabelvalueTwo()
            Discountexpandabelbutton.setBackgroundImage(#imageLiteral(resourceName: "angle-arrow-down"), for: .normal)
            
            
            Discountexpandabelbutton.tag = 0
        }
    }
    
 
    @IBAction func Readallreviews(_ sender: UIButton)
    {
        clikedstring = "20"
        ReviewName.removeAll()
        ReviewRange.removeAll()
        ReviewTime.removeAll()
        ReviewDatefinal.removeAll()
        Reviewleftiamge.removeAll()
        ReviewRightimage.removeAll()
        
        
        
        ReviewName = ["SureshKumar","SureshKumar","SureshKumar","SureshKumar","SureshKumar","SureshKumar","SureshKumar","SureshKumar","SureshKumar","SureshKumar","SureshKumar","SureshKumar","SureshKumar","SureshKumar","SureshKumar","SureshKumar","SureshKumar","SureshKumar","SureshKumar","SureshKumar"]
        ReviewRange = ["Nice Product With in the Range","Nice Product With in the Range","Nice Product With in the Range","Nice Product With in the Range","Nice Product With in the Range","Nice Product With in the Range","Nice Product With in the Range","Nice Product With in the Range","Nice Product With in the Range","Nice Product With in the Range","Nice Product With in the Range","Nice Product With in the Range","Nice Product With in the Range","Nice Product With in the Range","Nice Product With in the Range","Nice Product With in the Range","Nice Product With in the Range","Nice Product With in the Range","Nice Product With in the Range","Nice Product With in the Range",]
        ReviewTime = ["10:36AM","10:36AM","10:36AM","10:36AM","10:36AM","10:36AM","10:36AM","10:36AM","10:36AM","10:36AM","10:36AM","10:36AM","10:36AM","10:36AM","10:36AM","10:36AM","10:36AM","10:36AM","10:36AM","10:36AM",]
        ReviewDatefinal = ["17 april 2018","17 april 2018","17 april 2018","17 april 2018","17 april 2018","17 april 2018","17 april 2018","17 april 2018","17 april 2018","17 april 2018","17 april 2018","17 april 2018","17 april 2018","17 april 2018","17 april 2018","17 april 2018","17 april 2018","17 april 2018","17 april 2018","17 april 2018",]
    
        Reviewstabelview.reloadData()
        
    }
    
    @IBAction func Submit(_ sender: UIButton)
    {
        self.submit.setTitleColor(UIColor.black, for:.normal)
        
        self.ratethisproduct.text = "Write a shot review"
        finishtextfiled.isHidden = false
        
    finishtextfiled.useUnderline()
        finishtextfiled.attributedPlaceholder = NSAttributedString(string: "Tell us what you think")
        floatratingview.isHidden  = true
        self.ratinglabel.isHidden = true
        self.finish.isHidden = false
        self.submit.isHidden = true
        self.dotviewtwo.frame = CGRect(x:88 , y:6, width:12, height:12)
        self.dotviewtwo.layer.cornerRadius = self.dotviewtwo.layer.frame.size.width/2
        self.dotviewone.frame = CGRect(x:71 , y:8, width:7, height:7)
        self.dotviewone.layer.cornerRadius = self.dotviewone.layer.frame.size.width/2
        
        self.dotviewone.layer.masksToBounds = true
        self.dotviewtwo.layer.masksToBounds = true
        self.dotviewtwo.layer.backgroundColor = UIColor.pagecuurentcolor().cgColor
        self.dotviewone.layer.backgroundColor = UIColor.color3().cgColor
        
        self.submit.setTitleColor(UIColor.black, for:.normal)
        
    }
    
    
    @IBAction func Finish(_ sender: UIButton)
    {
        singelfinalvalue.isHidden = false
        ratingstring = "4.0"
        
        let floatvalue = Double(ratingstring)
        print(floatvalue)
        self.finishratingapp.rating = floatvalue!
        
        finishratingapp.backgroundColor = UIColor.clear
        
        finishratingapp.delegate = self as? FloatRatingViewDelegate
       finishratingapp.contentMode = UIViewContentMode.scaleAspectFit
        finishratingapp.type = .wholeRatings
        finishratingapp.editable = false
        nameoftheuser.text = "NumberMall"
        Niceapp.text = "Niceapp"
        ratedoflabel.text = "Rated on 21/08/2018"

//        Totalfinalvalue.frame = CGRect(x: self.Totalfinalvalue.frame.origin.x, y:  self.Totalfinalvalue.frame.origin.y+15, width:self.Totalfinalvalue.frame.size.width , height: self.Totalfinalvalue.frame.size.height)
        DispatchQueue.main.async {
            self.ProductCommentValue()
        }
    }
    
    func ProductCommentValue()
    {
        var request = URLRequest(url: URL(string:AgentConstants.DescriptionBaseurl)!)
        request.httpMethod = "POST"
        let defaults = UserDefaults.standard
        let defaulst = UserDefaults.standard

        if let Reviewfinaluseroid:String = defaults.value(forKey: "myuseridvaluefinal")as?String
        {
            self.productdescriptionuseridbiling = Reviewfinaluseroid
        }
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
let postString =  String(format: "method=%@&productId=%@&actorid=%@&comment=%@&rating=%@","productCommenting",productdemoidfinalvalue,productdescriptionuseridbiling,self.strotetextfiledvalue,CommentRatingstringvalue)
        print(postString)
        request.httpBody = postString.data(using: .utf8)
        request.addValue(AcessTokenfinalstring, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    
                    self.statusone = dict.value(forKey:"status")as! Bool
                    if let valedStr: Int = dict.value(forKey:"commentid")as? Int {
                        self.commentidstring = String(valedStr)
                    }
                    self.messagestring = dict.value(forKey:"message")as! String
                    self.view.makeToast(self.messagestring)
                }
                    break
                    case .failure(_):
                    break
              
            }
        }
        
    }
    
    
    @IBAction func Expandabelthreefinalsoldbyvalue(_ sender: UIButton)
    {
        if expandabelbuttonthree.tag == 0
        {
            soldviewfinaltabel.isHidden = false
            soldviewtabelview.isHidden = false

            expandabelbuttonthree.tag = 1
        }
        else if expandabelbuttonthree.tag == 1
        {
            soldviewfinaltabel.isHidden = true
            soldviewtabelview.isHidden = true
            
             expandabelbuttonthree.tag = 0
        }
    }
    
    @IBAction func ProductDescrptionaddbutton(_ sender: UIButton)
    {
        let btntag = sender.tag
        self.Maindescrptionpoupview.isHidden = true
        let bottomSheet = JXBottomSheetView(contentView:adpopupscroolview as! UIScrollView)
        bottomSheet.defaultMaxinumDisplayHeight  = self.view.frame.size.height
        bottomSheet.defaultMininumDisplayHeight = 0
        bottomSheet.displayState = .maxDisplay
        bottomSheet.frame = self.view.bounds
        self.view.addSubview(bottomSheet)
        
        let strValed: String = self.available_qty_dispone[btntag] as! String
        
        if strValed == "Out of Stock" {
            
            self.stockOutTitel = self.DescriptionNamefinalvalue[btntag]
            self.addpopupview.isHidden = true
        }
        
        let frqValeue = self.moq_calcstring[btntag]
        
       self.singquantitylabel.text = " \(frqValeue) X"
       self.lblInstockValue.text = self.instocklabel.text
        self.myinstacklabel.text = self.instocklabel.text
        
        if self.user_qtyfinalstringfinalarray[btntag] == "0"
        {
//            anotherquntitylabel.text = "\(self.modelData[1])"
            
            anotherquntitylabel.text = "1"

            self.pickerView.selectRow(1, inComponent: 0, animated: true)
            self.pickerView.reloadAllComponents()
        }
        else
        {
            anotherquntitylabel.text = self.user_qtyfinalstringfinalarray[btntag]
            let invalue = Int(self.user_qtyfinalstringfinalarray[btntag])
            self.pickerView.selectRow(invalue!, inComponent: 0, animated: true)
            self.pickerView.reloadAllComponents()

        }
        
        self.particularadd = ""
        print(self.DescriptionproductidValue)
        self.particularadd = self.productdemoidfinalvalue
        self.Postmethodaddfinalvalue()
         self.Today_quantity = ""
          self.Today_quantity = self.user_qtyfinalstringfinalarray[btntag]
        self.selectedint = btntag
    }
    
    func ProductDescriptionValue()
    {
        DispatchQueue.main.async {
//            self.veryalertview.isHidden = false
            self.productiamgeview.isHidden = false

        }
        
        let defaults = UserDefaults.standard
        defaults.set(self.productdemoidfinalvalue, forKey: "myproductidvalue")
        defaults.synchronize()
        
        
    self.showSpinner()
        
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        if let Reviewfinaluseroid:String = defaults.value(forKey: "myuseridvaluefinal")as?String
        {
            self.productdescriptionuseridbiling = Reviewfinaluseroid
        }
    
        if let Reviewfinaluseroid:String = defaults.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        
        if let Myagnetidfinalstringfinlavalue:String = defaults.value(forKey: "Myagentid")as?String
        {
            self.Myagnetidfinalstringvalue = Myagnetidfinalstringfinlavalue
        }
   
        let postString =  String(format: "method=%@&productId=%@&userid=%@&deviceType=%@","productDetails",productdemoidfinalvalue,productdescriptionuseridbiling,"mobile")
        print(postString)

      
        request.httpBody = postString.data(using: .utf8)
       request.addValue(self.AcessTokenfinalstring, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        request.addValue("application/json", forHTTPHeaderField: "Accept")

        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                self.removeSpinner()

                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    print(dict)
                    
                    DispatchQueue.main.async {
                        self.removeSpinner()
                    }
                self.variantarray = dict.value(forKey:"variants")as!NSArray
                    print(self.variantarray.count)
                    self.veryalertview.isHidden = true
                    self.productiamgeview.isHidden = true
                    self.removeSpinner()
                    if self.variantarray.count > 0
                    {
                if let DescriptionMOQfinal:[String] = self.variantarray.value(forKey: "MOQ") as? [String] {
                        self.variantMRPDisplayQuantity = DescriptionMOQfinal
                    }
                    if let DescriptionNamefinal:[String] = self.variantarray.value(forKey: "name") as? [String] {
                    self.DescriptionNamefinalvalue = DescriptionNamefinal
                    }
                        
                     if let DescriptionCODValefinal:[String] = self.variantarray.value(forKey: "cod_display") as? [String] {
                            self.DescriptionCODisplayfinal = DescriptionCODValefinal
                    }
                        
                        
                    if let DescriptionMRP:[String] = self.variantarray.value(forKey: "MRP") as? [String] {
                        self.variantMRPDisplayQuantityRupess = DescriptionMRP
                    }
              if let DescriptionProductImages:NSArray = self.variantarray.value(forKey: "ProductImages") as? NSArray {

//              self.variantProductimage.addingObjects(from:DescriptionProductImages as! [Any])
               self.variantProductimage = DescriptionProductImages
                
                print(self.variantProductimage)
                    }
                    if let Descriptionavailable_qty = self.variantarray.value(forKey: "available_qty") as? String {
                        self.available_qtyfinalvalue.append(Descriptionavailable_qty)
                    }
                    if let Descriptioncavailable_qty_disp = self.variantarray.value(forKey: "available_qty_disp") as? String {
                        self.available_qty_disp.append(Descriptioncavailable_qty_disp)
                    }
                        
                
                    if let Descriptioncb_cash_back:[String] = self.variantarray.value(forKey: "cash_back") as? [String] {
                        self.cash_back_string = Descriptioncb_cash_back
                    }
                  
                    if let Descriptioncb_display = self.variantarray.value(forKey: "cb_display") as? String {
                        
                        self.cb_displaystring.append(Descriptioncb_display)
                    }
                   
                    self.Combostringfinal = self.variantarray.value(forKey:"combo")as!NSArray

                    if let DescriptiondiscountString:[String] = self.variantarray.value(forKey: "discount") as? [String] {
                       self.Discount_string =  DescriptiondiscountString
                     
                    }
                   
                    if let Descriptiondiscount_disply:String = self.variantarray.value(forKey: "discount_disply") as? String {
                        self.discount_disply_string.append(Descriptiondiscount_disply)
                    }
              
                    if let Descriptionfav:String = self.variantarray.value(forKey: "fav") as? String {
                        
                        self.discriptioonFavourite.append(Descriptionfav)
                    }

                        if let moq_calcstringfinal:[String] = self.variantarray.value(forKey: "moq_calc") as? [String]
                        {

                            self.moq_calcstring = moq_calcstringfinal
                        }
                        
                        
                    print(self.moq_calcstring)
                    if let Descriptionname:String = self.variantarray.value(forKey: "name") as? String {
                        
                        self.productNameDescription.append(Descriptionname)
                    
                        }
                    
                    if let Descriptionpoff_take_display:String = self.variantarray.value(forKey: "off_take_display") as? String {
                        
                        self.off_take_displaystring.append(Descriptionpoff_take_display)
                        
                        }
                   
                    if let Descriptionpricevaluefinal:[String] = self.variantarray.value(forKey: "price") as? [String] {
                        
                        self.Descriptionpricevalue = Descriptionpricevaluefinal
                    }

                    if let DescriptionprodId:String = self.variantarray.value(forKey: "prodId") as? String {
                        
                        self.DescriptionproductidValue = [DescriptionprodId]
                    }
                    
                    self.Descriptionprod_ratingvaluearray =  self.variantarray.value(forKey:"prod_rating") as!NSArray
            
                self.ProductDeatilsfinalarray = self.variantarray.value(forKey:"product_details") as!NSArray
                  
                    print(self.ProductDeatilsfinalarray)
                
                    if let PlaceAddress:NSArray = self.ProductDeatilsfinalarray.value(forKey: "key") as? NSArray {
                     
                        self.EancodeItemsarray = PlaceAddress[0]  as! NSArray

                    }
                    if let Detailsscreevalue:NSArray = self.ProductDeatilsfinalarray.value(forKey: "value") as? NSArray {
                        self.EancodeValue = Detailsscreevalue[0]  as! NSArray
                        }
                    
              self.product_detailsratingString = self.variantarray.value(forKey:"rating") as! NSArray
                    
                    if let rating_displayAddress:String = self.variantarray.value(forKey: "rating_display") as? String {
                        
                        self.prodcutrating_display.append(rating_displayAddress)
                    }
                    if let rating_displayAddress:String = self.variantarray.value(forKey: "rating_display") as? String {
                        
                        self.prodcutrating_display.append(rating_displayAddress)
                    }
                    if let Deatilssold_by:[String] = self.variantarray.value(forKey: "sold_by") as? [String] {
                        
                        self.DescriptionSoldByRating = Deatilssold_by
                    }
                    if let DescriptionspecialOffers:[String] = self.variantarray.value(forKey: "specialOffers") as? [String] {
                    self.DescriptionspecialOffers = DescriptionspecialOffers
                    }
                    if let Descriptionweight:[String] = self.variantarray.value(forKey: "weight") as? [String] {
                        self.Descriptionweightonly = Descriptionweight
                    }
                    if let Descriptionweight_mrp:[String] = self.variantarray.value(forKey: "weight_mrp") as? [String] {
                        self.Descriptionweigtmrpfinal = Descriptionweight_mrp
                    
                    }
                    if let Descriptionoffer:[String] = self.variantarray.value(forKey: "offer") as? [String] {
                        self.DescriptionofferfinalValue = Descriptionoffer
                        
                    }
                
                    if let Descriptionmargin:[String] = self.variantarray.value(forKey: "margin") as? [String] {
                        self.DescrptionMarginfinalvalue = Descriptionmargin
                        
                    }
                    if let CashBackMargin:[String] = self.variantarray.value(forKey: "cash_back") as? [String] {
                        self.CashBackMarginDescription = CashBackMargin
                    }
                    if let DemoCashBackMargin:[String] = self.variantarray.value(forKey: "cash_back") as? [String] {
                        self.democashback = DemoCashBackMargin
                    }
          
                    if let DemoOutLetsBack:[String] = self.variantarray.value(forKey: "outletsBrought") as? [String] {
                        self.DemoOutLetsBackfinal = DemoOutLetsBack
                    }
               
                    if let variantquntityarrayfinal:NSArray = self.variantarray.value(forKey: "available_qty_disp") as? NSArray {
                             self.variantquntityarray = variantquntityarrayfinal
                        }
                        
                        if let Exclusiveofferarrayfinal:NSArray = self.variantarray.value(forKey: "exclusive") as? NSArray {
                            self.Exclusiveofferarray = Exclusiveofferarrayfinal
                        }
                        if let specialofferarray:NSArray = self.variantarray.value(forKey: "specialOffers") as? NSArray {
                            self.specialofferarray = specialofferarray
                        }
                        
                        
                        if let productdetailrarray:[String] = self.variantarray.value(forKey: "exclusive") as? [String] {
                           self.productdetailExculsive = productdetailrarray
                        }
                        
                      //  self.productdetailExculsive = self.variantarray.value(forKey: "exclusive") as! [String]

                        if let productTimerValue = self.variantarray.value(forKey: "dealExpireEnable") as? [String]
                        {
                            self.ProductDealTimeValue = productTimerValue
                        }
                        
                        if let productTimerset = self.variantarray.value(forKey: "dealExpTime") as? [NSNumber]{
                            self.dealEndtime = productTimerset
                            print(self.dealEndtime)
                        }
                        
                        
                        if let cashbackofferfinalvalue:NSArray = self.variantarray.value(forKey: "cash_backPer") as? NSArray {
                            self.cashbackoffer = cashbackofferfinalvalue
                        }
                        if let Discountofferfinal:NSArray = self.variantarray.value(forKey: "discountPer") as? NSArray {
                            self.Discountoffer = Discountofferfinal
                        }
                        
                        if let off_takefinal:NSArray = self.variantarray.value(forKey: "off_take") as? NSArray {
                            self.off_take = off_takefinal
                        }
                        if let outletsBroughtonefinal:NSArray = self.variantarray.value(forKey: "outletsBrought") as? NSArray {
                            self.outletsBroughtone = outletsBroughtonefinal
                        }
                        if let available_qty_disponefianl:NSArray = self.variantarray.value(forKey: "available_qty_disp") as? NSArray {
                            self.available_qty_dispone = available_qty_disponefianl
                        }
                      
                        if let productratingpreviewfianl:NSArray = self.variantarray.value(forKey: "prod_rating_prev") as? NSArray
                        {
                            self.productratingpreview = productratingpreviewfianl
                        }
                        
                        
     
                        if let favouriteratingfianl:NSArray = self.variantarray.value(forKey: "fav") as? NSArray
                        {
                            self.favouriterating = favouriteratingfianl
                        }
                        
                        
                        print(self.favouriterating)
                        
                        
                        
                    DispatchQueue.main.async
                        {
                     self.loadScrollView()

                        let fvaouritesingel = self.favouriterating[0] as! String
                            print(fvaouritesingel)
                            
                            if fvaouritesingel == "0"
                            {
                                self.myheartbutton?.setSelected(selected: false, animated: false)

                            }
                            if fvaouritesingel == "1"
                            {
                                self.myheartbutton?.setSelected(selected: true, animated:false)
                           self.myheartbutton.tag = 1
                                
                            }

                            self.user_qtyfinalstring = self.variantquntityarray[0] as! String
                            self.lblInstockValed.text = self.user_qtyfinalstring
                            print(self.user_qtyfinalstring)
                            self.specialofferlabel = self.specialofferarray[0] as! String
                            
                            if self.Exclusiveofferarray.count > 0
                            {
                                if let Exclusiveofferarrayfianl:String = self.Exclusiveofferarray[0] as? String
                                {
                                     self.Exclusive  = Exclusiveofferarrayfianl
                                }
//                                self.Exclusive = self.Exclusiveofferarray[0] as! String
                            }
                            
                     self.ProductNAmefinalvalue.text = self.DescriptionNamefinalvalue[0]
                    // self.soldbyNumberValue.text   = self.DescriptionSoldByRating[0]
                            self.soldbyNumberValue.isHidden = true

                    self.cashbackpercentage.text = self.Discountoffer[0] as? String
                    self.discountpercentage.text = self.cashbackoffer[0] as? String
                            /// discount array
                self.singelofferla.text = self.Discount_string[0]as? String
                self.offerlabel.text = self.self.DescrptionMarginfinalvalue[0] as? String
            self.productlabel.text = self.DescriptionNamefinalvalue[0] as? String
                self.dayslabel.text = self.off_take[0] as? String
                            
                            let offtake_value = self.off_take[0] as? String
                            if (offtake_value?.isEmpty)!
                            {
                                self.productserverrating.isHidden = true
                                self.stardarkgraey.isHidden = true
                                self.instocklabel.frame = CGRect(x:self.stardarkgraey.frame.origin.x, y: self.instocklabel.frame.origin.y-10, width: self.instocklabel.frame.size.width, height: self.instocklabel.frame.size.height)
                                 self.dayslabel.isHidden = true
                                self.daysiamgefinalvalue.isHidden = true
                            }
                self.largeamountofoutlets.text =                                                       self.outletsBroughtone[0] as? String
                             self.instocklabel.text =                                                       self.available_qty_dispone[0] as? String
                            self.outletsBroughtone[0] as? String
                            self.instocklabel.text =                                                       self.available_qty_dispone[0] as? String
                       
                            
                            print(self.variantarray.count)
                            if self.variantarray.count == 1
                            {
                        self.gramslabel.text   = self.Descriptionweightonly[0]
                                self.Roundbuttonone.isHidden = true
                                self.roundbuttontwo.isHidden = true
                                self.Roundbuttonthree.isHidden = true
                self.gramslabel.frame = CGRect(x:self.gramslabel.frame.origin.x, y: self.Roundbuttonone.frame.origin.y-10, width: self.gramslabel.frame.size.width, height: self.gramslabel.frame.size.height)
                    self.singeldemoview.frame = CGRect(x:self.singeldemoview.frame.origin.x, y: self.singeldemoview.frame.origin.y, width: self.singeldemoview.frame.size.width, height:40)
                                
            self.totalroundviewfinavalue.frame = CGRect(x:self.totalroundviewfinavalue.frame.origin.x, y: self.totalroundviewfinavalue.frame.origin.y-60, width: self.totalroundviewfinavalue.frame.size.width, height: self.totalroundviewfinavalue.frame.size.height)
                                self.variantalbel.isHidden = true

                            }
                            if self.variantarray.count > 1
                            {
                self.gramslabel.text   = self.Descriptionweightonly[0]
                self.Roundbuttonone.isHidden = false
                self.roundbuttontwo.isHidden = false
                self.Roundbuttonthree.isHidden = false
              self.gramslabel.frame = CGRect(x:self.gramslabel.frame.origin.x, y: self.gramslabel.frame.origin.y, width: self.gramslabel.frame.size.width, height: self.gramslabel.frame.size.height)
                self.singeldemoview.frame = CGRect(x:self.singeldemoview.frame.origin.x, y: self.singeldemoview.frame.origin.y, width: self.singeldemoview.frame.size.width, height: self.singeldemoview.frame.size.height)
                    self.totalroundviewfinavalue.frame = CGRect(x:self.totalroundviewfinavalue.frame.origin.x, y: self.totalroundviewfinavalue.frame.origin.y, width: self.totalroundviewfinavalue.frame.size.width, height: self.totalroundviewfinavalue.frame.size.height)
                    self.variantalbel.isHidden = false
                            }
                     self.Mrp10rupess8gramslabel.text =   self.Descriptionweigtmrpfinal[0]
                     self.quantitylabel.text =  self.variantMRPDisplayQuantity[0]
                    self.Rupeesalbel.text =  self.Descriptionpricevalue[0]
//                    self.offerlabel.text =  self.Discount_string[0]
                    self.cashbackpercentagelabel.text =  self.CashBackMarginDescription[0]
                //    self.singelofferla.text =  self.DescriptionofferfinalValue[0]
//                        self.gramslabel.text   = self.DemoOutLetsBackfinal[0]

    let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: self.variantMRPDisplayQuantityRupess[0] as String)
                    attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
                        self.struckofthelabel.attributedText = attributeString
                      //   self.offerlabel.text = self.DescrptionMarginfinalvalue[0]
                    self.expandabelview.isHidden = false
                            
                            
                            
                            
                    self.firstexpandtabelview.reloadData()
                        
                      ///  (self.variantquntityarray[0] as! String).count
                        
                            if self.user_qtyfinalstring == "Out of Stock"
                            {

                                self.addbutton.setBackgroundImage(UIImage(named: "Notification.png"), for:.normal)
                                self.Roundimage.isHidden = false
                            }
                            else{
                                if  self.user_qtyfinalstring >= "1"
                                {
                                    self.Roundimage.isHidden = true

                                    if let user_qtyfinalstringfinalvaluefianl:[String] = self.variantarray.value(forKey: "user_qty") as? [String]
                                    {
                                        let valuetotal = user_qtyfinalstringfinalvaluefianl[0]
                                        
                                        self.user_qtyfinalstringfinalarray = user_qtyfinalstringfinalvaluefianl
                                        
                                        if self.user_qtyfinalstringfinalarray[0].count > 0
                                        {
                                            self.user_qtyfinalstringfinalvalue = self.user_qtyfinalstringfinalarray[0]
                                        }
                                        
                                    }
                                
                                    if let user_qtyfinalstringfinalvaluefianl:[NSNumber] = self.variantarray.value(forKey: "user_qty") as? [NSNumber]
                                    {
                                        let valuetotal = user_qtyfinalstringfinalvaluefianl[0]
                          
                                        self.user_qtyfinalstringfinalarray = [user_qtyfinalstringfinalvaluefianl[0].stringValue]
                                        if self.user_qtyfinalstringfinalarray[0].count > 0
                                        {
                                            self.user_qtyfinalstringfinalvalue = self.user_qtyfinalstringfinalarray[0]
                                        }
                                        
                                    }
                                    
                                if self.user_qtyfinalstringfinalvalue == "0"
                                {
                                self.addbutton.setBackgroundImage(#imageLiteral(resourceName: "add"), for:.normal)
                                self.addbutton.addTarget(self, action: #selector(self.ProductDescrptionaddbutton(_:)), for: .touchUpInside)

                                self.countaddlabel.isHidden = true
                               self.countaddlabel.text = self.user_qtyfinalstringfinalvalue as String
                                self.Roundimage.isHidden = true
                                    self.cartcountlabel.text = self.user_qtyfinalstringfinalvalue as String

                                    }
                                    else
                                    {
                                    self.addbutton.setBackgroundImage(#imageLiteral(resourceName: "cart_edit"), for:.normal)
                                        self.addbutton.addTarget(self, action: #selector(self.ProductDescrptionaddbutton(_:)), for: .touchUpInside)
                                    self.countaddlabel.isHidden = false
                                    self.countaddlabel.text = self.user_qtyfinalstringfinalvalue as String
                                        self.cartcountlabel.text = self.user_qtyfinalstringfinalvalue as String
                                    }
 
                                }
                                if  self.user_qtyfinalstring == "0"
                                {
                                    self.countaddlabel.isHidden = true
                                    self.countaddlabel.text = self.user_qtyfinalstring as String
                                    self.addbutton.setBackgroundImage(#imageLiteral(resourceName: "add"), for:.normal);
                                    self.addbutton.addTarget(self, action: #selector(self.ProductDescrptionaddbutton(_:)), for: .touchUpInside)

                                    self.Roundimage.isHidden = true
                                    
                                }
                            }
                            if   self.specialofferlabel == "0"
                            {
                                self.offerlabelfinalvalue.isHidden = true
                            }
                            if   self.specialofferlabel == "1"
                            {
                                self.offerlabelfinalvalue.isHidden = false
                            }
                            if   self.Exclusive == "Yes"
                            {
                                self.Exculsiveoffer.isHidden = false
                            }
                            if   self.Exclusive == "False"
                            {
                                self.Exculsiveoffer.isHidden = true
                            }
                            
                            
                            let statusTime = self.ProductDealTimeValue[0]
                            
                            if statusTime == "0" {
                                self.dealTimeView.isHidden = true
                            }else{
                                self.dealTimeView.isHidden = false
                     
                            }
                            
                            if self.productratingpreview.count ==  1
                            {
                                self.Totalfinalvalue.isHidden = true
                            }
                            
                            if self.productratingpreview.count >= 1
                            {
                                self.productratedpreview = self.productratingpreview[0] as! NSDictionary
                                if let productratedpreview12fianlvalue:NSNumber =  self.productratedpreview.value(forKey:"rated") as? NSNumber
                                {
                                    self.productratedpreview12 = productratedpreview12fianlvalue
                                    self.Totalfinalvalue.isHidden = false
                                    if self.view.frame.size.height < 800 {
                                        self.productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2030, 0)
                                        self.productscrollview.isScrollEnabled = true
                                        self.productscrollview.showsVerticalScrollIndicator = false
                                    }
                                }
                                if let producttot_countpreviewfianlvalue:NSNumber =  self.productratedpreview.value(forKey:"tot_count") as? NSNumber
                                {
                                    self.producttot_countpreview = producttot_countpreviewfianlvalue
                                    self.Totalfinalvalue.isHidden = false
                                    if self.view.frame.size.height < 800 {
                                        self.productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2030, 0)
                                        self.productscrollview.isScrollEnabled = true
                                        self.productscrollview.showsVerticalScrollIndicator = false
                                    }
                                }
                                if let user_ratingfianlvalue:NSNumber =  self.productratedpreview.value(forKey:"user_rating") as? NSNumber
                                {
                                    self.productuser_ratingpreview = user_ratingfianlvalue
                                    self.Totalfinalvalue.isHidden = false
                                    if self.view.frame.size.height < 800 {
                                        self.productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2030, 0)
                                        self.productscrollview.isScrollEnabled = true
                                        self.productscrollview.showsVerticalScrollIndicator = false
                                    }
                                }
                                if let producttot_ratingpreviewfianlvalue:String =  self.productratedpreview.value(forKey:"tot_rating") as? String
                                {
                                    self.producttot_ratingpreview = producttot_ratingpreviewfianlvalue
                                    self.noofoutletsrating.isHidden = true
                                    self.Totalfinalvalue.isHidden = false
                                    let floatvalue = Double(self.producttot_ratingpreview)
                                    print(floatvalue)
                                    if self.view.frame.size.height < 800 {
                                        self.productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2030, 0)
                                        self.productscrollview.isScrollEnabled = true
                                        self.productscrollview.showsVerticalScrollIndicator = false
                                        self.googlereviewrating.text =  self.producttot_ratingpreview
                                        
                                       
                                        self.googlefloatingreview.rating = floatvalue!
                                       self.googlefloatingreview.backgroundColor = UIColor.clear
                                        self.googlefloatingreview.editable = false
                                    }
                                    
                                    self.dotviewone.layer.masksToBounds = true
                                    self.dotviewtwo.layer.masksToBounds = true
                                    self.dotviewtwo.layer.backgroundColor = UIColor.color3().cgColor
                                    self.dotviewone.layer.backgroundColor = UIColor.color3().cgColor
                                    
                                       self.floatratingview.delegate = self as? FloatRatingViewDelegate
                                    self.floatratingview.backgroundColor = UIColor.clear
                                 
                                    self.floatratingview.contentMode = UIViewContentMode.scaleAspectFit
                                    self.floatratingview.type = .wholeRatings
                                  
                                    self.floatratingview.rating = floatvalue!
                                    
                    self.ownratingviewfinalvaluue.isUserInteractionEnabled = false
                                    

                                   self.floatratingview.editable = false
                                    self.floatRatingView(self.floatratingview, isUpdating:floatvalue!)
                                    
                                    
                            ///floatRatingView(_ ratingView: FloatRatingView, isUpdating rating: Double)
                                    
                                    
                                }
                                if let producttot_reviewspreviewfianlvalue:String =  self.productratedpreview.value(forKey:"tot_reviews") as? String
                                {
                                    self.producttot_reviewspreview = producttot_reviewspreviewfianlvalue
                                    self.Totalfinalvalue.isHidden = false
                                    if self.view.frame.size.height < 800 {
                                        self.productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2030, 0)
                                        self.productscrollview.isScrollEnabled = true
                            self.productscrollview.showsVerticalScrollIndicator = false
                                       self.twentyfourreviews.setTitle(self.producttot_reviewspreview, for:.normal)
                                        
                                        
                                    }
                            
                                }
                        if let productrating_graphpreviewfinalvalue:NSArray =  self.productratedpreview.value(forKey:"rating_graph") as? NSArray
                                {
                                    self.productrating_graphpreview = productrating_graphpreviewfinalvalue
                                    
                                      if let productratingcountfinalvalue:[String] =  self.productrating_graphpreview.value(forKey:"count") as? [String]
                                    
                                      {
                                    self.productratingcount = productratingcountfinalvalue
                                        
                                        self.singelprogresslabel.text = self.productratingcount[0]
                                         self.secondprogreeslabel.text = self.productratingcount[1]
                                        self.Thirdprogreeslabel.text = self.productratingcount[2]
                                         self.fourthprogresslabel.text = self.productratingcount[3]
                                      self.fifthprogreeslabel.text = self.productratingcount[4]
 
                                        
                                    }
                                    if let productratingcolorfinalvalue:[String] =  self.productrating_graphpreview.value(forKey:"color") as? [String]
                                        
                                    {
                                        self.productratingcolor = productratingcolorfinalvalue

                                        var color1 = self.hexStringToUIColor(hex: self.productratingcolor[0])
                                        var color2 = self.hexStringToUIColor(hex: self.productratingcolor[1])
                                        var color3 = self.hexStringToUIColor(hex: self.productratingcolor[2])
                                        var color4 = self.hexStringToUIColor(hex: self.productratingcolor[3])
                                        var color5 = self.hexStringToUIColor(hex: self.productratingcolor[4])
                                        self.progressviewone.progressTintColor = color1
                                         self.progreesviewtwo.progressTintColor = color2
                                        self.progreeviewthree.progressTintColor = color3
                                        self.progreeviewfour.progressTintColor = color4
                                        self.progreeviewfive.progressTintColor = color5
                                    }
                                if let productratingpercentfinalvalue:[String] =  self.productrating_graphpreview.value(forKey:"percent") as? [String]
                                        
                                    {
                                        self.productratingpercent = productratingpercentfinalvalue
                                        
                                        self.progressviewone.progress = Float(self.productratingpercent[0])!
                                        
                                        self.progreesviewtwo.progress = Float(self.productratingpercent[1])!
                                          self.progreeviewthree.progress = Float(self.productratingpercent[2])!
                                         self.progreeviewfour.progress = Float(self.productratingpercent[3])!
                                        self.progreeviewfive.progress = Float(self.productratingpercent[4])!

                                    }
                                }
                                
                                
                        if let productrating_Commentspreviewfinalvalue:NSArray =  self.productratedpreview.value(forKey:"rating_comments") as? NSArray
                                {
                                    self.rating_Comments = productrating_Commentspreviewfinalvalue
                                    
                                    if let productratingNamevalue:[String] =  self.rating_Comments.value(forKey:"name") as? [String]
                                    {
                                        self.rating_name =  productratingNamevalue
                                    }
                                if let productratingidvalue:[String] =  self.rating_Comments.value(forKey:"ratingId") as? [String]
                                    {
                                        self.ratingId =  productratingidvalue
                                    }
                                    
                                if let commentidvalue:[String] =  self.rating_Comments.value(forKey:"comment") as? [String]
                                    {
                                        self.comment =  commentidvalue
                                    }
                                    if let rating1value:[String] =  self.rating_Comments.value(forKey:"rating") as? [String]
                                    {
                                        self.rating1 =  rating1value
                                    }
                                    if let timevalue:[String] =  self.rating_Comments.value(forKey:"time") as? [String]
                                    {
                                        self.time =  timevalue
                                    }
                            if let upCountvalue:[NSNumber] =  self.rating_Comments.value(forKey:"upCount") as? [NSNumber]
                                    {
                                        self.upCount =  upCountvalue
                                    }
                                    
                    if let DownCountvalue:[NSNumber] =  self.rating_Comments.value(forKey:"DownCount") as? [NSNumber]
                                    {
                                        self.DownCount =  DownCountvalue
                                    }
                                      print(self.upCount)
                                    print(self.DownCount)

                                    DispatchQueue.main.async {
                                        self.Reviewstabelview.reloadData()
                                    }
                                }
                            }
                    }
                    }
                }
                break
            case .failure(_):
                DispatchQueue.main.async {
                    self.veryalertview.isHidden = true
                    self.productiamgeview.isHidden = true
                    self.removeSpinner()
                }
                break
            }
            
            
            
        }
    }


    @IBAction func addTocart(_ sender: UIButton)
    {
        let btntag = sender.tag
        self.Maindescrptionpoupview.isHidden = true
        let bottomSheet = JXBottomSheetView(contentView:adpopupscroolview as! UIScrollView)
        bottomSheet.defaultMaxinumDisplayHeight  = self.view.frame.size.height
        bottomSheet.defaultMininumDisplayHeight = 0
        bottomSheet.displayState = .minDisplay
        bottomSheet.frame = self.view.bounds
        self.view.addSubview(bottomSheet)
        self.addtoanotherquantitylabel()
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
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
        pickerView.selectRow(row, inComponent:0, animated: true)
        return modelData[row] as String
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let finalstring = modelData[row]
        if finalstring == "10+"
        {
            demoviewfinalvalue.isHidden = false
            finalchangecolor.isHidden = true
            topviewfinal.isHidden = false
             mytextfiledcolor.text = "10"
             anotherquntitylabel.text = "10"
            self.Today_quantity  = "10"
        }
        else
        {
            mytextfiledcolor.text = modelData[row]
            anotherquntitylabel.text = modelData[row]
            self.Today_quantity  = modelData[row]
        }
        di_count = row
        pickerView.reloadAllComponents()
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        pickerView.reloadAllComponents()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.totalviewfinal.isHidden = true
            self.shoutsmallview.layer.cornerRadius = 5.0
            self.shoutsmallview.layer.masksToBounds = true
        }    }
    
    
    @IBAction func Topimageviewfinlvalue(_ sender: UIButton)
    {
      self.tapimageviewfinalview.isHidden = true
        productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2000, 0)
        productscrollview.isScrollEnabled = true
        productscrollview.showsVerticalScrollIndicator = false
        
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
    func showSpinner(){
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.veryalertview.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(imageView)
    }
    func removeSpinner(){
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()
    }
    
    @IBAction func sharebutton(_ sender: UIButton)
    {
        DispatchQueue.main.async
            {
                let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondViewController") as! secondViewController
                self.addChildViewController(popOverVC)
                popOverVC.view.frame = self.view.frame
                self.view.addSubview(popOverVC.view)
                popOverVC.didMove(toParentViewController: self)
        }
    }
    
    @IBAction func cartbuttonfinalvalue(_ sender: UIButton)
    {
        DispatchQueue.main.async
            {
            let cartviewfinalvalue  = self.storyboard?.instantiateViewController(withIdentifier:"CartViewController")as!CartViewController
            self.present(cartviewfinalvalue, animated: true, completion:nil)
        }
    }
    
    func firstPostion()
    {
        
        self.loadScrollView()
        
        let fvaouritesingel = self.favouriterating[0] as! String
        print(fvaouritesingel)
        
        if fvaouritesingel == "0"
        {
            
            self.myheartbutton?.setSelected(selected: false, animated: false)
            self.myheartbutton.tag = 0
            
        }
        if fvaouritesingel == "1"
        {
            
            self.myheartbutton?.setSelected(selected: true, animated:false)
            self.myheartbutton.tag = 1
            
        }
    
        self.user_qtyfinalstring = self.variantquntityarray[0] as! String
        self.lblInstockValed.text = self.user_qtyfinalstring
        self.specialofferlabel = self.specialofferarray[0] as! String
        self.Exclusive = self.Exclusiveofferarray[0] as! String
        self.ProductNAmefinalvalue.text = self.DescriptionNamefinalvalue[0]
        // self.soldbyNumberValue.text = self.DescriptionSoldByRating[0]
        self.soldbyNumberValue.isHidden = true

        self.cashbackpercentage.text = self.Discountoffer[0] as? String
        self.discountpercentage.text = self.cashbackoffer[0] as? String
        self.singelofferla.text = self.Discount_string[0]as? String
        self.offerlabel.text = self.self.DescrptionMarginfinalvalue[0] as? String
        self.productlabel.text = self.DescriptionNamefinalvalue[0] as? String
        self.dayslabel.text = self.off_take[0] as? String
        
        let offtake_value = self.off_take[0] as? String
        if (offtake_value?.isEmpty)!
        {
            self.productserverrating.isHidden = true
            self.stardarkgraey.isHidden = true
            self.instocklabel.frame = CGRect(x:self.stardarkgraey.frame.origin.x, y: self.instocklabel.frame.origin.y-10, width: self.instocklabel.frame.size.width, height: self.instocklabel.frame.size.height)
            self.dayslabel.isHidden = true
            self.daysiamgefinalvalue.isHidden = true
        }
        self.largeamountofoutlets.text = self.outletsBroughtone[0] as? String
        self.instocklabel.text = self.available_qty_dispone[0] as? String
        self.outletsBroughtone[0] as? String
        self.instocklabel.text = self.available_qty_dispone[0] as? String
        
        
        print(self.variantarray.count)
        if self.variantarray.count == 1
        {
            self.gramslabel.text = self.Descriptionweightonly[0]
            self.Roundbuttonone.isHidden = true
            self.roundbuttontwo.isHidden = true
            self.Roundbuttonthree.isHidden = true
            self.gramslabel.frame = CGRect(x:self.gramslabel.frame.origin.x, y: self.Roundbuttonone.frame.origin.y-10, width: self.gramslabel.frame.size.width, height: self.gramslabel.frame.size.height)
            self.singeldemoview.frame = CGRect(x:self.singeldemoview.frame.origin.x, y: self.singeldemoview.frame.origin.y, width: self.singeldemoview.frame.size.width, height:40)
            
            self.totalroundviewfinavalue.frame = CGRect(x:self.totalroundviewfinavalue.frame.origin.x, y: self.totalroundviewfinavalue.frame.origin.y-60, width: self.totalroundviewfinavalue.frame.size.width, height: self.totalroundviewfinavalue.frame.size.height)
            self.variantalbel.isHidden = true
            
        }
        if self.variantarray.count > 1
        {
            self.gramslabel.text = self.Descriptionweightonly[0]
            self.Roundbuttonone.isHidden = false
            self.roundbuttontwo.isHidden = false
            self.Roundbuttonthree.isHidden = false
            self.gramslabel.frame = CGRect(x:self.gramslabel.frame.origin.x, y: self.gramslabel.frame.origin.y, width: self.gramslabel.frame.size.width, height: self.gramslabel.frame.size.height)
            self.singeldemoview.frame = CGRect(x:self.singeldemoview.frame.origin.x, y: self.singeldemoview.frame.origin.y, width: self.singeldemoview.frame.size.width, height: self.singeldemoview.frame.size.height)
            self.totalroundviewfinavalue.frame = CGRect(x:self.totalroundviewfinavalue.frame.origin.x, y: self.totalroundviewfinavalue.frame.origin.y, width: self.totalroundviewfinavalue.frame.size.width, height: self.totalroundviewfinavalue.frame.size.height)
            self.variantalbel.isHidden = false
        }
        self.Mrp10rupess8gramslabel.text = self.Descriptionweigtmrpfinal[0]
        self.quantitylabel.text = self.variantMRPDisplayQuantity[0]
        self.Rupeesalbel.text = self.Descriptionpricevalue[0]
        self.cashbackpercentagelabel.text = self.CashBackMarginDescription[0]
      
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: self.variantMRPDisplayQuantityRupess[0] as String)
        attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        self.struckofthelabel.attributedText = attributeString
        self.expandabelview.isHidden = false
      
        self.firstexpandtabelview.reloadData()

        if self.user_qtyfinalstring == "Out of Stock"
        {
            self.addbutton.setBackgroundImage(UIImage(named:"Notification"), for: .normal)
            self.Roundimage.isHidden = false
        }
        else{
            if self.user_qtyfinalstring >= "1"
            {
                self.Roundimage.isHidden = true
                if let user_qtyfinalstringfinalvaluelvalue:[String] = self.variantarray.value(forKey:"user_qty") as? [String]
                {
                       self.user_qtyfinalstringfinalvalue = user_qtyfinalstringfinalvaluelvalue[0] as! String
                }
                
                if let user_qtyfinalstringfinalvaluelvalueTotal:[NSNumber] = self.variantarray.value(forKey:"user_qty") as? [NSNumber]
                {
                    let value = user_qtyfinalstringfinalvaluelvalueTotal[0]
                     self.user_qtyfinalstringfinalvalue = value.stringValue
                }

                if self.user_qtyfinalstringfinalvalue == "0"
                    
                {
                    self.addbutton.setBackgroundImage(#imageLiteral(resourceName: "add"), for:.normal)
                    self.addbutton.addTarget(self, action: #selector(self.ProductDescrptionaddbutton(_:)), for: .touchUpInside)

                    self.countaddlabel.isHidden = true
                    self.countaddlabel.text = self.user_qtyfinalstringfinalvalue as String
                    self.Roundimage.isHidden = true
                    
                }
                else
                {
                    self.addbutton.setBackgroundImage(#imageLiteral(resourceName: "cart_edit"), for:.normal)
                    self.addbutton.addTarget(self, action: #selector(self.ProductDescrptionaddbutton(_:)), for: .touchUpInside)

                    self.countaddlabel.isHidden = false
                    self.countaddlabel.text = self.user_qtyfinalstringfinalvalue as String
                }
                
            }
            if self.user_qtyfinalstring == "0"
            {
                self.countaddlabel.isHidden = true
                self.countaddlabel.text = self.user_qtyfinalstring as String
                self.addbutton.setBackgroundImage(#imageLiteral(resourceName: "add"), for:.normal); self.Roundimage.isHidden = true
                self.addbutton.addTarget(self, action: #selector(self.ProductDescrptionaddbutton(_:)), for: .touchUpInside)

                
            }
        }
        if self.specialofferlabel == "0"
        {
            self.offerlabelfinalvalue.isHidden = true
        }
        if self.specialofferlabel == "1"
        {
            self.offerlabelfinalvalue.isHidden = false
        }
        if self.Exclusive == "Yes"
        {
            self.Exculsiveoffer.isHidden = true
        }
        if self.Exclusive == "False"
        {
            self.Exculsiveoffer.isHidden = false
        }
        print(self.productratingpreview.count)
        if self.productratingpreview.count == 1
        {
            self.Totalfinalvalue.isHidden = true
        }
        
        if self.productratingpreview.count >= 1
        {
            self.productratedpreview = self.productratingpreview[0] as! NSDictionary
            if let productratedpreview12fianlvalue:NSNumber = self.productratedpreview.value(forKey:"rated") as? NSNumber
            {
                self.productratedpreview12 = productratedpreview12fianlvalue
                self.Totalfinalvalue.isHidden = false
                if self.view.frame.size.height < 800 {
                    self.productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2030, 0)
                    self.productscrollview.isScrollEnabled = true
                    self.productscrollview.showsVerticalScrollIndicator = false
                }
            }
            if let producttot_countpreviewfianlvalue:NSNumber = self.productratedpreview.value(forKey:"tot_count") as? NSNumber
            {
                self.producttot_countpreview = producttot_countpreviewfianlvalue
                self.Totalfinalvalue.isHidden = false
                if self.view.frame.size.height < 800 {
                    self.productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2030, 0)
                    self.productscrollview.isScrollEnabled = true
                    self.productscrollview.showsVerticalScrollIndicator = false
                }
            }
            if let user_ratingfianlvalue:NSNumber = self.productratedpreview.value(forKey:"user_rating") as? NSNumber
            {
                self.productuser_ratingpreview = user_ratingfianlvalue
                self.Totalfinalvalue.isHidden = false
                if self.view.frame.size.height < 800 {
                    self.productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2030, 0)
                    self.productscrollview.isScrollEnabled = true
                    self.productscrollview.showsVerticalScrollIndicator = false
                }
            }
            if let producttot_ratingpreviewfianlvalue:String = self.productratedpreview.value(forKey:"tot_rating") as? String
            {
                self.producttot_ratingpreview = producttot_ratingpreviewfianlvalue
                self.noofoutletsrating.isHidden = true
                self.Totalfinalvalue.isHidden = false
                let floatvalue = Double(self.producttot_ratingpreview)
                print(floatvalue!)
                if self.view.frame.size.height < 800 {
                    self.productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2030, 0)
                    self.productscrollview.isScrollEnabled = true
                    self.productscrollview.showsVerticalScrollIndicator = false
                    self.googlereviewrating.text = self.producttot_ratingpreview
                    
                    
                    self.googlefloatingreview.rating = floatvalue!
                    self.googlefloatingreview.backgroundColor = UIColor.clear
                    self.googlefloatingreview.editable = false
                }
                
                self.dotviewone.layer.masksToBounds = true
                self.dotviewtwo.layer.masksToBounds = true
                self.dotviewtwo.layer.backgroundColor = UIColor.color3().cgColor
                self.dotviewone.layer.backgroundColor = UIColor.color3().cgColor
                
                self.floatratingview.delegate = self as? FloatRatingViewDelegate
                self.floatratingview.backgroundColor = UIColor.clear
                
                self.floatratingview.contentMode = UIViewContentMode.scaleAspectFit
                self.floatratingview.type = .wholeRatings
                
                self.floatratingview.rating = floatvalue!
                
                self.ownratingviewfinalvaluue.isUserInteractionEnabled = false
                
                self.floatratingview.editable = false
                self.floatRatingView(self.floatratingview, isUpdating:floatvalue!)
     
            }
            if let producttot_reviewspreviewfianlvalue:String = self.productratedpreview.value(forKey:"tot_reviews") as? String
            {
                self.producttot_reviewspreview = producttot_reviewspreviewfianlvalue
                self.Totalfinalvalue.isHidden = false
                if self.view.frame.size.height < 800 {
                    self.productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2030, 0)
                    self.productscrollview.isScrollEnabled = true
                    self.productscrollview.showsVerticalScrollIndicator = false
                    self.twentyfourreviews.setTitle(self.producttot_reviewspreview, for:.normal)
                    
                    
                }
                
            }
            if let productrating_graphpreviewfinalvalue:NSArray = self.productratedpreview.value(forKey:"rating_graph") as? NSArray
            {
                self.productrating_graphpreview = productrating_graphpreviewfinalvalue
                
                if let productratingcountfinalvalue:[String] = self.productrating_graphpreview.value(forKey:"count") as? [String]
                    
                {
                    self.productratingcount = productratingcountfinalvalue
                    
                    self.singelprogresslabel.text = self.productratingcount[0]
                    self.secondprogreeslabel.text = self.productratingcount[1]
                    self.Thirdprogreeslabel.text = self.productratingcount[2]
                    self.fourthprogresslabel.text = self.productratingcount[3]
                    self.fifthprogreeslabel.text = self.productratingcount[4]
                    
                    
                }
                if let productratingcolorfinalvalue:[String] = self.productrating_graphpreview.value(forKey:"color") as? [String]
                    
                {
                    self.productratingcolor = productratingcolorfinalvalue

                    
                    var color1 = self.hexStringToUIColor(hex: self.productratingcolor[0])
                    var color2 = self.hexStringToUIColor(hex: self.productratingcolor[1])
                    var color3 = self.hexStringToUIColor(hex: self.productratingcolor[2])
                    var color4 = self.hexStringToUIColor(hex: self.productratingcolor[3])
                    var color5 = self.hexStringToUIColor(hex: self.productratingcolor[4])
                    self.progressviewone.progressTintColor = color1
                    self.progreesviewtwo.progressTintColor = color2
                    self.progreeviewthree.progressTintColor = color3
                    self.progreeviewfour.progressTintColor = color4
                    self.progreeviewfive.progressTintColor = color5
                }
                if let productratingpercentfinalvalue:[String] = self.productrating_graphpreview.value(forKey:"percent") as? [String]
                    
                {
                    self.productratingpercent = productratingpercentfinalvalue
                    
                    self.progressviewone.progress = Float(self.productratingpercent[0])!
                    
                    self.progreesviewtwo.progress = Float(self.productratingpercent[1])!
                    self.progreeviewthree.progress = Float(self.productratingpercent[2])!
                    self.progreeviewfour.progress = Float(self.productratingpercent[3])!
                    self.progreeviewfive.progress = Float(self.productratingpercent[4])!
                    
                }
            }
            
            
            if let productrating_Commentspreviewfinalvalue:NSArray = self.productratedpreview.value(forKey:"rating_comments") as? NSArray
            {
                self.rating_Comments = productrating_Commentspreviewfinalvalue
                
                if let productratingNamevalue:[String] = self.rating_Comments.value(forKey:"name") as? [String]
                {
                    self.rating_name = productratingNamevalue
                }
                if let productratingidvalue:[String] = self.rating_Comments.value(forKey:"ratingId") as? [String]
                {
                    self.ratingId = productratingidvalue
                }
                
                if let commentidvalue:[String] = self.rating_Comments.value(forKey:"comment") as? [String]
                {
                    self.comment = commentidvalue
                }
                if let rating1value:[String] = self.rating_Comments.value(forKey:"rating") as? [String]
                {
                    self.rating1 = rating1value
                }
                if let timevalue:[String] = self.rating_Comments.value(forKey:"time") as? [String]
                {
                    self.time = timevalue
                }
                if let upCountvalue:[NSNumber] = self.rating_Comments.value(forKey:"upCount") as? [NSNumber]
                {
                    self.upCount = upCountvalue
                }
                
                if let DownCountvalue:[NSNumber] = self.rating_Comments.value(forKey:"DownCount") as? [NSNumber]
                {
                    self.DownCount = DownCountvalue
                }
                print(self.upCount)
                print(self.DownCount)
                
                DispatchQueue.main.async {
                    self.Reviewstabelview.reloadData()
                }
            }
        }
    }
    
    
    
    func secondPosition()
    {
        if let PlaceAddress:NSArray = self.ProductDeatilsfinalarray.value(forKey: "key") as? NSArray
        {
            self.EancodeItemsarray = PlaceAddress[1] as! NSArray
        }
        if let Detailsscreevalue:NSArray = self.ProductDeatilsfinalarray.value(forKey: "value") as? NSArray {
            self.EancodeValue = Detailsscreevalue[1] as! NSArray
        }
        
   
        self.loadScrollView()
        
        let fvaouritesingel = self.favouriterating[0] as! String
        
        if fvaouritesingel == "0"
        {
            self.myheartbutton?.setSelected(selected: false, animated: false)
        }
        if fvaouritesingel == "1"
        {
            self.myheartbutton?.setSelected(selected: true, animated:false)
            self.myheartbutton.tag = 1
        }
        self.user_qtyfinalstring = self.variantquntityarray[1] as! String
        print(self.user_qtyfinalstring)
        self.lblInstockValed.text = self.user_qtyfinalstring
        self.specialofferlabel = self.specialofferarray[1] as! String
        print(self.specialofferlabel)
        self.Exclusive = self.Exclusiveofferarray[1] as! String
        print(self.Exclusive)
        
        self.ProductNAmefinalvalue.text = self.DescriptionNamefinalvalue[1]
       // self.soldbyNumberValue.text = self.DescriptionSoldByRating[1]
        self.soldbyNumberValue.isHidden = true
        self.cashbackpercentage.text = self.Discountoffer[1] as? String
        self.discountpercentage.text = self.cashbackoffer[1] as? String
        self.singelofferla.text = self.Discount_string[1]as? String
        self.offerlabel.text = self.DescrptionMarginfinalvalue[1] as? String
     
        self.productlabel.text = self.DescriptionNamefinalvalue[1] as? String
        self.dayslabel.text = self.off_take[1] as? String
        
        let offtake_value = self.off_take[1] as? String
        if (offtake_value?.isEmpty)!
        {
            self.productserverrating.isHidden = true
            self.stardarkgraey.isHidden = true
            self.instocklabel.frame = CGRect(x:self.stardarkgraey.frame.origin.x, y: self.instocklabel.frame.origin.y-10, width: self.instocklabel.frame.size.width, height: self.instocklabel.frame.size.height)
            self.dayslabel.isHidden = true
            self.daysiamgefinalvalue.isHidden = true
        }
        self.largeamountofoutlets.text = self.outletsBroughtone[1] as? String
        self.instocklabel.text = self.available_qty_dispone[1] as? String
        self.outletsBroughtone[1] as? String
        self.instocklabel.text = self.available_qty_dispone[1] as? String
        print(self.variantarray.count)
        if self.variantarray.count == 1
        {
            self.gramslabel.text = self.Descriptionweightonly[1]
            self.Roundbuttonone.isHidden = true
            self.roundbuttontwo.isHidden = true
            self.Roundbuttonthree.isHidden = true

            self.variantalbel.isHidden = true
            
        }
        if self.variantarray.count > 1
        {
            self.gramslabel.text = self.Descriptionweightonly[1]
            self.Roundbuttonone.isHidden = false
            self.roundbuttontwo.isHidden = false
            self.Roundbuttonthree.isHidden = false

            self.variantalbel.isHidden = false
        }
        self.Mrp10rupess8gramslabel.text = self.Descriptionweigtmrpfinal[1]
        self.quantitylabel.text = self.variantMRPDisplayQuantity[1]
        self.Rupeesalbel.text = self.Descriptionpricevalue[1]
        self.cashbackpercentagelabel.text = self.CashBackMarginDescription[1]
    
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: self.variantMRPDisplayQuantityRupess[1] as String)
        attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        self.struckofthelabel.attributedText = attributeString
        self.expandabelview.isHidden = false
      
        self.firstexpandtabelview.reloadData()
        
        
        if self.user_qtyfinalstring == "Out of Stock"
        {
            self.Roundimage.isHidden = false
            self.addbutton.setBackgroundImage(UIImage(named:"Notification"), for: .normal)
        }
        else{
            if self.user_qtyfinalstring >= "1"
            {
                self.Roundimage.isHidden = true

                if let productratingNamevalue:[String] = self.variantarray.value(forKey:"user_qty") as? [String]
                {
                    self.user_qtyfinalstringfinalarray = productratingNamevalue
                }
                
                
                if let productratingNamevalue:[NSNumber] = self.variantarray.value(forKey:"user_qty") as? [NSNumber]
                {
                    
                    let value =  productratingNamevalue[0].stringValue
                    
                    self.user_qtyfinalstringfinalarray = [value]

                }
                
                if let user_qtyfinalstringfinalvalueistotal:String = self.user_qtyfinalstringfinalarray[0] as! String
                {
                    
                     self.user_qtyfinalstringfinalvalue = user_qtyfinalstringfinalvalueistotal
                }
//                self.user_qtyfinalstringfinalvalue = self.user_qtyfinalstringfinalarray[0]
              
                if self.user_qtyfinalstringfinalvalue == "0"
                {
                    self.addbutton.setBackgroundImage(#imageLiteral(resourceName: "add"), for:.normal)
                    self.addbutton.addTarget(self, action: #selector(self.ProductDescrptionaddbutton(_:)), for: .touchUpInside)

                    self.countaddlabel.isHidden = true
                    self.countaddlabel.text = self.user_qtyfinalstringfinalvalue as String
                    self.Roundimage.isHidden = true
                    
                }
                else
                {
                    self.addbutton.setBackgroundImage(#imageLiteral(resourceName: "cart_edit"), for:.normal)
                    self.addbutton.addTarget(self, action: #selector(self.ProductDescrptionaddbutton(_:)), for: .touchUpInside)
                    self.countaddlabel.isHidden = false
                    self.countaddlabel.text = self.user_qtyfinalstringfinalvalue as String
                }
                
            }
            if self.user_qtyfinalstring == "0"
            {
                self.countaddlabel.isHidden = true
                self.countaddlabel.text = self.user_qtyfinalstring as String
                self.addbutton.setBackgroundImage(#imageLiteral(resourceName: "add"), for:.normal); self.Roundimage.isHidden = true
                self.addbutton.addTarget(self, action: #selector(self.ProductDescrptionaddbutton(_:)), for: .touchUpInside)

                
            }
        }
        if self.specialofferlabel == "0"
        {
            self.offerlabelfinalvalue.isHidden = true
        }
        if self.specialofferlabel == "1"
        {
            self.offerlabelfinalvalue.isHidden = false
        }
        if self.Exclusive == "Yes"
        {
            self.Exculsiveoffer.isHidden = true
        }
        if self.Exclusive == "False"
        {
            self.Exculsiveoffer.isHidden = false
        }
        print(self.productratingpreview.count)
        if self.productratingpreview.count == 1
        {
            self.Totalfinalvalue.isHidden = true
        }
        
        if self.productratingpreview.count >= 1
        {
            self.productratedpreview = self.productratingpreview[1] as! NSDictionary
            if let productratedpreview12fianlvalue:NSNumber = self.productratedpreview.value(forKey:"rated") as? NSNumber
            {
                self.productratedpreview12 = productratedpreview12fianlvalue
                self.Totalfinalvalue.isHidden = false
                if self.view.frame.size.height < 800 {
                    self.productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2030, 0)
                    self.productscrollview.isScrollEnabled = true
                    self.productscrollview.showsVerticalScrollIndicator = false
                }
            }
            if let producttot_countpreviewfianlvalue:NSNumber = self.productratedpreview.value(forKey:"tot_count") as? NSNumber
            {
                self.producttot_countpreview = producttot_countpreviewfianlvalue
                self.Totalfinalvalue.isHidden = false
                if self.view.frame.size.height < 800 {
                    self.productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2030, 0)
                    self.productscrollview.isScrollEnabled = true
                    self.productscrollview.showsVerticalScrollIndicator = false
                }
            }
            if let user_ratingfianlvalue:NSNumber = self.productratedpreview.value(forKey:"user_rating") as? NSNumber
            {
                self.productuser_ratingpreview = user_ratingfianlvalue
                self.Totalfinalvalue.isHidden = false
                if self.view.frame.size.height < 800 {
                    self.productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2030, 0)
                    self.productscrollview.isScrollEnabled = true
                    self.productscrollview.showsVerticalScrollIndicator = false
                }
            }
            if let producttot_ratingpreviewfianlvalue:String = self.productratedpreview.value(forKey:"tot_rating") as? String
            {
                self.producttot_ratingpreview = producttot_ratingpreviewfianlvalue
                self.noofoutletsrating.isHidden = true
                self.Totalfinalvalue.isHidden = false
                let floatvalue = Double(self.producttot_ratingpreview)
                print(floatvalue!)
                if self.view.frame.size.height < 800 {
                    self.productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2030, 0)
                    self.productscrollview.isScrollEnabled = true
                    self.productscrollview.showsVerticalScrollIndicator = false
                    self.googlereviewrating.text = self.producttot_ratingpreview
                    
                    
                    self.googlefloatingreview.rating = floatvalue!
                    self.googlefloatingreview.backgroundColor = UIColor.clear
                    self.googlefloatingreview.editable = false
                }
                
                self.dotviewone.layer.masksToBounds = true
                self.dotviewtwo.layer.masksToBounds = true
                self.dotviewtwo.layer.backgroundColor = UIColor.color3().cgColor
                self.dotviewone.layer.backgroundColor = UIColor.color3().cgColor
                
                self.floatratingview.delegate = self as? FloatRatingViewDelegate
                self.floatratingview.backgroundColor = UIColor.clear
                
                self.floatratingview.contentMode = UIViewContentMode.scaleAspectFit
                self.floatratingview.type = .wholeRatings
                
                self.floatratingview.rating = floatvalue!
                
                self.ownratingviewfinalvaluue.isUserInteractionEnabled = false
                
                self.floatratingview.editable = false
                self.floatRatingView(self.floatratingview, isUpdating:floatvalue!)
                
            }
            if let producttot_reviewspreviewfianlvalue:String = self.productratedpreview.value(forKey:"tot_reviews") as? String
            {
                self.producttot_reviewspreview = producttot_reviewspreviewfianlvalue
                self.Totalfinalvalue.isHidden = false
                if self.view.frame.size.height < 800 {
                    self.productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2030, 0)
                    self.productscrollview.isScrollEnabled = true
                    self.productscrollview.showsVerticalScrollIndicator = false
                    self.twentyfourreviews.setTitle(self.producttot_reviewspreview, for:.normal)
                    
                    
                }
                
            }
            if let productrating_graphpreviewfinalvalue:NSArray = self.productratedpreview.value(forKey:"rating_graph") as? NSArray
            {
                self.productrating_graphpreview = productrating_graphpreviewfinalvalue
                
                if let productratingcountfinalvalue:[String] = self.productrating_graphpreview.value(forKey:"count") as? [String]
                    
                {
                    self.productratingcount = productratingcountfinalvalue
                    
                    self.singelprogresslabel.text = self.productratingcount[0]
                    self.secondprogreeslabel.text = self.productratingcount[1]
                    self.Thirdprogreeslabel.text = self.productratingcount[2]
                    self.fourthprogresslabel.text = self.productratingcount[3]
                    self.fifthprogreeslabel.text = self.productratingcount[4]
                    
                    
                }
                if let productratingcolorfinalvalue:[String] = self.productrating_graphpreview.value(forKey:"color") as? [String]
                    
                {
                    self.productratingcolor = productratingcolorfinalvalue
             
                    self.progressviewone.clipsToBounds = true
                    self.progressviewone.progressViewStyle = .bar
        
                    self.progreesviewtwo.clipsToBounds = true
                    self.progreesviewtwo.progressViewStyle = .bar
                    self.progreeviewthree.progressViewStyle = .bar
                    self.progreeviewthree.clipsToBounds = true
                    self.progreeviewfour.progressViewStyle = .bar
                    self.progreeviewfour.clipsToBounds = true
                    self.progreeviewfive.progressViewStyle = .bar
                    self.progreeviewfive.clipsToBounds = true
                    
                    var color1 = self.hexStringToUIColor(hex: self.productratingcolor[0])
                    var color2 = self.hexStringToUIColor(hex: self.productratingcolor[1])
                    var color3 = self.hexStringToUIColor(hex: self.productratingcolor[2])
                    var color4 = self.hexStringToUIColor(hex: self.productratingcolor[3])
                    var color5 = self.hexStringToUIColor(hex: self.productratingcolor[4])
                    self.progressviewone.progressTintColor = color1
                    self.progreesviewtwo.progressTintColor = color2
                    self.progreeviewthree.progressTintColor = color3
                    self.progreeviewfour.progressTintColor = color4
                    self.progreeviewfive.progressTintColor = color5
                }
                if let productratingpercentfinalvalue:[String] = self.productrating_graphpreview.value(forKey:"percent") as? [String]
                    
                {
                    self.productratingpercent = productratingpercentfinalvalue
                    
                    self.progressviewone.progress = Float(self.productratingpercent[0])!
                    
                    self.progreesviewtwo.progress = Float(self.productratingpercent[1])!
                    self.progreeviewthree.progress = Float(self.productratingpercent[2])!
                    self.progreeviewfour.progress = Float(self.productratingpercent[3])!
                    self.progreeviewfive.progress = Float(self.productratingpercent[4])!
                    
                }
            }
            
            
            if let productrating_Commentspreviewfinalvalue:NSArray = self.productratedpreview.value(forKey:"rating_comments") as? NSArray
            {
                self.rating_Comments = productrating_Commentspreviewfinalvalue
                
                if let productratingNamevalue:[String] = self.rating_Comments.value(forKey:"name") as? [String]
                {
                    self.rating_name = productratingNamevalue
                }
                if let productratingidvalue:[String] = self.rating_Comments.value(forKey:"ratingId") as? [String]
                {
                    self.ratingId = productratingidvalue
                }
                
                if let commentidvalue:[String] = self.rating_Comments.value(forKey:"comment") as? [String]
                {
                    self.comment = commentidvalue
                }
                if let rating1value:[String] = self.rating_Comments.value(forKey:"rating") as? [String]
                {
                    self.rating1 = rating1value
                }
                if let timevalue:[String] = self.rating_Comments.value(forKey:"time") as? [String]
                {
                    self.time = timevalue
                }
                if let upCountvalue:[NSNumber] = self.rating_Comments.value(forKey:"upCount") as? [NSNumber]
                {
                    self.upCount = upCountvalue
                }
                
                if let DownCountvalue:[NSNumber] = self.rating_Comments.value(forKey:"DownCount") as? [NSNumber]
                {
                    self.DownCount = DownCountvalue
                }
                print(self.upCount)
                print(self.DownCount)
                
                DispatchQueue.main.async {
                    self.Reviewstabelview.reloadData()
                }
            }
        }
    }
    
    func thirdpostion()
    {
        if let PlaceAddress:NSArray = self.ProductDeatilsfinalarray.value(forKey: "key") as? NSArray {
            
            self.EancodeItemsarray = PlaceAddress[2] as! NSArray
        }
        if let Detailsscreevalue:NSArray = self.ProductDeatilsfinalarray.value(forKey: "value") as? NSArray {
            self.EancodeValue = Detailsscreevalue[2] as! NSArray
        }
        
        self.loadScrollView()
        
        let fvaouritesingel = self.favouriterating[0] as! String
        print(fvaouritesingel)
        
        if fvaouritesingel == "0"
        {
        
            self.myheartbutton?.setSelected(selected: false, animated: false)
            self.myheartbutton.tag = 0
            
        }
        if fvaouritesingel == "1"
        {
    
            self.myheartbutton?.setSelected(selected: true, animated:false)
            self.myheartbutton.tag = 1
            
        }
        
        
//        if fvaouritesingel == "0"
//        {
//            self.favouritebutton.setBackgroundImage(#imageLiteral(resourceName: "Heart"), for:.normal)
//
//        }
//        if fvaouritesingel == "1"
//        {
//            self.favouritebutton.setBackgroundImage(#imageLiteral(resourceName: "favourite"), for:.normal)
//            self.favouritebutton.tag = 1
//
//        }
        
        self.user_qtyfinalstring = self.variantquntityarray[2] as! String
        self.lblInstockValed.text = self.user_qtyfinalstring
        print(self.user_qtyfinalstring)
        self.specialofferlabel = self.specialofferarray[2] as! String
        print(self.specialofferlabel)
        
        self.Exclusive = self.Exclusiveofferarray[2] as! String
        print(self.Exclusive)
        
        self.ProductNAmefinalvalue.text = self.DescriptionNamefinalvalue[2]
       // self.soldbyNumberValue.text = self.DescriptionSoldByRating[2]
        self.soldbyNumberValue.isHidden = true

        self.cashbackpercentage.text = self.Discountoffer[2] as? String
        self.discountpercentage.text = self.cashbackoffer[2] as? String
        self.singelofferla.text = self.Discount_string[2]as? String
        self.offerlabel.text = self.DescrptionMarginfinalvalue[2] as? String
      
        self.productlabel.text = self.DescriptionNamefinalvalue[2] as? String
        self.dayslabel.text = self.off_take[2] as? String
        
        let offtake_value = self.off_take[2] as? String
        if (offtake_value?.isEmpty)!
        {
            self.productserverrating.isHidden = true
            self.stardarkgraey.isHidden = true

            self.dayslabel.isHidden = true
            self.daysiamgefinalvalue.isHidden = true
        }
        self.largeamountofoutlets.text = self.outletsBroughtone[2] as? String
        self.instocklabel.text = self.available_qty_dispone[2] as? String
        self.outletsBroughtone[1] as? String
        self.instocklabel.text = self.available_qty_dispone[2] as? String
        
        
        print(self.variantarray.count)
        if self.variantarray.count == 1
        {
            self.gramslabel.text = self.Descriptionweightonly[2]
            self.Roundbuttonone.isHidden = true
            self.roundbuttontwo.isHidden = true
            self.Roundbuttonthree.isHidden = true

            self.variantalbel.isHidden = true
            
        }
        if self.variantarray.count > 1
        {
            self.gramslabel.text = self.Descriptionweightonly[2]
            self.Roundbuttonone.isHidden = false
            self.roundbuttontwo.isHidden = false
            self.Roundbuttonthree.isHidden = false
            self.gramslabel.frame = CGRect(x:self.gramslabel.frame.origin.x, y: self.gramslabel.frame.origin.y, width: self.gramslabel.frame.size.width, height: self.gramslabel.frame.size.height)
            self.singeldemoview.frame = CGRect(x:self.singeldemoview.frame.origin.x, y: self.singeldemoview.frame.origin.y, width: self.singeldemoview.frame.size.width, height: self.singeldemoview.frame.size.height)
            self.totalroundviewfinavalue.frame = CGRect(x:self.totalroundviewfinavalue.frame.origin.x, y: self.totalroundviewfinavalue.frame.origin.y, width: self.totalroundviewfinavalue.frame.size.width, height: self.totalroundviewfinavalue.frame.size.height)
            self.variantalbel.isHidden = false
        }
        self.Mrp10rupess8gramslabel.text = self.Descriptionweigtmrpfinal[2]
        self.quantitylabel.text = self.variantMRPDisplayQuantity[2]
        self.Rupeesalbel.text = self.Descriptionpricevalue[2]
        self.cashbackpercentagelabel.text = self.CashBackMarginDescription[2]
    
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: self.variantMRPDisplayQuantityRupess[1] as String)
        attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        self.struckofthelabel.attributedText = attributeString
    
        self.expandabelview.isHidden = false
        
        self.firstexpandtabelview.reloadData()
        
        
        if self.user_qtyfinalstring == "Out of Stock"
        {
            self.Roundimage.isHidden = false
            self.addbutton.setBackgroundImage(UIImage(named:"Notification"), for: .normal)
        }
        else{
            if self.user_qtyfinalstring >= "1"
            {
                self.Roundimage.isHidden = true

                if let variantquantitytwo:[NSNumber] = self.self.variantarray.value(forKey:"user_qty") as? [NSNumber]
                {
                    
                    let valuetotal  = variantquantitytwo[0]
                    
                    self.user_qtyfinalstringfinalvalue = valuetotal.stringValue
                    
                }
                
                if let variantquant:[String] = self.variantarray.value(forKey:"user_qty") as? [String]
                {
                    
                    
                    self.user_qtyfinalstringfinalvalue = variantquant[0]

                }
                
                if self.user_qtyfinalstringfinalvalue == "0"
                    
                {
                    self.addbutton.setBackgroundImage(#imageLiteral(resourceName: "add"), for:.normal)
                    self.addbutton.addTarget(self, action: #selector(self.ProductDescrptionaddbutton(_:)), for: .touchUpInside)

                    self.countaddlabel.isHidden = true
                    self.countaddlabel.text = self.user_qtyfinalstringfinalvalue as String
                    self.Roundimage.isHidden = true
                    
                }
                else
                {
                    self.addbutton.setBackgroundImage(#imageLiteral(resourceName: "cart_edit"), for:.normal)
                    self.addbutton.addTarget(self, action: #selector(self.ProductDescrptionaddbutton(_:)), for: .touchUpInside)

                    self.countaddlabel.isHidden = false
                    self.countaddlabel.text = self.user_qtyfinalstringfinalvalue as String
                }
                
            }
            if self.user_qtyfinalstring == "0"
            {
                self.countaddlabel.isHidden = true
                self.countaddlabel.text = self.user_qtyfinalstring as String
                self.addbutton.setBackgroundImage(#imageLiteral(resourceName: "add"), for:.normal);
                self.addbutton.addTarget(self, action: #selector(self.ProductDescrptionaddbutton(_:)), for: .touchUpInside)

                self.Roundimage.isHidden = true
                
            }
        }
        if self.specialofferlabel == "0"
        {
            self.offerlabelfinalvalue.isHidden = true
        }
        if self.specialofferlabel == "1"
        {
            self.offerlabelfinalvalue.isHidden = false
        }
        if self.Exclusive == "Yes"
        {
            self.Exculsiveoffer.isHidden = true
        }
        if self.Exclusive == "False"
        {
            self.Exculsiveoffer.isHidden = false
        }
        print(self.productratingpreview.count)
        if self.productratingpreview.count == 1
        {
            self.Totalfinalvalue.isHidden = true
        }
        
        if self.productratingpreview.count >= 1
        {
            self.productratedpreview = self.productratingpreview[2] as! NSDictionary
            if let productratedpreview12fianlvalue:NSNumber = self.productratedpreview.value(forKey:"rated") as? NSNumber
            {
                self.productratedpreview12 = productratedpreview12fianlvalue
                self.Totalfinalvalue.isHidden = false
                if self.view.frame.size.height < 800 {
                    self.productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2030, 0)
                    self.productscrollview.isScrollEnabled = true
                    self.productscrollview.showsVerticalScrollIndicator = false
                }
            }
            if let producttot_countpreviewfianlvalue:NSNumber = self.productratedpreview.value(forKey:"tot_count") as? NSNumber
            {
                self.producttot_countpreview = producttot_countpreviewfianlvalue
                self.Totalfinalvalue.isHidden = false
                if self.view.frame.size.height < 800 {
                    self.productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2030, 0)
                    self.productscrollview.isScrollEnabled = true
                    self.productscrollview.showsVerticalScrollIndicator = false
                }
            }
            if let user_ratingfianlvalue:NSNumber = self.productratedpreview.value(forKey:"user_rating") as? NSNumber
            {
                self.productuser_ratingpreview = user_ratingfianlvalue
                self.Totalfinalvalue.isHidden = false
                if self.view.frame.size.height < 800 {
                    self.productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2030, 0)
                    self.productscrollview.isScrollEnabled = true
                    self.productscrollview.showsVerticalScrollIndicator = false
                }
            }
            if let producttot_ratingpreviewfianlvalue:String = self.productratedpreview.value(forKey:"tot_rating") as? String
            {
                self.producttot_ratingpreview = producttot_ratingpreviewfianlvalue
                self.noofoutletsrating.isHidden = true
                self.Totalfinalvalue.isHidden = false
                let floatvalue = Double(self.producttot_ratingpreview)
                print(floatvalue!)
                if self.view.frame.size.height < 800 {
                    self.productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2030, 0)
                    self.productscrollview.isScrollEnabled = true
                    self.productscrollview.showsVerticalScrollIndicator = false
                    self.googlereviewrating.text = self.producttot_ratingpreview
                    
                    
                    self.googlefloatingreview.rating = floatvalue!
                    self.googlefloatingreview.backgroundColor = UIColor.clear
                    self.googlefloatingreview.editable = false
                }
                
                self.dotviewone.layer.masksToBounds = true
                self.dotviewtwo.layer.masksToBounds = true
                self.dotviewtwo.layer.backgroundColor = UIColor.color3().cgColor
                self.dotviewone.layer.backgroundColor = UIColor.color3().cgColor
                
                self.floatratingview.delegate = self as? FloatRatingViewDelegate
                self.floatratingview.backgroundColor = UIColor.clear
                
                self.floatratingview.contentMode = UIViewContentMode.scaleAspectFit
                self.floatratingview.type = .wholeRatings
                
                self.floatratingview.rating = floatvalue!
                
                self.ownratingviewfinalvaluue.isUserInteractionEnabled = false
                
                
                self.floatratingview.editable = false
                self.floatRatingView(self.floatratingview, isUpdating:floatvalue!)
                
                
                ///floatRatingView(_ ratingView: FloatRatingView, isUpdating rating: Double)
                
                
            }
            if let producttot_reviewspreviewfianlvalue:String = self.productratedpreview.value(forKey:"tot_reviews") as? String
            {
                self.producttot_reviewspreview = producttot_reviewspreviewfianlvalue
                self.Totalfinalvalue.isHidden = false
                if self.view.frame.size.height < 800 {
                    self.productscrollview.contentInset = UIEdgeInsetsMake(0, 0,2030, 0)
                    self.productscrollview.isScrollEnabled = true
                    self.productscrollview.showsVerticalScrollIndicator = false
                    self.twentyfourreviews.setTitle(self.producttot_reviewspreview, for:.normal)
                    
                    
                }
                
            }
            if let productrating_graphpreviewfinalvalue:NSArray = self.productratedpreview.value(forKey:"rating_graph") as? NSArray
            {
                self.productrating_graphpreview = productrating_graphpreviewfinalvalue
                
                if let productratingcountfinalvalue:[String] = self.productrating_graphpreview.value(forKey:"count") as? [String]
                    
                {
                    self.productratingcount = productratingcountfinalvalue
                    
                    self.singelprogresslabel.text = self.productratingcount[0]
                    self.secondprogreeslabel.text = self.productratingcount[1]
                    self.Thirdprogreeslabel.text = self.productratingcount[2]
                    self.fourthprogresslabel.text = self.productratingcount[3]
                    self.fifthprogreeslabel.text = self.productratingcount[4]
                    
                    
                }
                if let productratingcolorfinalvalue:[String] = self.productrating_graphpreview.value(forKey:"color") as? [String]
                    
                {
                    self.productratingcolor = productratingcolorfinalvalue
                    
                    self.progressviewone.clipsToBounds = true
                    self.progressviewone.progressViewStyle = .bar
                    self.progreesviewtwo.clipsToBounds = true
                    self.progreesviewtwo.progressViewStyle = .bar
                    self.progreeviewthree.progressViewStyle = .bar
                    self.progreeviewthree.clipsToBounds = true
                    self.progreeviewfour.progressViewStyle = .bar
                    self.progreeviewfour.clipsToBounds = true
                    self.progreeviewfive.progressViewStyle = .bar
                    self.progreeviewfive.clipsToBounds = true
                    
                    var color1 = self.hexStringToUIColor(hex: self.productratingcolor[0])
                    var color2 = self.hexStringToUIColor(hex: self.productratingcolor[1])
                    var color3 = self.hexStringToUIColor(hex: self.productratingcolor[2])
                    var color4 = self.hexStringToUIColor(hex: self.productratingcolor[3])
                    var color5 = self.hexStringToUIColor(hex: self.productratingcolor[4])
                    self.progressviewone.progressTintColor = color1
                    self.progreesviewtwo.progressTintColor = color2
                    self.progreeviewthree.progressTintColor = color3
                    self.progreeviewfour.progressTintColor = color4
                    self.progreeviewfive.progressTintColor = color5
                }
                if let productratingpercentfinalvalue:[String] = self.productrating_graphpreview.value(forKey:"percent") as? [String]
                    
                {
                    self.productratingpercent = productratingpercentfinalvalue
                    
                    self.progressviewone.progress = Float(self.productratingpercent[0])!
                    
                    self.progreesviewtwo.progress = Float(self.productratingpercent[1])!
                    self.progreeviewthree.progress = Float(self.productratingpercent[2])!
                    self.progreeviewfour.progress = Float(self.productratingpercent[3])!
                    self.progreeviewfive.progress = Float(self.productratingpercent[4])!
                    
                }
            }
            
            
            if let productrating_Commentspreviewfinalvalue:NSArray = self.productratedpreview.value(forKey:"rating_comments") as? NSArray
            {
                self.rating_Comments = productrating_Commentspreviewfinalvalue
                
                if let productratingNamevalue:[String] = self.rating_Comments.value(forKey:"name") as? [String]
                {
                    self.rating_name = productratingNamevalue
                }
                if let productratingidvalue:[String] = self.rating_Comments.value(forKey:"ratingId") as? [String]
                {
                    self.ratingId = productratingidvalue
                }
                
                if let commentidvalue:[String] = self.rating_Comments.value(forKey:"comment") as? [String]
                {
                    self.comment = commentidvalue
                }
                if let rating1value:[String] = self.rating_Comments.value(forKey:"rating") as? [String]
                {
                    self.rating1 = rating1value
                }
                if let timevalue:[String] = self.rating_Comments.value(forKey:"time") as? [String]
                {
                    self.time = timevalue
                }
                if let upCountvalue:[NSNumber] = self.rating_Comments.value(forKey:"upCount") as? [NSNumber]
                {
                    self.upCount = upCountvalue
                }
                
                if let DownCountvalue:[NSNumber] = self.rating_Comments.value(forKey:"DownCount") as? [NSNumber]
                {
                    self.DownCount = DownCountvalue
                }
                print(self.upCount)
                print(self.DownCount)
                
                DispatchQueue.main.async {
                    self.Reviewstabelview.reloadData()
                }
            }
        }
    }
    
//    func stringFromTimeInterval(interval: TimeInterval) -> NSString {
//
//        let ti = NSInteger(interval)
//        let value = (ti / 1000)
//        let seconds = value  % 60
//        let minutes = (value / 60) % 60
//        let hours = (value / 3600)
//        return NSString(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
//    }
//
//
//    @objc func countDown()
//    {
//        var dealTie = Int(dealEndtime)
//        dealTie  -= 1
//        let ti = NSInteger(dealTie)
//        let seconds = ti  % 60
//        let minutes = (ti / 60) % 60
//        let hours = (ti / 3600000)
//        self.lblTimerText.text = String(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
//
//    }
    
    
    
    func stockOutOrderValue(){
        
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.productdescriptionuseridbiling = Reviewfinaluseroid
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
        producidclikHOMEstring = self.DescriptionproductidValue[0]
        let postString =  String(format: "method=%@&ActorId=%@&prodId=%@&flag=%@","RestockAlertMe",self.productdescriptionuseridbiling,self.producidclikHOMEstring,"1")
        
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
                    print(self.messageStockOut)
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
            self.productUserIdValue = Myagentidfinal
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

     postStringfinalvalue =  String(format: "method=%@&userid=%@&productId=%@&deviceType=%@&VendorId=%@","moreProductDetails",productUserIdValue,particularadd,"mobile","")
        
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
                    
                    //// Seller information
                    
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
                    
                    
                    DispatchQueue.main.async {
                        
                        print(self.particularadd)
                        
                    }
                }
                break
            case .failure(_):
                break
            }
            
        }
        
    }
    
    func addtoanotherquantitylabel()
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
                let arrayvalue = NSString(format:"%@%@-%@-%@","[",particularadd,self.Today_quantity,"]")
                print(arrayvalue)
                postStringfinalvalue =  String(format: "method=%@&idProductInfo=%@&userid=%@&sellerId=%@&schemeId=%@&bulkId=%@","AddToCartDynamic",arrayvalue,Homeuseridstringvalue,self.cellerid,"","")
                print(postStringfinalvalue)
            }
        }
        else
        {
            let arrayvalue = NSString(format:"%@%@-%@-%@","[",particularadd,self.Today_quantity,"]")
            print(arrayvalue)
            postStringfinalvalue =  String(format: "method=%@&idProductInfo=%@&userid=%@&sellerId=%@&schemeId=%@&bulkId=%@","AddToCartDynamic",arrayvalue,Homeuseridstringvalue,"1","","")
            print(postStringfinalvalue)
        }
        print(postStringfinalvalue)
        let defaulst = UserDefaults.standard

        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        
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

                    if let cart_Countvaluefinal:NSNumber = dict.value(forKey: "CartCount") as? NSNumber
                    {
                        self.cart_Countvalue = cart_Countvaluefinal
                        self.cartcountlabel.isHidden = false
//                        self.cartcountlabel.layer.cornerRadius = 6.0
                        self.cartcountlabel.layer.cornerRadius = self.cartcountlabel.layer.frame.size.width/2

                        self.cartcountlabel.layer.masksToBounds = true
                        self.cartcountlabel.text =   self.cart_Countvalue.stringValue
                    }

                    if let cart_Countvaluefinal:NSString = dict.value(forKey: "CartCount") as?NSString
                    {
                        self.cartcountlabel.isHidden = false
                        self.cartcountlabel.layer.cornerRadius = self.cartcountlabel.layer.frame.size.width/2
                        self.cartcountlabel.layer.masksToBounds = true
                        self.cartcountlabel.text =   cart_Countvaluefinal as String
                    }

                    if let user_updatevaluefinal:String = dict.value(forKey: "user_qty") as? String
                    {

                        self.user_updatevalue = user_updatevaluefinal
                        print(self.selectedint)

                        self.VisibleIndexquntity = IndexPath(row: self.selectedint!, section: 0)

                        print(self.VisibleIndexquntity)

                            for i in 0..<self.user_qtyfinalstringfinalarray.count {
                                let add = self.user_qtyfinalstringfinalarray[i]
                                if i == self.selectedint {
                                    self.user_qtyfinalstringfinalarray[i] =  self.user_updatevalue
                                    
                                    self.addbutton.setBackgroundImage(#imageLiteral(resourceName: "cart_edit"), for:.normal)
                                    self.countaddlabel.isHidden = false
                                    self.countaddlabel.text = self.user_updatevalue as String
                                    
                                }
                            }
                        self.ProductDescriptionValue()

                        DispatchQueue.main.async {
                            print(self.particularadd)
                        }
                    }
                }
                break
            case .failure(_):
                break
            }

        }

    }
    
    @IBAction func buttonselername(_ sender: UIButton)
    {
        self.soldview.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.soldview.layer.shadowOpacity = 0.3
        self.soldview.layer.shadowRadius = 1.0
        self.soldview.layer.borderColor = UIColor.color2().cgColor
        self.soldview.layer.shadowColor = UIColor.color2().cgColor
        
        IQKeyboardManager.sharedManager().enable = true
        IQKeyboardManager.sharedManager().enableAutoToolbar = true
        IQKeyboardManager.sharedManager().shouldShowToolbarPlaceholder = true
        
        
        
        if btnSellerName.tag == 0
        {
            self.soldview.isHidden = false
            self.soldtabelview.isHidden = false
            self.soldtabelview.layer.borderWidth = 1.0
            self.soldtabelview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
            btnSellerName.tag = 1
        }
        else if btnSellerName.tag == 1
        {
            self.soldview.isHidden = true
            self.soldtabelview.isHidden = true
            btnSellerName.tag = 0
        }
    }
    
    @IBOutlet weak var totalviewfinal: UIView!
    
    
    @IBOutlet weak var shoutsmallview: UIView!
 
    @IBAction func myshoutbutton(_ sender:UIButton)
    {
        
        let defaults = UserDefaults.standard
        defaults.set("Myshoutbutton", forKey:"Shoutsecondvalue")
        defaults.synchronize()
       
        DispatchQueue.main.async
            {
            let productshoutView = self.storyboard?.instantiateViewController(withIdentifier:"productshoutViewController")as!productshoutViewController
            self.present(productshoutView, animated:true, completion:nil)
         }
    }
    @IBAction func shoutwithComment(_ sender: UIButton)
    {
        
        let defaults = UserDefaults.standard
        defaults.set("Myshoutbutton", forKey:"Shoutsecondvalue")
        defaults.synchronize()
        
        DispatchQueue.main.async
            {
                let productshoutView = self.storyboard?.instantiateViewController(withIdentifier:"productshoutViewController")as!productshoutViewController
                productshoutView.CommentTotalvalueis = "CommentTotalvalueis"
                self.present(productshoutView, animated:true, completion:nil)
        }
    }
    
    
    @IBAction func handbutton(_ sender: UIButton)
    {
        
        
        
        
    }
    
    @IBAction func shoutbutton(_ sender: UIButton)
    {
        self.totalviewfinal.isHidden = false
        self.shoutsmallview.layer.cornerRadius = 5.0
        self.shoutsmallview.layer.masksToBounds = true
        
    }
    
    @IBAction func subscribeforfreedelivery(_ sender: UIButton)
    {
        DispatchQueue.main.async
            {
                let Herosubscirbe = self.storyboard?.instantiateViewController(withIdentifier:"HeroSubscriptionVC")as!HeroSubscriptionVC
                self.present(Herosubscirbe, animated: true, completion:nil)
          }
    }
    
    @IBAction func Reviews(_ sender: UIButton)
    {
   
  
    }
    
    
    @objc func doubleTapped()
    {
        self.totalviewfinal.isHidden = true
    }
    
    @IBAction func backbuttontotal(_ sender: UIButton)
    {
        
    self.index = Int(self.index)+1
        if self.index < 10
        {
            let myString = String(self.index)
            self.Today_quantity = myString
            pickerView.selectRow(self.index, inComponent:0, animated: true)
            self.anotherquntitylabel.text =  self.Today_quantity
            pickerView.reloadAllComponents()
        }
        if self.index > 10
        {
            finalchangecolor.isHidden = true
            pickerView.isHidden = true
            topviewfinal.isHidden = false
            
            self.mytextfiledcolor.isHidden = false
            self.Today_quantity = "10"
            self.mytextfiledcolor.text = self.Today_quantity
            self.anotherquntitylabel.text = self.Today_quantity
        }
        if self.index == 10
        {
            finalchangecolor.isHidden = true
            pickerView.isHidden = true
            topviewfinal.isHidden = false
            self.mytextfiledcolor.isHidden = false
            self.Today_quantity = "10"
            self.mytextfiledcolor.text = self.Today_quantity
            self.anotherquntitylabel.text = self.Today_quantity
        }
    }
    
}
extension UIView {
    
    func dropShadow() {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.dropshadowcolor().cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width:-1, height:0)
        self.layer.shadowRadius = 1
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        
        self.layer.rasterizationScale = UIScreen.main.scale
        
    }
    
    
}
extension ProductDescriptionViewController: FloatRatingViewDelegate {

    func floatRatingView(_ ratingView: FloatRatingView, isUpdating rating: Double) {
 
        switch self.floatratingview.rating {
        case 0.1...1 :
            self.ratinglabel.text = "Hated It"
            self.dotsize()
        case 1.1...2 :
            self.ratinglabel.text = "Hated it"
            self.dotsize()
            CommentRatingstringvalue = "2"

        case 2.1...3 :
            self.dotsize()
            CommentRatingstringvalue = "3"

        case 3.1...4 :
            self.ratinglabel.text = "It’s OK"
            CommentRatingstringvalue = "4"

            self.dotsize()
        case 4.1...5 :
            CommentRatingstringvalue = "5"

            self.dotsize()

        default:
            self.ratinglabel.text = "Loved it"
            CommentRatingstringvalue = "5"

            self.dotsize()
            break
        }
    }
    func dotsize()
    {
        submit.isEnabled = true
        self.ratinglabel.text = "Hated It"
        self.dotviewone.frame = CGRect(x:70 , y:6, width:12, height:12)
        self.dotviewone.layer.cornerRadius = self.dotviewone.layer.frame.size.width/2
        self.dotviewtwo.layer.cornerRadius = self.dotviewtwo.layer.frame.size.width/2
        self.dotviewone.layer.masksToBounds = true
        self.dotviewtwo.layer.masksToBounds = true
        self.dotviewtwo.layer.backgroundColor = UIColor.color3().cgColor
        self.dotviewone.layer.backgroundColor = UIColor.pagecuurentcolor().cgColor
        self.submit.setTitleColor(UIColor.black, for:.normal)
        
    }
    
}
extension UITextField {
    
    func useUnderline() {
        let border = CALayer()
        let borderWidth = CGFloat(0.5)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(origin: CGPoint(x: 0,y :self.frame.size.height - borderWidth), size: CGSize(width: self.frame.size.width, height: self.frame.size.height))
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func RemoveUnderline() {
        let border = CALayer()
        let borderWidth = CGFloat(0.0)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(origin: CGPoint(x: 0,y :self.frame.size.height - borderWidth), size: CGSize(width: self.frame.size.width, height: self.frame.size.height))
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
extension ProductDescriptionViewController: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
