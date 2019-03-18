//
//  comboViewController.swift
//  AgentRestocks
//
//  Created by Azharuddin on 19/09/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

/// Games spark integration
// https://support.gamesparks.net/support/discussions/topics/1000086260



/// Checkmark in collectionviecell


// https://www.reddit.com/r/swift/comments/3ajvbc/checkbox_in_uicollectionviewcell/

/// http://i.imgur.com/Ov1a1xV.png?1

import UIKit
import Alamofire
import AlamofireImage


class comboViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate
{
    @IBOutlet weak var comboview: UIView!
    @IBOutlet weak var dropdownview: UIView!
    @IBOutlet weak var dropdowntabelview: UITableView!
    var soldbytabelarray = [String]()
    let cellReuseIdentifier = "cell"
    @IBOutlet weak var drop: UIButton!
    @IBOutlet weak var namelabel: UILabel!
//
//    @IBOutlet weak var scrollpagertwo: ScrollPagertwo!
    @IBOutlet weak var scrollpagertwo: ScrollPagerfour!
    var CombofirstView  = UIView()
    var CombosecondView  = UIView()
    var Combothiredview  = UIView()
    var Combofourthview  = UIView()
     var Combofifthview = UIView()
    @IBOutlet weak var combofirstviewone: UIView!
    @IBOutlet weak var combosecondviewtwo: UIView!
    @IBOutlet weak var combothirdviewone: UIView!
    @IBOutlet weak var combofourthviewone: UIView!
    @IBOutlet weak var combofifthfinalvalueis: UIView!
    var collectionarray = [String]()
    var selectedIndex :Int?
    @IBOutlet weak var combocolletcionview: UICollectionView!
    @IBOutlet weak var Brandcontrollededistbutor: UILabel!
    @IBOutlet weak var titleofthelabel: UILabel!
    @IBOutlet weak var distributersupplyavaliabel: UILabel!
    @IBOutlet weak var combocollectionviewtwo: UICollectionView!
    var comboooferimage = [UIImage]()
      var comboooferimagetwo = [UIImage]()
    @IBOutlet weak var viewone: UIView!
    var Rupeesstring = [String]()
    var offerstring = [String]()
    var percentagestring = [String]()
    @IBOutlet weak var secondofferviewtwo: UIView!
    @IBOutlet weak var rupeeslabeltwo: UILabel!
    @IBOutlet weak var rupeesoffertwo: UILabel!
    @IBOutlet weak var rupeespercentagelabel: UILabel!
    var RupeesTwostring = [String]()
    var offerTwostring = [String]()
    var percentageTwostring = [String]()
    @IBOutlet weak var secondofferdrop: UIButton!
    var comboproductName = [String]()
    var Comboquantity = [String]()
    var Comborate = [String]()
    var Comboratestruck = [String]()
    @IBOutlet weak var combocollectionviewthree: UICollectionView!
    @IBOutlet weak var combofirstscrollview: UIScrollView!
    
    @IBOutlet weak var typeoderlabel: UILabel!
//    @IBOutlet weak var minimumorderquantitylabel: UILabel!
    var MAximuorderlabel = [String]()
    var selectquantitylabel = [String]()
    @IBOutlet weak var Maximumpickervi: UIView!
    var modelData = [String]()
    let customWidth:CGFloat = 100
    let customHeight:CGFloat = 100
    @IBOutlet var pickerView: UIPickerView!
    var rotationAngle:CGFloat!
   var di_count = 0
    @IBOutlet weak var tetxfiledview: UIView!
    @IBOutlet weak var singllinetextfiled: UITextField!
    @IBOutlet weak var combosecondviewfinal: UIView!
    @IBOutlet weak var firstviewone: UIView!
    @IBOutlet weak var firstbuttonone: UIButton!
    @IBOutlet weak var bytwentget: UIButton!
    var tapGesture = UITapGestureRecognizer()
    @IBOutlet weak var secondviewtwo: UIView!
    @IBOutlet weak var buttontwotwo: UIButton!
    @IBOutlet weak var Buy30getbuttonone: UIButton!
    @IBOutlet weak var thirdviewfinal: UIView!
    @IBOutlet weak var thirdbuttonone: UIButton!
    @IBOutlet weak var thirdbuttontwo: UIButton!
    @IBOutlet weak var viewfour: UIView!
    @IBOutlet weak var fourthbuttonone: UIButton!
    @IBOutlet weak var fourthbuttontwo: UIButton!
    @IBOutlet weak var maximumquantitylabel: UILabel!
    @IBOutlet weak var toatalquantitylabel: UILabel!
    @IBOutlet weak var offertopview: UIView!
    @IBOutlet weak var textfiledviewtwo: UIView!
    @IBOutlet weak var textfiledofertwo: UITextField!
    @IBOutlet weak var popscrollviewfinal: UIScrollView!
    @IBOutlet weak var Onetwentyfiveinstacklabel: UILabel!
    @IBOutlet weak var arrowBackbutton: UIButton!
    var VisibleIndexquntity:IndexPath = IndexPath(row: 0, section: 0)
    var index = Int()
    var Pickerstring = String()
    @IBOutlet weak var minimumordrqunatitylabel: UILabel!
    @IBOutlet weak var verfymaximumQuantityy: UIView!
    @IBOutlet weak var Bulkview: UIView!
    @IBOutlet weak var Bulkfirstviewone: UIView!
    @IBOutlet weak var Bulksecondview: UIView!
    @IBOutlet weak var Bulkthirdview: UIView!
    @IBOutlet weak var Bulkfourthview: UIView!
    @IBOutlet weak var bulkshou: UIButton!
    @IBOutlet weak var BulkHand: UIButton!
    
    @IBOutlet weak var maximuorderquantityvalue: UIView!
    @IBOutlet weak var Bulkquantityview: UIView!
    
    @IBOutlet weak var Bulkminimumorder: UILabel!
    @IBOutlet weak var Bulkminimumpicks: UILabel!
    @IBOutlet weak var BulkEqual: UILabel!
    @IBOutlet weak var Bulktotalitemslabel: UILabel!
    @IBOutlet weak var bulktetxfiledview: UIView!
    @IBOutlet weak var bulktetxfiled: UITextField!
    @IBOutlet weak var bulkaddtocart: UIButton!
    
    @IBOutlet weak var bulkfirstbuttonone: UIButton!
    @IBOutlet weak var bulkfirstbuttontwo: UIButton!
    @IBOutlet weak var bulksecondbuttonone: UIButton!
    @IBOutlet weak var bulksecondbuttontwo: UIButton!
    @IBOutlet weak var bulkthirdbuttonone: UIButton!
    @IBOutlet weak var bulkthirdbuttontwo: UIButton!
    @IBOutlet weak var bulkfourthbuttonone: UIButton!
    @IBOutlet weak var bulkfourthbuttontwo: UIButton!
    @IBOutlet weak var bulkorderqunatitytopview: UIView!
    @IBOutlet weak var combotopview: UIView!
    
    
    
    @IBOutlet weak var moqTopview: UIView!
    
    @IBOutlet weak var moqminimumorderquantity: UILabel!
    
    @IBOutlet weak var moqlabelone: UILabel!
    
    @IBOutlet weak var moqlabeltwo: UILabel!
    
    @IBOutlet weak var moqinstacklabel: UILabel!
    
    @IBOutlet weak var moqpickerview1: UIView!
    @IBOutlet weak var moqpcikertotalview1: UIPickerView!
    @IBOutlet weak var moqbackbutton: UIButton!
    
    
    
    @IBOutlet weak var moqviewfinal: UIView!
    @IBOutlet weak var moqtextfiledvalue: UITextField!
    var Moqindex = Int()
    var MoqPickerstring = String()
    var modelData1 = [String]()
    @IBOutlet weak var moqtotalpickslabel: UILabel!
    
    
    var Comboarray1 = NSArray()
    var offerarray1 = NSArray()
    var Bulkarray1 = NSArray()
    var Ltsarray1 = NSArray()
    var Moqarray1 = NSArray()
    var SchemeSarray1 = NSArray()

    var MycomboDictfinalvalue = NSDictionary()
    var defaultsDictFinalvalue = NSDictionary()
    var defaultsMoq = NSString()
    var defaultsMOQ_text = NSString()
    var defaultsMRP = NSString()
    var defaultsPTR = NSNumber()
    var defaultsmargin = NSString()
    var defaultsprice = NSString()
    var defaultsprodId = NSString()
    ///// without Combo

    @IBOutlet weak var withoutcomboradiobutton: UIButton!
    @IBOutlet weak var withoutcomboprice: UILabel!
    @IBOutlet weak var withoutcombomrp: UILabel!
    @IBOutlet weak var withoutcombomargin: UILabel!
    
    //// With Combo button
    @IBOutlet weak var combobutton: UIButton!
    @IBOutlet weak var combopricelabel: UILabel!
    @IBOutlet weak var combomrp: UILabel!
    @IBOutlet weak var combomragin: UILabel!
    @IBOutlet weak var combodrop: UIButton!
    @IBOutlet weak var Mytotalcomboview: UIView!
    @IBOutlet weak var MytotalMoqview: UIView!
    //// Combo dictfinalvalue
    var comboDictTotalvalue = NSDictionary()
    
    var comboMRP = NSNumber()
    
    var comboActualLSP = NSNumber()
    var comboLSPForCombo = NSNumber()
    var comboMArginfinalvalue = NSString()
    
    /// Moq Value
    var Moqstringfinalvalue = NSString()
    /// quantityavaliabel
    var quantityavaliabelstringfinalvalue = NSString()

    
    @IBOutlet weak var crosslabelfinal: UILabel!
    
    
    /// collectionview Responce
    
    
    var subDictfinalvalue = NSArray()
    var CollectionviewTitlename = [String]()
    var CollectionviewMoq = [String]()
    var CollectionviewMRP = [String]()
    var CollectionviewMaxQty = [String]()
    var CollectionviewMinQty = [String]()
    var CollectionviewPTR = [NSNumber]()
    var TotalQuantityfinalvalue = [NSNumber]()
    var Combouseridstringvalue = String()

    var CombopostStringfinalvalue = String()
    
    var SubcomboprodId = [String]()
    
    var Comboidsingelvalue = String()
    var arrayvalue = NSString()
    var arrayvaluefinal =  NSMutableString()

    
    var coverView = UIView()
    var imageView = UIImageView()
    
    var  valueis = String()
    var  countnumerb = Int()

    var  countnumertwo = Int()

    
    var myNumber = NSNumber()
    
    var MytotalNsmutabelstring = NSMutableString()
    
    var valuefinaltwois = NSString()
    var statusfinalavlue = String()
    
    
    var userquantity = String()
    
    var cartcountfinal = NSNumber()
    
    var Combofinalview = UIView()


    var tapGR = UITapGestureRecognizer()
    var tap = UITapGestureRecognizer()
    
    
    
    var appendarray = [String]()
    
    var Moqarrayone = [String]()

    
    var selectedIndexFinalavlue :Int?
    
    var MoqpostStringfinalvalue  = String()
    
    
    //// Bulkprice
    
    
    var Bulkprice = [String]()
    var Bulkbuyone = [String]()
    var Bulkbulk_idone = [String]()
    var Bulkbulk_min_qtyone = [String]()
    var Bulkbulk_max_qtyyone = [String]()
    var Bulkbulk_MOQyone = [String]()
    var Bulkbulk_MOQ_textyone = [String]()
    
    
    
    @IBOutlet weak var bulkinstacklabelfinal: UILabel!
    
    
    
    var MoqMimiumordrQuantityFinalavlue = String()
    
    
   var bulk_id  = String()
    
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
   
         self.combofirstviewone.isHidden = true
        self.combofourthviewone.isHidden = true
        self.combothirdviewone.isHidden = true
        self.combosecondviewtwo.isHidden = true

  
        
        soldbytabelarray = ["NumberMall","Venkata Ramana Traders"]
        Moqarrayone = ["1","2","3","4"]

        
    self.dropdowntabelview.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        dropdowntabelview.delegate = self
        dropdowntabelview.dataSource = self


        dropdownview.layer.shadowOffset = CGSize(width: 0, height: 2)
        dropdownview.layer.shadowOpacity = 0.3
        dropdownview.layer.shadowRadius = 1.0
        dropdownview.layer.borderColor = UIColor.color2().cgColor
        dropdownview.layer.shadowColor = UIColor.color2().cgColor

        self.combocolletcionview.showsHorizontalScrollIndicator = false
        self.combocollectionviewtwo.showsHorizontalScrollIndicator = false
        self.viewone.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        self.viewone.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)

        Rupeesstring = ["₹119.00"]
        offerstring = ["₹120"]
        percentagestring = ["15%"]
        
        let attributeString =  NSMutableAttributedString(string:offerstring[0])
        
        attributeString.addAttribute(NSAttributedStringKey.strikethroughStyle,
                                     value: NSUnderlineStyle.styleSingle.rawValue,
                                     range: NSMakeRange(0, attributeString.length))

        RupeesTwostring = ["₹119.00"]

        self.combocollectionviewthree.showsHorizontalScrollIndicator = false
        
        self.secondofferviewtwo.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.6)

        if self.view.frame.size.height < 800 {
            combofirstscrollview.contentInset = UIEdgeInsetsMake(0, 0,700, 0)
            combofirstscrollview.isScrollEnabled = true
            combofirstscrollview.showsVerticalScrollIndicator = false
        }
        MAximuorderlabel = ["12 x"]
        selectquantitylabel = ["1"]
      //  minimumordrqunatitylabel.text = MAximuorderlabel[0]
       
        
        let offertotal = NSString(format:"%@%@","Minimum Order Quantity:",MAximuorderlabel[0])
        
        minimumordrqunatitylabel.text = offertotal as String
        
        Bulkminimumorder.text = offertotal as String


        typeoderlabel.text = selectquantitylabel[0]
        rotationAngle = -90 * (.pi/180)
        let originalFrame = pickerView.frame
        pickerView.transform =  CGAffineTransform(rotationAngle: rotationAngle)
        pickerView.frame = originalFrame
        modelData = ["0","1","2","3","4","5","6","7","8","9","10"]
    singllinetextfiled.delegate = self
    singllinetextfiled.addTarget(self, action: #selector(comboViewController.textFieldDidChange(_:)), for: .editingChanged)
    singllinetextfiled.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClicked))
    singllinetextfiled.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
    singllinetextfiled.layer.borderWidth = 2.0
        
        
        textfiledofertwo.delegate = self

        textfiledofertwo.addTarget(self, action: #selector(comboViewController.textFieldDidChange(_:)), for: .editingChanged)

        textfiledofertwo.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClicked))
        textfiledofertwo.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        textfiledofertwo.layer.borderWidth = 2.0
        
        singllinetextfiled.keyboardType = .numberPad
        textfiledofertwo.keyboardType = .numberPad

        
        
        let combotap = UITapGestureRecognizer(target: self, action: #selector(self.Handelcomboone(_:)))
        firstviewone.addGestureRecognizer(combotap)
        combotap.delegate = self as? UIGestureRecognizerDelegate
        firstviewone.isUserInteractionEnabled = true
        combotap.numberOfTapsRequired = 1
        combotap.numberOfTouchesRequired = 1
        
        let combotaptwo = UITapGestureRecognizer(target: self, action: #selector(self.HandelcomboTwois(_:)))
        secondviewtwo.addGestureRecognizer(combotaptwo)
        combotaptwo.delegate = self as? UIGestureRecognizerDelegate
        secondviewtwo.isUserInteractionEnabled = true
        combotaptwo.numberOfTapsRequired = 1
        combotaptwo.numberOfTouchesRequired = 1
        
        let combotapthree = UITapGestureRecognizer(target: self, action: #selector(self.HandelcomboThreeis(_:)))
        thirdviewfinal.addGestureRecognizer(combotapthree)
        combotapthree.delegate = self as? UIGestureRecognizerDelegate
        thirdviewfinal.isUserInteractionEnabled = true
        combotapthree.numberOfTapsRequired = 1
        combotapthree.numberOfTouchesRequired = 1
     
        
        let combotapfour = UITapGestureRecognizer(target: self, action: #selector(self.Handelcombofouris(_:)))
        viewfour.addGestureRecognizer(combotapthree)
        combotapfour.delegate = self as? UIGestureRecognizerDelegate
        viewfour.isUserInteractionEnabled = true
        combotapfour.numberOfTapsRequired = 1
        combotapfour.numberOfTouchesRequired = 1
        

        maximumquantitylabel.text = "1"
        maximumquantitylabel.textColor = UIColor.red
        
        let totalmultipicationpercentage = (Int(12) * Int(maximumquantitylabel.text!)!)
        let valuefinal = NSString(format:"%d%@",totalmultipicationpercentage,"pcs")
        toatalquantitylabel.text = valuefinal as String
        toatalquantitylabel.textColor = UIColor.red
        toatalquantitylabel.text = valuefinal as String
        textfiledofertwo.keyboardType = .numberPad

        let bottomSheet = JXBottomSheetView(contentView:popscrollviewfinal as! UIScrollView)
        bottomSheet.defaultMaxinumDisplayHeight  = 530
        bottomSheet.defaultMininumDisplayHeight = 375
        bottomSheet.displayState = .minDisplay
        bottomSheet.frame = self.view.bounds
        self.view.addSubview(bottomSheet)
        self.index = 0
        
        self.Moqindex = 0
       
        
        

        /// viewfour condition
        
        self.viewfour.layer.borderWidth = 1.0
        self.viewfour.layer.cornerRadius = 8.0
        self.viewfour.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        self.viewfour.layer.masksToBounds = true
        
        /// firstviewone condition
        
        self.firstviewone.layer.borderWidth = 1.0
        self.firstviewone.layer.cornerRadius = 8.0
        self.firstviewone.layer.borderColor = UIColor.red.cgColor
        self.firstviewone.layer.masksToBounds = true
        
       //  secondviewtwo condtion
        
        
        self.secondviewtwo.layer.borderWidth = 1.0
        self.secondviewtwo.layer.cornerRadius = 8.0
        self.secondviewtwo.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        self.secondviewtwo.layer.masksToBounds = true
        
        
        
       ///  thirdviewfinal condtion
        
        self.thirdviewfinal.layer.borderWidth = 1.0
        self.thirdviewfinal.layer.cornerRadius = 8.0
        self.thirdviewfinal.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        self.thirdviewfinal.layer.masksToBounds = true
   
        self.verfymaximumQuantityy.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
        

        self.bulkorderqunatitytopview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)
       
     
        //// Bulk tapgesture value
        
        
        
        let BulkTapone = UITapGestureRecognizer(target: self, action: #selector(self.BulktapSingel(_:)))
        Bulkfirstviewone.addGestureRecognizer(BulkTapone)
        BulkTapone.delegate = self as? UIGestureRecognizerDelegate
        Bulkfirstviewone.isUserInteractionEnabled = true
        BulkTapone.numberOfTapsRequired = 1
        BulkTapone.numberOfTouchesRequired = 1
        
        
        
        
        let BulkTapTwo = UITapGestureRecognizer(target: self, action: #selector(self.BulktaptwoSingel(_:)))
        Bulksecondview.addGestureRecognizer(BulkTapTwo)
        BulkTapTwo.delegate = self as? UIGestureRecognizerDelegate
        Bulksecondview.isUserInteractionEnabled = true
        BulkTapTwo.numberOfTapsRequired = 1
        BulkTapTwo.numberOfTouchesRequired = 1
        
        let BulkTapThree = UITapGestureRecognizer(target: self, action: #selector(self.BulktapthreeSingel(_:)))
        Bulkthirdview.addGestureRecognizer(BulkTapThree)
        BulkTapThree.delegate = self as? UIGestureRecognizerDelegate
        Bulkthirdview.isUserInteractionEnabled = true
        BulkTapThree.numberOfTapsRequired = 1
        BulkTapThree.numberOfTouchesRequired = 1
        
        
        
        let BulkTapFourValue = UITapGestureRecognizer(target: self, action: #selector(self.BulktapFourSingel(_:)))
        Bulkfourthview.addGestureRecognizer(BulkTapThree)
        BulkTapFourValue.delegate = self as? UIGestureRecognizerDelegate
        Bulkfourthview.isUserInteractionEnabled = true
        BulkTapFourValue.numberOfTapsRequired = 1
        BulkTapFourValue.numberOfTouchesRequired = 1
        
        
        bulktetxfiled.delegate = self
        
        bulktetxfiled.addTarget(self, action: #selector(comboViewController.textFieldDidChange(_:)), for: .editingChanged)
        
        bulktetxfiled.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClicked))
        bulktetxfiled.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        bulktetxfiled.layer.borderWidth = 2.0
        
        
        moqtextfiledvalue.delegate = self
        
        moqtextfiledvalue.addTarget(self, action: #selector(comboViewController.textFieldDidChange(_:)), for: .editingChanged)
        
        moqtextfiledvalue.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(doneButtonClicked))
        moqtextfiledvalue.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        moqtextfiledvalue.layer.borderWidth = 2.0
        
      
       
     ///// tap gesture of the uivew
        
        
        
         tap = UITapGestureRecognizer(target: self, action: #selector(self.CombohandleTap(_:)))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        self.combotopview.addGestureRecognizer(tap)
         self.combotopview.isUserInteractionEnabled = true
   
        rotationAngle = -90 * (.pi/180)
        let originalFrame1 = moqpcikertotalview1.frame
        moqpcikertotalview1.transform =  CGAffineTransform(rotationAngle: rotationAngle)
        moqpcikertotalview1.frame = originalFrame1
        modelData1 = ["0","1","2","3","4","5","6","7","8","9","10"]
        
        
         tapGR = UITapGestureRecognizer(target: self, action: #selector(comboViewController.MycombofinalhandleTap(_:)))
        tapGR.delegate = self
        tapGR.numberOfTapsRequired = 2
        combotopview.addGestureRecognizer(tapGR)
  
        
//        if (self.Bulkarray.count > 0 || self.LTSarray.count > 0 || self.SchemeSarray.count > 0 || self.comboSarray.count > 0)
        
        
        print(self.Bulkarray1.count)
        print(self.Ltsarray1.count)
        print(self.SchemeSarray1.count)
        print(self.Comboarray1.count)
  
        
      
        let deafults = UserDefaults.standard
        if let ComboDictfinalvalue:NSDictionary = deafults.value(forKey: "MycomboDictfinalvalue") as? NSDictionary
        {
            self.MycomboDictfinalvalue = ComboDictfinalvalue
            
               if let defaultsDictFinalvaluesingel:NSDictionary = self.MycomboDictfinalvalue.value(forKey: "default_data") as? NSDictionary
            {
                
                self.defaultsDictFinalvalue = defaultsDictFinalvaluesingel
                
                self.defaultsMoq =  self.defaultsDictFinalvalue.value(forKey:"MOQ")as!NSString
                
                self.defaultsMOQ_text =  self.defaultsDictFinalvalue.value(forKey:"MOQ_text")as!NSString
                
                self.defaultsMRP =  self.defaultsDictFinalvalue.value(forKey:"MRP")as!NSString
                self.defaultsPTR =  self.defaultsDictFinalvalue.value(forKey:"PTR")as!NSNumber
                
                self.defaultsmargin =  self.defaultsDictFinalvalue.value(forKey:"margin")as!NSString
                self.defaultsprice =  self.defaultsDictFinalvalue.value(forKey:"price")as!NSString
                self.defaultsprodId =  self.defaultsDictFinalvalue.value(forKey:"prodId")as!NSString
                
                self.withoutcomboprice.text =  self.defaultsprice as String
                self.withoutcombomrp.text =  self.defaultsMRP as String
                let attributeStringtwo =  NSMutableAttributedString(string:self.defaultsmargin as String)
                attributeStringtwo.addAttribute(NSAttributedStringKey.strikethroughStyle,
                                                value: NSUnderlineStyle.styleSingle.rawValue,
                                                range: NSMakeRange(0, attributeStringtwo.length))
                self.withoutcombomargin.attributedText = attributeStringtwo
            }
            
            
            
         //   self.defaultsDictFinalvalue =  self.MycomboDictfinalvalue.value(forKey:"default_data")as!NSDictionary
           
            
            ////combo dictionary
            
            if let defaultsDictFinalvaluetwo:NSDictionary = self.MycomboDictfinalvalue.value(forKey: "combo_data") as? NSDictionary
            {
                self.comboDictTotalvalue = defaultsDictFinalvaluetwo
                self.comboMRP =  self.comboDictTotalvalue.value(forKey:"MRP")as!NSNumber
                self.comboActualLSP =  self.comboDictTotalvalue.value(forKey:"ActualLSP")as!NSNumber
                self.comboLSPForCombo =  self.comboDictTotalvalue.value(forKey:"LSPForCombo")as!NSNumber
                self.comboMArginfinalvalue =  self.comboDictTotalvalue.value(forKey:"margin")as!NSString
                
                self.Moqstringfinalvalue =  self.comboDictTotalvalue.value(forKey:"MOQ")as!NSString
                self.quantityavaliabelstringfinalvalue =  self.comboDictTotalvalue.value(forKey:"QTYAvailable")as!NSString

               let stringTotalvaluefinal =  "\u{20B9}"
                
                 let crossone =  "X"
                
                let instockstring =  "instock"

                
            let totalvalue = String(format:"%@%@",stringTotalvaluefinal,self.comboMRP)
                
                
                self.combopricelabel.text = totalvalue
                self.combomragin.text =  self.comboMArginfinalvalue as String
                
            let totalvaluetwo = String(format:"%@%@",stringTotalvaluefinal,self.comboMRP)

                self.combomrp.text = totalvaluetwo
                
        let QuantityToatalstring = String(format:"%@ %@", self.Moqstringfinalvalue,crossone)
       
let InstackTotalstring = String(format:"%@ %@",self.Moqstringfinalvalue,instockstring)
        self.crosslabelfinal.text = QuantityToatalstring
        self.Onetwentyfiveinstacklabel.text = InstackTotalstring
            }

            if let defaultsDictFinalvaluetwo:NSArray = self.MycomboDictfinalvalue.value(forKey: "subProdList") as? NSArray
            {
                self.subDictfinalvalue = defaultsDictFinalvaluetwo
                self.CollectionviewTitlename =  self.subDictfinalvalue.value(forKey:"name")as![String]
                self.CollectionviewMoq =  self.subDictfinalvalue.value(forKey:"MOQ")as![String]
                self.CollectionviewMRP =  self.subDictfinalvalue.value(forKey:"MRP")as![String]
                self.CollectionviewMaxQty =  self.subDictfinalvalue.value(forKey:"MaxQty")as![String]
                self.CollectionviewMinQty =  self.subDictfinalvalue.value(forKey:"MinQty")as![String]
                self.CollectionviewPTR =  self.subDictfinalvalue.value(forKey:"PTR")as![NSNumber]
                self.TotalQuantityfinalvalue =  self.subDictfinalvalue.value(forKey:"totalQty")as![NSNumber]
                
                self.SubcomboprodId =  self.subDictfinalvalue.value(forKey:"prodId")as![String]
            }
        }
        if self.Comboarray1.count > 0
        {
            self.collectionarray.append("COMBO")
            
        }
        if self.Bulkarray1.count > 0
        {
            self.collectionarray.append("BULK")
            
        }
        if self.Ltsarray1.count > 0
        {
            self.collectionarray.append("LTS")
            
        }
        
        if self.SchemeSarray1.count > 0
        {
            self.collectionarray.append("OFFER")
            
        }
        
        if self.Moqarrayone.count > 0
        {
            self.collectionarray.append("MOQ")
        }
     
        if collectionarray [0] == "COMBO"
        {
            self.combofirstviewone.isHidden = false
            if collectionarray [0] == "BULK"
            {
                self.combothirdviewone.isHidden = false
            }
            else
            {
                self.combothirdviewone.isHidden = true
            }
        }
        if collectionarray [0] == "LTS"
        {
            self.combofourthviewone.isHidden = false
        }
        if collectionarray [0] == "OFFER"
        {
            self.combothirdviewone.isHidden = false
            self.combosecondviewtwo.isHidden = false

        }
        
        if collectionarray [0] == "BULK"
        {
            self.combothirdviewone.isHidden = false
        }
    
        if let Mymoq_calcfinalTotalvalue:String = deafults.value(forKey: "Mymoq_calc") as? String
        {
            
            self.moqlabeltwo.text = Mymoq_calcfinalTotalvalue as String
            let valuefinal = Int(Mymoq_calcfinalTotalvalue)
            if valuefinal != nil
            {
                let billBeforeTax = valuefinal as! Int
                let taxPercentage = 12
                let tax = billBeforeTax * taxPercentage
                let strtwovalue:String = String(describing: tax)
                let total = NSString(format:"%@%@",strtwovalue,"Picks")
              self.moqtotalpickslabel.text = total as String
                let x:Int = valuefinal!
                var str:String = String(describing: x)
                print(str)
                if str  >= "36"
                {
                    self.view.makeToast("This product has purchase limit of 36 QTY")
                }
            }
            
        }
        if let MyvaluefinalTotal:String = deafults.value(forKey: "Myvaluefinal") as? String
        {
            self.moqinstacklabel.text = MyvaluefinalTotal
            self.bulkinstacklabelfinal.text = MyvaluefinalTotal
        }
     
        var Bulkbulk_MOQ_textyone = [String]()
        
        
        
        if let Bulkpricefinal:[String] = self.Bulkarray1.value(forKey: "price") as? [String]
        {
            
            self.Bulkprice = Bulkpricefinal
        }
        if let Bulkbuyonefinal:[String] = self.Bulkarray1.value(forKey: "buy") as? [String]
        {
            
            self.Bulkbuyone = Bulkbuyonefinal
        }
        
        if let Bulkbulk_idonefinal:[String] = self.Bulkarray1.value(forKey: "bulk_id") as? [String]
        {
            self.Bulkbulk_idone = Bulkbulk_idonefinal
            print(self.Bulkbulk_idone)
            if self.Bulkbulk_idone.count > 0
            {
                self.bulk_id =  self.Bulkbulk_idone[0]
            }
        }
        
        if let Bulkbulk_min_qtyonefinal:[String] = self.Bulkarray1.value(forKey: "min_qty") as? [String]
        {
            
            self.Bulkbulk_min_qtyone = Bulkbulk_min_qtyonefinal
        }
        
        if let Bulkbulk_max_qtyonefinal:[String] = self.Bulkarray1.value(forKey: "max_qty") as? [String]
        {
            
            self.Bulkbulk_max_qtyyone = Bulkbulk_max_qtyonefinal
        }
        

        if let Bulkbulk_MOQyonefinal:[String] = self.Bulkarray1.value(forKey: "MOQ") as? [String]
        {
            
            self.Bulkbulk_MOQyone = Bulkbulk_MOQyonefinal
        }
        if let Bulkbulk_MOQ_textyonefinal:[String] = self.Bulkarray1.value(forKey: "MOQ_text") as? [String]
        {
            
            if self.Bulkbulk_MOQyone.count > 0
            {
                self.Bulkbulk_MOQ_textyone = Bulkbulk_MOQ_textyonefinal
                let stringfinalavlue = NSString(format:"%@%@%@","Minimum Order Quantity:",self.Bulkbulk_MOQyone[0],self.Bulkbulk_MOQ_textyone[0],"x")
                
                
                self.Bulkminimumorder.text = stringfinalavlue as String
                
                self.MoqMimiumordrQuantityFinalavlue  = self.Bulkbulk_MOQyone[0]
            }
            
        }

      
        
        
        
      if self.Bulkarray1.count > 0
        {
            self.combosecondviewfinal.isHidden = false
            self.Bulkfirstviewone.layer.borderWidth = 1.0
            self.Bulkfirstviewone.layer.cornerRadius = 8.0
            self.Bulkfirstviewone.layer.borderColor = UIColor.red.cgColor
            self.Bulkfirstviewone.layer.masksToBounds = true
            
            /// firstviewone condition
            
            self.Bulksecondview.layer.borderWidth = 1.0
            self.Bulksecondview.layer.cornerRadius = 8.0
            self.Bulksecondview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
            
            self.Bulksecondview.layer.masksToBounds = true
            
            self.Bulkthirdview.layer.borderWidth = 1.0
            self.Bulkthirdview.layer.cornerRadius = 8.0
            self.Bulkthirdview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
            self.Bulkthirdview.layer.masksToBounds = true
        
            self.Bulkfourthview.layer.borderWidth = 1.0
            self.Bulkfourthview.layer.cornerRadius = 8.0
            self.Bulkfourthview.layer.masksToBounds = true
            self.Bulkfourthview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor

            
            if self.Bulkprice.count == 1
            {
                self.Bulkfirstviewone.isHidden = false
                self.Bulksecondview.isHidden = true
                self.Bulkthirdview.isHidden = true
                self.Bulkfourthview.isHidden = true

                self.bulkfirstbuttonone.setTitle(self.Bulkprice[0], for:.normal)
                self.bulkfirstbuttontwo.setTitle(self.Bulkbuyone[0], for:.normal)

            }
            if self.Bulkprice.count == 2
            {
                self.Bulkfirstviewone.isHidden = false
                self.Bulksecondview.isHidden = false
                self.Bulkthirdview.isHidden = true
                self.Bulkfourthview.isHidden = true
                self.bulksecondbuttonone.setTitle(self.Bulkprice[1], for:.normal)
                self.bulksecondbuttontwo.setTitle(self.Bulkbuyone[1], for:.normal)

            }
            if self.Bulkprice.count == 3
            {
                self.Bulkfirstviewone.isHidden = false
                self.Bulksecondview.isHidden = false
                self.Bulkthirdview.isHidden = false
                self.Bulkfourthview.isHidden = true
            self.bulkthirdbuttonone.setTitle(self.Bulkprice[2], for:.normal)
            self.bulkthirdbuttontwo.setTitle(self.Bulkbuyone[2], for:.normal)
            }
            if self.Bulkprice.count == 4
            {
                self.Bulkfirstviewone.isHidden = false
                self.Bulksecondview.isHidden = false
                self.Bulkthirdview.isHidden = false
                self.Bulkfourthview.isHidden = false
                self.bulkfourthbuttonone.setTitle(self.Bulkprice[3], for:.normal)
                self.bulkfourthbuttontwo.setTitle(self.Bulkbuyone[3], for:.normal)
               
            }
        }
        
       
        if Bulkbulk_MOQyone.count > 0
        {
            let Bulkvaluefinal = Int(Bulkbulk_MOQyone[0])
            if Bulkvaluefinal != nil
            {
                let billBeforeTax = Bulkvaluefinal as! Int
                let taxPercentage = Int(self.Bulkbulk_min_qtyone[0])
                let tax = billBeforeTax * taxPercentage!
                let strtwovalue:String = String(describing: tax)
                let total = NSString(format:"%@%@",strtwovalue,"Picks")
                Bulktotalitemslabel.text = total as String
                let x:Int = Bulkvaluefinal!
                var str:String = String(describing: x)
                print(str)
                if str  >= "36"
                {
                    self.view.makeToast("This product has purchase limit of 36 QTY")
                }
            }
        }
       
        
    }
    
    @objc func MycombofinalhandleTap(_ gesture: UITapGestureRecognizer)
    {
        print("doubletapped")
//        self.Combofinalview.isHidden = true
         self.collectionarray = [""]
        self.Bulkarray1 = [""]
        self.Ltsarray1 = [""]
        self.SchemeSarray1 = [""]
        self.Comboarray1 = [""]

      self.view.removeFromSuperview()
    }
    @objc func CombohandleTap(_ sender: UITapGestureRecognizer)
    {
    //    self.Combofinalview.isHidden = true

   self.view.removeFromSuperview()
        
        self.collectionarray = [""]
        self.Bulkarray1 = [""]
        self.Ltsarray1 = [""]
        self.SchemeSarray1 = [""]
        self.Comboarray1 = [""]
        
    }
    /// Bulk tapgesturevalue
    
    
    @objc func BulktapSingel(_ sender: UITapGestureRecognizer)
    {
        self.Bulkfirstviewone.layer.cornerRadius = 5.0
        self.Bulkfirstviewone.layer.borderWidth = 2.0
        self.Bulkfirstviewone.layer.borderColor = UIColor.red.cgColor
        
        self.Bulksecondview.layer.cornerRadius = 5.0
        self.Bulksecondview.layer.borderWidth = 2.0
        self.Bulksecondview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        
        self.Bulkthirdview.layer.cornerRadius = 5.0
        self.Bulkthirdview.layer.borderWidth = 2.0
        self.Bulkthirdview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        
        self.Bulkfourthview.layer.cornerRadius = 5.0
        self.Bulkfourthview.layer.borderWidth = 2.0
        self.Bulkfourthview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        
        
        
        self.bulkfirstbuttonone.setTitleColor(UIColor.red, for:.normal)
        self.bulkfirstbuttontwo.setTitleColor(UIColor.red, for:.normal)
        
        self.bulksecondbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulksecondbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        
        
        self.bulkthirdbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulkthirdbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
     
        self.bulkfourthbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulkfourthbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        
        let stringfinalavlue = NSString(format:"%@%@%@","Minimum Order Quantity:",self.Bulkbulk_MOQyone[0],self.Bulkbulk_MOQ_textyone[0],"x")
        
        
          self.Bulkminimumorder.text = stringfinalavlue as String
        let value = self.Bulkbulk_min_qtyone[0]
          self.Bulkminimumpicks.text  = value as String
        
        self.MoqMimiumordrQuantityFinalavlue  = self.Bulkbulk_MOQyone[0]
        
        self.bulk_id =  self.Bulkbulk_idone[0]

      
        
        let valuefinal =  self.Bulkbulk_MOQyone[0]
        if valuefinal != nil
        {
            let billBeforeTax = valuefinal as! Int
            let taxPercentage = Int(self.Bulkbulk_min_qtyone[0])
            let tax = billBeforeTax * taxPercentage!
            let strtwovalue:String = String(describing: tax)
            let total = NSString(format:"%@%@",strtwovalue,"Picks")
            Bulktotalitemslabel.text = total as String
            let x:Int = Int(valuefinal)!
            
            var str:String = String(describing: x)
            print(str)
            if str  >= "36"
            {
                self.view.makeToast("This product has purchase limit of 36 QTY")
            }
        }
        
    }
    
    @objc func BulktaptwoSingel(_ sender: UITapGestureRecognizer)
    {
        self.Bulksecondview.layer.cornerRadius = 5.0
        self.Bulksecondview.layer.borderWidth = 2.0
        self.Bulksecondview.layer.borderColor = UIColor.red.cgColor
        
        self.Bulkfirstviewone.layer.cornerRadius = 5.0
        self.Bulkfirstviewone.layer.borderWidth = 2.0
        self.Bulkfirstviewone.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor

        
        self.Bulkthirdview.layer.cornerRadius = 5.0
        self.Bulkthirdview.layer.borderWidth = 2.0
        self.Bulkthirdview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        
        self.Bulkfourthview.layer.cornerRadius = 5.0
        self.Bulkfourthview.layer.borderWidth = 2.0
        self.Bulkfourthview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        
        self.bulksecondbuttonone.setTitleColor(UIColor.red, for:.normal)
        self.bulksecondbuttontwo.setTitleColor(UIColor.red, for:.normal)
        
        
        self.bulkthirdbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulkthirdbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
     
        self.bulkfirstbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulkfirstbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulkfourthbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulkfourthbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        
        let stringfinalavlue = NSString(format:"%@%@%@","Minimum Order Quantity:",self.Bulkbulk_MOQyone[1],self.Bulkbulk_MOQ_textyone[1],"x")
        
        
            self.Bulkminimumorder.text  = stringfinalavlue as String
        
        
        let value = self.Bulkbulk_min_qtyone[1]
        
         self.Bulkminimumpicks.text  = value as String

        
        let valuefinal =  self.Bulkbulk_MOQyone[1]
        
        if valuefinal != nil
        {
            let billBeforeTax = valuefinal as! Int
            let taxPercentage = Int(self.Bulkbulk_min_qtyone[1])
            let tax = billBeforeTax * taxPercentage!
            let strtwovalue:String = String(describing: tax)
            let total = NSString(format:"%@%@",strtwovalue,"Picks")
            Bulktotalitemslabel.text = total as String
            let x:Int = Int(valuefinal)!
            var str:String = String(describing: x)
            print(str)
            if str  >= "36"
            {
                self.view.makeToast("This product has purchase limit of 36 QTY")
            }
        }
        
        self.bulk_id =  self.Bulkbulk_idone[1]

        
        self.MoqMimiumordrQuantityFinalavlue  = self.Bulkbulk_MOQyone[1]
    }
    
    
    @objc func BulktapthreeSingel(_ sender: UITapGestureRecognizer)
    {
        self.Bulkthirdview.layer.cornerRadius = 5.0
        self.Bulkthirdview.layer.borderWidth = 2.0
        self.Bulkthirdview.layer.borderColor = UIColor.red.cgColor
        
        
        
        
        self.Bulksecondview.layer.cornerRadius = 5.0
        self.Bulksecondview.layer.borderWidth = 2.0
        self.Bulksecondview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        
        self.Bulkfirstviewone.layer.cornerRadius = 5.0
        self.Bulkfirstviewone.layer.borderWidth = 2.0
        self.Bulkfirstviewone.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
 
        
        self.Bulkfourthview.layer.cornerRadius = 5.0
        self.Bulkfourthview.layer.borderWidth = 2.0
        self.Bulkfourthview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        
        
        
        
        
        self.bulkthirdbuttonone.setTitleColor(UIColor.red, for:.normal)
        self.bulkthirdbuttontwo.setTitleColor(UIColor.red, for:.normal)
     
        self.bulksecondbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulksecondbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulkfirstbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulkfirstbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulkfourthbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulkfourthbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        
        let stringfinalavlue = NSString(format:"%@%@%@","Minimum Order Quantity:",self.Bulkbulk_MOQyone[2],self.Bulkbulk_MOQ_textyone[2],"x")
        
        
        self.Bulkminimumorder.text = stringfinalavlue as String
        
        let value = self.Bulkbulk_min_qtyone[2]
         self.Bulkminimumpicks.text  = value as String

        let valuefinal =  self.Bulkbulk_MOQyone[2]
        if valuefinal != nil
        {
            let billBeforeTax = valuefinal as! Int
            let taxPercentage = Int(self.Bulkbulk_min_qtyone[0])
            let tax = billBeforeTax * taxPercentage!
            let strtwovalue:String = String(describing: tax)
            let total = NSString(format:"%@%@",strtwovalue,"Picks")
           Bulktotalitemslabel.text = total as String
            let x:Int = Int(valuefinal)!
            var str:String = String(describing: x)
            print(str)
            if str  >= "36"
            {
                self.view.makeToast("This product has purchase limit of 36 QTY")
            }
        }
        
        self.MoqMimiumordrQuantityFinalavlue  = self.Bulkbulk_MOQyone[2]
        self.bulk_id =  self.Bulkbulk_idone[2]

    }
   
    @objc func BulktapFourSingel(_ sender: UITapGestureRecognizer)
    {
        self.Bulkfourthview.layer.cornerRadius = 5.0
        self.Bulkfourthview.layer.borderWidth = 2.0
        self.Bulkfourthview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        self.Bulkthirdview.layer.cornerRadius = 5.0
        self.Bulkthirdview.layer.borderWidth = 2.0
        self.Bulkthirdview.layer.borderColor = UIColor.red.cgColor
        
        
        self.Bulksecondview.layer.cornerRadius = 5.0
        self.Bulksecondview.layer.borderWidth = 2.0
        self.Bulksecondview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        
        self.Bulkfirstviewone.layer.cornerRadius = 5.0
        self.Bulkfirstviewone.layer.borderWidth = 2.0
        self.Bulkfirstviewone.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
  
        self.bulkfourthbuttonone.setTitleColor(UIColor.red, for:.normal)
        self.bulkfourthbuttontwo.setTitleColor(UIColor.red, for:.normal)
        
        
        self.bulksecondbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulksecondbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        
        self.bulkthirdbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulkthirdbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        
        self.bulkfourthbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulkfourthbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        
        let stringfinalavlue = NSString(format:"%@%@%@","Minimum Order Quantity:",self.Bulkbulk_MOQyone[3],self.Bulkbulk_MOQ_textyone[3],"x")
        self.Bulkminimumorder.text = stringfinalavlue as String
        let value = self.Bulkbulk_min_qtyone[3]
        self.Bulkminimumpicks.text = value as String

        let valuefinal =  self.Bulkbulk_MOQyone[2]
        if valuefinal != nil
        {
            let billBeforeTax = valuefinal as! Int
            
            let taxPercentage = Int(self.Bulkbulk_min_qtyone[0])
            let tax = billBeforeTax * taxPercentage!
            
            let strtwovalue:String = String(describing: tax)
            let total = NSString(format:"%@%@",strtwovalue,"Picks")
           Bulktotalitemslabel.text = total as String
            let x:Int = Int(valuefinal)!
            var str:String = String(describing: x)
            print(str)
            if str  >= "36"
            {
                self.view.makeToast("This product has purchase limit of 36 QTY")
            }
        }
        
        
        self.MoqMimiumordrQuantityFinalavlue  = self.Bulkbulk_MOQyone[3]
        
        self.bulk_id =  self.Bulkbulk_idone[3]

    }
    
    
    
    @objc func Handelcombofouris(_ sender: UITapGestureRecognizer)
    {
        self.viewfour.layer.cornerRadius = 5.0
        self.viewfour.layer.borderWidth = 2.0
        self.viewfour.layer.borderColor = UIColor.red.cgColor
        self.fourthbuttonone.setTitleColor(UIColor.red, for:.normal)
        self.fourthbuttontwo.setTitleColor(UIColor.red, for:.normal)
    }
    @objc func HandelcomboTwois(_ sender: UITapGestureRecognizer)
    {
        self.secondviewtwo.layer.cornerRadius = 5.0
        self.secondviewtwo.layer.borderWidth = 2.0
        self.secondviewtwo.layer.borderColor = UIColor.red.cgColor
        self.buttontwotwo.setTitleColor(UIColor.red, for:.normal)
        self.Buy30getbuttonone.setTitleColor(UIColor.red, for:.normal)
     
    }
    @objc func Handelcomboone(_ sender: UITapGestureRecognizer)
    {
      
        self.firstviewone.layer.cornerRadius = 5.0
        self.firstviewone.layer.borderWidth = 2.0
        self.firstviewone.layer.borderColor = UIColor.red.cgColor
        self.firstbuttonone.setTitleColor(UIColor.red, for:.normal)
        self.bytwentget.setTitleColor(UIColor.red, for:.normal)
    }
    
    
    @objc func HandelcomboThreeis(_ sender: UITapGestureRecognizer)
    {
        self.thirdviewfinal.layer.cornerRadius = 5.0
        self.thirdviewfinal.layer.borderWidth = 2.0
        self.thirdviewfinal.layer.borderColor = UIColor.red.cgColor
        self.thirdbuttonone.setTitleColor(UIColor.red, for:.normal)
        self.thirdbuttontwo.setTitleColor(UIColor.red, for:.normal)
   
    
    }
   
    @IBAction func firstbuttonone(_ sender: UIButton)
    {
        self.Bulkfirstviewone.layer.cornerRadius = 5.0
        self.Bulkfirstviewone.layer.borderWidth = 2.0
        self.Bulkfirstviewone.layer.borderColor = UIColor.red.cgColor
        
        self.Bulksecondview.layer.cornerRadius = 5.0
        self.Bulksecondview.layer.borderWidth = 2.0
        self.Bulksecondview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        
        self.Bulkthirdview.layer.cornerRadius = 5.0
        self.Bulkthirdview.layer.borderWidth = 2.0
        self.Bulkthirdview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        
        self.Bulkfourthview.layer.cornerRadius = 5.0
        self.Bulkfourthview.layer.borderWidth = 2.0
        self.Bulkfourthview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        
        
        
        self.bulkfirstbuttonone.setTitleColor(UIColor.red, for:.normal)
        self.bulkfirstbuttontwo.setTitleColor(UIColor.red, for:.normal)
        
        
        self.bulksecondbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulksecondbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        
        
        
        self.bulkthirdbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulkthirdbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
     
        self.bulkfourthbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulkfourthbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
     
        
   
    }
    
    
    @IBAction func secondofferbutton(_ sender: UIButton)
    {
        self.secondviewtwo.layer.cornerRadius = 5.0
        self.secondviewtwo.layer.borderWidth = 2.0
        self.secondviewtwo.layer.borderColor = UIColor.red.cgColor
        self.buttontwotwo.setTitleColor(UIColor.red, for:.normal)
        self.Buy30getbuttonone.setTitleColor(UIColor.red, for:.normal)
    }
    
    
    
    @IBAction func buttonthree(_ sender: UIButton)
    {
        
        self.thirdviewfinal.layer.cornerRadius = 5.0
        self.thirdviewfinal.layer.borderWidth = 2.0
        self.thirdviewfinal.layer.borderColor = UIColor.red.cgColor
        self.thirdbuttonone.setTitleColor(UIColor.red, for:.normal)
        self.thirdbuttontwo.setTitleColor(UIColor.red, for:.normal)
    }
    
    @IBAction func fourthbuttonone(_ sender: UIButton)
    {
        self.viewfour.layer.cornerRadius = 5.0
        self.viewfour.layer.borderWidth = 2.0
        self.viewfour.layer.borderColor = UIColor.red.cgColor
        self.fourthbuttonone.setTitleColor(UIColor.red, for:.normal)
        self.fourthbuttontwo.setTitleColor(UIColor.red, for:.normal)
    }
    
    
    
    //// Bulk buttons actions
    
    
    
    @IBAction func Mybulkfirstbutton(_ sender: UIButton)
    {
     
        self.Bulkfirstviewone.layer.cornerRadius = 5.0
        self.Bulkfirstviewone.layer.borderWidth = 2.0
        self.Bulkfirstviewone.layer.borderColor = UIColor.red.cgColor
        
        self.Bulksecondview.layer.cornerRadius = 5.0
        self.Bulksecondview.layer.borderWidth = 2.0
        self.Bulksecondview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        
        self.Bulkthirdview.layer.cornerRadius = 5.0
        self.Bulkthirdview.layer.borderWidth = 2.0
        self.Bulkthirdview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        
        self.Bulkfourthview.layer.cornerRadius = 5.0
        self.Bulkfourthview.layer.borderWidth = 2.0
        self.Bulkfourthview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        
        
        
        self.bulkfirstbuttonone.setTitleColor(UIColor.red, for:.normal)
        self.bulkfirstbuttontwo.setTitleColor(UIColor.red, for:.normal)
        
        
        self.bulksecondbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulksecondbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        
        
        
        self.bulkthirdbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulkthirdbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        
        self.bulkfourthbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulkfourthbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        
        let stringfinalavlue = NSString(format:"%@%@%@","Minimum Order Quantity:",self.Bulkbulk_MOQyone[0],self.Bulkbulk_MOQ_textyone[0],"x")
        
        
        self.Bulkminimumorder.text = stringfinalavlue as String
     
        let value = self.Bulkbulk_min_qtyone[0]
           self.Bulkminimumpicks.text = value as String
        
        let valuefinal =  self.Bulkbulk_MOQyone[0]
        if valuefinal != nil
        {
            let billBeforeTax = Int(valuefinal)
            let taxPercentage = Int(self.Bulkbulk_min_qtyone[0])
            let tax = billBeforeTax! * taxPercentage!
            let strtwovalue:String = String(describing: tax)
            let total = NSString(format:"%@%@",strtwovalue,"Picks")
            Bulktotalitemslabel.text = total as String
            let x:Int = Int(valuefinal)!
            var str:String = String(describing: x)
            print(str)
            if str  >= "36"
            {
                self.view.makeToast("This product has purchase limit of 36 QTY")
            }
        }
        
        self.MoqMimiumordrQuantityFinalavlue  = self.Bulkbulk_MOQyone[0]
        
        self.bulk_id =  self.Bulkbulk_idone[0]

    }
    
    
    @IBAction func Mybulksecondbutton(_ sender: UIButton)
    {
        self.bulkfirstbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulkfirstbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
    
        self.bulksecondbuttonone.setTitleColor(UIColor.red, for:.normal)
        self.bulksecondbuttontwo.setTitleColor(UIColor.red, for:.normal)
        
        self.bulkthirdbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulkthirdbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        
        self.bulkfourthbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulkfourthbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        
        
        self.Bulkfirstviewone.layer.cornerRadius = 5.0
        self.Bulkfirstviewone.layer.borderWidth = 2.0
        self.Bulkfirstviewone.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        
        self.Bulksecondview.layer.cornerRadius = 5.0
        self.Bulksecondview.layer.borderWidth = 2.0
        self.Bulksecondview.layer.borderColor = UIColor.red.cgColor
        
        self.Bulkthirdview.layer.cornerRadius = 5.0
        self.Bulkthirdview.layer.borderWidth = 2.0
        self.Bulkthirdview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        
        self.Bulkfourthview.layer.cornerRadius = 5.0
        self.Bulkfourthview.layer.borderWidth = 2.0
        self.Bulkfourthview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        
        let stringfinalavlue = NSString(format:"%@%@%@","Minimum Order Quantity:",self.Bulkbulk_MOQyone[1],self.Bulkbulk_MOQ_textyone[1],"x")
        
        
        self.Bulkminimumorder.text = stringfinalavlue as String
        let value = self.Bulkbulk_min_qtyone[1]
         self.Bulkminimumpicks.text = value as String
        let valuefinal =  self.Bulkbulk_MOQyone[1]
        if valuefinal != nil
        {
            let billBeforeTax = Int(valuefinal)
            let taxPercentage = Int(self.Bulkbulk_min_qtyone[1])
            let tax = billBeforeTax! * taxPercentage!
            let strtwovalue:String = String(describing: tax)
            let total = NSString(format:"%@%@",strtwovalue,"Picks")
           Bulktotalitemslabel.text = total as String
            let x:Int = Int(valuefinal)!
            var str:String = String(describing: x)
            print(str)
            if str  >= "36"
            {
                self.view.makeToast("This product has purchase limit of 36 QTY")
            }
        }
        self.MoqMimiumordrQuantityFinalavlue  = self.Bulkbulk_MOQyone[1]
        
        self.bulk_id =  self.Bulkbulk_idone[1]

    }
    
    
    
    @IBAction func Mybulkthirdbutton(_ sender: UIButton)
    {
        self.bulkfirstbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulkfirstbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        
        self.bulkthirdbuttonone.setTitleColor(UIColor.red, for:.normal)
        self.bulkthirdbuttontwo.setTitleColor(UIColor.red, for:.normal)
        
        self.bulkfourthbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulkfourthbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        
        self.bulksecondbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulksecondbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        
        self.Bulkfirstviewone.layer.cornerRadius = 5.0
        self.Bulkfirstviewone.layer.borderWidth = 2.0
        self.Bulkfirstviewone.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        
        self.Bulksecondview.layer.cornerRadius = 5.0
        self.Bulksecondview.layer.borderWidth = 2.0
        self.Bulksecondview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        
        self.Bulkthirdview.layer.cornerRadius = 5.0
        self.Bulkthirdview.layer.borderWidth = 2.0
        self.Bulkthirdview.layer.borderColor = UIColor.red.cgColor

        
        self.Bulkfourthview.layer.cornerRadius = 5.0
        self.Bulkfourthview.layer.borderWidth = 2.0
        self.Bulkfourthview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        
        let stringfinalavlue = NSString(format:"%@%@%@","Minimum Order Quantity:",self.Bulkbulk_MOQyone[2],self.Bulkbulk_MOQ_textyone[2],"x")
        
        
         self.Bulkminimumorder.text  = stringfinalavlue as String
        
        let value = self.Bulkbulk_min_qtyone[2]
         self.Bulkminimumpicks.text = value as String
        let valuefinal =  self.Bulkbulk_MOQyone[2]
        if valuefinal != nil
        {
            let billBeforeTax = Int(valuefinal)
            let taxPercentage = Int(self.Bulkbulk_min_qtyone[2])
            let tax = billBeforeTax! * taxPercentage!
            let strtwovalue:String = String(describing: tax)
            let total = NSString(format:"%@%@",strtwovalue,"Picks")
           Bulktotalitemslabel.text = total as String
            let x:Int = Int(valuefinal)!
            var str:String = String(describing: x)
            print(str)
            if str  >= "36"
            {
                self.view.makeToast("This product has purchase limit of 36 QTY")
            }
        }
        self.MoqMimiumordrQuantityFinalavlue  = self.Bulkbulk_MOQyone[2]
        
        self.bulk_id =  self.Bulkbulk_idone[2]

    }
    
    
    @IBAction func Mybulkfourthbutton(_ sender: UIButton)
    {
        
        
        self.Bulkfirstviewone.layer.cornerRadius = 5.0
        self.Bulkfirstviewone.layer.borderWidth = 2.0
        self.Bulkfirstviewone.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        
        self.Bulksecondview.layer.cornerRadius = 5.0
        self.Bulksecondview.layer.borderWidth = 2.0
        self.Bulksecondview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        
        self.Bulkthirdview.layer.cornerRadius = 5.0
        self.Bulkthirdview.layer.borderWidth = 2.0
        self.Bulkthirdview.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
        
        
        self.Bulkfourthview.layer.cornerRadius = 5.0
        self.Bulkfourthview.layer.borderWidth = 2.0
        self.Bulkfourthview.layer.borderColor = UIColor.red.cgColor
        
        self.bulkfirstbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulkfirstbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        
        self.bulkthirdbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulkthirdbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        
        self.bulkfourthbuttonone.setTitleColor(UIColor.red, for:.normal)
        self.bulkfourthbuttontwo.setTitleColor(UIColor.red, for:.normal)
        
        self.bulksecondbuttonone.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        self.bulksecondbuttontwo.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
        
        let stringfinalavlue = NSString(format:"%@%@%@","Minimum Order Quantity:",self.Bulkbulk_MOQyone[3],self.Bulkbulk_MOQ_textyone[3],"x")
        
        
        self.Bulkminimumorder.text = stringfinalavlue as String
        
        let value = self.Bulkbulk_min_qtyone[3]
           self.Bulkminimumpicks.text = value
        
        
        let valuefinal =  self.Bulkbulk_MOQyone[2]
        if valuefinal != nil
        {
            let billBeforeTax = Int(valuefinal)
            let taxPercentage = Int(self.Bulkbulk_min_qtyone[3])
            let tax = billBeforeTax! * taxPercentage!
            let strtwovalue:String = String(describing: tax)
            let total = NSString(format:"%@%@",strtwovalue,"Picks")
           Bulktotalitemslabel.text = total as String
            let x:Int = Int(valuefinal)!
            var str:String = String(describing: x)
            print(str)
            if str  >= "36"
            {
                self.view.makeToast("This product has purchase limit of 36 QTY")
            }
        }
        
        self.MoqMimiumordrQuantityFinalavlue  = self.Bulkbulk_MOQyone[3]
        self.bulk_id =  self.Bulkbulk_idone[3]

        
    }
   
    
    @objc func doneButtonClicked(_ sender: Any)
    {
        singllinetextfiled.resignFirstResponder()
        moqtextfiledvalue.resignFirstResponder()

    }
    @objc func textFieldDidChange(_ textField: UITextField?)
    {
        if textField == singllinetextfiled
        {
            typeoderlabel.text = singllinetextfiled.text
        }
        else if textField == textfiledofertwo
        {
            maximumquantitylabel.text = textfiledofertwo.text
            
            let value = textfiledofertwo.text!
            
            let valuefinal = Int(value)
            
            if valuefinal != nil
            {
                let billBeforeTax = valuefinal as! Int
                let taxPercentage = 12
                let tax = billBeforeTax * taxPercentage
                 let strtwovalue:String = String(describing: tax)
                let total = NSString(format:"%@%@",strtwovalue,"Picks")
                Bulktotalitemslabel.text = total as String
                
                let x:Int = valuefinal!
                var str:String = String(describing: x)
                
                print(str)
                
                if str  >= "36"
                {
                    self.view.makeToast("This product has purchase limit of 36 QTY")
                }
            }
        }
        else if textField == bulktetxfiled
        {
            Bulkminimumpicks.text = bulktetxfiled.text
            self.MoqMimiumordrQuantityFinalavlue = bulktetxfiled.text!
            
            let value = self.Bulkbulk_MOQyone[0]
            let valuefinal = Int(value)
            if valuefinal != nil
            {
                let billBeforeTax = valuefinal as! Int
                let taxPercentage = Int(bulktetxfiled.text!)
                let tax = billBeforeTax * taxPercentage!
                let strtwovalue:String = String(describing: tax)
                let total = NSString(format:"%@%@",strtwovalue,"Picks")
                Bulktotalitemslabel.text = total as String
                let x:Int = valuefinal!
                let str:String = String(describing: x)
                
                print(str)
                
                if valuefinal!  > 36
                {
                    self.view.makeToast("This product has purchase limit of 36 QTY")
                }
            }
        }
        else if textField == moqtextfiledvalue
        {
            moqlabeltwo.text = moqtextfiledvalue.text
            let value = moqtextfiledvalue.text!
            let valuefinal = Int(value)
            if valuefinal != nil
            {
                let billBeforeTax = valuefinal as! Int
                let taxPercentage = 12
                let tax = billBeforeTax * taxPercentage
                let strtwovalue:String = String(describing: tax)
                let total = NSString(format:"%@%@",strtwovalue,"Picks")
                moqtotalpickslabel.text = total as String
                let x:Int = valuefinal!
                var str:String = String(describing: x)
                print(str)
                if str  >= "36"
                {
                    self.view.makeToast("This product has purchase limit of 36 QTY")
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    @IBAction func Add(_ sender: UIButton)
    {
      let cartview = self.storyboard?.instantiateViewController(withIdentifier:"CartViewController")as!CartViewController
        self.present(cartview, animated: true, completion:nil)
    }
    
    @IBAction func Backbutton(_ sender: UIButton)
    {
        self.comboview.isHidden = true
        self.view.removeFromSuperview()
    }
    
    @IBAction func dropdownbutton(_ sender: Any)
    {
        if drop.tag == 0
        {
            self.dropdownview.isHidden = false
            drop.tag = 1
        }
        else if drop.tag == 1
        {
            self.dropdownview.isHidden = true

            drop.tag = 0
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
            return  self.soldbytabelarray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        let cell:UITableViewCell = self.dropdowntabelview.dequeueReusableCell(withIdentifier:cellReuseIdentifier)as!UITableViewCell
        
        cell.textLabel?.text = self.soldbytabelarray[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Arial", size: 14.5)!
        
        cell.textLabel?.textColor =  UIColor.black
        return cell
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        DispatchQueue.main.async {
            self.namelabel.text = self.soldbytabelarray[indexPath.row]
            self.titleofthelabel.text = self.soldbytabelarray[indexPath.row]

            self.dropdownview.isHidden = true
            let cell:UITableViewCell = self.dropdowntabelview.dequeueReusableCell(withIdentifier:self.cellReuseIdentifier)as!UITableViewCell
            cell.backgroundColor = UIColor.white
            self.soldbytabelarray = ["NumberMall","Venkata Ramana Traders"]
          let titlestring =  self.soldbytabelarray[indexPath.row]
            
            if titlestring == "NumberMall"
            {
                self.drop.frame = CGRect(x: 295, y: self.drop.frame.origin.y, width: self.drop.frame.size.width, height: self.drop.frame.size.height)
                
                self.Brandcontrollededistbutor.frame = CGRect(x:90, y: self.Brandcontrollededistbutor.frame.origin.y, width: self.Brandcontrollededistbutor.frame.size.width, height: self.Brandcontrollededistbutor.frame.size.height)
                  self.drop.tag = 0
            }
            if titlestring == "Venkata Ramana Traders"
            {
                 self.drop.frame = CGRect(x:335, y: self.drop.frame.origin.y, width: self.drop.frame.size.width, height: self.drop.frame.size.height)
                 self.Brandcontrollededistbutor.frame = CGRect(x:170, y: self.Brandcontrollededistbutor.frame.origin.y, width: self.Brandcontrollededistbutor.frame.size.width, height: self.Brandcontrollededistbutor.frame.size.height)
            self.drop.tag = 0
           }
    }
    }
  
 
    
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        if pickerView == moqpcikertotalview1
        {
            return 1
        }
        else
        {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == moqpcikertotalview1
       {
        return modelData1.count
      }
      else
       {
        return modelData.count
        }
        
        
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        if pickerView == moqpcikertotalview1
        {
            return 80
        }
        else
        {
            return 80
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        
        if pickerView == moqpcikertotalview1
        {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
            let middleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
            middleLabel.text = modelData1[row]
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
            
            return view        }
        else
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
            
            return view        }
        
        
        
       
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if pickerView == moqpcikertotalview1
        {

            moqpcikertotalview1.selectRow(row, inComponent:0, animated: true)
            return modelData1[row] as String
        }
        else
        {
            pickerView.selectRow(row, inComponent:0, animated: true)
            return modelData[row] as String
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
        if pickerView == moqpcikertotalview1
        {
            let finalstring = modelData1[row]
            if finalstring == "10"
            {
                moqviewfinal.isHidden = false
                moqpickerview1.isHidden = true
            }
            moqlabeltwo.text = modelData1[row]
            
            self.MoqPickerstring = modelData1[row]
            
            di_count = row
            moqpcikertotalview1.reloadAllComponents()
            
            moqtextfiledvalue.text = self.MoqPickerstring
            
            
            let valuefinal = Int(self.MoqPickerstring)
            if valuefinal != nil
            {
                let billBeforeTax = valuefinal as! Int
                let taxPercentage = 12
                let tax = billBeforeTax * taxPercentage
                let strtwovalue:String = String(describing: tax)
                let total = NSString(format:"%@%@",strtwovalue,"Picks")
                moqtotalpickslabel.text = total as String
                let x:Int = valuefinal!
                var str:String = String(describing: x)
                print(str)
                if str  >= "36"
                {
                    self.view.makeToast("This product has purchase limit of 36 QTY")
                }
            }
  
        }
        else
        {
            
            let finalstring = modelData[row]
            if finalstring == "10"
            {
                tetxfiledview.isHidden = false
                Maximumpickervi.isHidden = true
                
            }
            typeoderlabel.text = modelData[row]
            
            self.Pickerstring = modelData[row]
            
            di_count = row
            pickerView.reloadAllComponents()
        }
        
       
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == moqpcikertotalview1
        {
            moqpcikertotalview1.reloadAllComponents()

        }
        else
        {
            pickerView.reloadAllComponents()
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if collectionView == combocolletcionview
        {
            return self.collectionarray.count
            
        }
        else if collectionView ==  combocollectionviewthree
        {
          //  return self.comboproductName.count
            return self.CollectionviewTitlename.count

            
        }
        else{
            // return self.comboooferimage.count
            return self.Comboarray1.count
            
            //             self.Comboarray1
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if collectionView == combocolletcionview
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"ComboCollectionViewCell", for: indexPath as IndexPath) as!ComboCollectionViewCell
            cell.combolabel.text = self.collectionarray[indexPath.item]
            if selectedIndex == nil
            {
                if indexPath.row == 0
                {
                    cell.combolabel.textColor = UIColor.red
                    cell.backgroundColor = UIColor.white
                    cell.comboviewtwo.backgroundColor = UIColor.red
                }
            }
                
            else
            {
                if indexPath.row == selectedIndex
                {
                    cell.combolabel.textColor = UIColor.red
                    cell.backgroundColor = UIColor.white
                    cell.comboviewtwo.backgroundColor = UIColor.red
                    
                }
                else{
                    cell.combolabel.textColor = UIColor.black
                    cell.backgroundColor = UIColor.lightGray
                    cell.comboviewtwo.backgroundColor = UIColor.comboviewbackground()
                    
                    
                }
            }
            return cell
        }
         
        else if collectionView == combocollectionviewthree
        {
            let cell = combocollectionviewthree.dequeueReusableCell(withReuseIdentifier:"LongCollectionViewCell", for: indexPath as IndexPath) as!LongCollectionViewCell
            cell.comboviewfinal.layer.cornerRadius = 5.0
            cell.comboviewfinal.layer.borderWidth = 2.0
             cell.comboviewfinal.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
            cell.NAmeoftheproduct.text = self.CollectionviewTitlename[indexPath.item]
            let Comboratefinalvalue
                = self.CollectionviewPTR[indexPath.item]
            
            cell.productrate.text = Comboratefinalvalue.stringValue
            
//
//            let a: Double = 4
//            let b = 5.0
//            let c = a * b
//
//            var billBeforeTax = 100
//            var taxPercentage = 0.12
//            var tax = billBeforeTax * taxPercentage
//
            
            let Quantityfinalvalue = "Qty:"
            let Quantitytwo = self.CollectionviewMoq[indexPath.row]
            let Quantithree = "pcs"
            let quantityfour = "X"
           let calcal = self.TotalQuantityfinalvalue[indexPath.row]
            let quantityfive = calcal.stringValue
            let quantitysix = "="
            
            
            let one = Int(Quantitytwo)
            
            let Two = Int(calcal)

            
            let totalmulti = (one! * Two)

            let valuefinaltwo = NSString(format:"%d%@",totalmulti,"pcs")
            
            let quantityseven = String(valuefinaltwo)
            
            let quantityEight = NSString(format:"%@%@%@%@%@%@", Quantityfinalvalue,Quantitytwo,Quantithree,quantityfour,quantitysix,quantityseven)
            cell.quantityproduct.text = quantityEight as String
//            cell.productstrucklabel.text = self.Comboratestruck[indexPath.item]
            let valuefinal = self.CollectionviewMRP[indexPath.item]
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string:valuefinal as String)
            attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
              cell.productstrucklabel.attributedText = attributeString
            
            
            
            
//            var CollectionviewTitlename = [String]()
//            var CollectionviewMoq = [String]()
//            var CollectionviewMRP = [String]()
//            var CollectionviewMaxQty = [String]()
//            var CollectionviewMinQty = [String]()
//            var CollectionviewPTR = [NSNumber]()
//
            
            
            
            cell.checkmarkbutton.tag = indexPath.row
            cell.checkmarkbutton.addTarget(self, action: #selector(comboViewController.addCombocheckmarkfinalValue(sender:)), for: .touchUpInside)
//            cell.checkmarkbutton.addTarget(self, action: #selector(addCombocheckmarkfinalValue), for: .touchUpInside)
            cell.checkmarkbutton.tag = indexPath.row
            
            cell.checkmarkbutton.addTarget(self, action: #selector(comboViewController.addCombocheckmarkfinalValue(sender:)), for: .touchUpInside)

            
             return cell
        }
        else
        {
            
            let cell = combocollectionviewtwo.dequeueReusableCell(withReuseIdentifier:"CombotwoCollectionViewCell", for: indexPath as IndexPath) as!CombotwoCollectionViewCell
           // cell.offerPlusimage.image = self.comboooferimagetwo[indexPath.item]

            let Myproduct = self.Comboarray1[indexPath.item]
            cell.offerimage.sd_setImage(with: URL(string:Myproduct as! String), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
         
            if self.comboooferimagetwo.count-1 == indexPath.row {
                cell.offerPlusimage.isHidden = true
                
            }
            else{
                cell.offerPlusimage.isHidden = false

            }
            
            
            return cell

        }
        }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if collectionView == combocolletcionview
            {
                selectedIndex = indexPath.item
                combocolletcionview.reloadData()
            let cell = combocolletcionview.dequeueReusableCell(withReuseIdentifier:"ComboCollectionViewCell", for: indexPath as IndexPath) as!ComboCollectionViewCell
                cell.combolabel.textColor = UIColor.black
                cell.comboviewtwo.backgroundColor = UIColor.comboviewbackground()
                cell.backgroundColor = UIColor.comboviewbackground()
                let valuefinal = self.collectionarray[indexPath.item]
                print(valuefinal)
                
                if valuefinal == "COMBO"
                {
                    self.combofirstviewone.isHidden = false
                    self.combothirdviewone.isHidden = true
                    self.combofourthviewone.isHidden = true
                    self.combosecondviewtwo.isHidden = true
                    self.combofifthfinalvalueis.isHidden = true

                }
                if valuefinal == "BULK"
                {
                    self.combothirdviewone.isHidden = false
                    self.combofirstviewone.isHidden = true
                    self.combofourthviewone.isHidden = true
                    self.combosecondviewtwo.isHidden = true
                    self.combofifthfinalvalueis.isHidden = true

                }
                if valuefinal == "LTS"
                {
                    self.combofourthviewone.isHidden = false
                    self.combothirdviewone.isHidden = true
                    self.combofirstviewone.isHidden = true
                    self.combosecondviewtwo.isHidden = true
                    self.combofifthfinalvalueis.isHidden = true
                }
                if valuefinal == "OFFER"
                {
                    self.combosecondviewtwo.isHidden = false
                    
                    self.combofourthviewone.isHidden = true
                    self.combothirdviewone.isHidden = true
                    self.combofirstviewone.isHidden = true
                    self.combofifthfinalvalueis.isHidden = true
                }
                if valuefinal == "MOQ"
                {
                    self.combofifthfinalvalueis.isHidden = false
                    self.combosecondviewtwo.isHidden = true
                    self.combofourthviewone.isHidden = true
                    self.combothirdviewone.isHidden = true
                    self.combofirstviewone.isHidden = true
                }

            }
    }
    @objc func addCombocheckmarkfinalValue(sender: UIButton)
    {
     
        if sender.tag == 0
        {
            sender.setBackgroundImage(#imageLiteral(resourceName: "Uncheckmark"), for:.normal)
            sender.tag = 1
        }
        else if sender.tag == 1
        {
            sender.setBackgroundImage(#imageLiteral(resourceName: "verifiedgreen"), for:.normal)
            sender.tag = 0
        }
    }
    @IBAction func arrowBackbutton(_ sender: UIButton)
    {
        if self.Pickerstring == ""
        {
            self.Pickerstring = "0"
        }
        else
        {
        }
        self.index = Int(self.Pickerstring)!+1
        
        print(self.index)
        print(self.Pickerstring)
        
        if self.index < 10
        {
            let myString = String(self.index)
            self.Pickerstring = myString
            pickerView.selectRow(self.index, inComponent:0, animated: true)
            self.typeoderlabel.text =  self.Pickerstring
            pickerView.reloadAllComponents()
            self.Maximumpickervi.isHidden = false
            self.textfiledviewtwo.isHidden = true
        }
        else
        {
            let myString = String(self.index)
            self.Pickerstring = myString
            if self.Pickerstring == "10"
            {
                self.Maximumpickervi.isHidden = true
                self.textfiledviewtwo.isHidden = false
//                self.textfiledviewtwo.backgroundColor = UIColor.red
                self.singllinetextfiled.isHidden = false
            }
            let myString1 = String(self.index)
            self.singllinetextfiled.text = myString1
            
            self.Pickerstring = myString1
            pickerView.selectRow(self.index, inComponent:0, animated: true)
            self.typeoderlabel.text =  self.Pickerstring
        }
    }
    @IBAction func offeraddtocart(_ sender: UIButton)
    {
        
    }
    
    @IBAction func Bulkshoutbutton(_ sender: UIButton)
    {
        
    }
    @IBAction func BulkHandbutton(_ sender: UIButton)
    {
        
    }
    
    @IBAction func Bulkaddtocrat(_ sender: UIButton)
    {
        
    }
    
    @IBAction func Moqbackbutton(_ sender: UIButton)
    {
        if self.MoqPickerstring == ""
        {
        self.MoqPickerstring = "0"
        }
        else
        {
            
        }
        self.Moqindex = Int(self.MoqPickerstring)!+1
        if self.Moqindex < 10
        {
            let myString = String(self.Moqindex)
            self.MoqPickerstring = myString
            moqpcikertotalview1.selectRow(self.Moqindex, inComponent:0, animated: true)
            self.moqlabeltwo.text =  self.MoqPickerstring
            moqpcikertotalview1.reloadAllComponents()
            self.moqpickerview1.isHidden = false
            self.moqviewfinal.isHidden = true
        }
        else
        {
            let myString = String(self.index)
            self.MoqPickerstring = myString
            if self.MoqPickerstring == "10"
            {
                self.moqpickerview1.isHidden = true
                self.moqviewfinal.isHidden = false
                self.singllinetextfiled.isHidden = false
                let myString1 = String(self.Moqindex)
                self.moqtextfiledvalue.text = self.MoqPickerstring
                self.MoqPickerstring = myString1
                moqpcikertotalview1.selectRow(self.Moqindex, inComponent:0, animated: true)
                self.moqlabeltwo.text =  self.MoqPickerstring
            }
           
        }
        
        let myStringtwo = String(self.Moqindex)
        self.MoqPickerstring = myStringtwo
        let valuefinal = Int(self.MoqPickerstring)
        if valuefinal != nil
        {
            let billBeforeTax = valuefinal as! Int
            let taxPercentage = 12
            let tax = billBeforeTax * taxPercentage
            let strtwovalue:String = String(describing: tax)
            let total = NSString(format:"%@%@",strtwovalue,"Picks")
            print(total)
            moqtotalpickslabel.text = total as String
            let x:Int = valuefinal!
            var str:String = String(describing: x)
        }
    }
    
    @IBAction func Moqaddtocartbutton(_ sender: UIButton)
    {
        
    }
    
    @IBAction func Withoutcombobutton(_ sender: UIButton)
    {

        if withoutcomboradiobutton.tag == 0
        {
            withoutcomboradiobutton.setBackgroundImage(#imageLiteral(resourceName: "Radioon"), for:.normal)
             combobutton.setBackgroundImage(#imageLiteral(resourceName: "Radiooff"), for:.normal)
            withoutcomboradiobutton.tag = 1
        }
        else if withoutcomboradiobutton.tag == 1
        {
             withoutcomboradiobutton.setBackgroundImage(#imageLiteral(resourceName: "Radiooff"), for:.normal)
            combobutton.setBackgroundImage(#imageLiteral(resourceName: "Radioon"), for:.normal)
            withoutcomboradiobutton.tag = 0
        }
        
    }
    
    @IBAction func Combobutton(_ sender: UIButton)
    {
        if combobutton.tag == 0
        {
            combobutton.setBackgroundImage(#imageLiteral(resourceName: "Radioon"), for:.normal)
            withoutcomboradiobutton.setBackgroundImage(#imageLiteral(resourceName: "Radiooff"), for:.normal)
            combobutton.tag = 1
            
        }
        else if combobutton.tag == 1
        {
            combobutton.setBackgroundImage(#imageLiteral(resourceName: "Radiooff"), for:.normal)
            withoutcomboradiobutton.setBackgroundImage(#imageLiteral(resourceName: "Radioon"), for:.normal)
            combobutton.tag = 0
        }
   
    }
    
    
    @IBAction func Combodrop(_ sender: UIButton)
    {
        if combodrop.tag == 0
        {
           self.MytotalMoqview.frame = CGRect(x: self.MytotalMoqview.frame.origin.x, y: self.Mytotalcomboview.frame.origin.y+130, width: self.MytotalMoqview.frame.size.width, height: self.MytotalMoqview.frame.size.height)
            self.Mytotalcomboview.isHidden = true
            combodrop.tag = 1
        }
        else if combodrop.tag == 1
        {
            self.Mytotalcomboview.isHidden = false
          self.Mytotalcomboview.frame = CGRect(x: self.Mytotalcomboview.frame.origin.x, y: self.Mytotalcomboview.frame.origin.y, width: self.Mytotalcomboview.frame.size.width, height: self.Mytotalcomboview.frame.size.height)
        self.MytotalMoqview.frame = CGRect(x: self.MytotalMoqview.frame.origin.x, y: self.MytotalMoqview.frame.origin.y+130, width: self.MytotalMoqview.frame.size.width, height: self.MytotalMoqview.frame.size.height)
            combodrop.tag = 0
        }
    }
    
    
    
    func Comboaddtoanotherquantitylabel()
    {
        self.showSpinner()
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let defaults = UserDefaults.standard
        if let Myagentidfinal:String = defaults.value(forKey:"MyLoginfinalvalue")as?String
        {
            self.Combouseridstringvalue = Myagentidfinal
        }
        if let MyComboidfinal:String = defaults.value(forKey:"Myparticularadd")as?String
        {
            self.Comboidsingelvalue = MyComboidfinal
        }
       
        self.MoqPickerstring  = self.typeoderlabel.text!
        let singleidfinalvalue = NSString(format:"%@%@%@%@%@%@",self.Comboidsingelvalue,"-",self.MoqPickerstring,"-",self.Comboidsingelvalue,",")
        
        self.arrayvaluefinal.append(singleidfinalvalue as String)

        let singel = self.MoqPickerstring
        
        let finalvalueis = 2
     
        let one = Int(singel)
        
        let Two = Int(finalvalueis)
        
        
        let totalmulti = (one! * Two)

        
       valuefinaltwois = NSString(format:"%d",totalmulti)

        
        for i in 0..<self.SubcomboprodId.count
        {
            let value = self.SubcomboprodId[i]
            
            
            countnumerb = self.CollectionviewTitlename.count
            print(countnumerb)

            arrayvalue = NSString(format:"%@%@%@%@%@%@",value,"-",self.valuefinaltwois,"-",self.Comboidsingelvalue,",")
            self.arrayvaluefinal.append(arrayvalue as String)
        }
        
        
        print(self.arrayvaluefinal)

        let stringfinaltwovalue = NSString(format:"%@%@%@","[",self.arrayvaluefinal,"]")
        
        var name: String = stringfinaltwovalue as String
        let endIndex = name.index(name.endIndex, offsetBy: -2)
        let truncated = name.substring(to: endIndex)
     
         self.MytotalNsmutabelstring.append(truncated)
        self.MytotalNsmutabelstring.append("]")
        
        
        let stringTotalvalue = NSString(format:"%@",self.MytotalNsmutabelstring)

        
        CombopostStringfinalvalue =  String(format: "method=%@&idProductInfo=%@&userid=%@&sellerId=%@&schemeId=%@&bulkId=%@","AddToCartDynamic",stringTotalvalue,self.Combouseridstringvalue,"1","","")
                print(CombopostStringfinalvalue)
        
        print(CombopostStringfinalvalue)
        
        request.httpBody = CombopostStringfinalvalue.data(using: .utf8)
        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                self.removeSpinner()
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    print(dict)
                    
                   self.statusfinalavlue = dict.value(forKey:"StatusMsg")as!String
                   self.cartcountfinal = dict.value(forKey:"CartCount")as!NSNumber

                    self.userquantity = dict.value(forKey:"user_qty")as!String
                    
                    let defaultstotal = UserDefaults.standard
                    defaultstotal.set(self.cartcountfinal, forKey:"Mycart")
                    defaultstotal.set(self.userquantity, forKey:"userquantity")
                    defaultstotal.set("Combopage", forKey:"Combopage1")
                    defaultstotal.synchronize()
                    
                    self.view.makeToast(self.statusfinalavlue)
                    
                    
                    DispatchQueue.main.async
                        {
                let viewone = self.storyboard?.instantiateViewController(withIdentifier:"HomeViewController")as!HomeViewController
                self.present(viewone, animated: true, completion:nil)
//                            self.view.removeFromSuperview()
                            
//                          self.callBFootwo()
                    }
                    
                }
                break
            case .failure(_):
                break
            }
            
        }
        
    }
  
    func ComboMoqfinal()
    {
        self.showSpinner()
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let defaults = UserDefaults.standard
        if let Myagentidfinal:String = defaults.value(forKey:"MyLoginfinalvalue")as?String
        {
            self.Combouseridstringvalue = Myagentidfinal
        }
        if let MyComboidfinal:String = defaults.value(forKey:"Myparticularadd")as?String
        {
            self.Comboidsingelvalue = MyComboidfinal
        }
        let arrayvalue = NSString(format:"%@%@-%@-%@","[", self.Comboidsingelvalue,self.MoqPickerstring,"]")
        print(arrayvalue)
        MoqpostStringfinalvalue =  String(format: "method=%@&idProductInfo=%@&userid=%@&sellerId=%@&schemeId=%@&bulkId=%@","AddToCartDynamic",arrayvalue,self.Combouseridstringvalue,"1","","")
        print(MoqpostStringfinalvalue)
        request.httpBody = MoqpostStringfinalvalue.data(using: .utf8)
        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                self.removeSpinner()
                if let dict:NSDictionary = response.result.value as? NSDictionary
                {
                     self.statusfinalavlue = ""
                    self.cartcountfinal == nil
                     self.userquantity  = ""
                    self.statusfinalavlue = dict.value(forKey:"StatusMsg")as!String
                    self.cartcountfinal = dict.value(forKey:"CartCount")as!NSNumber
                    
                    self.userquantity = dict.value(forKey:"user_qty")as!String
                    
                    print(self.cartcountfinal)
                    print(self.userquantity)
                    let defaultstotal = UserDefaults.standard
                    defaultstotal.set(self.cartcountfinal, forKey:"Mycart")
                    defaultstotal.set(self.userquantity, forKey:"userquantity")
                    defaultstotal.set("Combopage", forKey:"Combopage1")
                    defaultstotal.synchronize()
                    self.view.makeToast(self.statusfinalavlue)
                    DispatchQueue.main.async
                        {
                    let viewone = self.storyboard?.instantiateViewController(withIdentifier:"HomeViewController")as!HomeViewController
                    self.present(viewone, animated: true, completion:nil)
                    }
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
    
    func Bulkcomboanotherquantitylabel()
    {
        self.showSpinner()
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let defaults = UserDefaults.standard
        if let Myagentidfinal:String = defaults.value(forKey:"MyLoginfinalvalue")as?String
        {
            self.Combouseridstringvalue = Myagentidfinal
        }
        if let MyComboidfinal:String = defaults.value(forKey:"Myparticularadd")as?String
        {
            self.Comboidsingelvalue = MyComboidfinal
        }
        let arrayvalue = NSString(format:"%@%@-%@-%@","[", self.Comboidsingelvalue,self.MoqMimiumordrQuantityFinalavlue,"]")
        print(arrayvalue)
        MoqpostStringfinalvalue =  String(format: "method=%@&idProductInfo=%@&userid=%@&sellerId=%@&schemeId=%@&bulkId=%@","AddToCartDynamic",arrayvalue,self.Combouseridstringvalue,"1","",self.bulk_id)
        
        print(MoqpostStringfinalvalue)
        request.httpBody = MoqpostStringfinalvalue.data(using: .utf8)
        request.addValue("delta141forceSEAL8PARA9MARCOSBRAHMOS", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                self.removeSpinner()
                if let dict:NSDictionary = response.result.value as? NSDictionary
                {
                    self.statusfinalavlue = ""
                    self.cartcountfinal == nil
                    self.userquantity  = ""
                    self.statusfinalavlue = dict.value(forKey:"StatusMsg")as!String
                    self.cartcountfinal = dict.value(forKey:"CartCount")as!NSNumber
                    
                    self.userquantity = dict.value(forKey:"user_qty")as!String
                    
                    print(self.cartcountfinal)
                    print(self.userquantity)
                    let defaultstotal = UserDefaults.standard
                    defaultstotal.set(self.cartcountfinal, forKey:"Mycart")
                    defaultstotal.set(self.userquantity, forKey:"userquantity")
                    defaultstotal.set("Combopage", forKey:"Combopage1")
                    defaultstotal.synchronize()
                    self.view.makeToast(self.statusfinalavlue)
                    DispatchQueue.main.async
                        {
                            let viewone = self.storyboard?.instantiateViewController(withIdentifier:"HomeViewController")as!HomeViewController
                            self.present(viewone, animated: true, completion:nil)
                    }
                }
                break
            case .failure(_):
                break
            }
        }
        
    }
    
    
    
    func callBFoo()
    {
        let viewtwofinal = comboViewController()
        
   self.hideContentController(content:viewtwofinal)
        
      // self.addChildViewController(viewtwofinal)

//      viewtwofinal.Methodcombo()
    }
    func callBFootwo()
    {
        let viewtwofinal = HomeViewController()
         viewtwofinal.Methodcombo()
        callBFoo()
    }
    func displayContentController(content: UIViewController) {
        addChildViewController(content)
        self.view.addSubview(content.view)
        content.didMove(toParentViewController: self)
    }
    
    func hideContentController(content: UIViewController) {
        content.willMove(toParentViewController: nil)
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
    }
    
    
    
    

    @IBAction func addtocartfinalvalue(_ sender: UIButton)
    {
        
        self.Comboaddtoanotherquantitylabel()
    }
    
    func showSpinner()
    {
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.view.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(imageView)
    }
    func removeSpinner()
    {
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()
    }
    
    
    
    ///// Moq add to cart button
    
    
    @IBAction func Moqaddtobutton(_ sender: UIButton)
    {
        
        DispatchQueue.main.async
            {
            self.ComboMoqfinal()
         }
    }
    @IBAction func buttonshowbutton(_ sender: UIButton)
    {
        DispatchQueue.main.async
            {
            let Viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"ShoutViewController")as!ShoutViewController
            self.present(Viewfinal, animated: true, completion:nil)
        }
    }
    
    @IBAction func Bulkaddtocartbutton(_ sender: UIButton)
    {
         DispatchQueue.main.async
         {
         self.Bulkcomboanotherquantitylabel()
         }
    }
    
}
extension comboViewController: UIGestureRecognizerDelegate
{
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool
    {
        return true
    }
}
