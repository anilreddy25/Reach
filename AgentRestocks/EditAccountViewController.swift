//
//  EditAccountViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 12/09/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//
//https://codecanyon.net/item/realtime-chat-app-using-socket-io-ios-swift-4/22469667
// CHATING APPLICATION EXAMPLE

import UIKit
import QuartzCore
// https://stackoverflow.com/questions/24171857/implementing-uitextfielddelegate-with-swift


/// https://stackoverflow.com/questions/46950732/how-to-handle-iqkeyboardmanager-done-button-action-in-toolbar - Keybaord done action


///// Moving crusor Postion textfield Postion

/// https://stackoverflow.com/questions/35331839/how-to-move-cursor-from-one-text-field-to-another-automatically-in-swift-ios-pro



import IQKeyboardManagerSwift
import Alamofire
import SDWebImage

class EditAccountViewController: UIViewController,YSSegmentedControlDelegate,UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate,ScrollPagerDelegatefinal
{
    @IBOutlet weak var Editviewfinal: UIView!
    
    @IBOutlet weak var Businessview: UIView!
    
    @IBOutlet weak var deliveryview: UIView!
    
    @IBOutlet weak var bilingview: UIView!
    
 
    
    @IBOutlet weak var Nametextfield: UITextField!
    
    @IBOutlet weak var Mobilenumber: UITextField!
    @IBOutlet weak var Agentfavouritescrollview: UIScrollView!
    
    
    @IBOutlet weak var Emailtextfiled: UITextField!
    
    @IBOutlet weak var verifiedmobilenumberone: UIButton!
    
    @IBOutlet weak var verifiedEmailnumberone: UIButton!
    
    @IBOutlet weak var dateofbirthbutton: UIButton!
    
    
    
    
    
    @IBOutlet weak var poupdatepikcerview: UIView!
    
    @IBOutlet weak var datepickerview: UIView!
    
    @IBOutlet weak var datepicker: UIDatePicker!
    
    @IBOutlet weak var donebutton: UIButton!
    
    
    @IBOutlet weak var btnDOB: UIButton!
    var formatter = DateFormatter()
    
    var Dateofbirthstring1 = String()
    
    
    @IBOutlet weak var cancelbutton: UIButton!
    
    var genderType = String()
    
    @IBOutlet weak var Malebutton: UIButton!
    
    @IBOutlet weak var Femalebutton: UIButton!

    
    @IBOutlet weak var pintetxfiled: UITextField!
    
    @IBOutlet weak var Businesstextfiled: UITextField!
    
    @IBOutlet weak var Businessnamebutton: UIButton!
    
    
    @IBOutlet weak var pannumbertextfiled: UITextField!
    
    @IBOutlet weak var Gstnumbertextfiled: UITextField!
    
    @IBOutlet weak var changepinview: UIView!
    
    @IBOutlet weak var changtopview: UIView!
    
    
    @IBOutlet weak var Middelview: UIView!
    
    @IBOutlet weak var bottomview: UIView!
    
    @IBOutlet weak var businessnamebuttontwo: UIButton!
    
    
    @IBOutlet weak var catageoryviewtwo: UIView!
    
    @IBOutlet weak var catageorytopview: UIView!
    
    @IBOutlet weak var closetop: UIButton!
    
    @IBOutlet weak var Editaccounttabelview: UITableView!
    
    @IBOutlet weak var okbutton: UIButton!
    
    
   var selectBusinesscategory = [String]()
    var profileselectedIndex :Int?

   var selectedcatageory = String()
    
    @IBOutlet weak var BusinessLincencebutton: UIButton!
    
    @IBOutlet weak var Businesslincencebuttontwo: UIButton!
    
    
    
    @IBOutlet weak var uploadauthorisationbuttonone: UIButton!
    
    @IBOutlet weak var uploadauthorisationtwo: UIButton!
    
    @IBOutlet weak var Uploadidprrofone: UIButton!
    
    @IBOutlet weak var UpLoadidprooftwo: UIButton!
    
    
    @IBOutlet weak var setbillingLocation: UIButton!
    
    
    @IBOutlet weak var Deliveryadressofthelabel: UILabel!
    
    @IBOutlet weak var addanotheRLocation: UIButton!
    
    var updatevalue = String()
    
    
    
    @IBOutlet weak var othersview: UIView!
    
    @IBOutlet weak var otherstabelview: UITableView!
    var others = [String]()
    
    @IBOutlet weak var namebutton: UIButton!
    
    @IBOutlet weak var veryalertview: UIView!
    var coverView = UIView()
    var imageView = UIImageView()
    var demostringvalue = String()
    var businessDict = NSDictionary()
    var businessDictsingel = NSDictionary()
    var businessDicttwo = NSDictionary()

    var businessname =  String()
    var businessemail_id = String()
    var businessnumber = String()
    var businessgender = String()
    var businessdate_of_birth = String()
    var businesspassword = String()
    var businesspan = String()
    var businessgst = String()
    var Editbusiness =  String()
   var dictfinalvalue = NSDictionary()
    var Editaccounttimer = Timer()
    var Busineesimagefinalvalue =  [String]()

 //   https://blog.kodius.io/upload-image-from-swift-3-ios-app-to-rails-5-server
    
    var Businesautharry =  [String]()
    
    var businessImageDictfinalvalue = NSDictionary()
    var Uploadauthorisiationdocueemnt = NSDictionary()
    var uploadidproof = NSDictionary()
    var businessDictarray = NSArray()
    var Uploadauthorisiationdocueemntarray = NSArray()
    var uploadidproofarray = NSArray()
   
    var uploadtextbusinessnamelvalue = String()
    var uploadtextauth_documentvalue = String()
    var uploadtextid_proofvalue = String()
    
    
    @IBOutlet weak var savechanges: UIButton!
    
    var editaccountagentid = String()
    var EditaccountMobilenumebrfinlvalue = String()
    
    

    @IBOutlet weak var cahngefinalvalue: UIView!
    
    
    @IBOutlet weak var TOPVIEW: UIView!
    
    @IBOutlet weak var TOPVIEWLABEL: UILabel!
    
    @IBOutlet weak var CROSS: UIButton!
    
    @IBOutlet weak var changemiddleview: UIView!
    
    @IBOutlet weak var cahngebottomview: UIView!
    
    
    @IBOutlet weak var pannumberviewfinal: UIView!
    
    @IBOutlet weak var pinnumberview: UIView!
    
    var othersstring = NSArray()
//    var othersstringhelp = NSDictionary()
    
var othersstringhelp = NSArray()

var othersdictfinal = NSDictionary()
    
//    var othersstringid = NSString()

 var othersstringid = NSArray()
    var othersstringhelpName = NSArray()
    
    var Recomendeddictvalue = NSDictionary()
    
    var Questionfinalvalue = [String]()
    var Answervalue = [String]()

    var catgeroryfinalvalue = [String]()
    
    var billingJSON = NSDictionary()
    var billingJSONadresslocation = String()
    var billingJSONasaveAsfinalvalue = String()

    @IBOutlet weak var billingaccountview: UIView!
    
    
    @IBOutlet weak var billingsaveaslabel: UILabel!
    
    
    @IBOutlet weak var billingadresslabel: UILabel!
    
    @IBOutlet weak var billingsavechangesbutton: UIButton!
    
    
    var EditMapdictone = NSDictionary()
    
    var EditMapdictTwo = NSDictionary()
    
    
    var EditaccountDictfinal  = NSMutableDictionary()

    var datafour = NSDictionary()
    
    @IBOutlet weak var scorllpagefourvaluefinal: ScrollPagerfour!
    
    @IBOutlet weak var scrollviewedit: UIScrollView!
    
    
    var Editcahtsviewone  = UIView()
    var EditComplaintsView1  = UIView()
    var EditMarketView1  = UIView()
    var othersviewone  = UIView()

    
    
    @IBOutlet weak var chatsviewone: UIView!
    
    @IBOutlet weak var cahtsbuttonone: UIButton!
    
    @IBOutlet weak var chatssingelview: UIView!
    
    
    @IBOutlet weak var compiantsview: UIView!
    
    @IBOutlet weak var Complaintsbuttonone: UIButton!
    
    @IBOutlet weak var compliantssingelview: UIView!
    
    @IBOutlet weak var AMrketingviewone: UIView!
    
    @IBOutlet weak var marketingbuttonone: UIButton!
    
    @IBOutlet weak var marketingsingellineview: UIView!
    

    @IBOutlet weak var Editothersviewsingel: UIView!
    @IBOutlet weak var editotherssmalllineview: UIView!
    
    @IBOutlet weak var editotherssinglbiutton: UIButton!
    
    @IBOutlet weak var gstnumberbutton: UIButton!
    
    @IBOutlet weak var pannumberbutton: UIButton!
    
    
    var NewEditagentid = String()
    var NewEditMobileNumber = String()
    
    
    @IBOutlet weak var savechangesfinalvalue: UIButton!
    
    var auhthDocuementcatageory  = String()
    
    var id_prooffilecatageory  = String()
    
    var Businesslicencecatageory  = String()

    var BusinesslicencecatageoryImage  = String()
    var BusinesslicencecatageoryimageName  = String()
    
    var authorisationcatageoryImage  = String()
    var authorisationcatageoryimageName  = String()
    var id_proofcatageoryImage  = String()
    var id_proofimageName  = String()

    var BillingDictone = NSDictionary()
    var BillingDicttwo = NSDictionary()

    
   var useridbiling  = String()

    @IBOutlet weak var deliveryfinalviewone: UIView!
    
    @IBOutlet weak var deliveryfinalviewtwo: UIView!
    
    @IBOutlet weak var storedeliverytwo: UILabel!
    
    @IBOutlet weak var storedeliverytexttwo: UILabel!
    
    
    @IBOutlet weak var deliveryfinalstoreone: UILabel!
    
    
    var DeliveryDictone = NSDictionary()
    var DeliveryDicttwo = NSDictionary()
    
    var DeliveryaccountDictfinal  = NSMutableDictionary()

    var Deliveryadressone = NSDictionary()
     var DeliveryadressTwofinalvalue = NSDictionary()
    
    var Deliveryadresslocation = String()
    var deliveryJSONasaveAsfinalvalue = String()

    
    var DeliveryDicthtree = NSDictionary()
    var DeliveryDictfour = NSDictionary()
    
    
    var Deliveryadresslocationtwo = String()
    var deliveryJSONasaveAsfinalvaluetwo = String()
    
    var Mobilevericationvalue = String()
    var Mobilevericationcolor = String()

    
    @IBOutlet weak var validEmailview: UIView!
    
    var uploadauthone  = String()
    var uploadauthonecolor  = String()

    
    var uploadauthtwo  = String()
    var uploadauthtwocolor  = String()
    
    var uploadauththree  = String()
    var uploadauththreecolor  = String()
    
    
    
    ///// Editaccount name
    
    var Editaccountname = String()
    
    var Editaccountmobilenumber = String()

    var Editmobilenumberverificationvalue = String()
    var EditemailidTotal = String()
/// verfy emailid avlue
    
    var verfyemailemailid = String()

    var defaults = UserDefaults.standard
    
    
    
    
    @IBOutlet weak var Locationviewtotal: UIView!
    
    @IBOutlet weak var Houseviewtotal: UIView!
    
    
    @IBOutlet weak var landmarkviewtotal: UIView!
    
    @IBOutlet weak var areaviewtotal: UIView!
    
    @IBOutlet weak var cityviewtotal: UIView!
    
    @IBOutlet weak var pincodeviewtotal: UIView!
    
    
    @IBOutlet weak var Locationlabel: UILabel!
    
    @IBOutlet weak var Locationtitle: UILabel!
    
    @IBOutlet weak var Houseno: UILabel!
    
    @IBOutlet weak var Housetitle: UILabel!
    
    @IBOutlet weak var landamrknumber: UILabel!
    
    @IBOutlet weak var landemarktitel: UILabel!
    
    @IBOutlet weak var arealabel: UILabel!
    
    @IBOutlet weak var areatitle: UILabel!
    
    @IBOutlet weak var citylabel: UILabel!
    
    @IBOutlet weak var citytitle: UILabel!
    
    @IBOutlet weak var pincodelabel: UILabel!
    
    @IBOutlet weak var pincodetitle: UILabel!
    
    
    @IBOutlet weak var billtotalview: UIView!
    
    var billingJSONTotal = NSArray()
    
//    var bILLINGVALUE = [String]()
//    var bILLINGKeytotal = [String]()
    
    var bILLINGVALUE = NSArray()
    var bILLINGKeytotal = NSArray()

    var auth_documentDownLoadtotalvalue  = String()
    var  businessImagepdfstring = String()
    var  id_proofdownloadpathImage = String()
    
    var AcessTokenfinalstring = String()
    
    var myagentTotalvalue  = String()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        if let EditaccountnameFinalvalue = self.defaults.value(forKey:"Mybusinessname") as? String
        {
            self.Editaccountname = EditaccountnameFinalvalue
            self.namebutton.setTitle(self.Editaccountname, for:.normal)
        }
        
        if let EditaccountmobilenumberFinalvalue = self.defaults.value(forKey:"Mybusinessnumber") as? String
        {
            self.Editaccountmobilenumber = EditaccountmobilenumberFinalvalue
            self.Mobilenumber.text = self.Editaccountmobilenumber
        }
        
        if let EditmobilenumberverificationvalueFinalvalue = self.defaults.value(forKey:"MyMobilevericationvalue") as? String
        {
            self.Editmobilenumberverificationvalue = EditmobilenumberverificationvalueFinalvalue
            self.verifiedmobilenumberone.setTitle(self.Editmobilenumberverificationvalue, for:.normal)
        }
        if let EditemailidTotalFinalvalue = self.defaults.value(forKey:"Myemail_id") as? String
        {
            self.EditemailidTotal = EditemailidTotalFinalvalue
            self.Emailtextfiled.text = self.EditemailidTotal
        }
        if let verfyemailemailidTotalFinalvalue = self.defaults.value(forKey:"Myemail_id") as? String
        {
            self.verfyemailemailid = verfyemailemailidTotalFinalvalue
            self.verifiedmobilenumberone.setTitle("Verified", for:.normal)
        }
        
        
        
        Editviewfinal.layer.shadowOffset = CGSize(width: 0, height: 2)
        Editviewfinal.layer.shadowOpacity = 0.4
        Editviewfinal.layer.shadowRadius = 1.0
        Editviewfinal.layer.shadowColor = UIColor.color3().cgColor
        
//        let segmented = YSSegmentedControl(frame: CGRect(x: 0,y: 70,width: self.view.frame.size.width,height: 40),
//           titles: [
//                "Business",
//                "Billing","Delivery","Others"
//            ],
//            action: {
//                control, index in
//
//        })
//        segmented.delegate = self
//        self.view.addSubview(segmented)
 //       roundcircleview.layer.cornerRadius = roundcircleview.frame.size.width/2
 //       roundcircleview.layer.masksToBounds  = true
//        Nametextfield.delegate = self
//        Nametextfield.text = "Kiran kumar reddy"
//        Nametextfield.addTarget(self, action: #selector(EditAccountViewController.textFieldDidChange(_:)), for: .editingChanged)
        Mobilenumber.delegate = self
//        Mobilenumber.text = "+91 99494 04972"
        Mobilenumber.addTarget(self, action: #selector(EditAccountViewController.textFieldDidChange(_:)), for: .editingChanged)
        Emailtextfiled.delegate = self
//        Emailtextfiled.text = "kirankumarreddy@gmail.com"
        Emailtextfiled.addTarget(self, action: #selector(EditAccountViewController.textFieldDidChange(_:)), for: .editingChanged)
        
        let iconWidthlogin = 20;
        let iconHeightLogin = 20;
        let imageViewlogin = UIImageView()
        let imageEmailLogin = UIImage(named:"india")
        imageViewlogin.image = imageEmailLogin
        imageViewlogin.frame = CGRect(x:0, y:7, width: iconWidthlogin, height: iconHeightLogin)
        let paddingViewEmailtextfiled = UIView(frame: CGRect(x: 0, y: 3, width:25, height: self.Mobilenumber.frame.size.height))
        Mobilenumber.leftViewMode = UITextFieldViewMode.always
        Mobilenumber.addSubview(imageViewlogin)
        Mobilenumber.leftView = paddingViewEmailtextfiled
        Mobilenumber.isUserInteractionEnabled = false
        Emailtextfiled.isUserInteractionEnabled = false
        if self.view.frame.size.height < 800 {
            Agentfavouritescrollview.contentInset = UIEdgeInsetsMake(0, 0,self.Agentfavouritescrollview.frame.size.height-750, 0)
            Agentfavouritescrollview.isScrollEnabled = true
            Agentfavouritescrollview.showsVerticalScrollIndicator = true
        }
//        Nametextfield.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClicked))
        Emailtextfiled.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClicked))
        Mobilenumber.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClicked))
        IQKeyboardManager.sharedManager().enable = true
        IQKeyboardManager.sharedManager().enableAutoToolbar = true
        IQKeyboardManager.sharedManager().shouldShowToolbarPlaceholder = false
//     dateofbirthbutton.setTitle("12/07/2018", for:.normal)
//        pintetxfiled.text = "123456"
        pintetxfiled.addTarget(self, action: #selector(EditAccountViewController.textFieldDidChange(_:)), for: .editingChanged)
        
//       pannumbertextfiled.text = "A124123SDE213345d"
        
     pannumbertextfiled.addTarget(self, action: #selector(EditAccountViewController.textFieldDidChange(_:)), for: .editingChanged)
//        Businessnamebutton.setTitle("Ramakrishna kirana & general store", for:.normal)
//        Gstnumbertextfiled.text = "Abcdefgh123493252309523"
        
        Gstnumbertextfiled.addTarget(self, action: #selector(EditAccountViewController.textFieldDidChange(_:)), for: .editingChanged)
        
        Middelview.layer.addBorder(edge:.top, color: UIColor.textfiledbottomcolorside(), thickness:0.6)
        Middelview.layer.addBorder(edge:.bottom, color: UIColor.textfiledbottomcolorside(), thickness:0.6)
  
        
        
//        selectBusinesscategory = ["Fancy Store","Kirana Store","Medical Shop","Stationery Shop","Pan Shop","Saloon Shop","Photo Studio","Xerox Center","Bakery","Restaurant","Hotel"]
//        setbillingLocation.layer.cornerRadius = 5.0
//        addanotheRLocation.layer.cornerRadius = 5.0
//        
//        if updatevalue .isEmpty
//         {
//            segmented.index(ofAccessibilityElement:0)
//            
//        }
//        else
//        {
//            segmented.index(ofAccessibilityElement:2)
//            self.deliveryview.isHidden = false
//        }
        
        others = ["No. of Employees","Approach road type (width in Feet)","Distributor supply available brands","Retail Shopping Experience (if applicable)","Daily Counter Sales","Payment acceptance types","Billing system","Assortment Category","Assortment Price Points"]
     
        TOPVIEW.layer.addBorder(edge:.bottom, color: UIColor.textfiledbottomcolorside(), thickness:0.6)
        cahngebottomview.layer.addBorder(edge:.top, color: UIColor.textfiledbottomcolorside(), thickness:0.6)

        
        let tappin = UITapGestureRecognizer(target: self, action: #selector(self.handleNumberpinfinalvalue(_:)))
        
        pinnumberview.addGestureRecognizer(tappin)
        
        pinnumberview.isUserInteractionEnabled = true
        
        
        let tapgesturebillingaccountview = UITapGestureRecognizer(target: self, action: #selector(self.handelbillingadressvalue(_:)))
        
        billingaccountview.addGestureRecognizer(tapgesturebillingaccountview)
        
        billingaccountview.isUserInteractionEnabled = true
        
        
        let tapgesturebillingdeliveryfinalviewone = UITapGestureRecognizer(target: self, action: #selector(self.handelDeliveryadressvalueone(_:)))
        
        deliveryfinalviewone.addGestureRecognizer(tapgesturebillingdeliveryfinalviewone)
        
        deliveryfinalviewone.isUserInteractionEnabled = true
   
        let tapgesturebillingdeliveryfinalTwo = UITapGestureRecognizer(target: self, action: #selector(self.handelDeliveryadressvalueTwo(_:)))
        
        deliveryfinalviewtwo.addGestureRecognizer(tapgesturebillingdeliveryfinalTwo)
        
        deliveryfinalviewtwo.isUserInteractionEnabled = true
    
        let eamiltapgesture = UITapGestureRecognizer(target: self, action: #selector(self.Emailtapfinalvalue(_:)))
        validEmailview.addGestureRecognizer(eamiltapgesture)
        validEmailview.isUserInteractionEnabled = true
    
         let defaults = UserDefaults.standard
        if let Reviewfinal:[String] = defaults.value(forKey: "arryone")as?[String]
        {
            print(Reviewfinal)
        }
        
        if let Editstr_array:NSDictionary  = defaults.value(forKey:"finaldictvalue")as? NSDictionary
        {
            self.EditMapdictone = Editstr_array
        }
        

        Editcahtsviewone = Businessview
        EditComplaintsView1 = bilingview
        EditMarketView1 = deliveryview
        othersviewone = othersview
        
//        self.othersview.isHidden = true

        Editcahtsviewone.frame = CGRect(x:self.Businessview.frame.origin.x, y:self.Businessview.frame.origin.y, width:self.Businessview.frame.size.width, height:self.Businessview.frame.size.height)
        EditComplaintsView1.frame = CGRect(x:self.bilingview.frame.origin.x, y:self.bilingview.frame.origin.y, width:self.bilingview.frame.size.width, height:self.bilingview.frame.size.height)
        EditMarketView1.frame = CGRect(x:self.deliveryview.frame.origin.x, y:self.deliveryview.frame.origin.y, width:self.deliveryview.frame.size.width, height:self.deliveryview.frame.size.height)
        
         othersviewone.frame = CGRect(x:self.othersview.frame.origin.x, y:self.othersview.frame.origin.y, width:self.othersview.frame.size.width, height:self.othersview.frame.size.height)
        
        
        scorllpagefourvaluefinal.delegate = self
        scorllpagefourvaluefinal.addSegmentsWithTitlesAndViews(segments: [
            ("Home",Editcahtsviewone),
            ("Public Feed",EditComplaintsView1),
            ("Profile", EditMarketView1),("others", othersviewone)])
        
        self.setbillingLocation.layer.cornerRadius = 5.0
        self.addanotheRLocation.layer.cornerRadius = 5.0
        uploadauthorisationbuttonone.layer.cornerRadius = 5
        uploadauthorisationbuttonone.clipsToBounds = true
        Uploadidprrofone.layer.cornerRadius = 5
        Uploadidprrofone.clipsToBounds = true
        BusinessLincencebutton.layer.cornerRadius = 5
        BusinessLincencebutton.clipsToBounds = true
        
        
        DispatchQueue.main.async {
            self.EditProfileview()
        }
        
        if UIScreen.main.bounds.size.height == 480
        {
            
        }
        if UIScreen.main.bounds.size.height == 568
        {
            
        }
        
        if  UIScreen.main.bounds.size.height == 736
        {
            
        }
        if UIScreen.main.bounds.size.height == 667
        {
            self.savechangesfinalvalue.frame = CGRect(x: self.savechangesfinalvalue.frame.origin.x, y: self.savechangesfinalvalue.frame.origin.y+290, width: self.savechangesfinalvalue.frame.size.width, height: self.savechangesfinalvalue.frame.size.height)
//             self.cahngefinalvalue.isHidden = false
//              self.cahngefinalvalue.frame = CGRect(x: self.cahngefinalvalue.frame.origin.x, y:0, width: self.cahngefinalvalue.frame.size.width, height: 650)
        }
        
        
        //scrollPager.setSelectedIndex(index:4, animated: true)

        
       
        
        DispatchQueue.main.async {
            self.EditProfileview()
        }
   
        let Locationviewtotalccountview = UITapGestureRecognizer(target: self, action: #selector(self.Locationhandelbillingadressvalue(_:)))
        
        Locationviewtotal.addGestureRecognizer(Locationviewtotalccountview)
        
        Locationviewtotal.isUserInteractionEnabled = true
        
        
        let Houseviewtotalfinal = UITapGestureRecognizer(target: self, action: #selector(self.Houseviewtotalbillingadressvalue(_:)))
        
        Houseviewtotal.addGestureRecognizer(Houseviewtotalfinal)
        
        Houseviewtotal.isUserInteractionEnabled = true
        
        
        let landmarkviewtotalfinal = UITapGestureRecognizer(target: self, action: #selector(self.landmarkviewtotalbillingadressvalue(_:)))
        
        landmarkviewtotal.addGestureRecognizer(landmarkviewtotalfinal)
        
        landmarkviewtotal.isUserInteractionEnabled = true
        
        let areaviewtotalfinal = UITapGestureRecognizer(target: self, action: #selector(self.areaviewtotalbillingadressvalue(_:)))
        
        areaviewtotal.addGestureRecognizer(areaviewtotalfinal)
        
        areaviewtotal.isUserInteractionEnabled = true
        
        
        
        let Cityviewtotalfinal = UITapGestureRecognizer(target: self, action: #selector(self.cityviewtotalbillingadressvalue(_:)))
        
        cityviewtotal.addGestureRecognizer(Cityviewtotalfinal)
        
        cityviewtotal.isUserInteractionEnabled = true
        
        
        
        let pincodeviewtotalfinal = UITapGestureRecognizer(target: self, action: #selector(self.pincodeviewtotalbillingadressvalue(_:)))
        
        pincodeviewtotal.addGestureRecognizer(pincodeviewtotalfinal)
        
        pincodeviewtotal.isUserInteractionEnabled = true
        
    }
    
    
    @objc func Emailtapfinalvalue(_ sender: UITapGestureRecognizer)
    {
        
        DispatchQueue.main.async {
            let NamebuttonView = self.storyboard?.instantiateViewController(withIdentifier:"NamebuttonViewController")as!NamebuttonViewController
            NamebuttonView.Namelabelstring = "GST Number"
            NamebuttonView.NameTextfiledstring = self.businessemail_id
            NamebuttonView.Mobilenumebrfinlvalue = self.businessnumber
            NamebuttonView.finalbusinesstypevaluefinal = self.Editbusiness
            
            self.present(NamebuttonView, animated: true, completion:nil)
        }
    }
    @objc func Locationhandelbillingadressvalue(_ sender: UITapGestureRecognizer)
    {
        
                DispatchQueue.main.async {
                    let NamebuttonView = self.storyboard?.instantiateViewController(withIdentifier:"NamebuttonViewController")as!NamebuttonViewController
                    NamebuttonView.Namelabelstring = "Location"
                    NamebuttonView.NameTextfiledstring = self.Locationtitle.text!
                    NamebuttonView.Mobilenumebrfinlvalue = self.businessnumber
                    self.present(NamebuttonView, animated: true, completion:nil)
                }
        
    }
    
    @objc func Houseviewtotalbillingadressvalue(_ sender: UITapGestureRecognizer)
    {
        
        DispatchQueue.main.async {
            let NamebuttonView = self.storyboard?.instantiateViewController(withIdentifier:"NamebuttonViewController")as!NamebuttonViewController
            NamebuttonView.Namelabelstring = "House / Plot / Shop no."
            NamebuttonView.NameTextfiledstring = self.Housetitle.text!
            NamebuttonView.Mobilenumebrfinlvalue = self.businessnumber
            self.present(NamebuttonView, animated: true, completion:nil)
        }
        
    }
    
    @objc func landmarkviewtotalbillingadressvalue(_ sender: UITapGestureRecognizer)
    {
        
        DispatchQueue.main.async {
            let NamebuttonView = self.storyboard?.instantiateViewController(withIdentifier:"NamebuttonViewController")as!NamebuttonViewController
            NamebuttonView.Namelabelstring = "Landmark"
            NamebuttonView.NameTextfiledstring = self.landemarktitel.text!
            NamebuttonView.Mobilenumebrfinlvalue = self.businessnumber
            self.present(NamebuttonView, animated: true, completion:nil)
        }
        
    }
    @objc func areaviewtotalbillingadressvalue(_ sender: UITapGestureRecognizer)
    {
        
        DispatchQueue.main.async {
            let NamebuttonView = self.storyboard?.instantiateViewController(withIdentifier:"NamebuttonViewController")as!NamebuttonViewController
            NamebuttonView.Namelabelstring = "Area"
            NamebuttonView.NameTextfiledstring = self.areatitle.text!
            NamebuttonView.Mobilenumebrfinlvalue = self.businessnumber
            self.present(NamebuttonView, animated: true, completion:nil)
        }
        
    }
    @objc func cityviewtotalbillingadressvalue(_ sender: UITapGestureRecognizer)
    {
        
        DispatchQueue.main.async {
            let NamebuttonView = self.storyboard?.instantiateViewController(withIdentifier:"NamebuttonViewController")as!NamebuttonViewController
            NamebuttonView.Namelabelstring = "City"
            NamebuttonView.NameTextfiledstring = self.citytitle.text!
            NamebuttonView.Mobilenumebrfinlvalue = self.businessnumber
            self.present(NamebuttonView, animated: true, completion:nil)
        }
        
    }
    @objc func pincodeviewtotalbillingadressvalue(_ sender: UITapGestureRecognizer)
    {
        
        DispatchQueue.main.async {
            let NamebuttonView = self.storyboard?.instantiateViewController(withIdentifier:"NamebuttonViewController")as!NamebuttonViewController
            NamebuttonView.Namelabelstring = "Pincode"
            NamebuttonView.NameTextfiledstring = self.pincodetitle.text!
            NamebuttonView.Mobilenumebrfinlvalue = self.businessnumber
            self.present(NamebuttonView, animated: true, completion:nil)
        }
        
    }
  
    
    

    
    @objc func handleNumberpinfinalvalue(_ sender: UITapGestureRecognizer)
    {
        self.cahngefinalvalue.isHidden = false
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EditPinViewController") as!
        EditPinViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    @objc func handelbillingadressvalue(_ sender: UITapGestureRecognizer)
    {
        DispatchQueue.main.async {
            let viewsingel = self.storyboard?.instantiateViewController(withIdentifier:"SetLocationViewController")as!SetLocationViewController
        //    viewsingel.editbillinglocation = "editbillinglocationfinalvalue"
            viewsingel.billingstringfinalvalue = "Billingstringfinalvalue"

            self.present(viewsingel, animated:true, completion:nil)
            
        }
    }
    
    @objc func handelDeliveryadressvalueone(_ sender: UITapGestureRecognizer)
    {
        DispatchQueue.main.async {
            let viewsingel = self.storyboard?.instantiateViewController(withIdentifier:"SetLocationViewController")as!SetLocationViewController
            //    viewsingel.editbillinglocation = "editbillinglocationfinalvalue"
            viewsingel.devlievrystringsingel = "deliverystringfinalvalue"
            self.present(viewsingel, animated:true, completion:nil)
        }
    }
    
    @objc func handelDeliveryadressvalueTwo(_ sender: UITapGestureRecognizer)
    {
        DispatchQueue.main.async {
            let viewsingel = self.storyboard?.instantiateViewController(withIdentifier:"SetLocationViewController")as!SetLocationViewController
            //    viewsingel.editbillinglocation = "editbillinglocationfinalvalue"
            viewsingel.deliverytwovalue = "Deliveryfinalvalue"
            self.present(viewsingel, animated:true, completion:nil)
        }
    }
    
    
    
    
    @IBAction func Businessbutton(_ sender: UIButton)
    {
        
        DispatchQueue.main.async {
            let viewsingel = self.storyboard?.instantiateViewController(withIdentifier:"EditaccountNameViewController")as!EditaccountNameViewController
            self.present(viewsingel, animated:true, completion:nil)
            
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let result = true
        
        if textField == pintetxfiled {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")
            let characterSet = CharacterSet(charactersIn: string)
            //            return allowedCharacters.isSuperset(of: characterSet)
            
            let maxLength = 6
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
          
            return allowedCharacters.isSuperset(of: characterSet) && newString.length <= maxLength
            
            
            
        }
        if textField == Mobilenumber {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")
            let characterSet = CharacterSet(charactersIn: string)
            //            return allowedCharacters.isSuperset(of: characterSet)
            
            let maxLength = 10
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            //            return newString.length <= maxLength
            
            return allowedCharacters.isSuperset(of: characterSet) && newString.length <= maxLength
            
            
            
        }
        return result
    }
    
    @IBAction func Close(_ sender: UIButton)
    {
        self.changepinview.isHidden = true

    }
    
    @IBAction func Nobutton(_ sender: UIButton)
    {
        self.changepinview.isHidden = true
    }
    
    @objc func doneButtonClicked(_ sender: Any) {
        Nametextfield.resignFirstResponder()
        Emailtextfiled.resignFirstResponder
        Mobilenumber.resignFirstResponder

    }
    @objc func textFieldDidChange(_ textField: UITextField?) {
        
        if textField == Nametextfield
        {
            if textField?.text?.count == 0
            {
                Nametextfield.useUnderline()
            }
        }
        if textField == Mobilenumber
        {
        Mobilenumber.useUnderline()
        }
        if textField == Emailtextfiled
        {
                Emailtextfiled.useUnderline()
        }
        if textField == pintetxfiled
        {
                Nametextfield.useUnderline()
            self.changepinview.isHidden = false
            self.cahngefinalvalue.isHidden = false
            let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EditPinViewController") as!
            EditPinViewController
            self.addChildViewController(popOverVC)
            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParentViewController: self)

        }
        if textField == pannumbertextfiled
        {
            pannumbertextfiled.useUnderline()
        }
        if textField == Gstnumbertextfiled
        {
            Gstnumbertextfiled.useUnderline()
        }
        }
   
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == Nametextfield
        {
            if (textField.text?.count)! > 0
            {
                Nametextfield.RemoveUnderline()
            }
        }
        if textField == Mobilenumber
        {
            if (textField.text?.count)! > 0
            {
                Mobilenumber.RemoveUnderline()
                
            }
        }
        if textField == Emailtextfiled
        {
            if (textField.text?.count)! > 0
            {
                Emailtextfiled.RemoveUnderline()
            }
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == Nametextfield
        {
            textField.resignFirstResponder()
        }
        if textField == Mobilenumber
        {
            textField.resignFirstResponder()
        }
        if textField == Emailtextfiled
        {
            textField.resignFirstResponder()
        }
        return true
    }
    
   
    @IBAction func VerifyMobilleNumber(_ sender: UIButton)
    {
        
    }
    
    
    @IBAction func VerifyEmailNumber(_ sender: UIButton)
    {

    }
    @IBAction func Dateofbirthbutton(_ sender: UIButton)
    {
        DispatchQueue.main.async {
            let NamebuttonView = self.storyboard?.instantiateViewController(withIdentifier:"NamebuttonViewController")as!NamebuttonViewController
            NamebuttonView.Namelabelstring = "Date of birth"
            print(self.Dateofbirthstring1)
            NamebuttonView.NameTextfiledstring = self.businessdate_of_birth
            NamebuttonView.Mobilenumebrfinlvalue = self.businessnumber
            NamebuttonView.finalbusinesstypevaluefinal = self.Editbusiness
            self.present(NamebuttonView, animated: true, completion:nil)
        }
    }
    
    @IBAction func Donebutton(_ sender: UIButton)
    {
        self.poupdatepikcerview.isHidden = true
    }
   
    @IBAction func dtaepickerEditaccount(_ sender: UIDatePicker)
    {
        datepicker.maximumDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY"
        Dateofbirthstring1 = dateFormatter.string(from:sender.date)
        dateofbirthbutton.setTitle(Dateofbirthstring1, for: .normal)
        dateofbirthbutton.setTitleColor(UIColor.black, for:.normal)
        dateofbirthbutton.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
    }
    @IBAction func Cancel(_ sender: UIButton)
    {
        self.poupdatepikcerview.isHidden = true
    }
  
    @IBAction func MAlebutton(_ sender: UIButton)
    {
        self.genderType = "Male"
        Femalebutton.setBackgroundImage(#imageLiteral(resourceName: "female_grey"), for:.normal)
        Malebutton.setBackgroundImage(#imageLiteral(resourceName: "male_red"), for:.normal)
        savechangesfinalvalue.isHidden = false
    }
    
    @IBAction func Femalebutton(_ sender: UIButton)
    {
        self.genderType = "Female"
        Femalebutton.setBackgroundImage(#imageLiteral(resourceName: "female_red"), for:.normal)
        Malebutton.setBackgroundImage(#imageLiteral(resourceName: "male_grey"), for:.normal)
        savechangesfinalvalue.isHidden = false
        
    }
    @IBAction func Cloasetop(_ sender: UIButton)
    {
        self.catageoryviewtwo.isHidden = true
    }
    func segmentedControlWillPressItemAtIndex(_ segmentedControl: YSSegmentedControl, index: Int)
    {
        if index == 0
        {
            self.bilingview.isHidden = true
            self.deliveryview.isHidden = true
            self.Businessview.isHidden = false
            self.othersview.isHidden = true

        }
        else if index == 1
        {
            self.bilingview.isHidden = false
            self.deliveryview.isHidden = true
            self.Businessview.isHidden = true
            self.othersview.isHidden = true

        }
        
        else if index == 2
        {
            self.bilingview.isHidden = true
            self.deliveryview.isHidden = false
            self.Businessview.isHidden = true
            self.othersview.isHidden = true

        }
        
        else if index == 3
        {
            self.bilingview.isHidden = true
            self.deliveryview.isHidden = true
            self.Businessview.isHidden = true
            self.othersview.isHidden = false
     
            
//            self.othersstring = self.businessDict.value(forKey:"others")as!NSArray
//            print(self.othersstring)
//
////            for  i in 0..<othersstring.count {
////                Recomendeddictvalue = self.othersstring[i]as!NSDictionary
////                self.othersstringhelp = Recomendeddictvalue.value(forKey:"options")as!NSArray
////            }
////
////            for  i in 0..<othersstring.count {
//                Recomendeddictvalue = self.othersstring[0]as!NSDictionary
//                self.othersstringhelp = Recomendeddictvalue.value(forKey:"options")as!NSArray
//        //    }
//
//            Recomendeddictvalue = self.othersstring[0]as!NSDictionary
//
//            self.othersstringid = self.othersstringhelp.value(forKey:"id")as!NSArray
//            self.othersstringhelpName = self.othersstringhelp.value(forKey:"value")as!NSArray
//
//            print(othersstringhelp.count)
//
//            print(Recomendeddictvalue.count)
//
//            DispatchQueue.main.async {
//                self.otherstabelview.reloadData()
//            }
//            print(self.othersstringhelpName.count)

        }
        
        
        
        
    }
    @IBAction func Ok(_ sender: UIButton)
    {
        Businessnamebutton.setTitle(selectedcatageory, for:.normal)
        self.catageoryviewtwo.isHidden = true
        self.Businessnamebutton.tag = 0
        self.businessnamebuttontwo.tag = 0
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
      return self.catgeroryfinalvalue.count
        print(self.catgeroryfinalvalue.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell  = otherstabelview.dequeueReusableCell(withIdentifier: "OthersTableViewCell", for: indexPath) as! OthersTableViewCell
            cell.otherslabel.text  = self.Questionfinalvalue[indexPath.row]
        
//        Answervalue
       let singelvalueis =  self.Answervalue[indexPath.row]
        if singelvalueis == ""
        {
            cell.otherslabeltwo.isHidden = true
             cell.otherslabeltwo.text  = singelvalueis
        }
        else{
            cell.otherslabeltwo.isHidden = false
            cell.otherslabeltwo.text  = singelvalueis
        }
          //  cell.otherslabeltwo.text  = self.Answervalue[indexPath.row]
            return cell

    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
            let Editotherstype = self.storyboard?.instantiateViewController(withIdentifier:"EditaccountNameViewController")as!EditaccountNameViewController
       let  catgerorysingelvalueis = self.catgeroryfinalvalue[indexPath.row]
            Editotherstype.int_count = indexPath.row
        Editotherstype.othersstring1 = self.othersstring
        Editotherstype.catgeroryfinalvalueoneis = catgerorysingelvalueis
        Editotherstype.MobilenumeberEditaccountName = self.businessnumber
            self.present(Editotherstype, animated: true, completion:nil)
    }

    
    
    
    @IBAction func BusinessLicence(_ sender: UIButton)
    {
        DispatchQueue.main.async {
    let viewsingel = self.storyboard?.instantiateViewController(withIdentifier:"proofsViewController")as!proofsViewController
            viewsingel.uploadstring = self.Busineesimagefinalvalue
            viewsingel.businessDictarrayfinalvalue = self.businessDictarray
            viewsingel.uploadnameproofs = self.uploadtextbusinessnamelvalue
            viewsingel.filecatgeorysingeledit = self.Businesslicencecatageory
            
            viewsingel.FinaluploadcatageoryImage = self.BusinesslicencecatageoryImage
            viewsingel.finaluploadcatageoryName = self.BusinesslicencecatageoryimageName
            viewsingel.Toatlvalue = "1"

            viewsingel.upLoadauthorisationstring = self.businessImagepdfstring
            viewsingel.upLoadauthorisationEmail = self.businessemail_id
       
            self.present(viewsingel, animated: true, completion:nil)
   
        }
    }
    
    @IBAction func BusinessLicenceTwo(_ sender: UIButton)
    {
        DispatchQueue.main.async {
    
          let viewsingel = self.storyboard?.instantiateViewController(withIdentifier:"proofsViewController")as!proofsViewController
            viewsingel.uploadstring = self.Busineesimagefinalvalue
            viewsingel.businessDictarrayfinalvalue = self.businessDictarray
            viewsingel.uploadnameproofs = self.uploadtextbusinessnamelvalue
            viewsingel.filecatgeorysingeledit = self.Businesslicencecatageory
            viewsingel.FinaluploadcatageoryImage = self.BusinesslicencecatageoryImage
            viewsingel.finaluploadcatageoryName = self.BusinesslicencecatageoryimageName
            viewsingel.Toatlvalue = "1"
            viewsingel.upLoadauthorisationstring = self.businessImagepdfstring
            viewsingel.upLoadauthorisationEmail = self.businessemail_id
            
            print(viewsingel.filecatgeorysingeledit)
            self.present(viewsingel, animated: true, completion:nil)
        }
    }
    
    @IBAction func Uploadauthorisation(_ sender: UIButton)
    {
        DispatchQueue.main.async {
        let viewsingel = self.storyboard?.instantiateViewController(withIdentifier:"proofsViewController")as!proofsViewController
            viewsingel.uploadstring = self.Busineesimagefinalvalue
            viewsingel.businessDictarrayfinalvalue = self.Uploadauthorisiationdocueemntarray
            viewsingel.uploadnameproofs = self.uploadtextauth_documentvalue
            viewsingel.filecatgeorysingeledit = self.auhthDocuementcatageory
            viewsingel.Toatlvalue = "2"
            viewsingel.FinaluploadcatageoryImage = self.authorisationcatageoryImage
            viewsingel.finaluploadcatageoryName = self.authorisationcatageoryimageName
            viewsingel.savefinalvalues.isHidden = false
            viewsingel.upLoadauthorisationstring = self.auth_documentDownLoadtotalvalue
            viewsingel.upLoadauthorisationEmail = self.businessemail_id
            self.present(viewsingel, animated: true, completion:nil)
        }
    }
    @IBAction func Uploadauthorisationtwo(_ sender: UIButton)
    {
        DispatchQueue.main.async {
        let viewsingel = self.storyboard?.instantiateViewController(withIdentifier:"proofsViewController")as!proofsViewController
            viewsingel.uploadstring = self.Busineesimagefinalvalue
            viewsingel.businessDictarrayfinalvalue = self.Uploadauthorisiationdocueemntarray
            viewsingel.uploadnameproofs = self.uploadtextauth_documentvalue
            viewsingel.filecatgeorysingeledit = self.auhthDocuementcatageory
            viewsingel.FinaluploadcatageoryImage = self.authorisationcatageoryImage
            viewsingel.finaluploadcatageoryName = self.authorisationcatageoryimageName
            viewsingel.Toatlvalue = "2"
            viewsingel.savefinalvalues.isHidden = false
            viewsingel.upLoadauthorisationstring = self.auth_documentDownLoadtotalvalue
            viewsingel.upLoadauthorisationEmail = self.businessemail_id
            self.present(viewsingel, animated: true, completion:nil)
            
          
        }
        
    }
    @IBAction func UploadIDproo(_ sender: UIButton)
    {
        DispatchQueue.main.async
            {
        let viewsingel = self.storyboard?.instantiateViewController(withIdentifier:"proofsViewController")as!proofsViewController
            viewsingel.uploadstring = self.Busineesimagefinalvalue
            viewsingel.businessDictarrayfinalvalue = self.uploadidproofarray
            viewsingel.uploadnameproofs = self.uploadtextid_proofvalue
            viewsingel.filecatgeorysingeledit = self.id_prooffilecatageory
            viewsingel.FinaluploadcatageoryImage = self.id_proofcatageoryImage
            viewsingel.finaluploadcatageoryName = self.id_proofimageName
            viewsingel.Toatlvalue = "3"
            viewsingel.upLoadauthorisationstring = self.id_proofdownloadpathImage
            viewsingel.upLoadauthorisationEmail = self.businessemail_id
            self.present(viewsingel, animated: true, completion:nil)
        }
    }
    @IBAction func UploadIDproofTwo(_ sender: UIButton)
    {
        DispatchQueue.main.async
            {
        let viewsingel = self.storyboard?.instantiateViewController(withIdentifier:"proofsViewController")as!proofsViewController
            viewsingel.uploadstring = self.Busineesimagefinalvalue
            viewsingel.businessDictarrayfinalvalue = self.uploadidproofarray
            viewsingel.uploadnameproofs = self.uploadtextid_proofvalue
            viewsingel.filecatgeorysingeledit = self.id_prooffilecatageory
            viewsingel.FinaluploadcatageoryImage = self.id_proofcatageoryImage
            viewsingel.finaluploadcatageoryName = self.id_proofimageName
            viewsingel.Toatlvalue = "3"
            viewsingel.upLoadauthorisationstring = self.id_proofdownloadpathImage
            viewsingel.savefinalvalues.isHidden = false
            viewsingel.upLoadauthorisationEmail = self.businessemail_id
            self.present(viewsingel, animated: true, completion:nil)
        }
    }
    @IBAction func setbillingLocation(_ sender: UIButton)
    {
        DispatchQueue.main.async
        {
        let viewsingel = self.storyboard?.instantiateViewController(withIdentifier:"SetLocationViewController")as!SetLocationViewController
            viewsingel.billingstringfinalvalue = "Billingstringfinalvalue"
            self.present(viewsingel, animated: true, completion:nil)
        }
    }
    
    
    @IBAction func Yesbutton(_ sender: UIButton)
    {
        DispatchQueue.main.async
            {
            let yesbutonview = self.storyboard?.instantiateViewController(withIdentifier:"ChangePinViewController")as!ChangePinViewController
            self.present(yesbutonview, animated:true, completion:nil)
        }
    }

    @IBAction func addanotherLocation(_ sender: UIButton)
    {
        DispatchQueue.main.async
            {
        let viewtwo = self.storyboard?.instantiateViewController(withIdentifier:"SetLocationViewController")as!SetLocationViewController
        viewtwo.deliverytwovalue = "Deliveryfinalvalue"
            self.present(viewtwo, animated: true, completion:nil)
        }
    }
    
    @IBAction func MyBackbutton(_ sender: UIButton)
    {
        self.dismiss(animated:true, completion:nil)
    }
    @IBAction func NAmebutton(_ sender: UIButton)
    {
        DispatchQueue.main.async
        {
            let NamebuttonView = self.storyboard?.instantiateViewController(withIdentifier:"NamebuttonViewController")as!NamebuttonViewController
            NamebuttonView.Namelabelstring = "Name"
            NamebuttonView.NameTextfiledstring = self.businessname
            NamebuttonView.Mobilenumebrfinlvalue = self.businessnumber
            NamebuttonView.finalbusinesstypevaluefinal = self.Editbusiness
        
            self.present(NamebuttonView, animated: true, completion:nil)
        }
    }
    func EditProfileview()
    {
        let defaultsingelvalue = UserDefaults.standard
        let Myagentidvalueis = defaultsingelvalue.value(forKey:"myuseridvaluefinal")as!String
   var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let postString =  String(format: "method=%@&agentid=%@","profileinformation",Myagentidvalueis)
        print(postString)
        
        if let Reviewfinaluseroid:String = defaultsingelvalue.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaultsingelvalue.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }

        request.httpBody = postString.data(using: .utf8)
        request.addValue(AcessTokenfinalstring, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                print(response.result)
                if let dictsingelvalue:NSDictionary = response.result.value as? NSDictionary
                {
                    DispatchQueue.main.async
                        {
                        self.removeSpinner()
                    }
                    self.businessDict = dictsingelvalue
                    self.dictfinalvalue = self.businessDict.value(forKey:"business")as!NSDictionary
                    self.businessname = self.dictfinalvalue.value(forKey:"name")as!String
                    self.businessemail_id = self.dictfinalvalue.value(forKey:"email_id")as!String
                    
                    let defaultstotalvalue = UserDefaults.standard
                    defaultstotalvalue.set(self.businessemail_id, forKey:"Myemialidvalue")
                    defaultstotalvalue.synchronize()
                    
                    if let Mobilevericationvalueplay:String = self.dictfinalvalue.value(forKey:"mobile_verification")  as? String {
                        
                        self.Mobilevericationvalue = Mobilevericationvalueplay
                        
                    self.Mobilevericationcolor = self.dictfinalvalue.value(forKey:"mobile_verification_color")         as!String
        let verifiedEmailnumberonecolor1 = self.hexStringToUIColor(hex:self.Mobilevericationcolor)
                        self.verifiedEmailnumberone.setTitleColor(verifiedEmailnumberonecolor1, for:.normal)
                        self.verifiedEmailnumberone.setTitle(self.Mobilevericationvalue, for:.normal)
                    }
//                     self.verifiedEmailnumberone.setTitle(self.Mobilevericationvalue, for:.normal)
                    self.businessnumber = self.dictfinalvalue.value(forKey:"number")as!String
                    self.businessgender = self.dictfinalvalue.value(forKey:"gender")as!String
                    self.businessdate_of_birth =  self.dictfinalvalue.value(forKey:"date_of_birth")as!String
                    self.businesspassword = self.dictfinalvalue.value(forKey:"password")as!String
                    let defaults = UserDefaults.standard
                    defaults.set(self.businesspassword, forKey:"Mypassword")
                    defaults.set(self.businessnumber, forKey:"Mybusinessnumber")
                    defaults.synchronize()
                    self.businesspan = self.dictfinalvalue.value(forKey:"pan")as!String
                    self.businessgst =  self.dictfinalvalue.value(forKey:"gst")as!String
                    
                    self.Editbusiness =  self.dictfinalvalue.value(forKey:"business_name")as!String
                    self.Editaccounttimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.EdictaccounttimertimerAction), userInfo: nil, repeats: false)
                    if let Newproductoutletsfinal:[String] = self.dictfinalvalue.value(forKey:"image")as?[String]
                    {
                        self.Busineesimagefinalvalue = Newproductoutletsfinal
                    }
                    self.businessImageDictfinalvalue = self.dictfinalvalue.value(forKey:"businessImage")as!NSDictionary
                     self.BusinesslicencecatageoryImage = self.businessImageDictfinalvalue.value(forKey:"Image")as!String
                        self.BusinesslicencecatageoryimageName = self.businessImageDictfinalvalue.value(forKey:"imageName")as!String
                    
                    self.businessImagepdfstring = self.businessImageDictfinalvalue.value(forKey:"downloadpath")as!String

                    self.Businesslicencecatageory = self.businessImageDictfinalvalue.value(forKey:"fileCategory")as!String
                    let defa  = UserDefaults.standard
                    defa.set( self.Businesslicencecatageory, forKey:"Mybusinesscataegory")
                    defa.synchronize()
                    
                    self.uploadauthone = self.businessImageDictfinalvalue.value(forKey:"status")as!String
                    self.uploadauthonecolor = self.businessImageDictfinalvalue.value(forKey:"status_color")as!String

                    let verifieduploadauthonecolor = self.hexStringToUIColor(hex:  self.uploadauthonecolor)
                    
                self.Businesslincencebuttontwo.setTitleColor(verifieduploadauthonecolor, for:.normal)
                   self.Businesslincencebuttontwo.setTitle(self.uploadauthone, for:.normal)

                    
                  
              self.Uploadauthorisiationdocueemnt = self.dictfinalvalue.value(forKey:"auth_document")as!NSDictionary
                    
                  self.authorisationcatageoryImage = self.Uploadauthorisiationdocueemnt.value(forKey:"Image")as!String
                    
                    self.authorisationcatageoryimageName = self.Uploadauthorisiationdocueemnt.value(forKey:"imageName")as!String
                    
                self.auth_documentDownLoadtotalvalue = self.Uploadauthorisiationdocueemnt.value(forKey:"downloadpath")as!String
                    
                self.uploadauthtwo = self.Uploadauthorisiationdocueemnt.value(forKey:"status")as!String
                self.uploadauthtwocolor = self.Uploadauthorisiationdocueemnt.value(forKey:"status_color")as!String
                    
                 print(self.uploadauthtwo)
                print(self.uploadauthtwocolor)

                    let uploadauthtwocolorcolor = self.hexStringToUIColor(hex:  self.uploadauthonecolor)
                    
                    self.uploadauthorisationtwo.setTitleColor(uploadauthtwocolorcolor, for:.normal)
                    self.uploadauthorisationtwo.setTitle(self.uploadauthtwo, for:.normal)
                
             self.auhthDocuementcatageory = self.Uploadauthorisiationdocueemnt.value(forKey:"fileCategory")as!String
                    print(self.auhthDocuementcatageory)
                      self.uploadidproof = self.dictfinalvalue.value(forKey:"id_proof")as!NSDictionary
                     self.id_proofcatageoryImage = self.uploadidproof.value(forKey:"Image")as!String
                    
                      self.id_proofdownloadpathImage = self.uploadidproof.value(forKey:"downloadpath")as!String
                    
                    
                     self.id_proofimageName = self.uploadidproof.value(forKey:"imageName")as!String
                  
                    self.id_prooffilecatageory = self.uploadidproof.value(forKey:"fileCategory")as!String
                  
                    self.uploadauththree = self.uploadidproof.value(forKey:"status")as!String
                    self.uploadauththreecolor = self.uploadidproof.value(forKey:"status_color")as!String
                    let uploadauththreecolorfinalavlue = self.hexStringToUIColor(hex:  self.uploadauththreecolor)

                    self.UpLoadidprooftwo.setTitle(self.uploadauththree, for:.normal)
                    
                    self.UpLoadidprooftwo.setTitleColor(uploadauththreecolorfinalavlue, for:.normal)
                    
                    print(self.uploadauththree)
                    print(self.uploadauththreecolor)

                    self.businessDictarray = self.businessImageDictfinalvalue.value(forKey:"options")as!NSArray
                    self.Uploadauthorisiationdocueemntarray = self.Uploadauthorisiationdocueemnt.value(forKey:"options")as!NSArray
                  self.uploadidproofarray = self.uploadidproof.value(forKey:"options")as!NSArray
        self.uploadtextbusinessnamelvalue = self.businessImageDictfinalvalue.value(forKey:"uploadText")as!String
        
        self.uploadtextauth_documentvalue = self.Uploadauthorisiationdocueemnt.value(forKey:"uploadText")as!String
  
         self.uploadtextid_proofvalue = self.uploadidproof.value(forKey:"uploadText")as!String

                    self.othersstring = self.businessDict.value(forKey:"others")as!NSArray
                 

            self.Questionfinalvalue = self.othersstring.value(forKey:"question")as![String]
                    
                      self.Answervalue = self.othersstring.value(forKey:"answer")as![String]
                     self.catgeroryfinalvalue = self.othersstring.value(forKey:"category")as![String]
                    print(self.catgeroryfinalvalue)
                    if let buil:NSDictionary  = self.businessDict.value(forKey:"billingJSON")as? NSDictionary
                    {
                       self.billingJSON = buil
                        self.billingJSONadresslocation =  self.billingJSON.value(forKey:"location")as!String
                        
                        print(self.billingJSONadresslocation)
                        
                        if self.billingJSONadresslocation.count > 0
                        {
                            self.billingaccountview.isHidden = false
                            self.billingsavechangesbutton.isHidden = true
                        }
                        else{
                            self.billingaccountview.isHidden = true
                            self.billingsavechangesbutton.isHidden = false
                        }
                        self.billingJSONasaveAsfinalvalue =  self.billingJSON.value(forKey:"saveAs")as!String
                        print(self.billingJSONasaveAsfinalvalue)
                        self.billingsaveaslabel.text = self.billingJSONasaveAsfinalvalue
                        self.billingadresslabel.text = self.billingJSONadresslocation
                    }
                    
                    
                    if let builjsonarrayvalue:NSArray  = self.businessDict.value(forKey:"billingJSON")as? NSArray
                    {
                        self.billingJSONTotal = builjsonarrayvalue
                   
                        if let billingKEYVALUEvalue:NSArray  = self.billingJSONTotal.value(forKey:"key")as? NSArray
                        {
                            self.bILLINGKeytotal = billingKEYVALUEvalue
                          
                                self.Locationlabel.text = (self.bILLINGKeytotal[0] as! String)
                          
                                self.Houseno.text = (self.bILLINGKeytotal[1] as! String)
                                    self.landamrknumber.text = (self.bILLINGKeytotal[2] as! String)
                           
                                self.arealabel.text = (self.bILLINGKeytotal[3] as! String)
                            
                                self.citylabel.text = (self.bILLINGKeytotal[4] as! String)
                            
                                self.pincodelabel.text = (self.bILLINGKeytotal[5] as! String)
                        }
                        if let bILLINGVALUEtotal:NSArray  = self.billingJSONTotal.value(forKey:"value")as? NSArray
                        {
                            self.bILLINGVALUE = bILLINGVALUEtotal
                           
                                self.Locationtitle.text = (self.bILLINGVALUE[0] as! String)
                          
                                self.Housetitle.text = (self.bILLINGVALUE[1] as! String)
                           
                                self.landemarktitel.text = (self.bILLINGVALUE[2] as! String)
                          
                                self.areatitle.text = (self.bILLINGVALUE[3] as! String)
                             self.citytitle.text = (self.bILLINGVALUE[4] as! String)
                                self.pincodetitle.text = (self.bILLINGVALUE[5] as! String)
                        }
                    }
                 
                    if let deliverybuil:NSDictionary  = self.businessDict.value(forKey:"deliveryJson")as? NSDictionary
                    {
                        
                        self.billingaccountview.isHidden = false
                        
                       
                        self.businessDictsingel   = deliverybuil
                        
                        
                        if let deliverybuilsingel:NSDictionary  = self.businessDictsingel.value(forKey:"delAddress1")as? NSDictionary
                        {
                               self.Deliveryadressone = deliverybuilsingel
                            self.Deliveryadresslocation =  self.Deliveryadressone.value(forKey:"location")as!String
                            print(self.billingJSONadresslocation)
                            self.deliveryJSONasaveAsfinalvalue =  self.Deliveryadressone.value(forKey:"saveAs")as!String
                            self.deliveryfinalstoreone.text = self.deliveryJSONasaveAsfinalvalue
                            self.Deliveryadressofthelabel.text = self.Deliveryadresslocation
                        }
           
                          if let deliverybuiltwo:NSDictionary  = self.businessDictsingel.value(forKey:"delAddress2")as? NSDictionary
                          {
                            self.businessDicttwo = deliverybuiltwo
                            print(self.businessDicttwo)
                             self.Deliveryadresslocationtwo =  self.businessDicttwo.value(forKey:"location")as!String
                            if  self.Deliveryadresslocationtwo.count > 0
                            {
                                self.deliveryJSONasaveAsfinalvaluetwo =  self.businessDicttwo.value(forKey:"saveAs")as!String
                                print(self.Deliveryadresslocationtwo)
                                print(self.deliveryJSONasaveAsfinalvaluetwo)
                                self.storedeliverytwo.text = self.deliveryJSONasaveAsfinalvaluetwo
                                self.storedeliverytexttwo.text = self.Deliveryadresslocationtwo
                                
                                self.deliveryfinalviewtwo.isHidden = false
                                self.addanotheRLocation.isHidden = true
                            }
                           else
                            {
                                self.deliveryfinalviewtwo.isHidden = true
                                
                                self.addanotheRLocation.isHidden = false
                            }
                        }
                        
                    }
                 
                    DispatchQueue.main.async {
                        self.otherstabelview.reloadData()
                        self.Emailtextfiled.text =  self.businessemail_id
                        
                        let stringtotalvalue = NSString(format:"%@%@","+91 ",self.businessnumber)
                        self.Mobilenumber.text =  stringtotalvalue as String
//                        self.pintetxfiled.text =  self.businesspassword
                        self.namebutton.setTitle(self.businessname, for:.normal)
//                        self.dateofbirthbutton.setTitle(self.businessdate_of_birth, for:.normal)
                        print(self.genderType)
//                        self.pannumbertextfiled.text =  self.businesspan
                        if self.businessgst.count > 0
                          {
//                            self.Gstnumbertextfiled.text =  self.businessgst
                        self.gstnumberbutton.setTitle(self.businessgst, for:.normal)

                         }
                        self.Businessnamebutton.setTitle(self.Editbusiness, for:.normal)
//                        self.gstnumberbutton.setTitle(self.businessgst, for:.normal)
//                        self.pannumberbutton.setTitle( self.businesspan, for:.normal)

                        print(self.genderType)

                        if self.BusinesslicencecatageoryImage.count > 0
                        {
                        self.BusinessLincencebutton.sd_setBackgroundImage(with: URL(string:self.BusinesslicencecatageoryImage), for: .normal)
                        }
                        
                        if self.authorisationcatageoryImage.count > 0
                        {
                           self.uploadauthorisationbuttonone.sd_setBackgroundImage(with: URL(string:self.authorisationcatageoryImage), for: .normal)
                        }
                        
                        if self.id_proofcatageoryImage.count > 0
                        {
                            self.Uploadidprrofone.sd_setBackgroundImage(with: URL(string:self.id_proofcatageoryImage), for: .normal)
                        }
 
                        if  self.businessgender == "Male"
                        {
                            self.Malebutton.setBackgroundImage(#imageLiteral(resourceName: "male_red"), for:.normal)
                        }
                        if  self.businessgender == "FeMale" ||  self.businessgender == "Female"
                        {
                            self.Femalebutton.setBackgroundImage(#imageLiteral(resourceName: "female_red"), for:.normal)
                        }
                        
                    
                       
                       
                    }
                    }
                break
            case .failure(_):
                DispatchQueue.main.async
                    {
                        self.removeSpinner()
                }
                break
            }
    
        }
        
    }
    func updatesinglvaluefinal()
    {
        self.showSpinner()
        let defaultsingelvalue = UserDefaults.standard
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        
        let kuserdefaukts = UserDefaults.standard
        
        if let Myagentidfinal:String = kuserdefaukts.value(forKey:"myuseridvaluefinal")as!String
        {
     
            self.NewEditagentid = Myagentidfinal
        }
       
        if let MyMobilenumbervalue:String = kuserdefaukts.value(forKey:"Mymobilenumbervalue")as!String
        {
            self.NewEditMobileNumber = MyMobilenumbervalue
        }
        
        if let Reviewfinaluseroid:String = kuserdefaukts.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = kuserdefaukts.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        request.httpMethod = "POST"
    let postString =  String(format: "method=%@&agentID=%@&mobileNo=%@&type=%@&text=%@","updateSingleValue",self.NewEditagentid,self.businessnumber, self.businessname,self.genderType)
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
                print(response.result)
                DispatchQueue.main.async {
                    self.removeSpinner()
                }
                if let dictsingelvalue:NSDictionary = response.result.value as? NSDictionary
                {
                    DispatchQueue.main.async {
                        self.removeSpinner()
                    }
                    if let str2:String = dictsingelvalue.value(forKey:"Status")as?String
                    {
                        print(str2)
                        if  str2 == "0"
                        {
                            self.removeSpinner()
                            self.veryalertview.isHidden = true
                        }
                        if  str2 == "1"
                        {
                          self.savechangesfinalvalue.isHidden = true
                            self.removeSpinner()
                            
                        }
                        
                    }
                    
                    
                    
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
        self.veryalertview.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(imageView)
    }
    func removeSpinner(){
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()

       // self.veryalertview.removeFromSuperview()
        
    }
    @objc func EdictaccounttimertimerAction()
    {
        self.removeSpinner()
        self.veryalertview.isHidden = true
    }
    
    @IBAction func Savechangesbutton(_ sender: UIButton)
    {
        updatesinglvaluefinal()
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
       
        self.cahngefinalvalue.isHidden = true
        
        let defaults = UserDefaults.standard
        
    
        
        if let Billfinal:String = defaults.value(forKey:"MyBillingadressset")as?String
        {
            print(Billfinal)
            
            if Billfinal.count > 0
            {
                billingsavechangesbutton.isHidden = true
                
                self.billingaccountview.isHidden = false
//                billingsavechangesbutton.isHidden = false
//                scorllpagefourvaluefinal.setSelectedIndex(index:1, animated: true)
                cahtsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                Complaintsbuttonone.setTitleColor(UIColor.black, for:.normal)
                marketingbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                editotherssinglbiutton.setTitleColor(UIColor.lightGray, for:.normal)
                Editcahtsviewone.isHidden = true
                EditComplaintsView1.isHidden =  false
                compliantssingelview.isHidden = false
                chatssingelview.isHidden = true
                marketingsingellineview.isHidden = true
                editotherssmalllineview.isHidden = true
                
                scorllpagefourvaluefinal.setSelectedIndex(index:1, animated: true)
                DispatchQueue.main.async {
                    self.billingadressMethod()
                }
            }
         
        }
        if let Billfinaltwo:String = defaults.value(forKey:"Mydeliveryadressset")as?String
        {
            print(Billfinaltwo)
            
            if Billfinaltwo.count > 0
            {
//                scorllpagefourvaluefinal.setSelectedIndex(index:3, animated: true)

                
                EditMarketView1.isHidden =  false
                cahtsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                Complaintsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                marketingbuttonone.setTitleColor(UIColor.black, for:.normal)
                editotherssinglbiutton.setTitleColor(UIColor.lightGray, for:.normal)
                
                marketingsingellineview.isHidden = false
                compliantssingelview.isHidden = true
                chatssingelview.isHidden = true
                marketingsingellineview.isHidden = false
                editotherssmalllineview.isHidden = true
                
                scorllpagefourvaluefinal.setSelectedIndex(index:2, animated: true)
                
                
                
                billingsavechangesbutton.isHidden = true

                //                billingsavechangesbutton.isHidden = false
                
                DispatchQueue.main.async {
                    self.Deliveryadressmethod()
                }
            }
            
        }
      
        if let Singelname:String = defaults.value(forKey:"singelupdate")as?String
        {
            if Singelname.count > 2
            {
                DispatchQueue.main.async {
                    self.EditProfileview()
                    self.showSpinner()
                }
                scorllpagefourvaluefinal.setSelectedIndex(index:0, animated: true)
                cahtsbuttonone.setTitleColor(UIColor.black, for:.normal)
                Complaintsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                marketingbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                editotherssinglbiutton.setTitleColor(UIColor.lightGray, for:.normal)
                Editcahtsviewone.isHidden = false
                compliantssingelview.isHidden = true
                chatssingelview.isHidden = false
                editotherssmalllineview.isHidden = true
                
                marketingsingellineview.isHidden = true
                
                
            }
            
        }
       
        
        
        
        if let Deliverytwo:String = defaults.value(forKey:"myanothersvalue")as?String
        {
            if Deliverytwo.count > 2
            {
                DispatchQueue.main.async {
                    self.EditProfileview()
                    self.showSpinner()
                }
                EditMarketView1.isHidden =  true
                Editcahtsviewone.isHidden =  true
                EditMarketView1.isHidden =  true
                othersviewone.isHidden =  false
                cahtsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                Complaintsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                marketingbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                editotherssinglbiutton.setTitleColor(UIColor.black, for:.normal)
                
                
                marketingsingellineview.isHidden = true
                compliantssingelview.isHidden = true
                chatssingelview.isHidden = true
                marketingsingellineview.isHidden = true
                editotherssmalllineview.isHidden = false
                scorllpagefourvaluefinal.setSelectedIndex(index:3, animated: true)
                
                
            }
            
        }
            
        if let Deliverytwo:String = defaults.value(forKey:"Mydeliveryadresssetfinalvalue")as?String
        {
            print(Deliverytwo)
            
            if Deliverytwo.count > 0
            {
                //                scorllpagefourvaluefinal.setSelectedIndex(index:3, animated: true)
                
                billingsavechangesbutton.isHidden = true
                addanotheRLocation.isHidden = true
                deliveryfinalviewtwo.isHidden = false
                
                //                billingsavechangesbutton.isHidden = false
                EditMarketView1.isHidden =  false
                cahtsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                Complaintsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                marketingbuttonone.setTitleColor(UIColor.black, for:.normal)
                editotherssinglbiutton.setTitleColor(UIColor.lightGray, for:.normal)
                
                marketingsingellineview.isHidden = false
                compliantssingelview.isHidden = true
                chatssingelview.isHidden = true
                marketingsingellineview.isHidden = false
                editotherssmalllineview.isHidden = true
                
                scorllpagefourvaluefinal.setSelectedIndex(index:2, animated: true)
                DispatchQueue.main.async {
                    self.Deliveryadressmethod()
                }
            }
        }
        else
        {
            DispatchQueue.main.async {
                self.EditProfileview()
            }
        }
        
    }
    
    @IBAction func CROSSbutton(_ sender: UIButton)
    {
        self.cahngefinalvalue.isHidden = true
    }
    @IBAction func Mynobutton(_ sender: UIButton)
    {
        self.cahngefinalvalue.isHidden = true
    }
    @IBAction func Myyesbutton(_ sender: UIButton)
    {
        DispatchQueue.main.async {
          let viewsingel = self.storyboard?.instantiateViewController(withIdentifier:"ChangePinViewController")as!ChangePinViewController
            self.present(viewsingel, animated: true, completion:nil)
        }
    }
 
    @IBAction func billingsavechanges(_ sender: UIButton)
    {
        DispatchQueue.main.async {
            let viewsingel = self.storyboard?.instantiateViewController(withIdentifier:"ChangePinViewController")as!ChangePinViewController
            self.present(viewsingel, animated: true, completion:nil)
        }
    }

    func scrollPagerfinal(scrollPager: ScrollPagerfour, changedIndex: Int)
    {
        if scrollPager == scrollPager
        {
            if changedIndex == 0
            {
             
                cahtsbuttonone.setTitleColor(UIColor.black, for:.normal)
                Complaintsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                marketingbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                editotherssinglbiutton.setTitleColor(UIColor.lightGray, for:.normal)
                Editcahtsviewone.isHidden = false
                compliantssingelview.isHidden = true
                chatssingelview.isHidden = false
                marketingsingellineview.isHidden = true
                editotherssmalllineview.isHidden = true

            }
            if changedIndex == 1
            {
                cahtsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                Complaintsbuttonone.setTitleColor(UIColor.black, for:.normal)
                marketingbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                editotherssinglbiutton.setTitleColor(UIColor.lightGray, for:.normal)

                Editcahtsviewone.isHidden = true
                EditComplaintsView1.isHidden =  false
                compliantssingelview.isHidden = false
                chatssingelview.isHidden = true
                marketingsingellineview.isHidden = true
                editotherssmalllineview.isHidden = true

            }
            if changedIndex == 2
            {
                EditMarketView1.isHidden =  false
                cahtsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                Complaintsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                marketingbuttonone.setTitleColor(UIColor.black, for:.normal)
                editotherssinglbiutton.setTitleColor(UIColor.lightGray, for:.normal)

                marketingsingellineview.isHidden = false
                compliantssingelview.isHidden = true
                chatssingelview.isHidden = true
                marketingsingellineview.isHidden = false
                editotherssmalllineview.isHidden = true

            }
            if changedIndex == 3
            {
                Editcahtsviewone.isHidden =  true
                EditComplaintsView1.isHidden =  true
                EditMarketView1.isHidden =  true
                othersviewone.isHidden =  false
            
                cahtsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                Complaintsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                marketingbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                compliantssingelview.isHidden = true
                chatssingelview.isHidden = true
                marketingsingellineview.isHidden = true
                editotherssmalllineview.isHidden = false
                editotherssinglbiutton.setTitleColor(UIColor.black, for:.normal)

            }

        }
        
    }
func billingadressMethod()
{
    self.showSpinner()
    var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
    let userdefaultsvalue = UserDefaults.standard
    let defaults = UserDefaults.standard

      if let Reviewfinal:NSDictionary = defaults.value(forKey: "Billingfirstdict")as?NSDictionary
        {
            self.BillingDictone = Reviewfinal
        }
    if let Reviewfinalseconddict:NSDictionary = defaults.value(forKey: "Billingseconddicttdict")as?NSDictionary
    {
        self.BillingDicttwo = Reviewfinalseconddict
    }
    
print(self.BillingDictone)
    print(self.BillingDicttwo)
    EditaccountDictfinal.addEntries(from:self.BillingDictone as! [AnyHashable : Any])
    EditaccountDictfinal.addEntries(from:self.BillingDicttwo as! [AnyHashable : Any])

   
    if let Reviewfinaluseroid:String = defaults.value(forKey: "myuseridvaluefinal")as?String
    {
        self.useridbiling = Reviewfinaluseroid
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

    let jsonData = try? JSONSerialization.data(withJSONObject:EditaccountDictfinal, options: [])
    let jsonString = String(data: jsonData!, encoding: .utf8)
    request.httpMethod = "POST"
       let postString =  String(format: "method=%@&agentid=%@&RequestType=%@&json=%@","submitInfo",useridbiling,"Billing",jsonString!)

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
            print(response.result)
           
            DispatchQueue.main.async {
                self.removeSpinner()
            }
            

            if let dictsingelvalue:String = response.result.value as? String
            {
                self.removeSpinner()

                
                print(dictsingelvalue)
                
                
                
            }
            break
        case .failure(_):
            
            DispatchQueue.main.async {
                self.removeSpinner()
                self.EditProfileview()
            }

            break
        }
    }
    }
    
    
    func Deliveryadressmethod()
    {
        self.showSpinner()
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        let userdefaultsvalue = UserDefaults.standard
        let defaults = UserDefaults.standard
     
        if let Reviewfinal:NSDictionary = defaults.value(forKey: "Deliveryfirstdict")as?NSDictionary
        {
            self.DeliveryDictone = Reviewfinal
        }
        if let Reviewfinalseconddict:NSDictionary = defaults.value(forKey: "Deliveryseconddict")as?NSDictionary
        {
            self.DeliveryDicttwo = Reviewfinalseconddict
        }

        if let Reviewfinalthree:NSDictionary = defaults.value(forKey: "Deliverythirdtdict")as?NSDictionary
        {
            self.DeliveryDicthtree = Reviewfinalthree
        }
        if let Reviewfinalfour:NSDictionary = defaults.value(forKey: "DeliveryFourthdict")as?NSDictionary
        {
            self.DeliveryDictfour = Reviewfinalfour
        }

        print(self.DeliveryDictone)
        print(self.DeliveryDicttwo)
        print(self.DeliveryDicthtree)
        print(self.DeliveryDictone)

        DeliveryaccountDictfinal.addEntries(from:self.DeliveryDictone as! [AnyHashable : Any])
        DeliveryaccountDictfinal.addEntries(from:self.DeliveryDicttwo as! [AnyHashable : Any])
        DeliveryaccountDictfinal.addEntries(from:self.DeliveryDicthtree as! [AnyHashable : Any])
        DeliveryaccountDictfinal.addEntries(from:self.DeliveryDictfour as! [AnyHashable : Any])
        
        if let Reviewfinaluseroid:String = defaults.value(forKey: "myuseridvaluefinal")as?String
        {
            self.useridbiling = Reviewfinaluseroid
        }
        
        let jsonData = try? JSONSerialization.data(withJSONObject:DeliveryaccountDictfinal, options: [])
        let jsonString = String(data: jsonData!, encoding: .utf8)
        request.httpMethod = "POST"
        let postString =  String(format: "method=%@&agentid=%@&RequestType=%@&json=%@","submitInfo",useridbiling,"Delivery",jsonString!)
        
        print(postString)
        
        
        
        request.httpBody = postString.data(using: .utf8)
        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
                
                
            case .success(_):
                print(response.result)
                
                DispatchQueue.main.async {
                    self.removeSpinner()
                }
                
                if let dictsingelvalue:String = response.result.value as? String
                {
                    self.removeSpinner()
                    
                    
                    print(dictsingelvalue)
                    
                    
                    
                }
                break
            case .failure(_):
                DispatchQueue.main.async
                    {
                    self.removeSpinner()
                    self.EditProfileview()
                }

                break
            }
        }
    }
    
    
    
    @IBAction func Cahttingbuttoone(_ sender: UIButton)
    {
        scorllpagefourvaluefinal.setSelectedIndex(index:0, animated: true)
        cahtsbuttonone.setTitleColor(UIColor.black, for:.normal)
        Complaintsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
        marketingbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
        editotherssinglbiutton.setTitleColor(UIColor.lightGray, for:.normal)
        Editcahtsviewone.isHidden = false
        compliantssingelview.isHidden = true
        chatssingelview.isHidden = false
        editotherssmalllineview.isHidden = true

        marketingsingellineview.isHidden = true
    }
    @IBAction func complaintbuttonone(_ sender: UIButton)
    {
        cahtsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
        Complaintsbuttonone.setTitleColor(UIColor.black, for:.normal)
        marketingbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
        editotherssinglbiutton.setTitleColor(UIColor.lightGray, for:.normal)
        Editcahtsviewone.isHidden = true
        EditComplaintsView1.isHidden =  false
        compliantssingelview.isHidden = false
        chatssingelview.isHidden = true
        marketingsingellineview.isHidden = true
        editotherssmalllineview.isHidden = true

        scorllpagefourvaluefinal.setSelectedIndex(index:1, animated: true)
    }
    @IBAction func Marketingbuttonone(_ sender: UIButton)
    {
        EditMarketView1.isHidden =  false
        cahtsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
        Complaintsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
        marketingbuttonone.setTitleColor(UIColor.black, for:.normal)
        editotherssinglbiutton.setTitleColor(UIColor.lightGray, for:.normal)

        marketingsingellineview.isHidden = false
        compliantssingelview.isHidden = true
        chatssingelview.isHidden = true
        marketingsingellineview.isHidden = false
        editotherssmalllineview.isHidden = true

        scorllpagefourvaluefinal.setSelectedIndex(index:2, animated: true)
    }
    
    @IBAction func Editotherssingelbutton(_ sender: UIButton)
    {
        EditMarketView1.isHidden =  true
        Editcahtsviewone.isHidden =  true
        EditMarketView1.isHidden =  true
        othersviewone.isHidden =  false
        cahtsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
        Complaintsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
        marketingbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
        editotherssinglbiutton.setTitleColor(UIColor.black, for:.normal)

        
        marketingsingellineview.isHidden = true
        compliantssingelview.isHidden = true
        chatssingelview.isHidden = true
        marketingsingellineview.isHidden = true
        editotherssmalllineview.isHidden = false
        scorllpagefourvaluefinal.setSelectedIndex(index:3, animated: true)
   
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if Answervalue.count > 0
        {
              return 60
        }
        else{
            return 40
        }
        
    }
    
    @IBAction func Entergstnuberbutton(_ sender: UIButton)
    {
        DispatchQueue.main.async {
            let NamebuttonView = self.storyboard?.instantiateViewController(withIdentifier:"NamebuttonViewController")as!NamebuttonViewController
            NamebuttonView.Namelabelstring = "GST Number"
            NamebuttonView.NameTextfiledstring = self.businessgst
            NamebuttonView.Mobilenumebrfinlvalue = self.businessnumber
            NamebuttonView.finalbusinesstypevaluefinal = self.Editbusiness
     
            self.present(NamebuttonView, animated: true, completion:nil)
        }
        
        
//        self.gstnumberbutton.setTitle(self.businessgst, for:.normal)
//        self.pannumberbutton.setTitle( self.businesspan, for:.normal)
    }
 
    @IBAction func pannumber(_ sender: UIButton)
    {
        DispatchQueue.main.async {
            let NamebuttonView = self.storyboard?.instantiateViewController(withIdentifier:"NamebuttonViewController")as!NamebuttonViewController
            NamebuttonView.Namelabelstring = "Pan Number"
            NamebuttonView.NameTextfiledstring = self.businesspan
            NamebuttonView.Mobilenumebrfinlvalue = self.businessnumber
            NamebuttonView.finalbusinesstypevaluefinal = self.Editbusiness
            
            self.present(NamebuttonView, animated: true, completion:nil)
        }
    }
    
    @IBAction func BusinessNAmebuttonfinalvalueis(_ sender: UIButton)
    {
        DispatchQueue.main.async {
            let NamebuttonView = self.storyboard?.instantiateViewController(withIdentifier:"NamebuttonViewController")as!NamebuttonViewController
            NamebuttonView.Namelabelstring = "Business name"
            NamebuttonView.NameTextfiledstring = self.Editbusiness
            NamebuttonView.Mobilenumebrfinlvalue = self.businessnumber
            
            self.present(NamebuttonView, animated: true, completion:nil)
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

    
}
