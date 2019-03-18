//  HomeViewController.swift
//  AgentRestocks
//  Created by Azharuddin on 06/08/18.
//  Copyright © 2018 NumberMall. All rights reserved.
//

import UIKit
import QuartzCore
import Alamofire
import AlamofireImage
import SDWebImage
import ScratchCard
import SocketIO
import DTZFloatingActionButton
import IQKeyboardManagerSwift
import Kingfisher

@objc public enum JXBottomSheetState: Int
{
    case maxDisplay
    case minDisplay
}
@objc
protocol JXBottomSheetViewDelegate: NSObjectProtocol
{
    @objc optional func bottomSheet(bottomSheet: JXBottomSheetView, willDisplay state: JXBottomSheetState)
    @objc optional func bottomSheet(bottomSheet: JXBottomSheetView, didDisplayed state: JXBottomSheetState)
}
public class JXBottomSheetView: UIView {
    weak var delegate: JXBottomSheetViewDelegate?
    public var defaultMininumDisplayHeight: CGFloat = 100
    {
        didSet {
            mininumDisplayHeight = defaultMininumDisplayHeight
        }
    }
    public var defaultMaxinumDisplayHeight: CGFloat = 300
    {
        didSet {
            maxinumDisplayHeight = defaultMaxinumDisplayHeight
        }
    }
    public var displayState: JXBottomSheetState = .minDisplay
 
    public var triggerVelocity: CGFloat = 1000
    public var triggerDistance: CGFloat = 70    //滚动多少距离，可以触发展开和收缩状态切换
    fileprivate var mininumDisplayHeight: CGFloat = 30
    fileprivate var maxinumDisplayHeight: CGFloat = 300
    fileprivate var isFirstLayout = true
    fileprivate var minFrame: CGRect {
        get {
            return CGRect(x: 0, y: self.bounds.size.height - mininumDisplayHeight+30, width: self.bounds.size.width, height: maxinumDisplayHeight)
        }
    }
    fileprivate var maxFrame: CGRect {
        get {
            return CGRect(x: 0, y: self.bounds.size.height - maxinumDisplayHeight, width: self.bounds.size.width, height: maxinumDisplayHeight)
        }
    }
    
    var contentView: UIScrollView
    
    public override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        if newSuperview == nil {
            contentView.removeObserver(self, forKeyPath: "contentSize")
        }
    }
    
    public override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return self.convert(point, to: contentView).y >= 0
    }
    
    public init(contentView: UIScrollView) {
        self.contentView = contentView
        super.init(frame: CGRect.zero)
        
        clipsToBounds = true
        backgroundColor = .clear
        
        contentView.bounces = false
        if let tableView = contentView as? UITableView {
            tableView.estimatedRowHeight = 0
        }
        addSubview(contentView)
        contentView.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions.new, context: nil)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(processPan(gesture:)))
        panGesture.delegate = self as? UIGestureRecognizerDelegate
        contentView.addGestureRecognizer(panGesture)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        if isFirstLayout {
            isFirstLayout = false
            if displayState == .minDisplay {
                contentView.frame = minFrame
            }else {
                contentView.frame = maxFrame
            }
        }
    }
    
    @objc fileprivate func processPan(gesture: UIPanGestureRecognizer)
    {
        if mininumDisplayHeight == maxinumDisplayHeight {
            return
        }
        switch gesture.state {
        case .changed:
            var canMoveFrame = false
            if displayState == .minDisplay {
                canMoveFrame = true
            }else  {
                if contentView.frame.origin.y > maxFrame.origin.y || contentView.contentOffset.y <= 0 {
                    canMoveFrame = true
                }
            }
            if canMoveFrame {
                let point = gesture.translation(in: contentView)
                var frame = contentView.frame
                frame.origin.y += point.y
                frame.origin.y = max(frame.origin.y, maxFrame.origin.y)
                frame.origin.y = min(frame.origin.y, minFrame.origin.y)
                contentView.frame = frame
            }
            gesture.setTranslation(CGPoint.zero, in: contentView)
            if displayState == .minDisplay {
                if contentView.frame.origin.y <= maxFrame.origin.y {
                    delegate?.bottomSheet?(bottomSheet: self, willDisplay: .maxDisplay)
                    displayState = .maxDisplay
                    delegate?.bottomSheet?(bottomSheet: self, didDisplayed: .maxDisplay)
                }
            }else  {
                if contentView.frame.origin.y >= minFrame.origin.y {
                    delegate?.bottomSheet?(bottomSheet: self, willDisplay: .minDisplay)
                    displayState = .minDisplay
                    delegate?.bottomSheet?(bottomSheet: self, didDisplayed: .minDisplay)
                }
            }
            
            if contentView.frame.origin.y > maxFrame.origin.y ||
                (contentView.frame.origin.y == minFrame.origin.y && contentView.frame.origin.y == maxFrame.origin.y) {
                contentView.setContentOffset(CGPoint.zero, animated: false)
            }
        case .cancelled, .ended, .failed:
            let velocity = gesture.velocity(in: gesture.view)
            if displayState == .minDisplay {
                if velocity.y < -triggerVelocity {
                    displayMax()
                }else if minFrame.origin.y - contentView.frame.origin.y > triggerDistance {
                    if velocity.y <= 0 {
                        displayMax()
                    }else {
                        displayMin()
                    }
                }else {
                    displayMin()
                }
                contentView.setContentOffset(CGPoint.zero, animated: false)
            }else {
                if velocity.y > triggerVelocity && contentView.contentOffset.y <= 0 {
                    displayMin()
                    contentView.setContentOffset(CGPoint.zero, animated: false)
                }else if contentView.frame.origin.y - maxFrame.origin.y > triggerDistance {
                    if velocity.y < 0 {
                        displayMax()
                    }else {
                        displayMin()
                    }
                }else {
                    displayMax()
                }
            }
        default:
            break
        }
    }
    
    public func displayMax() {
        if contentView.frame == maxFrame {
            return
        }
        delegate?.bottomSheet?(bottomSheet: self, willDisplay: JXBottomSheetState.maxDisplay)
        UIView.animate(withDuration: 0.25, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.contentView.frame = self.maxFrame
        }) { (finished) in
            self.displayState = .maxDisplay
            self.delegate?.bottomSheet?(bottomSheet: self, didDisplayed: JXBottomSheetState.maxDisplay)
        }
    }
    
    public func displayMin() {
        
        if contentView.frame == minFrame {
            return
        }
        delegate?.bottomSheet?(bottomSheet: self, willDisplay: JXBottomSheetState.minDisplay)
        UIView.animate(withDuration: 0.25, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.contentView.frame = self.minFrame
        }) { (finished) in
            self.displayState = .minDisplay
            self.delegate?.bottomSheet?(bottomSheet: self, didDisplayed: JXBottomSheetState.minDisplay)
        }
    }
    
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize" {
            mininumDisplayHeight = min(defaultMininumDisplayHeight, contentView.contentSize.height)
            maxinumDisplayHeight = min(defaultMaxinumDisplayHeight, contentView.contentSize.height)
            if displayState == .maxDisplay {
                contentView.frame = maxFrame
            }else {
                contentView.frame = minFrame
            }
        }
    }
    
}

class HomeViewController: UIViewController,UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource,ScrollPagerDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate,ScratchUIViewDelegate,ScrollPagerDelegateThree,ScrollPagerDelegatefinal
{
    @IBOutlet var scrollPager: ScrollPager!
    @IBOutlet weak var finaldemoview: UIView!
    @IBOutlet weak var catview: UIView!
    @IBOutlet weak var demoview: UIView!
    @IBOutlet weak var firstviewone: UIView!
    @IBOutlet weak var demoscrollview: UIScrollView!
    
    @IBOutlet weak var bottomstaticview: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrMain: UIScrollView!
    let arrImages = [#imageLiteral(resourceName: "offerimages"),#imageLiteral(resourceName: "offerimages"),#imageLiteral(resourceName: "offerimages"),#imageLiteral(resourceName: "offerimages"),#imageLiteral(resourceName: "offerimages"),#imageLiteral(resourceName: "offerimages")]
    
    var Items = [String]()
    var outlets = [String]()
    var days = [String]()
    var instock = [String]()
    var Itemimage = [String]()
    var Recomendediamge = [UIImage]()
 
    var timer = Timer()
   
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    var Itemimagefinal = [String]()
    var TopcatageoryItemsfinal = [String]()
    var TopBrandimage = [String]()
    var TopBrandName = [String]()

    
    @IBOutlet weak var Todaydeals: UIView!
    @IBOutlet weak var Homecollectionview: UICollectionView!
    @IBOutlet weak var Homescrollview: UIScrollView!
    @IBOutlet weak var menubutton: UIButton!
   var appDelegate = UIApplication.shared.delegate as! AppDelegate

    var Menu_vc:MenuViewController!
    
    @IBOutlet weak var Recomendedcollectionview: UICollectionView!
    
    @IBOutlet weak var Mytrendingview: UIView!
    @IBOutlet weak var Trendingproductcollectionview: UICollectionView!
    
    @IBOutlet weak var secondview: UIView!
    @IBOutlet weak var Recomendedview: UIView!
    
    @IBOutlet weak var Newproductcollectionview: UICollectionView!
    
    @IBOutlet weak var Newproductview: UIView!
    
    @IBOutlet weak var Topproducts: UIView!
    
    @IBOutlet weak var Topproductcolectionview: UICollectionView!
    
    @IBOutlet weak var topcatageoryview: UIView!
    
    @IBOutlet weak var topcatageorycollectionview: UICollectionView!
    
    @IBOutlet weak var TopBrandcollectionview: UICollectionView!
    
    
    
    @IBOutlet weak var Homeone: UIButton!
    @IBOutlet weak var Hometwo: UIButton!
    @IBOutlet weak var catageoryone: UIButton!
    @IBOutlet weak var catageorytwo: UIButton!
    
    @IBOutlet weak var Brnads: UIButton!
    
    @IBOutlet weak var Brandstwo: UIButton!
    
    @IBOutlet weak var favourite: UIButton!
    @IBOutlet weak var fsvouritetwo: UIButton!
    @IBOutlet weak var cart: UIButton!
    @IBOutlet weak var carttwo: UIButton!
    
    var timerTwo = Timer()

    @IBOutlet weak var Homeview: UIView!
    
    @IBOutlet weak var catageorysview: UIView!
    
    @IBOutlet weak var Brandsview: UIView!
    
    @IBOutlet weak var favourities: UIView!
    
    @IBOutlet weak var chatview: UIView!
   
    @IBOutlet weak var snackdemo: UIImageView!
    
    
    @IBOutlet weak var filterbrand: UIButton!
    @IBOutlet weak var filtersearch: UIButton!
    @IBOutlet weak var cadburry: UILabel!
    @IBOutlet weak var Brandstapview: UIView!
    
    
    @IBOutlet weak var NewBrandcollectionview: UICollectionView!
    var New_BrandItem = [String]()
    
    var selectedIndex :Int?
    
    
    
    @IBOutlet weak var NewBrandtabelview: UITableView!
    
    var NewBrandsimage = [UIImage]()
    var NewBrandsName = [String]()
    var favouritefinal = [String]()

    
    var addbuttonimage = [UIImage]()
    var NewBrandimagefinalvalue = [UIImage]()
    var NewBrandofferprize = [String]()
    var QuantityProduct = [String]()
    var ProductPicks = [String]()
    var Explorecatageory_item = [String]()
    var ExploreBrand_image = [String]()
    var ExploreBrand_Name = [String]()
    var  Abcdelements = [String]()
 
    @IBOutlet weak var popview: UIView!
    
    @IBOutlet weak var Explorebrandscollectionview: UICollectionView!
    
    
    @IBOutlet weak var abcdcollectionview: UICollectionView!
    
    var productItems =  [String]()
    var itemDays =  [String]()
    var stockIn =  [String]()
    var cashBackfinal = [String]()
    var cashBackfinalTwo = NSString()
    
    @IBOutlet weak var productDetailsTV: UITableView!
    
    
   
  
    
    @IBOutlet weak var Brandsscrollview: UIScrollView!
    @IBOutlet weak var popupscrollview: UIScrollView!
    
    
    @IBOutlet weak var ANIMATIONVIEW: UIView!
    
    var Brandtaeblviewiamgeview = [UIImage]()
    
    
    @IBOutlet weak var Todayviewall: UIButton!
    
    @IBOutlet weak var Recomendedviewall: UIButton!

    @IBOutlet weak var Trendingbutton: UIButton!
    
    @IBOutlet weak var singelbrand: UIButton!
    @IBOutlet weak var NEwproductall: UIButton!
     @IBOutlet weak var topbrands: UIButton!
    
    @IBOutlet weak var Topcatageorybutton: UIButton!
    
    @IBOutlet weak var ExploreBrands: UILabel!
    
    
    
  
     var Today_dealsstruck = [String]()
    var Today_Dealspercentage = [String]()
    var Recomended_dealsstruck = [String]()
    var Recomended_Dealspercentage = [String]()
    var Trending_dealsstruck = [String]()
    var Trending_Dealspercentage = [String]()
    
    var Newproduct_dealsstruck = [String]()
    var Newproduct_Dealspercentage = [String]()
    var Topproduct_dealsstruck = [String]()
    var Topproduct_Dealspercentage = [String]()
    
    
    var firstView  = UIView()
    var secondView1  = UIView()
    var thiredview  = UIView()

     var Moreview  = UIView()
    var Numbermallfavouriteview  = UIView()
    var numnbermallchatview  = UIView()

    
    @IBOutlet weak var agentfvaouriteview: UIView!
    
    @IBOutlet weak var catscroollview: UIScrollView!
    
    @IBOutlet weak var cartview: UIView!
    @IBOutlet weak var cartimage: UIImageView!
 
    @IBOutlet weak var Catpopupscrollview: UIScrollView!
    
    @IBOutlet weak var CatANIMATIONVIEW: UIView!
    
    
 
    @IBOutlet weak var CatExplorebrandscollectionview: UICollectionView!
    
    @IBOutlet weak var Catabcdcollectionview: UICollectionView!
 
    @IBOutlet weak var singpopoupcatgeory: UIView!
    
    
    @IBOutlet weak var Newcattabelview: UITableView!
    
    @IBOutlet weak var Newcatcollectionview: UICollectionView!
    
    
    @IBOutlet weak var Agentsfavouritietwo: UIView!
    
    @IBOutlet weak var Agentfavouritescrollview: UIScrollView!
    
    @IBOutlet weak var favouriteimageview: UIImageView!
    
    @IBOutlet weak var Newfavouritecollectionview: UICollectionView!
    
    @IBOutlet weak var Toplabel: UILabel!
    @IBOutlet weak var favouritetabelview: UITableView!
    
    @IBOutlet weak var bottomview: UIView!
    
    @IBOutlet weak var addnowone: UIButton!
    
    
    
    @IBOutlet weak var Nofavourites: UIView!
    
    @IBOutlet weak var whataddnowfavouriteno: UIButton!
    
    var Bannerarry = NSArray()
    var Bannerarryimagestring = [String]()
    var TopBrandarray = NSArray()
    var Topcatageoryfinal = NSArray()
    var FrequentlyProducts = NSArray()
    var FrequentlyProductsonly = NSArray()
    var offTakeDisplay = [String]()
    var off_takefinal = String()
    
    var NewproductLauncharray = NSArray()
    var NEwproductIMage = [String]()
    var NEwproductItems = [String]()
    var Newproductoutlets = [String]()
   var NewproductsInstack = [String]()
    var NewproductsoffTakeDisplay = [String]()
    var Newproductdays = [String]()
  
    
    var TrendingProducts = NSArray()
    var TrendingProductimage = [String]()
    var TrendingProductItems = [String]()
    var Trendinginstock = [String]()
    var TrendingProductItemsprice = [String]()
    var TrendingProductoffTakeDisplay = [String]()
    var TrendingProductdays = [String]()

    var RecomendedProducts = NSArray()
    var RecomendedProductimage = [String]()
    var RecomendedProductItems = [String]()
    var Recomendedinstock = [String]()
    var RecomendedProductItemsprice = [String]()
    var RecomendedProductoffTakeDisplay = [String]()
    var RecomendedProductdays = [String]()
    var Recomendedsstruck = [String]()
    var RecomendedinsPercentage = [String]()
    
    
    
    var TodayDealsProducts = NSArray()
    var TodayDealProductimage = [String]()
    var TodayDealProductItems = [String]()
    var TodayDealinstock = [String]()
    var TodayDealProductItemsprice = [String]()
    var TodayDealProductoffTakeDisplay = [String]()
    var TodayDealProductdays = [String]()
    var TodayDealsstruck = [String]()
    var TodayDealPercentage = [String]()
    var todaydealsstacklabel = [String]()

    
    var allcatageoryarray = NSArray()
    var Recomendedname = String()
    var TrendingproductName = String()
    var NewproductName = String()
    var FrequentlyProductsHome = String()
    var TodayProducts = String()
    var RecomendediamgeHome = String()
    var TrendingproductimageHome = String()
    var NewproductimageHome = String()
    var FrequentlyProductsimageHome = String()
    var TodayProductsimageHome = String()
    @IBOutlet weak var MyTodaydeals: UILabel!
    @IBOutlet weak var recomendeHomeall: UILabel!
    @IBOutlet weak var TrendingproductHomeall: UILabel!
    @IBOutlet weak var Newproductall: UILabel!
    @IBOutlet weak var Topproductall: UILabel!
    @IBOutlet weak var todayHomeimage: UIImageView!
    @IBOutlet weak var RecomendedHomeimage: UIImageView!
    @IBOutlet weak var trendingHomeimagefinal: UIImageView!
    @IBOutlet weak var BrandsHomeimage: UIImageView!
    @IBOutlet weak var topproducthomeimage: UIImageView!
    var coverView = UIView()
    var imageView = UIImageView()
    var allBrandsarray = NSArray()
    var allCatageoryarray = NSArray()
    var ExploreBrandsidstring = [String]()
    var singelExploreidstring = String()
    var LoginidValuefinal = String()
    var TopBrandidvalue = [String]()
     var TopBrandidSingelvalue = String()
    var BrandsidbrandIdstring =  [String]()
    var Brandsidbrand_namestring = [String]()
    var Brandsidimage_pathstring = [String]()
    var Brandsidcnew_brandstring = [String]()
    var BrandsidclcickHomearray = NSArray()
    
    
    var Explorecatageoryarray = NSArray()
    var Explorecatageoryiamge = [String]()
    var ExplorecatgeoryName = [String]()
    var Explorecatageoryidstring = [String]()
    var Explorecatageoryidsingelone = [String]()
    var ExplorecatageoryNewstring = [String]()
    var ExplorecatageoryLettersArray = [String]()

    
    
    //// secondscreen Parameters
    var secondNewproductLauncharray = NSArray()
    var SecondNEwproductIMage = [String]()
    var SecondNEwproductItems = [String]()
    var SecondNewproductoutlets = [String]()
    var SecondNewproductsInstack = [String]()
    var SecondNewproductsoffTakeDisplay = [String]()
    var SecondNewproductdays = [String]()
    var SecondNewproductCODDisplay = [String]()
    var SecondNewproduct_dealsstruck = [String]()
    var SecondNewproductlabelMrp = [String]()
    var SecondAvailabelQuantity = [String]()
    var SecondProductidValue = [String]()
    var Secondproducidclikstring = String()
    var SecondproductofferMargin = [String]()
   var SecondNewproductsMrpstack = [String]()
    var favouritesecondvalue = [String]()
    
    
    
    
    var TotalTopBrandsValue = String()
    var TotalTopcatageoryValue = String()
    var postString = String()
    var ecom_array = [Contact]()
    var isSearching = false
    var filter_ecom = [Contact]()
    @IBOutlet weak var adpopupscroolview: UIScrollView!
    @IBOutlet weak var addpopupview: UIView!
    @IBOutlet weak var Maindescrptionpoupview: UIView!
    @IBOutlet weak var radiobutton: UIButton!
    @IBOutlet weak var radiobuttontwo: UIButton!
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
    var favouriteLauncharray = NSArray()
    var favouriteproductIMage = [String]()
    var favouriteproductItems = [String]()
    var favouriteproductoutlets = [String]()
    var favouriteproductsInstack = [String]()
    var favouriteNewproductsoffTakeDisplay = [String]()
    var favouriteproductdays = [String]()
    var favouriteproduct_dealsstruck = [String]()
    var favouriteproductlabelMrp = [String]()
    var favouriteAvailabelQuantity = [String]()
    var favouriteProductidValue = [String]()
    var favouriteproducidclikstring = String()
    var favouriteproductofferMargin = [String]()
    var favouriteNewproductsMrpstack = [String]()
    var producidclikHOMEstring = String()
   var producidclikHOMENAmestring = String()
    var HomestatusLikeviewall = NSNumber()
    var scratchCard: ScratchUIView!
    @IBOutlet weak var viewtwo: UIView!
    @IBOutlet weak var youownlabel: UILabel!
    @IBOutlet weak var scratchcardviewfinal: UIView!
    var scatchtimer = Timer()
    @IBOutlet weak var demoscatch: UIView!
     var SwipeLeft = UISwipeGestureRecognizer()
    var SwipeRight = UISwipeGestureRecognizer()
    @IBOutlet weak var veryalertview: UIView!
    
    
    @IBOutlet weak var cahtviewfinalvalue: UIView!
    
    @IBOutlet weak var chatsingelviewfinal: UIView!
    
    
    
    @IBOutlet weak var cahtone: UIButton!
    
    
    @IBOutlet weak var cahttwo: UIButton!
    
    
    
    
    
    @IBOutlet weak var cahtscrollview: UIScrollView!
    @IBOutlet weak var scrollpagethreefinalvalue: ScrollPagerthree!
    
    @IBOutlet weak var cahtsview: UIView!
    
    @IBOutlet weak var compliantsview: UIView!
    
    @IBOutlet weak var marketingview: UIView!
    
    
    var cahtsviewone  = UIView()
    var ComplaintsView1  = UIView()
    var MarketView1  = UIView()
 
    @IBOutlet weak var totaltopview: UIView!
    
    @IBOutlet weak var chatsviewone: UIView!
    
    @IBOutlet weak var cahtsbuttonone: UIButton!
    
    @IBOutlet weak var chatssingelview: UIView!
    
    
    @IBOutlet weak var compiantsview: UIView!
    
    @IBOutlet weak var Complaintsbuttonone: UIButton!
    
    @IBOutlet weak var compliantssingelview: UIView!
    
    @IBOutlet weak var AMrketingviewone: UIView!
    
    @IBOutlet weak var marketingbuttonone: UIButton!
    
    @IBOutlet weak var marketingsingellineview: UIView!
    @IBOutlet weak var scrollpagerfourvalue: ScrollPagerfour!
    @IBOutlet weak var chatingtabelview: UITableView!
    
    
    var chatingimagevalue = [String]()
    var Productypeicon = [String]()
    
    var Productypeiconimage = [UIImage]()
    
    var ProductypeMessage = [String]()
    var Tickmarkiamge = [UIImage]()
    
    
    var ProductTiming = [String]()
    
    var ProductTiming1 = [String]()

    var ProductMessages = [String]()
    var ProductMessagesCount = [NSNumber]()
    var ProductMessagesCount1 = [String]()

    let manager = SocketManager(socketURL: URL(string: "http://172.31.0.13:3000")!, config: [.log(true), .compress])
    
    
    let managertwo = SocketManager(socketURL: URL(string: "http://172.31.0.13:3000")!, config: [.log(true), .compress])

    var socket:SocketIOClient!
    var socketwovalue:SocketIOClient!

    
    let managerthree = SocketManager(socketURL: URL(string: "http://172.31.0.13:3000")!, config: [.log(true), .compress])
    
    
    let managerfinal = SocketManager(socketURL: URL(string: "http://172.31.0.13:3000")!, config: [.log(true), .compress])

    
    var socketthree:SocketIOClient!
    
    var soketFinal:SocketIOClient!

    
    
    var socketDict = [Any]()
    var socketDictfinalvalue = [Any]()

    
    
    
    var MainsocketDict = NSDictionary()
    var MainsocketArray = NSArray()
   var useridbiling = String()
    @IBOutlet weak var mytodaydeals: UILabel!
    @IBOutlet weak var Todaydelas: UIView!
    @IBOutlet weak var viewHomeone: UIView!
    @IBOutlet weak var viewHometwo: UIView!
    @IBOutlet weak var viewHomethree: UIView!
    @IBOutlet weak var viewhomefour: UIView!
    @IBOutlet weak var viewHomefive: UIView!
    @IBOutlet weak var viewsix: UIView!
    @IBOutlet weak var viewseven: UIView!
    @IBOutlet weak var todaydelasfinalvalueis: UIView!
    var NewproductName12 = String()
    @IBOutlet weak var singelbutton: UIButton!
    var usersingelvalue = NSNumber()
    var VisibleIndex:IndexPath = IndexPath(row: 0, section: 0)
    var FirstLeterManipulation: Character = "1"
    var FirstLeterManipulationtwo: Character = "B"

    var exploreBrandsNamearry = [String]()
    var exploreBrandsImagepatharry = [String]()
    var exploreBrandsidpatharry = [String]()
    var exploreBrandsNewpatharry = [String]()
    var ExploreLettersArray = [String]()

    var Homeuseridstringvalue = String()
 
  var  expireTimetodayvalue = NSNumber()
    
    @IBOutlet weak var NewTimerlabel: UILabel!
    
    @IBOutlet weak var cartbuttonfinalvalue: UIButton!
    @IBOutlet weak var cartlabel: UILabel!
    
    var TotalTimervalueistwo = Int()
var timersineglvalue: Timer?
    var TotalTimervalueis  = 0.0
    var distanceFloat1: Float = 0.0
    var demotwovalue = String()

    
    var index : Int = 0

    var millseconds = Int()
    
    var ratingDouble: Double!

        var timerIsOn = false
        var dealEndtime = Int()
    var timertwo = Timer()
    
    var clickedbrandstring = String()
    var postStringfinalvalue = String()
   var Topcatageorysingelvalue = String()
    
    var Topcatageorysingleidvalueis = [String]()
    var Newcatidstringvalueone = String()
    
    var NewBrnsidindividual = String()
    var Bydefaultsvalueis = String()

    var currentPage : Int = 1

    var defaultsBrandidstring = String()
    var defaultsbarndsnamestring = String()
    var deafultsbrandspathstring = String()
    var deafultscatageoryidstring = String()
    var deafultscatageorynamestring = String()
    var defaultscaatgeorypathstring = String()
    var clickedCatageorystring = String()
    var Mycartcountvaluestring = String()

    
    var catageorybuttonvalue = String()
    var brandbuttonvalue = String()
    var deafultscatvalueString = String()
    var deafultsBrandvalueString = String()

    var ExploresingelBrandidstring = String()
    
    var ExploresingelCatageoryidstring = String()


    var exploreBrandsidsingelstring = String()
    var explorecatageoryidsingelstring = String()

    var explorecatageorcliked = String()
    var exploreBrnadscliked = String()

    var BrandexploreclkedTotal = String()
    var demobarnd = String()
    
    var clikedstringfinalvalue = String()

    @IBOutlet weak var brandsviewtwofinalvalue: UIView!
    
    @IBOutlet weak var catviewtwofinalvalue: UIView!
  
   var  favouritelaunchDict11 = NSDictionary()
    
    var  FavouriteBrandsString = NSArray()
    var  FavouriteTrendingString = NSArray()
    var  FavouriteAllString = NSArray()

    
     var  FavouriteBrandsString1 = [String]()
    
    var  FavouriteTrendingString1 = [String]()

    var  FavouriteAllString1 = [String]()

    var freNewproductName12 = String()
    var freNewproductLauncharray = NSArray()
    var freNEwproductItems = [String]()
    var freNEwproductIMage = [String]()
    var freNewproductoutlets = [String]()
    var freNewproduct_dealsstruck = [String]()
    var freNewproductsInstack = [String]()
    var freNewproduct_Dealspercentage = [String]()
    var freNewproductsoffTakeDisplay = [String]()
    var freNewproductdays = [String]()
  
    @IBOutlet weak var viewfavone: UIView!
    @IBOutlet weak var viewfavtwo: UIView!
    
    @IBOutlet weak var favouritescrollviewfinalvalue: ScrollPagerfour!
    
    var viewfavouriteone  = UIView()
    var viewfavouritwtwo  = UIView()
    
    var viewfavourithree  = UIView()

    var favSecondNEwproductIMage = [String]()
    var favSecondNEwproductItems = [String]()
    var favSecondNewproductCODisplay = [String]()
    var favSecondNewproductoutlets = [String]()
    var favSecondNewproductsInstack = [String]()
    var favSecondNewproductsoffTakeDisplay = [String]()
    var favSecondNewproductdays = [String]()
    var favSecondNewproduct_dealsstruck = [String]()
    var favSecondNewproductlabelMrp = [String]()
    var favSecondAvailabelQuantity = [String]()
    var favSecondProductidValue = [String]()
    var favSecondproducidclikstring = String()
  var favSecondproductofferMargin = [String]()

    var favSecondNewproductsMrpstack = [String]()
    var favfavouritesecondvalue = [String]()
    var favouritecashBackfinal = [String]()
    var favtwoSecondNEwproductIMage = [String]()
    var favtwoSecondNEwproductItems = [String]()
    var favtwoSecondNewproductCODisplay = [String]()

    var favtwoSecondNewproductoutlets = [String]()
    var favtwoSecondNewproductsInstack = [String]()
    var favtwoSecondNewproductsoffTakeDisplay = [String]()
    var favtwoSecondNewproductdays = [String]()
    var favtwoSecondNewproduct_dealsstruck = [String]()
    var favtwoSecondNewproductlabelMrp = [String]()
    var favtwoSecondAvailabelQuantity = [String]()
    var favtwoSecondProductidValue = [String]()
    var favtwoSecondproducidclikstring = String()
    
    var favtwoSecondproductofferMargin = [String]()

    var favtwoSecondNewproductsMrpstack = [String]()
    var favtwofavouritesecondvalue = [String]()
    var favtwovouritecashBackfinal = [String]()
    var buttonsingeltwo = UIButton()
    var favouritetwo = UIButton()
    var HomefooterView = UIView()
    var HomefooterViewtwo = UIView()
    var buttonsingelfinal = UIButton()
    @IBOutlet weak var favouritetabelviewtwo: UITableView!
    var shareTime = Int()
    
    
    var favouritetotoalvalue = String()
    
    var FavouriteproducidclikHOMEstring  = String()
    
    
    
    @IBOutlet weak var agnetfavouritefourvalue: UIView!
  
    var DefaultBrandexplorebuttonclick = String()
    var DefaultCatageorybuttonclick = String()
    
    var deafultsBrandvalueStringfinalnewcat = String()

    var deafultscatageoryvalueStringfinalnewcat = String()
    
    
    
    
    @IBOutlet weak var Toplabelvaluechanged: UILabel!
    @IBOutlet weak var cartlabelfinalvalue: UILabel!
    
    
    @IBOutlet weak var brandlabelfinalvalue: UILabel!
  
    @IBOutlet weak var cartlabelsingel: UILabel!
    
    var Brnadsingel = String()
    
    var catsingel = String()



    var Branduserquantity = [String]()
    var Branduserweight_mrp = [String]()
var secondNewmarginlabelvaluefinal = [String]()

    var Catgeoryuserquantity = [String]()
    var Catgeoryweight_mrp = [String]()

    var SecondNewavailable_qtybrand = [String]()
    
   var  TodayProductsid = [String]()
    var  RecomendedProductId = [String]()
    var  Trendingproductidvalue = [String]()

    var Newproductidvalue = [String]()
   var Newproductuserquantity = [String]()
   var freNewproductidvalue = [String]()
  
    @IBOutlet weak var maximumorderquntity: UIView!

    @IBOutlet weak var soldview: UIView!
    
    @IBOutlet weak var soldtabelview: UITableView!
    
     @IBOutlet weak var Numbermalltopdropbutton: UIButton!
    
    @IBOutlet weak var drop: UIButton!
    
    @IBOutlet weak var numbermalview: UIView!
    @IBOutlet weak var descriptionlabel: UILabel!
 
    @IBOutlet weak var minimuminstacklabel: UILabel!
    var particularadd = String()
    var Bulkarray = NSArray()
    var LTSarray = NSArray()
    var SchemeSarray = NSArray()
    var comboSarray = [String]()
    var comboSfinalarray = NSDictionary()
    var Combossingelvalue = NSDictionary()
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

    let HomecellReuseIdentifier = "cell"
    var imageone = UIImageView()
    var Bannerarryidstring = [String]()
    var pageCount : CGFloat = CGFloat()
   
    var newProductInstock = String()
    var newProductMoQ = String()
    var newProductanotherQnty = String()

    var NewproductavailQnty = [String]()
    var NewproductMoQCal = [String]()
    var NewproductSellerID = [String]()
    var clickedbuttontotalvalue = String()
    var TodaydealavailableQnty = [String]()
    var TodaydealMoQCal = [String]()
    var TodaydealSellerID = [String]()
    var todayInstock = String()
    var todayMoQ = String()
    var todayanotherQnty = String()

    var recomInstock = String()
    var recomMoQ = String()
    var recomanotherQnty = String()
    var RecomendedavailableQnty = [String]()
    var RecomendedMoQCal = [String]()
    var RecomendedSellerID = [String]()
 
    var trendInStock = String()
    var trendMoQ = String()
    var trendanotherQnty = String()
    
    var TrendingavailableQnty = [String]()
    var TrendingMoQCal = [String]()
    var TrendingSellerID = [String]()
   
    var frequentInstock = String()
    var frequentMoQ = String()
    var frequentanotherQnty = String()
    
    var freNewproductavailQnty = [String]()
    var freNewproductMoQCal = [String]()
    var freNewproductSellerID = [String]()

    
    var Todayspecialoffer = [String]()
    
    var Recomendedspecialoffer = [String]()
    
    var Trendingspecialoffer = [String]()
    var Newproductspecialoffer = [String]()

    var Frequentlyboughtproductsspecialoffer = [String]()
    
    
    @IBOutlet weak var pickerviewBackfinalvalue: UIButton!

    var Todayvalue = String()
    

    var cellerid = String()

    var Today_quantity = String()

    var cart_Countvalue = NSNumber()
    
    var user_updatevalue = String()

    
    var selectedint :Int?

    
      var point : CGPoint = CGPoint()
    
    
    
    var VisibleIndexquntity:IndexPath = IndexPath(row: 0, section: 0)

    var cartListarraysingel:Array<Any> = []

    
    var cartListmuetabelarrayone = NSMutableArray()
    var cartListmuetabelarraytwo = NSMutableArray()
   
    var BrandMOquantity = [String]()
    var favtwoSecondavalQnty = [String]()
    var favtwoSecondMoqCal = [String]()
    var favSecondMoqCal = [String]()
    var favSecondavalQnty = [String]()
    
    @IBOutlet weak var myviewonefinal: UIView!
    
    var viewallclickvalue = String()

    var messageStockOut = String()
    var stockOutTitel = String()
    
   var SecondProductExculise = [String]()
  var favtwoSecondExclusive = [String]()
    var favSecondExclusive = [String]()

    @IBOutlet weak var mainpopupscrollview: UIScrollView!
    @IBOutlet weak var mainpopview: UIView!

    @IBOutlet weak var ratingtopHome: UIView!
    @IBOutlet weak var floatratingview: FloatRatingView!
    
    @IBOutlet weak var ratedgivenview: UIView!
    
    
    @IBOutlet weak var manimage: UIImageView!
    @IBOutlet weak var ratedeliveryboy: UILabel!
    
    @IBOutlet weak var freelabel: UILabel!
    
    
    @IBOutlet weak var Bowl: UIImageView!
    
    
    @IBOutlet weak var submit: UIButton!
    
    @IBOutlet weak var Quantitymismatch: UIButton!
    
    
    
    @IBOutlet weak var Damagedproducts: UIButton!
    
    @IBOutlet weak var Timetodelivery: UIButton!
    
    
    
    @IBOutlet weak var Productknowledge: UIButton!
    
    @IBOutlet weak var Goodshandling: UIButton!
    
    
    @IBOutlet weak var Unprofessional: UIButton!
    
    @IBOutlet weak var Packingquality: UIButton!
    
    @IBOutlet weak var Others: UIButton!
    @IBOutlet weak var topview: UIView!
    
    
    
    var HomeMessagelabel = [String]()
    
    @IBOutlet weak var complianttabelview: UITableView!
    
    var Stocktitle = [String]()

    var Stockis = [String]()
    var Delyindelivery = [String]()
    var DeliveryorderNumbaer = [String]()
    var DeliveryOpen = [String]()
    var DeliveryDate = [String]()

    
    
    @IBOutlet weak var compliantfinalview: UIView!
    
    @IBOutlet weak var mylogyourticket: UIButton!
    
    @IBOutlet weak var callbutton: UIButton!
    
    @IBOutlet weak var CompliantPlusbutton: UIButton!
    
    @IBOutlet weak var closepopview: UIView!
    
    @IBOutlet weak var closextop: UIView!
    
    
    @IBOutlet weak var middelviewfinal: UIView!
    
    
    @IBOutlet weak var SchemesView: UIView!
    
    

    var SoketLoginarray = NSDictionary()
    
    var onlinestring = NSNumber()
    
    var AcessTokenfinalstring = String()

    var CompliantDict = NSDictionary()
    var Compliantarray = NSArray()
    var CompliantName = [String]()
    var Homeindex = Int()
    var CompliantimageValue = [String]()

    var compiantid = [NSNumber]()
    
    var mycompliantimagefinal = UIImage()
    
    
    @IBOutlet weak var mycontactbutton: UIButton!
    

    
    
    @IBOutlet weak var mycontactviewfinalview: UIView!
  
    var Mycompliantfinalvalue = String()
    
    
    var Mysingelqunatityvaluefinal = String()

    var Mysecondfinal = String()

    var MysecondIntvalue = Int()
    @IBOutlet weak var Mycart: UILabel!
   
    @IBOutlet weak var Notificationsview: UIView!
    var Notificationsviewfinal  = UIView()

    @IBOutlet weak var mynotificationsingellineview: UIView!
    
    @IBOutlet weak var Notificationbutton: UIButton!
    @IBOutlet weak var notificationLineview: UIView!
 
    @IBOutlet weak var mymarkettabelview: UITableView!
    var Marketusers = [String]()
  
    var popcornTopname = [String]()

    var popcornCustomerbname = NSArray()

    var popcornDatelabel = NSArray()

    
    var Totalpopcornnamelabel = NSArray()

    
    var Totalpopcornrupeeslabel = NSArray()
  
    var Totalpopcornrupeesmarginlabel = [String]()
    var Totalpopcornpercentagelabel = [String]()
    var TotalpopcornMarginlabel = NSArray()
  
    var TotalpopcornEndsinlabel = [String]()
    var Totalpopcorndaysinlabel = [String]()
    var TotalpopcornRestokeoffTakelabel = [NSNumber]()
    var Totalpopcornoutletboughtlabel = [String]()
    var shoutNamelabelstring = [String]()
    var percentagelabelstring = [String]()
    var Dictfinal  = NSMutableDictionary()
    var useridbiling1 = String()
    
    var MArketproductIMagetwo = NSArray()

    
    var popcornDictionary = NSArray()
    
    var favpopcornsubject = NSArray()

    var Moqstringvalue = NSArray()

    var Totalpopcorniamgefinalvalue = NSArray()

    var TotalpopcornCutoffrate = NSArray()

    
    @IBOutlet weak var myalertviewfinalvalue: UIView!
    
    var Myauthorisationstringfinalvalue = String()
    
    
    var Marketshoutid = NSArray()
    
    var SingelMarketshoutidvalue = String()

    
    var Instackarray = NSArray()

     @IBOutlet weak var NoTifictaiontabelview: UITableView!
    var Notifictaionimagevalue = [UIImage]()
    var Notificationoffer = [String]()
    var Notificationofferfinalvalue = [String]()
    var NotificationofferHistoryValue = [String]()

    
    @IBOutlet weak var combototalviewfinal: UIView!
    
    
    @IBOutlet weak var combototalfinaltwo: UIView!
    
    @IBOutlet weak var mydemofinalavle: UIView!
    
    var finalarayvaluw = String()
    
    
    
    var sokettidTotal = [String]()
    
    var sokettidindividual = String()

    
    
    var selectedIndexfinal :Int?

    
    
    @IBOutlet weak var myshemetabelview: UITableView!
    
    
    @IBOutlet weak var Favorites: UIButton!
    
    @IBOutlet weak var Recents: UIButton!
    
    @IBOutlet weak var Schemes: UIButton!
    
    
    
    
    @IBOutlet weak var agentschemeviefinal: UIView!
    
    
    
    
    
    var favouritesineglvalue = String()

    
    
    var SwipeLeftone = UISwipeGestureRecognizer()
    var SwipeRightone = UISwipeGestureRecognizer()
   
    var MenuappDelegate = String()
    
    
    
    @IBOutlet weak var mycomboscrollview: UIScrollView!
    
    
    @IBOutlet weak var mycomboviewfinal: UIView!
   
    @IBOutlet weak var addpopview: UIView!
    
    
    
    @IBOutlet weak var Combotopview: UIView!
    
    @IBOutlet weak var soldfilledby: UILabel!
    @IBOutlet weak var soldrop: UIButton!
    @IBOutlet weak var numbermalllabel: UILabel!
    
    
    
    
    @IBOutlet weak var mycombotwofinal: UIView!
    
    @IBOutlet weak var numbermalltwo: UILabel!
    
    @IBOutlet weak var distibutionlabel: UILabel!
    
    @IBOutlet weak var distibutopnsupplay: UILabel!
    
    @IBOutlet weak var Topcombocolletcionview: UICollectionView!
    
    
    var collectionarray = [String]()

    var comboSarray1 = NSArray()
    
    
    @IBOutlet weak var Combofirstviewone: UIView!
    
    @IBOutlet weak var Combofirstscrollview: UIScrollView!
    
    @IBOutlet weak var Combocolelctionview: UICollectionView!
    
    
    @IBOutlet weak var LightButton: UIButton!
    
    @IBOutlet weak var Handbuttone: UIButton!
    
    var Combimage = NSArray()
    
    @IBOutlet weak var viewone: UIView!
    
    @IBOutlet weak var withoutcomboradiobutton: UIButton!
    
    @IBOutlet weak var withoutcomboprice: UILabel!
    
    
    @IBOutlet weak var withoutcombomore: UILabel!
    @IBOutlet weak var withoutcombomargin: UILabel!
    
    
    @IBOutlet weak var secondofferviewtwo: UIView!
    
    @IBOutlet weak var combobutton: UIButton!
    
    @IBOutlet weak var comboprice: UILabel!
    
    @IBOutlet weak var combomrp: UILabel!
    
    @IBOutlet weak var combomargin: UILabel!
    
    @IBOutlet weak var combodrop: UIButton!
    
    var MycomboDictfinalvalue = NSDictionary()
    var defaultsDictFinalvalue = NSDictionary()
    var defaultsMoq = NSString()
    var defaultsMOQ_text = NSString()
    var defaultsMRP = NSString()
    var defaultsPTR = NSNumber()
    var defaultsmargin = NSString()
    var defaultsprice = NSString()
    var defaultsprodId = NSString()
    
    var buttonTotalvalue = UIButton()
   
    
    
    @IBOutlet weak var Loadingaimegfinalvalue: UIImageView!
    
    
    
    @IBOutlet weak var myinstacklabeltwo: UILabel!
    
    @IBOutlet weak var numbermalldottedline: UIView!
    
    
    @IBOutlet weak var popupsingellineview: UIView!
    
    @IBOutlet weak var singeldropfinal: UIView!
    
    @IBOutlet weak var favoiuriteimagetwo: UIImageView!
    
    @IBOutlet weak var catageorytotalview: UIView!
    
    
    
    var  mrparrayyTotal = NSArray()
    var ComboarrayvalueTotal = NSArray()
    
    var isExclusiveTotal  = NSArray()
    
    var isNewTotal =  NSArray()
    
    @IBOutlet weak var mymarketscrollview: UIScrollView!
    
    @IBOutlet weak var noshoutimageview: UIImageView!
    
    @IBOutlet weak var noshoutviewfinal: UIView!
    
    var  Marketsingelidvalue = String()
    var  StatusTotal = String()
    
    var marketarray = NSArray()
    
    var MArketcomments = [String]()
    var likesvalue = [String]()
    var shoutsvalue = [String]()
    var Likemarketselectedint :Int?
    var  emarketselectedint :Int?
    var markettapGesture = UITapGestureRecognizer()
    var statusTotalvalue = String()
    var singelshoutidtotal = String()
    @IBOutlet weak var Reshoutview: UIView!
    @IBOutlet weak var Reshouttotal: UIView!
    @IBOutlet weak var sahreview: UIView!
    var Homerating = String()
    var Homeratingnumber = NSNumber()
    var Homefreedeliver = NSArray()
    var myagentTotalvalue = String()
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.singeldropfinal.layer.cornerRadius = 8.0
        self.singeldropfinal.layer.masksToBounds = true
        self.Reshoutview.layer.cornerRadius = 8.0
        self.Reshoutview.layer.masksToBounds = true
        maximumorderquntity.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        
        if self.view.frame.size.height < 800
        {
            Combofirstscrollview.delegate = self
            Combofirstscrollview.contentInset = UIEdgeInsetsMake(0, 0,700, 0)
            Combofirstscrollview.isScrollEnabled = true
            Combofirstscrollview.showsVerticalScrollIndicator = false
        }
        
        if self.view.frame.size.height < 800
        {
            mymarketscrollview.delegate = self
            mymarketscrollview.contentInset = UIEdgeInsetsMake(0, 0,1500, 0)
            mymarketscrollview.isScrollEnabled = true
            mymarketscrollview.showsVerticalScrollIndicator = false
        }
        
        self.viewone.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.6)

        self.Homeindex = 0

        topview.dropShadow()
     
        Brandstapview.dropShadow()

        
        let defaults = UserDefaults.standard
        
        if let Brandidfinal:String = defaults.value(forKey:"MydefaultsBrandidstring")as?String
        {
            self.defaultsBrandidstring = Brandidfinal
        }
        
        if let barndsnamefinal:String = defaults.value(forKey:"Mydefaultsbarndsname")as?String
        {
            self.defaultsbarndsnamestring = barndsnamefinal
        }
        if let brandspathfinal:String = defaults.value(forKey:"Mydeafultsbrandspath")as?String
        {
            self.deafultsbrandspathstring = brandspathfinal
        }
        if let catageoryidfinal:String = defaults.value(forKey:"Mydeafultscatageoryidstring")as?String
        {
            self.deafultscatageoryidstring = catageoryidfinal
        }
    if let catageorynamesfinal:String = defaults.value(forKey:"mydeafultscatageoryname")as?String
        {
            self.deafultscatageorynamestring = catageorynamesfinal
        }
    if let caatgeorypathsfinal:String = defaults.value(forKey:"mydefaultscaatgeorypathstring")as?String
        {
            self.defaultscaatgeorypathstring = caatgeorypathsfinal
        }
        
      
        
        if let Mycartcountvalue:NSNumber = defaults.value(forKey:"Mycartcountstring")as?NSNumber
        {
            self.Mycart.text = Mycartcountvalue.stringValue
            self.Mycart.isHidden = false
            self.Mycart.layer.cornerRadius = 6.0
            self.Mycart.layer.masksToBounds = true

        }
        

        
        if let MyKycpendingfinalavlue:String = defaults.value(forKey:"isverystring")as?String
        {
            if MyKycpendingfinalavlue == "1"
            {
                self.singelbutton.isHidden = true
            }
            if MyKycpendingfinalavlue == "2"
            {
                self.singelbutton.isHidden = false
            }
            if MyKycpendingfinalavlue == "4"
            {
                self.singelbutton.isHidden = false

            }
            if MyKycpendingfinalavlue == "3"
            {
                self.singelbutton.isHidden = false
            }
            if MyKycpendingfinalavlue == "5"
            {
                self.singelbutton.isHidden = false
            }
            
        }
        else
        {
            self.Mycart.isHidden = true
            self.cartbuttonfinalvalue.setBackgroundImage(#imageLiteral(resourceName: "Cart"), for:.normal)
        }
        let kuserdefaukts = UserDefaults.standard

    let colorfinal =  UIColor(red:217/255, green:218/255, blue:218/255, alpha: 1).cgColor
        
        self.bottomstaticview.layer.addBorder(edge:.top, color:UIColor(cgColor:colorfinal), thickness: 0.6)

         favouritefinal = ["All","Trending"]

        
        if view.frame.size.width < 800
        {
            if UIScreen.main.bounds.size.height == 480
            {
                Homescrollview.contentSize = CGSize(width: self.view.frame.size.width, height:3250)
                Homescrollview.showsVerticalScrollIndicator = false
            }
            if UIScreen.main.bounds.size.height == 568
            {
                Homescrollview.contentSize = CGSize(width: self.view.frame.size.width, height:3300)
                Homescrollview.showsVerticalScrollIndicator = false
            }
            
            if  UIScreen.main.bounds.size.height == 736
            {
                
            
                Homescrollview.contentSize = CGSize(width: self.view.frame.size.width, height:3750)
                Homescrollview.showsVerticalScrollIndicator = false
                
            }
            if UIScreen.main.bounds.size.height == 667
            {
                Homescrollview.contentSize = CGSize(width: self.view.frame.size.width, height:2800)
                Homescrollview.showsVerticalScrollIndicator = false
        
            }
        }
     
Menu_vc = self.storyboard?.instantiateViewController(withIdentifier:"MenuViewController")as!MenuViewController

         SwipeRight = UISwipeGestureRecognizer(target:self, action: #selector(self.respondToGesture))
        SwipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(SwipeRight)
        
        
        SwipeRight = UISwipeGestureRecognizer(target:self, action: #selector(self.respondToGesture))
        SwipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(SwipeRight)
        
        
         SwipeLeft = UISwipeGestureRecognizer(target:self, action: #selector(self.respondToGesture))
        SwipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(SwipeLeft)
        
        topcatageoryview.isUserInteractionEnabled = true
        
        Homecollectionview.showsHorizontalScrollIndicator = false
        Trendingproductcollectionview.showsHorizontalScrollIndicator = false
        Topproductcolectionview.showsHorizontalScrollIndicator = false
        topcatageorycollectionview.showsHorizontalScrollIndicator = false
        Recomendedcollectionview.showsHorizontalScrollIndicator = false
        TopBrandcollectionview.showsHorizontalScrollIndicator = false
        Newproductcollectionview.showsHorizontalScrollIndicator = false
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        
        Homeview.addGestureRecognizer(tap)
        Homeview.isUserInteractionEnabled = true
        Newproductcollectionview.dataSource = self
        Newproductcollectionview.delegate = self
        
        let tapTwo = UITapGestureRecognizer(target: self, action: #selector(self.handleTaptwo(_:)))
        
        Brandsview.addGestureRecognizer(tapTwo)
        
        Brandsview.isUserInteractionEnabled = true
        let tapThree = UITapGestureRecognizer(target: self, action: #selector(self.handleTapcatgeory(_:)))
        
        topcatageoryview.addGestureRecognizer(tapThree)
        
        topcatageoryview.isUserInteractionEnabled = true

        NewBrandcollectionview.showsHorizontalScrollIndicator = false
 
        TopBrandcollectionview.backgroundColor = UIColor.NEWBRANDCOLOR()
      
        abcdcollectionview.showsHorizontalScrollIndicator = false
        Explorebrandscollectionview.showsHorizontalScrollIndicator = false
        
        Catabcdcollectionview.showsHorizontalScrollIndicator = false
        CatExplorebrandscollectionview.showsHorizontalScrollIndicator = false
        
        
        NewBrandtabelview.showsVerticalScrollIndicator = false
        
        Newcatcollectionview.showsVerticalScrollIndicator = false
//        Newfavouritecollectionview.showsHorizontalScrollIndicator = false
        CatExplorebrandscollectionview.showsHorizontalScrollIndicator = false
        Newcattabelview.showsVerticalScrollIndicator = false
        favouritetabelview.showsVerticalScrollIndicator = false
    
        if self.view.frame.size.height < 800
        {
            Brandsscrollview.contentInset = UIEdgeInsetsMake(0, 0, self.Brandsscrollview.frame.size.height-115, 0)
         Brandsscrollview.isScrollEnabled = true
            Brandsscrollview.showsVerticalScrollIndicator = false
        }

   Brandtaeblviewiamgeview = [#imageLiteral(resourceName: "Testing"),#imageLiteral(resourceName: "Testing"),#imageLiteral(resourceName: "Testing")]


        Todayviewall.layer.cornerRadius = 3.0
        Recomendedviewall.layer.cornerRadius = 3.0
        Trendingbutton.layer.cornerRadius = 3.0
        singelbrand.layer.cornerRadius = 3.0
        NEwproductall.layer.cornerRadius = 3.0
        topbrands.layer.cornerRadius = 3.0
        Topcatageorybutton.layer.cornerRadius = 3.0
        

 self.Homecall()

        firstView = firstviewone
        thiredview = finaldemoview
        
        Moreview = catview
        numnbermallchatview = cahtviewfinalvalue

       firstView.frame = CGRect(x:self.firstviewone.frame.origin.x, y:self.firstviewone.frame.origin.y, width:self.firstviewone.frame.size.width, height:self.firstviewone.frame.size.height)
    
       thiredview.frame = CGRect(x:self.finaldemoview.frame.origin.x, y:self.finaldemoview.frame.origin.y, width:self.finaldemoview.frame.size.width, height:self.finaldemoview.frame.size.height)
  
        Moreview.frame = CGRect(x:self.catview.frame.origin.x, y: self.catview.frame.origin.y, width:self.catview.frame.size.width, height:self.catview.frame.size.height)

         numnbermallchatview.frame = CGRect(x:self.cahtviewfinalvalue.frame.origin.x, y: self.cahtviewfinalvalue.frame.origin.y, width:self.cahtviewfinalvalue.frame.size.width, height:self.cahtviewfinalvalue.frame.size.height)

        let bottomSheet = JXBottomSheetView(contentView:popupscrollview as! UIScrollView)
        bottomSheet.defaultMaxinumDisplayHeight  = 200
        bottomSheet.displayState = .maxDisplay
        bottomSheet.frame = self.view.bounds
        demoview.addSubview(bottomSheet)
        Numbermallfavouriteview = agentfvaouriteview
        
        
          Numbermallfavouriteview.frame = CGRect(x:self.agentfvaouriteview.frame.origin.x, y: self.agentfvaouriteview.frame.origin.y, width:self.agentfvaouriteview.frame.size.width, height:self.agentfvaouriteview.frame.size.height)
        
        let tapfour = UITapGestureRecognizer(target: self, action: #selector(self.handleNumberfavourite(_:)))
        
        favourities.addGestureRecognizer(tapfour)
        
        favourities.isUserInteractionEnabled = true
        scrollPager.delegate = self
        scrollPager.addSegmentsWithTitlesAndViews(segments: [
            ("Home",firstView),
            ("Public Feed",Moreview),
            ("Profile", thiredview), ("Profilesingel", Numbermallfavouriteview), ("Cahtviewfinal",numnbermallchatview)])
        
        let bottomSheettwo = JXBottomSheetView(contentView:(Catpopupscrollview)!)
        bottomSheettwo.defaultMaxinumDisplayHeight  = 240
        bottomSheettwo.displayState = .maxDisplay
        bottomSheettwo.frame = self.view.bounds
        singpopoupcatgeory.addSubview(bottomSheettwo)
        
        rotationAngle = -90 * (.pi/180)
        
        let originalFrame = pickerView.frame
        
        pickerView.transform =  CGAffineTransform(rotationAngle: rotationAngle)
        pickerView.frame = originalFrame
        modelData = ["0","1","2","3","4","5","6","7","8","9","10+"]

        
        mytextfiledcolor.delegate = self
        mytextfiledcolor.addTarget(self, action: #selector(HomeViewController.textFieldDidChange(_:)), for: .editingChanged)
        
        scratchCard  = ScratchUIView(frame: CGRect(x:0, y:0, width:250
            , height:250),Coupon: "iamgeonetwo.png", MaskImage: "maskone.png", ScratchWidth: CGFloat(40))
        scratchCard.addSubview(viewtwo)
        scratchCard.delegate = self
        self.scratchcardviewfinal.addSubview(scratchCard)
        self.scratchcardviewfinal.layer.cornerRadius = 20.0
        self.scratchCard.layer.cornerRadius = 20.0

        
        let CahttapView = UITapGestureRecognizer(target: self, action: #selector(self.handleNumberChatview(_:)))
        chatsingelviewfinal.addGestureRecognizer(CahttapView)
        chatsingelviewfinal.isUserInteractionEnabled = true
        

       
        cahtsviewone = cahtsview
        ComplaintsView1 = compliantsview
        MarketView1 = marketingview
        Notificationsviewfinal = Notificationsview

        cahtsviewone.frame = CGRect(x:self.cahtsview.frame.origin.x, y:self.cahtsview.frame.origin.y, width:self.cahtsview.frame.size.width, height:self.cahtsview.frame.size.height)
        ComplaintsView1.frame = CGRect(x:self.compliantsview.frame.origin.x, y:self.compliantsview.frame.origin.y, width:self.ComplaintsView1.frame.size.width, height:self.compliantsview.frame.size.height)
        MarketView1.frame = CGRect(x:self.marketingview.frame.origin.x, y:self.marketingview.frame.origin.y, width:self.marketingview.frame.size.width, height:self.marketingview.frame.size.height)
         Notificationsviewfinal.frame = CGRect(x:self.Notificationsview.frame.origin.x, y:self.Notificationsview.frame.origin.y, width:self.Notificationsview.frame.size.width, height:self.Notificationsview.frame.size.height)
        
        scrollpagerfourvalue.delegate = self

        scrollpagerfourvalue.addSegmentsWithTitlesAndViews(segments: [
            ("Home",MarketView1),
            ("Public Feed",Notificationsviewfinal),
            ("Profile", ComplaintsView1),("Notifications",cahtsviewone)])
        

        if let caatgeorypathsfinal:String = defaults.value(forKey:"Shoutsecondvalue")as?String
        {
            if caatgeorypathsfinal.count > 0
            {
                favouritetotoalvalue = "1"
                self.mychatwithshoutDetails()
            }
        }

    let actionButton = DTZFloatingActionButton(frame:CGRect(x:view.frame.size.width - 56 - 14,
                                                                y:view.frame.size.height - 120,
                                                                width: 50,
                                                                height: 50
        ))
        actionButton.buttonImage =  #imageLiteral(resourceName: "new_contact")

        actionButton.handler = {
            button in
            DispatchQueue.main.async
                {
                let Contactsview = self.storyboard?.instantiateViewController(withIdentifier:"SelectconatactViewController")as!SelectconatactViewController
                self.present(Contactsview, animated: true, completion:nil)
            }
        }
        actionButton.isScrollView = true
        self.chatingtabelview.addSubview(actionButton)

        
        if !timerIsOn {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
            timerIsOn = true
        }
    
        firstviewone.addSubview(Homescrollview)
        
        self.demoscrollview.addSubview(firstviewone)
        
        self.demoscrollview.isScrollEnabled = false
        
        
        self.viewfavouriteone = self.viewfavone
        self.viewfavouritwtwo =  self.viewfavtwo
        self.viewfavourithree =  self.SchemesView

        self.viewfavouriteone.frame = CGRect(x:self.viewfavone.frame.origin.x, y:0, width:self.viewfavone.frame.size.width, height:self.viewfavone.frame.size.height+150)
        
        self.viewfavouritwtwo.frame = CGRect(x:self.viewfavtwo.frame.origin.x, y:0, width:self.viewfavtwo.frame.size.width, height:self.viewfavtwo.frame.size.height+150)
        
        self.viewfavourithree.frame = CGRect(x:self.SchemesView.frame.origin.x, y:0, width:self.SchemesView.frame.size.width, height:self.SchemesView.frame.size.height+150)
      
        Agentfavouritescrollview.contentSize = CGSize(width: self.view.frame.size.width, height:2500)
        Agentfavouritescrollview.showsVerticalScrollIndicator = false

        
        self.favouritescrollviewfinalvalue.delegate = self
        self.favouritescrollviewfinalvalue.addSegmentsWithTitlesAndViews(segments: [
            ("Favorites",self.viewfavouriteone),
            ("Recents",self.viewfavouritwtwo)
])
        
        
        
        

        self.soldtabelview.register(UITableViewCell.self, forCellReuseIdentifier: HomecellReuseIdentifier)


        self.ratingtopHome.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        
        self.submit.layer.cornerRadius = 3.0
        self.submit.layer.masksToBounds = true
        self.submit.clipsToBounds = true
       self.submit.layer.borderWidth  = 1.0
       self.submit.layer.borderColor = UIColor.lightGray.cgColor
        
        
        self.Quantitymismatch.layer.cornerRadius = 12.0
        self.Quantitymismatch.layer.masksToBounds = true
        self.Quantitymismatch.clipsToBounds = true
        self.Quantitymismatch.layer.borderWidth  = 1.0
        self.Quantitymismatch.layer.borderColor = UIColor.lightGray.cgColor
        self.Quantitymismatch.backgroundColor = UIColor.gray
        
        self.Damagedproducts.layer.cornerRadius = 12.0
        self.Damagedproducts.layer.masksToBounds = true
        self.Damagedproducts.clipsToBounds = true
         self.Damagedproducts.layer.borderWidth  = 1.0
        self.Damagedproducts.layer.borderColor = UIColor.lightGray.cgColor

        
        self.Timetodelivery.layer.cornerRadius = 12.0
        self.Timetodelivery.layer.masksToBounds = true
        self.Timetodelivery.clipsToBounds = true
        self.Timetodelivery.layer.borderWidth  = 1.0
        self.Timetodelivery.layer.borderColor = UIColor.lightGray.cgColor

        
        
        
        self.Productknowledge.layer.cornerRadius = 12.0
        self.Productknowledge.layer.masksToBounds = true
        self.Productknowledge.clipsToBounds = true
        self.Productknowledge.layer.borderWidth  = 1.0
        self.Productknowledge.layer.borderColor = UIColor.lightGray.cgColor
        
        

        self.Goodshandling.layer.cornerRadius = 12.0
        self.Goodshandling.layer.masksToBounds = true
        self.Goodshandling.clipsToBounds = true
        self.Goodshandling.layer.borderWidth  = 1.0
        self.Goodshandling.layer.borderColor = UIColor.lightGray.cgColor
        
        
        
        self.Unprofessional.layer.cornerRadius = 12.0
        self.Unprofessional.layer.masksToBounds = true
        self.Unprofessional.clipsToBounds = true
        self.Unprofessional.layer.borderWidth  = 1.0
        self.Unprofessional.layer.borderColor = UIColor.lightGray.cgColor
        
        
        self.Packingquality.layer.cornerRadius = 12.0
        self.Packingquality.layer.masksToBounds = true
        self.Packingquality.clipsToBounds = true
        self.Packingquality.layer.borderWidth  = 1.0
        self.Packingquality.layer.borderColor = UIColor.lightGray.cgColor

        self.mylogyourticket.layer.cornerRadius = 5.0
        self.mylogyourticket.layer.masksToBounds = true
        self.mylogyourticket.clipsToBounds = true
        
        self.Others.layer.cornerRadius = 12.0
        self.Others.layer.masksToBounds = true
        self.Others.clipsToBounds = true
        self.Others.layer.borderWidth  = 1.0
        self.Others.layer.borderColor = UIColor.lightGray.cgColor

        self.floatratingview.backgroundColor = UIColor.clear
        
        
        self.floatratingview.delegate = self as? FloatRatingViewDelegate

        self.ratedgivenview.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        
        self.ratedgivenview.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.8)

        self.middelviewfinal.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        self.middelviewfinal.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
        
        self.secondofferviewtwo.layer.addBorder(edge:.top, color:UIColor.textfiledbottomcolorside(), thickness:0.8)

        self.HomeMessagelabel = ["Raja goud","Raja goud","Raja goud","Raja goud","Stock alerts","Price updates"]
        self.complianttabelview.dataSource = self
        self.complianttabelview.delegate = self
        Stocktitle = ["S","D","P"]
        Stockis = ["Stock is not moving","Dely in delivery","Price issue"]
        Delyindelivery = ["Stock is not moving","Dely in delivery","Price issue"]
        DeliveryorderNumbaer = ["23334","23333","23332"]
        DeliveryOpen = ["Open","Open","Open"]
        DeliveryDate = ["Sun 12 Aug 2018","Sun 12 Aug 2018","Sun 12 Aug 2018"]
        self.Maindescrptionpoupview.roundedButton()

        DispatchQueue.main.async
            {
           self.socketconnection()

        }
        
        
        let tapcontactfinalvalue = UITapGestureRecognizer(target: self, action: #selector(self.handleTapContactfinalvalue(_:)))
        
        mycontactviewfinalview.addGestureRecognizer(tapcontactfinalvalue)
        
        mycontactviewfinalview.isUserInteractionEnabled = true

        
       
        Marketusers = ["Swift","Python","PHP","Java","JavaScript","C#"]
        mymarkettabelview.dataSource  = self
        mymarkettabelview.delegate  = self
        mymarkettabelview.showsHorizontalScrollIndicator = false
        mymarkettabelview.showsVerticalScrollIndicator = false
        DispatchQueue.main.async
            {
                self.Marketmethodtotal()
        }

Notifictaionimagevalue = [UIImage(named:"Logo.png"),UIImage(named:"Logo.png"),UIImage(named:"Logo.png"),UIImage(named:"Logo.png"),UIImage(named:"Logo.png")] as! [UIImage]

        
        Notificationoffer = ["NumberMall offered","NumberMall offered","NumberMall offered","NumberMall offered","NumberMall offered"]
        Notificationofferfinalvalue = ["New offer","New offer","New offer","New offer","New offer"]
NotificationofferHistoryValue = ["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer"]
        
        NoTifictaiontabelview.dataSource = self
        NoTifictaiontabelview.delegate = self

        let CahttapViewTotal = UITapGestureRecognizer(target: self, action: #selector(self.handleNumberChatviewfinalatotal(_:)))
        mydemofinalavle.addGestureRecognizer(CahttapViewTotal)
        mydemofinalavle.isUserInteractionEnabled = true
        
        myshemetabelview.dataSource = self
        myshemetabelview.delegate = self
       
        
        
        if view.frame.size.width < 800
        {
            self.Agentfavouritescrollview.contentSize = CGSize(width: self.view.frame.size.width, height:1800)
            self.Agentfavouritescrollview.showsVerticalScrollIndicator = false
        }

        self.Topcombocolletcionview.dataSource = self
        self.Topcombocolletcionview.delegate = self

        
        self.Combocolelctionview.dataSource = self
        self.Combocolelctionview.delegate = self
        self.Combocolelctionview.showsHorizontalScrollIndicator = false
        self.Combocolelctionview.showsVerticalScrollIndicator = false

        Catpopupscrollview.roundedButton()

        ANIMATIONVIEW.roundedButton()

        self.abcdcollectionview.decelerationRate = UIScrollViewDecelerationRateFast
        self.Catabcdcollectionview.decelerationRate = UIScrollViewDecelerationRateFast
 
        
        let markettap = UITapGestureRecognizer(target: self, action: #selector(self.markethandleTapContactfinalvalue(_:)))
        Reshouttotal.addGestureRecognizer(markettap)
        Reshouttotal.isUserInteractionEnabled = true
        self.sahreview.layer.cornerRadius = 12.0
        self.sahreview.layer.masksToBounds = true
    }

    @objc func markethandleTapContactfinalvalue(_ sender: UIGestureRecognizer)
    {
        self.Reshouttotal.isHidden = true
        self.Reshoutview.isHidden = true
        self.sahreview.isHidden = true
    }
  
    @objc func MyTaptotalfinalavlue(_ sender: UIGestureRecognizer)
    {
        SwipeLeft = UISwipeGestureRecognizer(target:self, action: #selector(self.respondToGesture))
        SwipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(SwipeLeft)
        
    }
    
    
    @objc func longTap(_ sender: UIGestureRecognizer)
    {
                DispatchQueue.main.async {
                    let viewtwo = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(viewtwo, animated:true, completion:nil)
                }

    }

    @objc func handleNumberChatviewfinalatotal(_ sender: UITapGestureRecognizer)
    {
      
        
        
        
        
        
    }
    
    @objc func handleTapContactfinalvalue(_ sender: UITapGestureRecognizer)
    {
        DispatchQueue.main.async
       {
            let contactviewfinalvalue = self.storyboard?.instantiateViewController(withIdentifier:"contactsViewController")as!contactsViewController
            self.present(contactviewfinalvalue, animated:true, completion:nil)
        }
    }

    private lazy var summaryViewController: ViewallBrandsViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "ViewallBrandsViewController") as! ViewallBrandsViewController
    
      if  self.viewallclickvalue == "Today"
      {
        viewController.Recomendedname1 = self.TodayProducts
        viewController.timeValue = self.dealEndtime
        viewController.viewone = self.myviewonefinal
        }
        
       
        
       

//           self.remove(containerView:myviewonefinal)
        
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    
    
    private lazy var summaryViewControllertwo: ViewallBrandsViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "ViewallBrandsViewController") as! ViewallBrandsViewController
        
       
        if  self.viewallclickvalue == "Trending"
        {
            viewController.Recomendedname1 = self.TrendingproductName
            viewController.viewone = self.myviewonefinal
            
        }
        if  self.viewallclickvalue == "Recomended"
        {
            viewController.Recomendedname1 = self.Recomendedname
            viewController.viewone = self.myviewonefinal
            
        }
        
        if  self.viewallclickvalue == "Newproductcall"
        {
            viewController.Recomendedname1 = self.NewproductName12
            viewController.viewone = self.myviewonefinal
            
        }
        
        if  self.viewallclickvalue == "Topproductcall"
        {
            viewController.Recomendedname1 = self.TodayProducts
            viewController.viewone = self.myviewonefinal
            
        }
        
        
        
        //           self.remove(containerView:myviewonefinal)
        
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
   
    private lazy var summaryViewControllerthree: ViewallBrandsViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "ViewallBrandsViewController") as! ViewallBrandsViewController
        
        if  self.viewallclickvalue == "Today"
        {
            viewController.Recomendedname1 = self.TodayProducts
            viewController.timeValue = self.dealEndtime
            viewController.viewone = self.myviewonefinal
        }
        
        if  self.viewallclickvalue == "Trending"
        {
            viewController.Recomendedname1 = self.TrendingproductName
            viewController.viewone = self.myviewonefinal
            
        }
        if  self.viewallclickvalue == "Recomended"
        {
            viewController.Recomendedname1 = self.Recomendedname
            viewController.viewone = self.myviewonefinal
            
        }
        
        if  self.viewallclickvalue == "Newproductcall"
        {
            viewController.Recomendedname1 = self.NewproductName12
            viewController.viewone = self.myviewonefinal
            
        }
        
        if  self.viewallclickvalue == "Topproductcall"
        {
            viewController.Recomendedname1 = self.TodayProducts
            viewController.viewone = self.myviewonefinal
            
        }
   
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    
    
    private lazy var summaryViewControllerfour: ViewallBrandsViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "ViewallBrandsViewController") as! ViewallBrandsViewController
        
        if  self.viewallclickvalue == "Today"
        {
            viewController.Recomendedname1 = self.TodayProducts
//            viewController.timeValue = self.myviewonefinal
            viewController.viewone = self.myviewonefinal
        }
        
        if  self.viewallclickvalue == "Trending"
        {
            viewController.Recomendedname1 = self.TrendingproductName
            viewController.viewone = self.myviewonefinal
            
        }
        if  self.viewallclickvalue == "Recomended"
        {
            viewController.Recomendedname1 = self.Recomendedname
            viewController.viewone = self.myviewonefinal
            
        }
        
        if  self.viewallclickvalue == "Newproductcall"
        {
            viewController.Recomendedname1 = self.NewproductName12
            viewController.viewone = self.myviewonefinal
            
        }
        
        if  self.viewallclickvalue == "Topproductcall"
        {
            viewController.Recomendedname1 = self.TodayProducts
            viewController.viewone = self.myviewonefinal
        }
   
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    
    
    private lazy var summaryViewControllerfive: ViewallBrandsViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "ViewallBrandsViewController") as! ViewallBrandsViewController
        
        if  self.viewallclickvalue == "Today"
        {
            viewController.Recomendedname1 = self.TodayProducts
//            viewController.timeValue = self.de
            viewController.viewone = self.myviewonefinal
        }
        
        if  self.viewallclickvalue == "Trending"
        {
            viewController.Recomendedname1 = self.TrendingproductName
            viewController.viewone = self.myviewonefinal
            
        }
        if  self.viewallclickvalue == "Recomended"
        {
            viewController.Recomendedname1 = self.Recomendedname
            viewController.viewone = self.myviewonefinal
            
        }
        
        if  self.viewallclickvalue == "Newproductcall"
        {
            viewController.Recomendedname1 = self.NewproductName12
            viewController.viewone = self.myviewonefinal
            
        }
        
        if  self.viewallclickvalue == "freproductcall"
        {
            viewController.Recomendedname1 = self.freNewproductName12
            viewController.viewone = self.myviewonefinal
            
        }
  
        self.add(asChildViewController: viewController)
        return viewController
    }()
    
    
    
    
    private func add(asChildViewController viewController: UIViewController) {
        addChildViewController(viewController)
        
        myviewonefinal.addSubview(viewController.view)
        
        viewController.view.frame = myviewonefinal.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParentViewController: self)
    }
    private func remove(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParentViewController: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParentViewController()
    }
    private func updateView() {
        add(asChildViewController: summaryViewController)
        
    }
    private func updateViewtwo() {
        add(asChildViewController: summaryViewControllertwo)
        
    }
    
    private func updateViewthree() {
        add(asChildViewController: summaryViewControllerthree)
        
    }
    private func updateViewfour() {
        add(asChildViewController: summaryViewControllerfour)
        
    }
    
    private func updateViewfive()
    {
        add(asChildViewController: summaryViewControllerfive)
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
    
    @objc func countDown()
    {
       
      dealEndtime  -= 1
            let ti = NSInteger(dealEndtime)
            let seconds = ti  % 60
            let minutes = (ti / 60) % 60
            let hours = (ti / 3600000)
            self.NewTimerlabel.text = String(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
       
         self.shareTime = self.dealEndtime
    }
 
    func socketconnection()
    {
        socketthree = managerthree.defaultSocket
        let defaultsvalue = UserDefaults.standard
        
        if let Bulkarrayfinal:String = defaultsvalue.value(forKey:"MyLoginfinalvalue")as? String
        {
            self.finalarayvaluw = Bulkarrayfinal
            let datafour = ["username":self.finalarayvaluw]
            let jsonData = try? JSONSerialization.data(withJSONObject:datafour, options: [])
            let jsonString = String(data: jsonData!, encoding: .utf8)
            socketthree.connect()
            socketthree.on("connect") { _, _ in
                self.socketthree.emit("socket_login", jsonString!)
                
                self.socketthree.on("system_groups")
                {data, ack in
                    self.socketDict = data as! [Any]
                    print(self.socketDict)
                    let arraysingelValue  = self.socketDict[0]
                    self.MainsocketDict = arraysingelValue as! NSDictionary
                    self.MainsocketArray = self.MainsocketDict.value(forKey:"chats")as!NSArray
                    self.chatingimagevalue =       self.MainsocketArray.value(forKey:"image")as![String]
                    
                    if let Productypeiconvaluefinal:[String] = self.MainsocketArray.value(forKey: "name") as? [String]
                    {
                        self.Productypeicon = Productypeiconvaluefinal
                    }
                    
                    self.ProductTiming =  self.MainsocketArray.value(forKey:"time")as![String]
                    
                    self.ProductMessagesCount =  self.MainsocketArray.value(forKey:"message_count")as![NSNumber]
                    print(self.ProductMessagesCount)
                    self.ProductypeMessage =  self.MainsocketArray.value(forKey:"last_message")as![String]
                    
                    self.ProductypeMessage =  self.MainsocketArray.value(forKey:"last_message")as![String]
                    self.sokettidTotal =  self.MainsocketArray.value(forKey:"id")as![String]

                 
                    DispatchQueue.main.async {
                        self.chatingtabelview.reloadData()
                    }
                    
                    DispatchQueue.main.async {
                        self.socketCompiantconnection()
                    }
                    
                }
            }
        }

    }
    
    
    func socketCompiantconnection()
    {
        socketwovalue = managertwo.defaultSocket
        
        let defaultsvalue = UserDefaults.standard
    
        if let Mycompliantfinalvaluearrayfinalvalue:String  =  defaultsvalue.value(forKey:"MyLoginfinalvalue") as? String
        {
            self.Mycompliantfinalvalue = Mycompliantfinalvaluearrayfinalvalue
        }
        
        
        
        let datafour = ["username":self.Mycompliantfinalvalue]
        let jsonData = try? JSONSerialization.data(withJSONObject:datafour, options: [])
        
        let jsonString = String(data: jsonData!, encoding: .utf8)
        
        
        socketwovalue.connect()
   
        
        socketwovalue.on("connect") { _, _ in
            self.socketwovalue.emit("get_compliants_info", jsonString!)
            self.socketwovalue.on("compliants_user_group")
            {data, ack in
                self.socketDictfinalvalue = data as! [Any]

                print(self.socketDictfinalvalue)
                let arraysingelValuetwo  = self.socketDictfinalvalue
                print(arraysingelValuetwo)

                self.CompliantDict =  arraysingelValuetwo as! NSDictionary

                print(self.CompliantDict)
                self.Compliantarray = self.CompliantDict.value(forKey:"Complaits")as!NSArray
            
                self.CompliantimageValue =       self.Compliantarray.value(forKey:"image")as![String]
                self.Stockis =  self.Compliantarray.value(forKey:"sub_name")as![String]
                self.DeliveryDate =  self.Compliantarray.value(forKey:"time")as![String]
                self.compiantid =  self.Compliantarray.value(forKey:"id")as![NSNumber]
           
                DispatchQueue.main.async
                    {
                    self.complianttabelview.reloadData()
                }
        
            }
        }
     
    }
    
    @objc func textFieldDidChange(_ textField: UITextField?)
    {
        anotherquntitylabel.text = textField?.text
    }
 
     @objc func handleTap(_ sender: UITapGestureRecognizer)
     {
        
        let defaults = UserDefaults.standard

        if let MyKycpendingfinalavlue:String = defaults.value(forKey:"isverystring")as?String
        {
            if MyKycpendingfinalavlue == "1"
            {
                self.singelbutton.isHidden = true
                
                self.combototalviewfinal.isHidden = true
                self.myviewonefinal.isHidden = true
                Homescrollview.contentOffset = .zero
                Toplabel.text = "NumberMall"
                Homescrollview.isHidden = false
                secondview.isHidden = true
                firstView.isHidden = false
                Moreview.isHidden = true
                thiredview.isHidden = true
                Numbermallfavouriteview.isHidden =  false
                Brnads.setBackgroundImage(#imageLiteral(resourceName: "Barnds"), for: .normal)
                Brandstwo.setTitleColor(UIColor.bottomnavigationtitile(), for: .normal)
                Hometwo.setBackgroundImage(#imageLiteral(resourceName: "Home"), for: .normal)
                Homeone.setTitleColor(UIColor.red, for:.normal)
                catageorytwo.setBackgroundImage(#imageLiteral(resourceName: "catageory"), for: .normal)
                catageoryone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                favourite.setBackgroundImage(#imageLiteral(resourceName: "favourite"), for: .normal)
                fsvouritetwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                cahtone.setBackgroundImage(#imageLiteral(resourceName: "chat"), for: .normal)
                cahttwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                
                scrollPager.setSelectedIndex(index:0, animated: true)
                favouritetotoalvalue = ""
        
                Newcattabelview.frame = CGRect(x: 0, y: self.Newcattabelview.frame.origin.y, width: self.Newcattabelview.frame.size.width, height: self.Newcattabelview.frame.size.height)
                NewBrandtabelview.frame = CGRect(x: 0, y: self.NewBrandtabelview.frame.origin.y, width: self.NewBrandtabelview.frame.size.width, height: self.NewBrandtabelview.frame.size.height)
            }
            if MyKycpendingfinalavlue == "2"
            {
                self.singelbutton.isHidden = false
            }
            if MyKycpendingfinalavlue == "4"
            {
                self.singelbutton.isHidden = false
                
            }
            if MyKycpendingfinalavlue == "3"
            {
                self.singelbutton.isHidden = false
            }
            if MyKycpendingfinalavlue == "5"
            {
                self.singelbutton.isHidden = false
            }
            
        }
        
        else
        {

        }
    }
    
    @objc func handleNumberfavourite(_ sender: UITapGestureRecognizer)
    {
        let defaults = UserDefaults.standard
        if let MyKycpendingfinalavlue:String = defaults.value(forKey:"isverystring")as?String
        {
            if MyKycpendingfinalavlue == "1"
            {
                self.singelbutton.isHidden = true
                
                self.combototalviewfinal.isHidden = true
                
                self.viewallclickvalue = ""
                self.viewallclickvalue = ""
                self.viewallclickvalue = ""
                self.viewallclickvalue = ""
                self.viewallclickvalue = ""
                self.myviewonefinal.isHidden = true
                
                Numbermallfavouriteview.isHidden =  false
                Toplabel.text = "Favorites"
                Toplabel.text = "Favorites"
                Numbermallfavouriteview.isHidden =  false
                scrollPager.setSelectedIndex(index:3, animated: true)
                Brnads.setBackgroundImage(#imageLiteral(resourceName: "Barnds"), for: .normal)
                Brandstwo.setTitleColor(UIColor.bottomnavigationtitile(), for: .normal)
                Hometwo.setBackgroundImage(#imageLiteral(resourceName: "home_grey"), for: .normal)
                Homeone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                catageorytwo.setBackgroundImage(#imageLiteral(resourceName: "catageory"), for: .normal)
                catageoryone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                favourite.setBackgroundImage(#imageLiteral(resourceName: "favoutires_red"), for: .normal)
                fsvouritetwo.setTitleColor(UIColor.red, for:.normal)
                cahtone.setBackgroundImage(#imageLiteral(resourceName: "chat"), for: .normal)
                cahttwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                Agentfavouritescrollview.isHidden = false
                Agentsfavouritietwo.isHidden = true
                self.favouritetabelview.isHidden = false
                self.favouritetabelviewtwo.isHidden = false
                self.Favouritecallfunction()
                favouritetotoalvalue = "1"
             
                Newcattabelview.frame = CGRect(x: 0, y: self.Newcattabelview.frame.origin.y, width: self.Newcattabelview.frame.size.width, height: self.Newcattabelview.frame.size.height)
                NewBrandtabelview.frame = CGRect(x: 0, y: self.NewBrandtabelview.frame.origin.y, width: self.NewBrandtabelview.frame.size.width, height: self.NewBrandtabelview.frame.size.height)
                
                self.myviewonefinal.isHidden = true
                
                self.favoiuriteimagetwo.isHidden = false

                favouritesineglvalue = "1"
                DispatchQueue.main.async
                    {
                        self.Favouritecallfunction()
                }
                
            }
            if MyKycpendingfinalavlue == "2"
            {
                self.singelbutton.isHidden = false
            }
            if MyKycpendingfinalavlue == "4"
            {
                self.singelbutton.isHidden = false
                
            }
            if MyKycpendingfinalavlue == "3"
            {
                self.singelbutton.isHidden = false
            }
            if MyKycpendingfinalavlue == "5"
            {
                self.singelbutton.isHidden = false
            }
            
        }

    }
    
    @objc func handleNumberChatview(_ sender: UITapGestureRecognizer)
    {
        self.Marketmethodtotal()
        let defaults = UserDefaults.standard
        if let MyKycpendingfinalavlue:String = defaults.value(forKey:"isverystring")as?String
        {
            if MyKycpendingfinalavlue == "1"
            {
                self.singelbutton.isHidden = true
                self.combototalviewfinal.isHidden = true
                
                self.myviewonefinal.isHidden = true
                favouritetotoalvalue = ""
                Agentfavouritescrollview.contentOffset = .zero
                if self.view.frame.size.height < 800 {
                    Agentfavouritescrollview.contentInset = UIEdgeInsetsMake(0, 0,self.Brandsscrollview.frame.size.height-115, 0)
                    Agentfavouritescrollview.isScrollEnabled = true
                    Agentfavouritescrollview.showsVerticalScrollIndicator = false
                }
                numnbermallchatview.isHidden =  false
                scrollPager.setSelectedIndex(index:4, animated: true)
                

                
                if cahtone.tag == 0
                {
                    
                    numnbermallchatview.isHidden =  false
                    Agentfavouritescrollview.isHidden = false
                    cahtone.tag = 1
                    
                }
                else if cahtone.tag == 1
                {
                    
                    Numbermallfavouriteview.isHidden =  false
                    Agentfavouritescrollview.isHidden = true
                    cahtone.tag = 0
                }
                Newcattabelview.frame = CGRect(x: 0, y: self.Newcattabelview.frame.origin.y, width: self.Newcattabelview.frame.size.width, height: self.Newcattabelview.frame.size.height)
                NewBrandtabelview.frame = CGRect(x: 0, y: self.NewBrandtabelview.frame.origin.y, width: self.NewBrandtabelview.frame.size.width, height: self.NewBrandtabelview.frame.size.height)
            }
            if MyKycpendingfinalavlue == "2"
            {
                self.singelbutton.isHidden = false
            }
            if MyKycpendingfinalavlue == "4"
            {
                self.singelbutton.isHidden = false
                
            }
            if MyKycpendingfinalavlue == "3"
            {
                self.singelbutton.isHidden = false
            }
            if MyKycpendingfinalavlue == "5"
            {
                self.singelbutton.isHidden = false
            }
        }
        Brnads.setBackgroundImage(#imageLiteral(resourceName: "Barnds"), for: .normal)
        Brandstwo.setTitleColor(UIColor.bottomnavigationtitile(), for: .normal)
        Hometwo.setBackgroundImage(#imageLiteral(resourceName: "home_grey"), for: .normal)
        Homeone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
        catageorytwo.setBackgroundImage(#imageLiteral(resourceName: "catageory"), for: .normal)
        catageoryone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
        favourite.setBackgroundImage(#imageLiteral(resourceName: "grey-star"), for: .normal)
        fsvouritetwo.setTitleColor(UIColor.black, for:.normal)
        cahtone.setBackgroundImage(#imageLiteral(resourceName: "chats-red"), for: .normal)
        cahttwo.setTitleColor(UIColor.red, for:.normal)
        
        
    }
    
    func mychatwithshoutDetails()
    {
        let defaults = UserDefaults.standard
        if let MyKycpendingfinalavlue:String = defaults.value(forKey:"isverystring")as?String
        {
            if MyKycpendingfinalavlue == "1"
            {
                self.singelbutton.isHidden = true
                self.myviewonefinal.isHidden = true
                favouritetotoalvalue = ""
                Agentfavouritescrollview.contentOffset = .zero
                if self.view.frame.size.height < 800 {
                    Agentfavouritescrollview.contentInset = UIEdgeInsetsMake(0, 0,self.Brandsscrollview.frame.size.height-115, 0)
                    Agentfavouritescrollview.isScrollEnabled = true
                    Agentfavouritescrollview.showsVerticalScrollIndicator = false
                }
                numnbermallchatview.isHidden =  false
                scrollPager.setSelectedIndex(index:4, animated: true)
                self.scrollPagerfinal(scrollPager:scrollpagerfourvalue, changedIndex:2)
                
                Brnads.setBackgroundImage(#imageLiteral(resourceName: "Barnds"), for: .normal)
                Brandstwo.setTitleColor(UIColor.bottomnavigationtitile(), for: .normal)
                Hometwo.setBackgroundImage(#imageLiteral(resourceName: "home_grey"), for: .normal)
                Homeone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                catageorytwo.setBackgroundImage(#imageLiteral(resourceName: "catageory"), for: .normal)
                catageoryone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                favourite.setBackgroundImage(#imageLiteral(resourceName: "favourite"), for: .normal)
                fsvouritetwo.setTitleColor(UIColor.black, for:.normal)
                cahtone.setBackgroundImage(#imageLiteral(resourceName: "chats-red"), for: .normal)
                cahttwo.setTitleColor(UIColor.red, for:.normal)
                
                if cahtone.tag == 0
                {
                    
                    numnbermallchatview.isHidden =  false
                    Agentfavouritescrollview.isHidden = false
                    cahtone.tag = 1
                    
                }
                else if cahtone.tag == 1
                {
                    
                    Numbermallfavouriteview.isHidden =  false
                    Agentfavouritescrollview.isHidden = true
                    cahtone.tag = 0
                }
                Newcattabelview.frame = CGRect(x: 0, y: self.Newcattabelview.frame.origin.y, width: self.Newcattabelview.frame.size.width, height: self.Newcattabelview.frame.size.height)
                NewBrandtabelview.frame = CGRect(x: 0, y: self.NewBrandtabelview.frame.origin.y, width: self.NewBrandtabelview.frame.size.width, height: self.NewBrandtabelview.frame.size.height)
                
                self.socketconnection()
                
                self.socketCompiantconnection()
            }
            if MyKycpendingfinalavlue == "2"
            {
                self.singelbutton.isHidden = false
            }
            if MyKycpendingfinalavlue == "4"
            {
                self.singelbutton.isHidden = false
                
            }
            if MyKycpendingfinalavlue == "3"
            {
                self.singelbutton.isHidden = false
            }
            if MyKycpendingfinalavlue == "5"
            {
                self.singelbutton.isHidden = false
            }
            
        }
        else
        {
            
        }

    }
    
    @objc func handleTaptwo(_ sender: UITapGestureRecognizer)
    {
        
        let defaults = UserDefaults.standard
        if let MyKycpendingfinalavlue:String = defaults.value(forKey:"isverystring")as?String
        {
            if MyKycpendingfinalavlue == "1"
            {
                self.singelbutton.isHidden = true
                catageoryone.tag = 0
                catageorytwo.tag = 0
                
                self.myviewonefinal.isHidden = true
                
                
                brandlabelfinalvalue.text = self.defaultsbarndsnamestring
                
                snackdemo.sd_setImage(with: URL(string:deafultsbrandspathstring), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
                
                
                brandbuttonvalue = "brandbuttonvalue"
                favouritetotoalvalue = ""
                self.TopBasedonBrandidvalue()
                brandbuttonvalue = "brandbuttonvalue"
                catageorybuttonvalue = ""
                clickedCatageorystring = ""
                clickedbrandstring = ""
                self.deafultscatvalueString = ""
                self.deafultsBrandvalueString = ""
                self.selectedIndex = nil
                self.explorecatageorcliked = ""
                self.exploreBrnadscliked = ""
                self.deafultsBrandvalueStringfinalnewcat = "brandbuttonvalue"
                
                self.Explorebrandscollectionview.reloadData()
                Brandsscrollview.contentOffset = .zero
                thiredview.isHidden =  false
                secondview.isHidden = false
                Toplabel.text = "Cadbury"
                scrollPager.setSelectedIndex(index:2, animated: true)
                
                if self.view.frame.size.height < 800 {
                    Brandsscrollview.contentInset = UIEdgeInsetsMake(0, 0, self.Brandsscrollview.frame.size.height+115, 0)
                    Brandsscrollview.isScrollEnabled = true
                    Brandsscrollview.showsVerticalScrollIndicator = false
                }
                popupscrollview.slideInFromLeft()
                popupscrollview.dropShadow1()
                ANIMATIONVIEW.slideInFromLefttwo()
                ANIMATIONVIEW.dropShadow1()
                Brnads.setBackgroundImage(#imageLiteral(resourceName: "Brandselectedred"), for: .normal)
                Brandstwo.setTitleColor(UIColor.red, for: .normal)
                self.ExploreBrands.text = "Explore Brands"
                Hometwo.setBackgroundImage(#imageLiteral(resourceName: "home_grey"), for: .normal)
                Homeone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                catageorytwo.setBackgroundImage(#imageLiteral(resourceName: "catageory"), for: .normal)
                catageoryone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                favourite.setBackgroundImage(#imageLiteral(resourceName: "favourite"), for: .normal)
                fsvouritetwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                cahtone.setBackgroundImage(#imageLiteral(resourceName: "chat"), for: .normal)
                cahttwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
              
                if Brnads.tag == 0
                {
                    let bottomSheet = JXBottomSheetView(contentView:popupscrollview as! UIScrollView)
                    bottomSheet.defaultMininumDisplayHeight = 120
                    bottomSheet.defaultMaxinumDisplayHeight = 240
                    bottomSheet.displayState = .maxDisplay
                    bottomSheet.frame = self.view.bounds
                    demoview.addSubview(bottomSheet)
                    Brnads.tag = 1
                    
                }
                    
                else if Brnads.tag == 1{
                    let bottomSheet = JXBottomSheetView(contentView:popupscrollview as! UIScrollView)
                    bottomSheet.defaultMininumDisplayHeight = 120
                    bottomSheet.defaultMaxinumDisplayHeight = 240
                    bottomSheet.displayState = .minDisplay
                    bottomSheet.frame = self.view.bounds
                    demoview.addSubview(bottomSheet)
                    Brnads.tag = 0
                }
                
                self.TopBasedonBrandidvalue()
         
                DefaultBrandexplorebuttonclick = ""
                DefaultCatageorybuttonclick = ""
                
                
                deafultscatageoryvalueStringfinalnewcat  = ""
                
                self.deafultsBrandvalueString = ""
                Newcattabelview.frame = CGRect(x: 0, y: self.Newcattabelview.frame.origin.y, width: self.Newcattabelview.frame.size.width, height: self.Newcattabelview.frame.size.height)
                NewBrandtabelview.frame = CGRect(x: 0, y: self.NewBrandtabelview.frame.origin.y, width: self.NewBrandtabelview.frame.size.width, height: self.NewBrandtabelview.frame.size.height)
            }
            if MyKycpendingfinalavlue == "2"
            {
                self.singelbutton.isHidden = false
            }
            if MyKycpendingfinalavlue == "4"
            {
                self.singelbutton.isHidden = false
                
            }
            if MyKycpendingfinalavlue == "3"
            {
                self.singelbutton.isHidden = false
            }
            if MyKycpendingfinalavlue == "5"
            {
                self.singelbutton.isHidden = false
            }
        }
    }
    @objc func handleTapcatgeory(_ sender: UITapGestureRecognizer)
    {
        
        let defaults = UserDefaults.standard
        if let MyKycpendingfinalavlue:String = defaults.value(forKey:"isverystring")as?String
        {
            if MyKycpendingfinalavlue == "1"
            {
                self.singelbutton.isHidden = true
                self.myviewonefinal.isHidden = true
                
                Brnads.tag = 0
                Brandstwo.tag = 0
                
                Newcattabelview.frame = CGRect(x: 0, y: self.Newcattabelview.frame.origin.y, width: self.Newcattabelview.frame.size.width, height: self.Newcattabelview.frame.size.height)
                NewBrandtabelview.frame = CGRect(x: 0, y: self.NewBrandtabelview.frame.origin.y, width: self.NewBrandtabelview.frame.size.width, height: self.NewBrandtabelview.frame.size.height)
                
                
                cartlabelfinalvalue.text = deafultscatageorynamestring
                
                cartimage.sd_setImage(with: URL(string:defaultscaatgeorypathstring), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
                
                
                self.deafultsBrandvalueStringfinalnewcat = ""
                
                
                
                favouritetotoalvalue = ""
                catageorybuttonvalue  = "catageorybuttonvalue"
                clickedCatageorystring = ""
                brandbuttonvalue = ""
                clickedbrandstring = ""
                self.deafultscatvalueString = ""
                self.deafultsBrandvalueString = ""
                self.explorecatageorcliked = ""
                self.exploreBrnadscliked = ""
                self.selectedIndex = nil
                
                self.CatExplorebrandscollectionview.reloadData()
                catscroollview.contentOffset = .zero
                Toplabel.text = "Snacks"
                self.bottomstaticview.isHidden = true
                Moreview.isHidden =  false
                scrollPager.setSelectedIndex(index:1, animated: true)
                
                if self.view.frame.size.height < 800 {
                    catscroollview.contentInset = UIEdgeInsetsMake(0, 0, self.catscroollview.frame.size.height+115, 0)
                    catscroollview.showsVerticalScrollIndicator = false
                }
                Catpopupscrollview.slideInFromLeft()
                Catpopupscrollview.dropShadow1()
                CatANIMATIONVIEW.slideInFromLefttwo()
                CatANIMATIONVIEW.dropShadow1()
           
                catageorytwo.setBackgroundImage(#imageLiteral(resourceName: "categories_red"), for: .normal)
                catageoryone.setTitleColor(UIColor.red, for: .normal)
                Hometwo.setBackgroundImage(#imageLiteral(resourceName: "home_grey"), for: .normal)
                Homeone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                favourite.setBackgroundImage(#imageLiteral(resourceName: "catageory"), for: .normal)
                fsvouritetwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                favourite.setBackgroundImage(#imageLiteral(resourceName: "favourite"), for: .normal)
                fsvouritetwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                Brnads.setBackgroundImage(#imageLiteral(resourceName: "Barnds"), for: .normal)
                Brandstwo.setTitleColor(UIColor.bottomnavigationtitile(), for: .normal)
                cahtone.setBackgroundImage(#imageLiteral(resourceName: "chat"), for: .normal)
                cahttwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                self.cadburry.text = "snacks"
                self.ExploreBrands.text = "Explore Categories"
                
                if catageorytwo.tag == 0
                {
                    
                    let bottomSheettwo = JXBottomSheetView(contentView:Catpopupscrollview as! UIScrollView)
                    bottomSheettwo.defaultMininumDisplayHeight = 120
                    bottomSheettwo.defaultMaxinumDisplayHeight = 240
                    bottomSheettwo.displayState = .maxDisplay
                    bottomSheettwo.frame = self.view.bounds
                    singpopoupcatgeory.addSubview(bottomSheettwo)
                    
                    catageorytwo.tag = 1
                    
                }
                    
                else if catageorytwo.tag == 1{
                    
                    
                    
                    let bottomSheettwo = JXBottomSheetView(contentView:Catpopupscrollview as! UIScrollView)
                    bottomSheettwo.defaultMininumDisplayHeight = 120
                    bottomSheettwo.defaultMaxinumDisplayHeight = 240
                    bottomSheettwo.displayState = .minDisplay
                    bottomSheettwo.frame = self.view.bounds
                    singpopoupcatgeory.addSubview(bottomSheettwo)
                    
                    
                    
                    catageorytwo.tag = 0
                }
                
                Toplabel.text = "Favorites"
             
                DefaultBrandexplorebuttonclick = ""
                DefaultCatageorybuttonclick = ""
             
                deafultscatageoryvalueStringfinalnewcat  = ""
            
            }
            if MyKycpendingfinalavlue == "2"
            {
                self.singelbutton.isHidden = false
            }
            if MyKycpendingfinalavlue == "4"
            {
                self.singelbutton.isHidden = false
                
            }
            if MyKycpendingfinalavlue == "3"
            {
                self.singelbutton.isHidden = false
            }
            if MyKycpendingfinalavlue == "5"
            {
                self.singelbutton.isHidden = false
            }
        }

    }
    
        @objc func respondToGesture(gesture:UISwipeGestureRecognizer)
    {
        switch gesture.direction
        {
        case UISwipeGestureRecognizerDirection.right:

            
            Showmenu()
        case UISwipeGestureRecognizerDirection.left:

            Closemenu()
            
        default:
            break
        }
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    override func viewDidLayoutSubviews()
    {
    }
    func loadScrollView()
    {
   
       pageCount = CGFloat(Bannerarry.count)
        
        scrMain.backgroundColor = UIColor.clear
        scrMain.delegate = self
        scrMain.isPagingEnabled = true
        scrMain.contentSize = CGSize(width: scrMain.frame.size.width * pageCount, height: scrMain.frame.size.height)
        scrMain.showsHorizontalScrollIndicator = false
        
        pageControl.numberOfPages = Int(pageCount)
        pageControl.addTarget(self, action: #selector(self.pageChanged), for: .valueChanged)
        
        for i in 0..<Int(pageCount) {
            
            
           imageone = UIImageView(frame: CGRect(x: self.scrMain.frame.size.width * CGFloat(i), y: 0, width: self.scrMain.frame.size.width, height: self.scrMain.frame.size.height))
          //  image.image =    UIImage(named: self.Bannerarryimagestring[i])

            imageone.sd_setImage(with: URL(string:self.Bannerarryimagestring[i] ), placeholderImage:(UIImage(named:"AppIcon")), options: .refreshCached, completed: nil)
            
            //image.contentMode = UIViewContentMode.scaleAspectFit
            let productCahttapView = UITapGestureRecognizer(target: self, action: #selector(self.MyhomehandleNumberChatview(_:)))
            self.imageone.addGestureRecognizer(productCahttapView)
            self.imageone.isUserInteractionEnabled = true
            self.scrMain.addSubview(imageone)
      
        }

        let productCahttapView = UITapGestureRecognizer(target: self, action: #selector(self.MyhomehandleNumberChatview(_:)))
        self.imageone.addGestureRecognizer(productCahttapView)
        self.imageone.isUserInteractionEnabled = true
        
    }
    @objc func MyhomehandleNumberChatview(_ sender: UITapGestureRecognizer)
    {
        DispatchQueue.main.async
            {
            let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"ProductDescriptionViewController")as!ProductDescriptionViewController
            if self.Bannerarryidstring.count > 0
            {
                viewfinal.productdemoidfinalvalue = self.Bannerarryidstring[self.pageControl.currentPage]
            }
            self.present(viewfinal, animated: true, completion:nil)
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        if scrollView == scrMain
        {
            let viewWidth: CGFloat = scrollView.frame.size.width
            let pageNumber = floor((scrollView.contentOffset.x - viewWidth / 50) / viewWidth) + 1
            pageControl.currentPage = Int(pageNumber)
            
        }
       else  if scrollView == Homescrollview
        {
            scrollView.isScrollEnabled = true
            firstviewone.addSubview(Homescrollview)
            self.demoscrollview.addSubview(firstviewone)
            
        }
            
        else if scrollView == Explorebrandscollectionview
        {

        }
        else if scrollView == NewBrandtabelview
        {
            NewBrandtabelview.isScrollEnabled = true
            Brandsscrollview.isUserInteractionEnabled = true
        }
        else if scrollView == popupscrollview
        {
            popupscrollview.isScrollEnabled = true

        }
        else if scrollView == Catpopupscrollview
        {
            Catpopupscrollview.isScrollEnabled = true
            
        }
            
        else if scrollView == Brandsscrollview
        {
            if   Brandsscrollview.contentOffset.y >= 115
            {
                self.Brandsscrollview.contentOffset.y  = 115
              self.NewBrandtabelview.contentOffset.y = 0
              self.NewBrandcollectionview.contentOffset.y = 0
                let value = brandlabelfinalvalue.text
                Toplabelvaluechanged.text = value
                Brnadsingel =  "Brnadsingel"
            }
            else
            {
                Toplabelvaluechanged.text = "NumberMall"
                self.Brandsscrollview.isScrollEnabled = true
                self.NewBrandtabelview.isScrollEnabled = true
                Brnadsingel =  ""

            }
        }
        else if scrollView == catscroollview
        {
            print(catscroollview.contentOffset.y)
            
            if   catscroollview.contentOffset.y >= 115
            {
                self.catscroollview.contentOffset.y  = 115
                self.Newcattabelview.contentOffset.y = 0
                let valuetwo = cartlabelfinalvalue.text
                Toplabelvaluechanged.text = valuetwo
                catsingel =  "catsingel"
            }
            else
            {
                Toplabelvaluechanged.text = "NumberMall"
                self.catscroollview.isScrollEnabled = true
                self.Newcattabelview.isScrollEnabled = true
                catsingel =  ""
            }
            
        }
        else  if scrollView == Agentfavouritescrollview
        {
            
            if   Agentfavouritescrollview.contentOffset.y >= 115
            {
                
//                self.Agentfavouritescrollview.contentOffset.y  = 115
//                self.favouritetabelview.contentOffset.y = 0
              //  bottomview.isHidden = false
                
                
            }
            else
            {
                self.Agentfavouritescrollview.isScrollEnabled = true
                self.favouritetabelview.isScrollEnabled = true
                //bottomview.isHidden = true

            }
            
          
        }
        
        else  if scrollView == Agentfavouritescrollview
        {
            
            
            
            
        }
        
        else if scrollView == Catpopupscrollview
        {
            if   Catpopupscrollview.contentOffset.y >= 115
            {
                self.catageorytotalview.isHidden = false
                print(Catpopupscrollview.contentOffset.y)
            }
            else
            {
               self.catageorytotalview.isHidden = true
                
            }
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)
    {

        if   Brandsscrollview.contentOffset.y >= 140
        {
         self.Brandsscrollview.contentOffset.y  = 140
          self.NewBrandtabelview.contentOffset.y = 0
        }
    
        else if catscroollview.contentOffset.y >= 140
        {
                self.catscroollview.contentOffset.y  = 140
                self.Newcattabelview.contentOffset.y = 0
        }
        else if Agentfavouritescrollview.contentOffset.y >= 140
        {

            
        }
        else if scrollView == Explorebrandscollectionview
        {
            var visibleRect = CGRect()
            visibleRect.origin = Explorebrandscollectionview.contentOffset
            visibleRect.size = Explorebrandscollectionview.bounds.size
            let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
            guard let indexPath = Explorebrandscollectionview.indexPathForItem(at: visiblePoint) else { return }
            VisibleIndex = indexPath
            if indexPath.count > 0
            {
                let cell = Explorebrandscollectionview.cellForItem(at: indexPath) as! NewBrandTwoCollectionViewCell
                let email = cell.catageorylabel.text!
                if let letter = email.first {
                    FirstLeterManipulation = letter
                }
                Explorebrandscollectionview.reloadData()
                abcdcollectionview.reloadData()
            }
        }
            
        else if scrollView == CatExplorebrandscollectionview
        {
            var visibleRect = CGRect()
            visibleRect.origin = CatExplorebrandscollectionview.contentOffset
            visibleRect.size = CatExplorebrandscollectionview.bounds.size
            let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
            guard let indexPath = CatExplorebrandscollectionview.indexPathForItem(at: visiblePoint) else { return }
            VisibleIndex = indexPath
            let cell = CatExplorebrandscollectionview.cellForItem(at: indexPath) as! NewBrandTwoCollectionViewCell
            let email = cell.catageorylabel.text!
        
            if let letter = email.first {
                FirstLeterManipulationtwo = letter
            }
            CatExplorebrandscollectionview.reloadData()
            Catabcdcollectionview.reloadData()
        }
        else
        {
            self.Brandsscrollview.isScrollEnabled = true
            self.NewBrandtabelview.isScrollEnabled = true
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == favouritetabelview
        {
            return self.favSecondNEwproductItems.count

        }
        if tableView == chatingtabelview
        {
            return self.Productypeicon.count
  
        }
        if tableView == Newcattabelview
        {
            return self.SecondNEwproductItems.count
            
        }
        if tableView == favouritetabelviewtwo
        {
            return self.favtwoSecondNEwproductItems.count
     
        }
        if tableView == soldtabelview
        {
            return self.sold_filledbynamearray.count
        }
        if tableView == mymarkettabelview
        {
            return self.Totalpopcorniamgefinalvalue.count
        }
        if tableView == NoTifictaiontabelview
        {
            return self.Notificationoffer.count
        }
        if tableView == myshemetabelview
        {
            return self.favSecondNEwproductItems.count
            
        }
        if tableView == complianttabelview
        {
            return self.Stockis.count
        }
        else
        {
             return self.SecondNEwproductItems.count

        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == NewBrandtabelview
        {
        let cell : tableListCell = tableView.dequeueReusableCell(withIdentifier: "tableListCell", for: indexPath) as! tableListCell
   
            let Newprodcutoff_Takefinal = self.SecondNewproductdays[indexPath.row]
            if Newprodcutoff_Takefinal.count == 0
            {
                cell.lblDays.isHidden = true
                cell.imgArrow.isHidden = true
            }
            if Newprodcutoff_Takefinal.count  >= 1
            {
                cell.lblDays.isHidden = false
                cell.imgArrow.isHidden = false
cell.lblDays.text = self.SecondNewproductdays[indexPath.item]
            }
            cell.lblDays.text = self.SecondNewproductdays[indexPath.item]
let finalavailabelvaluesingeltwo = self.SecondNewproductsInstack[indexPath.row]
            
            if finalavailabelvaluesingeltwo == "Out of Stock"
            {
                cell.btnAdd.setBackgroundImage(#imageLiteral(resourceName: "Notification"), for:.normal)
                cell.NewBrandlabel.isHidden = false
                cell.NewBrandlabel.text = self.SecondAvailabelQuantity[indexPath.row]
                cell.NewBrandlabel.isHidden = true
                cell.cashback_text.isHidden = true
                cell.imgArrow.isHidden = true
                cell.cashbacklabel.isHidden = true
               
                cell.imgNew.isHidden = true
                cell.imgStockOut.isHidden = false
                cell.imgProduct.alpha = 0.3
                cell.lblStock.text = finalavailabelvaluesingeltwo
            }
            else
            {
                if finalavailabelvaluesingeltwo >= "1"
                {
                    cell.cashback_text.isHidden = false
                    cell.cashbacklabel.isHidden = false
                    
                    cell.imgProduct.alpha = 1.0

                    cell.btnAdd.setBackgroundImage(#imageLiteral(resourceName: "cart_edit"), for:.normal)
                    cell.NewBrandlabel.isHidden = false
                    let stockValueBell = self.SecondAvailabelQuantity[indexPath.row]
                    cell.NewBrandlabel.text = stockValueBell
                    cell.imgStockOut.isHidden = true
                    if stockValueBell == "0" {
                        cell.btnAdd.setBackgroundImage(#imageLiteral(resourceName: "add"), for:.normal)
                        cell.imgStockOut.isHidden = true
                        cell.NewBrandlabel.isHidden = true

                    }else{
                        cell.NewBrandlabel.text = stockValueBell
                        cell.imgStockOut.isHidden = true
                    }
                }
                if finalavailabelvaluesingeltwo == "0"
                {
                    cell.imgProduct.alpha = 1.0
                    cell.btnAdd.setBackgroundImage(#imageLiteral(resourceName: "add"), for:.normal)
                    cell.NewBrandlabel.isHidden = true
                    cell.imgStockOut.isHidden = true
               cell.NewBrandlabel.text = self.SecondAvailabelQuantity[indexPath.row]
                    cell.cashback_text.isHidden = false
                    cell.cashbacklabel.isHidden = false
                    
                }
            }
            let favouritemore = self.favouritesecondvalue[indexPath.row]
            if favouritemore == "0"
            {
                cell.btnFavor.setBackgroundImage(#imageLiteral(resourceName: "Heart"), for:.normal)
                cell.btnFavor.isSelected = true
            }
            if favouritemore == "1" {
                cell.btnFavor.setBackgroundImage(#imageLiteral(resourceName: "favourite"), for:.normal)
                cell.btnFavor.isSelected = false

            }
            cell.lblProduct.text = self.SecondNEwproductItems[indexPath.item]
            let Newproductcollection = self.SecondNEwproductIMage[indexPath.item]
            cell.imgProduct.sd_setImage(with: URL(string:Newproductcollection), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)

            cell.Wightofproductlabel.text = self.Branduserweight_mrp[indexPath.item]

            
            if self.secondNewmarginlabelvaluefinal.count > 0
            {
                cell.Newmarginlabel.text =  self.secondNewmarginlabelvaluefinal[indexPath.row]
            }
            let valuefinal = self.SecondNewproductsMrpstack[indexPath.item]
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string:valuefinal as String)
            attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            cell.lblStock.attributedText = attributeString
            cell.lblRate.text = self.SecondNewproductoutlets[indexPath.row]

             cell.cashbacklabel.text = self.cashBackfinal[indexPath.row]
//           cell.lblRate.text = self.SecondNewproductsMrpstack[indexPath.row]
            cell.lblMRP.text = self.SecondNewproductlabelMrp[indexPath.row]
            cell.nintyninestruckfinalvalue.text = self.SecondNewproductsInstack[indexPath.row]
            let statusVa = self.SecondProductExculise[indexPath.row]
            
            if statusVa == "0"
            {
                cell.imgExclusive.isHidden = true
            }
            else
            {
                cell.imgExclusive.isHidden = false
            }
            
            
            let secondCoDisplay = self.SecondNewproductCODDisplay[indexPath.row]
            if secondCoDisplay == "0" {
                cell.codView.isHidden = true
                
            }
            if secondCoDisplay == "1" {
                cell.codView.isHidden = false
                
            }
            
            
            
            cell.btnFavor.tag = indexPath.row
            cell.btnFavor.addTarget(self, action: #selector(HomeViewController.connected(sender:)), for: .touchUpInside)
                       cell.selectionStyle = .none
            cell.btnAdd.addTarget(self, action: #selector(addBrandFavAction), for: .touchUpInside)
            cell.btnAdd.tag = indexPath.row
            return cell
        }
        if tableView == Newcattabelview
        {
            let cell = Newcattabelview.dequeueReusableCell(withIdentifier: "secondTableViewCell", for: indexPath) as! secondTableViewCell
            if self.SecondNewproductdays.count > 0
            {
                let Newprodcutoff_Takefinal = self.SecondNewproductdays[indexPath.row]
                if Newprodcutoff_Takefinal.count == 0
                {
                    cell.lblDays.isHidden = true
                    cell.imgArrow.isHidden = true
                }
                if Newprodcutoff_Takefinal.count >= 1
                {
                    cell.lblDays.isHidden = false
                    cell.imgArrow.isHidden = false
                    cell.lblDays.text = self.SecondNewproductdays[indexPath.item]
                }
                let finalavailabelvaluesingeltwo = self.SecondNewproductsInstack[indexPath.row]
                
                
                if finalavailabelvaluesingeltwo == "Out of Stock"
                {
                    cell.btnAdd.setBackgroundImage(#imageLiteral(resourceName: "Notification"), for:.normal)
                    cell.NewBrandlabel.isHidden = true
                    cell.cashback_text.isHidden = true
                    cell.imgArrow.isHidden = true
                    cell.cashbacklabel.isHidden = true
                    cell.lblStock.frame = CGRect(x: cell.cashbacklabel.frame.origin.x, y: cell.cashbacklabel.frame.origin.y, width: cell.cashbacklabel.frame.size.width, height: cell.cashbacklabel.frame.size.height)
                    
                    cell.imgNew.isHidden = true
                    cell.iamgestockout.isHidden = false
                    cell.imgProduct.alpha = 0.3
                    cell.lblStock.text = finalavailabelvaluesingeltwo
                }
                else
                {
                    if finalavailabelvaluesingeltwo >= "1"
                    {
                        cell.cashback_text.isHidden = false
                        cell.cashbacklabel.isHidden = false
                        
                        cell.imgProduct.alpha = 1.0
                        
                        cell.btnAdd.setBackgroundImage(#imageLiteral(resourceName: "cart_edit"), for:.normal)
                        cell.NewBrandlabel.isHidden = false
                        let stockValueBell = self.SecondAvailabelQuantity[indexPath.row]
                        cell.NewBrandlabel.text = stockValueBell
                        cell.iamgestockout.isHidden = true
                        if stockValueBell == "0" {
                            cell.btnAdd.setBackgroundImage(#imageLiteral(resourceName: "add"), for:.normal)
                            cell.iamgestockout.isHidden = true
                            cell.NewBrandlabel.isHidden = true
                            
                        }else{
                            cell.NewBrandlabel.text = stockValueBell
                            cell.iamgestockout.isHidden = true
                        }
                    }
                    if finalavailabelvaluesingeltwo == "0"
                    {
                        cell.imgProduct.alpha = 1.0
                        cell.btnAdd.setBackgroundImage(#imageLiteral(resourceName: "add"), for:.normal)
                        cell.NewBrandlabel.isHidden = true
                        cell.iamgestockout.isHidden = true
                        cell.NewBrandlabel.text = self.SecondAvailabelQuantity[indexPath.row]
                        cell.cashback_text.isHidden = false
                        cell.cashbacklabel.isHidden = false
                        
                    }
                }
                
            }
            
            
            
            let favouritemore = self.favouritesecondvalue[indexPath.row]
            
            if favouritemore == "0" {
                cell.btnFavor.setBackgroundImage(#imageLiteral(resourceName: "Heart"), for:.normal)
                cell.btnFavor.isSelected = true
                
            }
            if favouritemore == "1" {
                cell.btnFavor.setBackgroundImage(#imageLiteral(resourceName: "favourite"), for:.normal)
                cell.btnFavor.isSelected = false
                
                
            }
            let statusVa = self.SecondProductExculise[indexPath.row]
            
            if statusVa == "0" {
                cell.imgExclusive.isHidden = true
            }else{
                cell.imgExclusive.isHidden = false
                
            }
            
            
            let secondCoDisplay = self.SecondNewproductCODDisplay[indexPath.row]
            if secondCoDisplay == "0" {
                cell.codView.isHidden = true
                
            }
            if secondCoDisplay == "1" {
                cell.codView.isHidden = false
            }
            
            
            cell.lblProduct.text = self.SecondNEwproductItems[indexPath.item]
            let Newproductcollection = self.SecondNEwproductIMage[indexPath.item]
            cell.imgProduct.sd_setImage(with: URL(string:Newproductcollection), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
            let valuefinal = self.SecondNewproductsMrpstack[indexPath.item]
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string:valuefinal as String)
            attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            cell.lblStock.attributedText = attributeString
            cell.cashbacklabel.text = cashBackfinal[indexPath.row]
            cell.lblRate.text = self.SecondNewproductoutlets[indexPath.row] //SecondNewproductoutlets
            cell.lblMRP.text = self.SecondNewproductlabelMrp[indexPath.row]
            cell.nintyninestruckfinalvalue.text = self.SecondNewproductsInstack[indexPath.row]
            
            
            if self.secondNewmarginlabelvaluefinal.count > 0
            {
                cell.Newmarginlabel.text = self.secondNewmarginlabelvaluefinal[indexPath.row]
            }

            cell.btnFavor.tag = indexPath.row
            cell.btnFavor.addTarget(self, action: #selector(HomeViewController.connected(sender:)), for: .touchUpInside)
            cell.selectionStyle = .none
            cell.btnAdd.addTarget(self, action: #selector(addCategFavAction), for: .touchUpInside)
            cell.btnAdd.tag = indexPath.row
            return cell
        }

     if tableView == chatingtabelview
    {
        
        let cell : CahtingTableViewCell = chatingtabelview.dequeueReusableCell(withIdentifier: "CahtingTableViewCell", for: indexPath) as! CahtingTableViewCell

        
        if indexPath.row == 0
        {
            cell.Tickimage.isHidden = false
            cell.Tickimage.image = self.Tickmarkiamge[indexPath.row]
            cell.Popcorniamge.layer.cornerRadius =   cell.Popcorniamge.frame.size.width/2
            cell.Popcorniamge.clipsToBounds = true
            
            let Recomendedpopcornimagevalue = self.chatingimagevalue[indexPath.row]

            cell.popcornname.text = self.Productypeicon[indexPath.row]
            cell.popcornmessage.text = self.ProductypeMessage[indexPath.row]
           let simpletime  = self.ProductTiming[indexPath.row]
        
            cell.Timinglabel.text = self.ProductTiming[indexPath.row]
              let countmessagevalue = self.ProductMessagesCount[indexPath.row]
            let singel = countmessagevalue.stringValue

            if singel.count > 1
            {
                cell.Mesagenumberlabel.text = singel
                cell.Mesagenumberlabel.isHidden = false

            }
            else
            {
                cell.Mesagenumberlabel.isHidden = true
            }
            cell.Mesagenumberlabel.layer.cornerRadius =   cell.Mesagenumberlabel.frame.size.width/2
            cell.Mesagenumberlabel.clipsToBounds = true
            
            let Messagecount = self.ProductMessagesCount[indexPath.row]
            
            if Messagecount == 0
            {
                cell.Mesagenumberlabel.isHidden = true
            }
            if Int(Messagecount) > 0
            {
                let MessageTotalvalue = self.ProductMessagesCount[indexPath.row]
                cell.Mesagenumberlabel.text = MessageTotalvalue.stringValue
                cell.Mesagenumberlabel.isHidden = false
            }
            cell.Popcorniamge.layer.cornerRadius = cell.Popcorniamge.layer.frame.size.width/2
            cell.Popcorniamge.clipsToBounds = true
             cell.Popcorniamge.layer.borderWidth = 1.0
        cell.Popcorniamge.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
            cell.Popcorniamge.backgroundColor = UIColor.gray
            let Marketproductcollection = Recomendedpopcornimagevalue
            let url = URL(string:Recomendedpopcornimagevalue)
            let imgURL = Recomendedpopcornimagevalue
            
            cell.Popcorniamge.setImageFromURl(stringImageUrl:imgURL)
            
            cell.selectionStyle = .none
        }
        else
        {
            cell.Tickimage.isHidden = true
            let Recomendedpopcornimagevalue = self.chatingimagevalue[indexPath.row]
            cell.popcornname.text = self.Productypeicon[indexPath.row]
            cell.popcornmessage.text = self.ProductypeMessage[indexPath.row]
            let simpletime  = self.ProductTiming[indexPath.row]

            cell.Timinglabel.text = self.ProductTiming[indexPath.row]

            cell.Mesagenumberlabel.layer.cornerRadius =   cell.Mesagenumberlabel.frame.size.width/2
            cell.Mesagenumberlabel.clipsToBounds = true
            cell.Popcorniamge.layer.cornerRadius =   cell.Popcorniamge.frame.size.width/2
            cell.Popcorniamge.clipsToBounds = true
            let countmessagevalue = self.ProductMessagesCount[indexPath.row]
            let singel = countmessagevalue.stringValue
            if singel.count > 1
            {
                cell.Mesagenumberlabel.text = singel
                cell.Mesagenumberlabel.isHidden = false
            }
            else{
                cell.Mesagenumberlabel.isHidden = true
            }

            cell.Popcorniamge.backgroundColor = UIColor.gray

            cell.Popcorniamge.layer.cornerRadius = cell.Popcorniamge.layer.frame.size.width/2
            cell.Popcorniamge.clipsToBounds = true
            cell.Popcorniamge.layer.borderWidth = 1.0
            cell.Popcorniamge.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
            let Marketproductcollection = Recomendedpopcornimagevalue
            let url = URL(string:Recomendedpopcornimagevalue)
            let imgURL = Recomendedpopcornimagevalue
            cell.Popcorniamge.setImageFromURl(stringImageUrl:imgURL)
        }
        cell.selectionStyle = .none
         return cell
     }
 
        if tableView == complianttabelview
        {
            let cell : CompliantTableViewCell = complianttabelview.dequeueReusableCell(withIdentifier: "CompliantTableViewCell", for: indexPath) as! CompliantTableViewCell
            cell.selectionStyle = .none
            cell.Stockisnotmoving.text = self.Stockis[indexPath.row]
            cell.ordernumberlabel.text =  self.DeliveryorderNumbaer[indexPath.row]
            cell.opnelabel.text = self.DeliveryOpen[indexPath.row]
            
            cell.orderdatelabel.text = self.DeliveryDate[indexPath.row]
            cell.stocklabel.text = self.Stocktitle[indexPath.row]
            cell.stocklabel.layer.cornerRadius = cell.stocklabel.layer.frame.size.width/2
            cell.stocklabel.layer.masksToBounds = true
            cell.selectionStyle = .none

            if (indexPath.row % 2) != 0
            {
                cell.stocklabel.textColor = UIColor.green
            }
            else
            {
                cell.stocklabel.textColor = UIColor .textfiledbottomcolorside()
            }
            return cell
        }
        
        
        if tableView == favouritetabelviewtwo
        {
            let cell : tableListCell = favouritetabelviewtwo.dequeueReusableCell(withIdentifier: "tableListCell", for: indexPath) as! tableListCell
     
            let Newprodcutoff_Takefinal = self.favtwoSecondNewproductdays[indexPath.row]
            if Newprodcutoff_Takefinal.count == 0
            {
                cell.lblDays.isHidden = true
                cell.imgArrow.isHidden = true
            }
            if Newprodcutoff_Takefinal.count >= 1
            {
                cell.lblDays.isHidden = false
                cell.imgArrow.isHidden = false
                cell.lblDays.text = self.favtwoSecondNewproductdays[indexPath.item]
            }
            let finalavailabelvaluesingeltwo = self.favtwoSecondNewproductsInstack[indexPath.row]
            print(finalavailabelvaluesingeltwo)
           
            if finalavailabelvaluesingeltwo == "Out of Stock"
            {
                cell.btnAdd.setBackgroundImage(#imageLiteral(resourceName: "Notification"), for:.normal)
                cell.NewBrandlabel.isHidden = true
                cell.outofstocklabel.isHidden = false
                cell.NewBrandlabel.text = self.favtwoSecondAvailabelQuantity[indexPath.row]
                 cell.imgProduct.alpha = 0.5
                cell.cashback_text.isHidden = true
                cell.imgArrow.isHidden = true
                cell.cashbacklabel.isHidden = true
                cell.lblStock.frame = CGRect(x: cell.cashbacklabel.frame.origin.x, y: cell.cashbacklabel.frame.origin.y, width: cell.lblStock.frame.size.width, height: cell.lblStock.frame.size.height)
                cell.imgNew.isHidden = true
                cell.outofstocklabel.isHidden = false
                cell.imgProduct.alpha = 0.3
                cell.lblStock.text = finalavailabelvaluesingeltwo
           
            }
            else{
                if finalavailabelvaluesingeltwo == "0"
                {
                    cell.NewBrandlabel.isHidden = false
                    cell.btnAdd.setBackgroundImage(#imageLiteral(resourceName: "add"), for:.normal)
                    cell.NewBrandlabel.isHidden = false
                    cell.outofstocklabel.isHidden = true
                    cell.NewBrandlabel.text = self.favtwoSecondAvailabelQuantity[indexPath.row]
                   
                    cell.outofstocklabel.isHidden = true
                    cell.NewBrandlabel.text = self.favtwoSecondAvailabelQuantity[indexPath.row]
                    cell.imgProduct.alpha = 1.0
                    cell.cashback_text.isHidden = false
                    cell.cashbacklabel.isHidden = false
                    
                    
                }
                if finalavailabelvaluesingeltwo >= "1"
                {
                    cell.NewBrandlabel.isHidden = false
                   cell.outofstocklabel.isHidden = true
                cell.NewBrandlabel.text = self.favtwoSecondAvailabelQuantity[indexPath.row]
                    cell.imgProduct.alpha = 1.0
                    cell.btnAdd.setBackgroundImage(#imageLiteral(resourceName: "cart_edit"), for:.normal)
                    cell.NewBrandlabel.isHidden = false
                    cell.cashbacklabel.isHidden = false
                    let stockValueBelltwo = self.favtwoSecondAvailabelQuantity[indexPath.row]
                    if stockValueBelltwo == "0"
                    {
                        cell.btnAdd.setBackgroundImage(#imageLiteral(resourceName: "add"), for:.normal)
                        cell.outofstocklabel.isHidden = true
                        cell.NewBrandlabel.isHidden = true
                    }
                    else
                    {
                        cell.NewBrandlabel.text = stockValueBelltwo
                        cell.outofstocklabel.isHidden = true
                    }
                }
            }
            let favouritemore = self.favtwofavouritesecondvalue[indexPath.row]
            print(favouritemore)
            if favouritemore == "0" {
                cell.btnFavor.setBackgroundImage(#imageLiteral(resourceName: "Heart"), for:.normal)
            }
            if favouritemore == "1"
            {
                cell.btnFavor.setBackgroundImage(#imageLiteral(resourceName: "favourite"), for:.normal)
            }
            cell.lblProduct.text = self.favtwoSecondNEwproductItems[indexPath.item]
            let statusVa = self.favtwoSecondExclusive[indexPath.row]
            
            if statusVa == "0" {
                cell.imgExclusive.isHidden = true
            }else{
                cell.imgExclusive.isHidden = false
            }
            
            let valedStr = self.favtwoSecondNewproductCODisplay[indexPath.row]
            if valedStr == "0" {
                cell.codView.isHidden = true
            }
            if valedStr == "1"{
                cell.codView.isHidden = false
                
            }
            
            
            
            let Newproductcollection = self.favtwoSecondNEwproductIMage[indexPath.item]
            cell.imgProduct.sd_setImage(with: URL(string:Newproductcollection), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
            let valuefinal = self.favtwoSecondNewproductoutlets[indexPath.item]
            print(valuefinal)
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string:valuefinal as String)
            attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            cell.lblStock.attributedText = attributeString
            cell.cashbacklabel.text = self.favtwovouritecashBackfinal[indexPath.row]
            cell.lblRate.text = self.favtwoSecondNewproductsMrpstack[indexPath.row]
            cell.lblMRP.text = self.favtwoSecondNewproductlabelMrp[indexPath.row]
            cell.nintyninestruckfinalvalue.text = self.favtwoSecondNewproductsInstack[indexPath.row]
          cell.Newmarginlabel.text =    self.favtwoSecondproductofferMargin[indexPath.row]
           
            cell.btnFavor.tag = indexPath.row
cell.btnFavor.addTarget(self, action: #selector(HomeViewController.connectedfinalvauefavouritetabelviewtwo(sender:)), for: .touchUpInside)
            
            cell.btnAdd.addTarget(self, action: #selector(addFavTrendingAction), for: .touchUpInside)

            cell.btnAdd.tag = indexPath.row
            
            cell.selectionStyle = .none
            return cell
        }
        
            if tableView == soldtabelview
            {
                let cell:UITableViewCell = (self.soldtabelview.dequeueReusableCell(withIdentifier: HomecellReuseIdentifier))!
                cell.textLabel?.text = self.sold_filledbynamearray[indexPath.row]
                cell.textLabel?.font = UIFont(name: "Arial", size: 14.5)!
                
                cell.textLabel?.textColor =  UIColor.black
                return cell
            }
        
        if tableView == NoTifictaiontabelview
        {
           let cell : NotificationsTableViewCell = NoTifictaiontabelview.dequeueReusableCell(withIdentifier: "NotificationsTableViewCell", for: indexPath) as! NotificationsTableViewCell
            
            cell.NumberMalloffered.text = self.Notificationoffer[indexPath.row]
            cell.Newoffer.text = self.Notificationofferfinalvalue[indexPath.row]
            cell.LoremIpsum.text = self.NotificationofferHistoryValue[indexPath.row]

            cell.Roundimagefinal.image = self.Notifictaionimagevalue[indexPath.row] as? UIImage
             cell.Roundimagefinal.layer.borderWidth = 0.7
            cell.Roundimagefinal.layer.masksToBounds = false
            cell.Roundimagefinal.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
             cell.Roundimagefinal.layer.cornerRadius =  cell.Roundimagefinal.frame.height/2
             cell.Roundimagefinal.clipsToBounds = true
            
            
            return cell
        }
       
        if tableView == mymarkettabelview
        {
            let cell  = mymarkettabelview.dequeueReusableCell(withIdentifier:"MArketTableViewCell", for: indexPath) as! MArketTableViewCell
            
            if self.ComboarrayvalueTotal .count > 0
            {
                if let TotalExclusiveTotalone:String = self.ComboarrayvalueTotal[indexPath.row] as? String
                {
                   let TotalExclusiveTotal = TotalExclusiveTotalone
                    
                    if TotalExclusiveTotal == "0"
                    {
                        cell.myexculsive.isHidden = true
                   
                            cell.mycardviewfinal.isHidden = true
                            cell.marketcardviewtwo.isHidden = false
                            cell.mycardviewfinal.isHidden = true
                            cell.mycardviewfinal.layer.cornerRadius = 15.0
                            cell.mycardviewfinal.layer.masksToBounds = true
                            cell.mycardviewfinal.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
                            cell.mycardviewfinal.layer.borderWidth = 1.0
                            cell.marketcardviewtwo.layer.cornerRadius = 15.0
                            cell.marketcardviewtwo.layer.masksToBounds = true
                            cell.marketcardviewtwo.layer.borderColor = UIColor.textfiledbottomcolorside().cgColor
                            cell.marketcardviewtwo.layer.borderWidth = 1.0
                            cell.Timerview.layer.cornerRadius = 3.0
                            cell.selectionStyle = .none
                            cell.circleimageview.layer.cornerRadius =  cell.circleimageview.frame.size.width/2
                            cell.circleimageview.clipsToBounds = true
                            let Marketproductcollection = self.MArketproductIMagetwo[indexPath.row]
                            let url = URL(string:Marketproductcollection as! String)
                            if url != nil
                            {
                                let data = try? Data(contentsOf: url!)
                                if let imageData = data
                                {
                                    let image = UIImage(data: imageData)
                                    cell.circleimageview.image = image
                                }
                            }
                     
                            cell.raajagoudnamefinal.text = self.popcornCustomerbname[indexPath.row]
                                as! String
                            cell.exlentproduct.text = self.favpopcornsubject[indexPath.row] as! String
                            
                            cell.moqlabel.text = self.Moqstringvalue[indexPath.row] as! String
                            
                            if self.Totalpopcornrupeeslabel.count > 0
                            {
                                cell.cardviewpopcornlabel.text =  self.Totalpopcornnamelabel[indexPath.row] as! String
                            }
                            cell.exlenttime.text = self.popcornDatelabel[indexPath.row] as! String
                            if self.TotalpopcornRestokeoffTakelabel.count > 0
                            {
                                let offtakeDayslabelfinalvalue   = self.TotalpopcornRestokeoffTakelabel[indexPath.row]
                                cell.mypopocrndayslabel.text = offtakeDayslabelfinalvalue.stringValue
                            }
                            
                            cell.myrupeeslabel.text = self.mrparrayyTotal[indexPath.row] as! String
                            
                            cell.mycardviewfinal.layer.shadowOffset = CGSize(width: 0, height: 2)
                            cell.mycardviewfinal.layer.shadowOpacity = 0.3
                            cell.mycardviewfinal.layer.shadowRadius = 1.0
                            cell.mycardviewfinal.layer.borderColor = UIColor.color2().cgColor
                            cell.mycardviewfinal.layer.shadowColor = UIColor.color2().cgColor
                            cell.cardviewtwotop.layer.addBorder(edge:.bottom, color:UIColor.textfiledbottomcolorside(), thickness:0.8)
                            let Newproductcollectiontwo = self.Totalpopcorniamgefinalvalue[indexPath.row]
                            cell.popcornimage.sd_setImage(with: URL(string:Newproductcollectiontwo as! String), placeholderImage:(UIImage(named:"Profile")), options: .refreshCached, completed: nil)

                        
                            if self.Totalpopcornnamelabel.count > 0
                            {
                                
                            }
                            if self.TotalpopcornCutoffrate.count > 0
                            {
                                let valuefinaltwo =  self.TotalpopcornCutoffrate[indexPath.row]
                                
                                let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string:valuefinaltwo as! String)
                                attributeString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
                                cell.popcorncutoffratinglabel.attributedText = attributeString
                                cell.mypopcornrupeeslabel.text = (valuefinaltwo as! String)
                            }
                        
                        if self.TotalpopcornMarginlabel.count > 0
                        {
                            cell.mypopcornmarginlabel.text = self.TotalpopcornMarginlabel[indexPath.row] as! String
                        }
                cell.restocklabel.text = self.Instackarray[indexPath.row] as! String
            cell.mypopcornrupeeslabel.text = self.TotalpopcornCutoffrate[indexPath.row] as! String
                        
                    }
                }
            }
                if let isExclusiveTotalone:String = self.isExclusiveTotal[indexPath.row] as? String
                {
                    let TotalExclusiveTotal = isExclusiveTotalone
                    
                    if TotalExclusiveTotal == "0"
                    {
                        cell.mygifttotal.isHidden = true
                        cell.myexculsive.isHidden = true
                    }
                }
                else
                {
                    cell.mycardviewfinal.isHidden = false
                    cell.marketcardviewtwo.isHidden = true
                }
            cell.topdropdown.addTarget(self, action: #selector(addMArketDeleteAction), for: .touchUpInside)
            cell.topdropdown.tag = indexPath.row
   
            cell.chatone.addTarget(self, action: #selector(addMArketchatfinalAction), for: .touchUpInside)
            cell.chatone.tag = indexPath.row

            let totallikes = self.likesvalue[indexPath.row]
            if totallikes == "0"
            {
                cell.likelabeltotal.isHidden = true
                cell.likelabeltotal.text = totallikes
                cell.likeone.setBackgroundImage(#imageLiteral(resourceName: "likes"), for:.normal)
            }
            if totallikes == "1"
            {
                cell.likelabeltotal.isHidden = false
                cell.likelabeltotal.text = totallikes
                cell.likeone.setBackgroundImage(#imageLiteral(resourceName: "MyHand-1"), for:.normal)
            }
            markettapGesture = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.likelabelvalue(_:)))
            markettapGesture.numberOfTapsRequired = 1
            markettapGesture.numberOfTouchesRequired = 1
            cell.likelabeltotal.addGestureRecognizer(markettapGesture)
           cell.likelabeltotal.isUserInteractionEnabled = true

            cell.likeone.addTarget(self, action: #selector(addlikebuttonmarket), for: .touchUpInside)
            cell.likeone.tag = indexPath.row
         
            cell.shouone.addTarget(self, action: #selector(addshoutbuttonmarkettotal), for: .touchUpInside)
            cell.shouone.tag = indexPath.row
            
            cell.shareone.addTarget(self, action: #selector(addsharebuttonbuttonmarkettotal), for: .touchUpInside)
            cell.shareone.tag = indexPath.row
         
            let shoutsvalueFinal = self.shoutsvalue[indexPath.row]
            if shoutsvalueFinal == "0"
            {
                cell.shoutlabel.isHidden = true
                cell.shoutlabel.text = shoutsvalueFinal
            }
            else
            {
                cell.shoutlabel.isHidden = false
                cell.shoutlabel.text = shoutsvalueFinal
            }
           
            let MArketcommentsFinal = self.MArketcomments[indexPath.row]
            if MArketcommentsFinal == "0"
            {
                cell.chatlabel.isHidden = true
                cell.chatlabel.text = MArketcommentsFinal
            }
            else
            {
                cell.chatlabel.isHidden = false
                cell.chatlabel.text = MArketcommentsFinal
            }
           
            return cell
        }
     if tableView == myshemetabelview
     {
        let cell : tableListCell = myshemetabelview.dequeueReusableCell(withIdentifier: "tableListCell", for: indexPath) as! tableListCell
        
        let Newprodcutoff_Takefinal = self.favSecondNewproductdays[indexPath.row]
        if Newprodcutoff_Takefinal.count == 0
        {
            cell.lblDays.isHidden = true
            cell.imgArrow.isHidden = true
        }
        if Newprodcutoff_Takefinal.count >= 1
        {
            cell.lblDays.isHidden = false
            cell.imgArrow.isHidden = false
            cell.lblDays.text = self.favSecondNewproductdays[indexPath.item]
        }
        let finalavailabelvaluesingeltwo = self.favSecondNewproductsInstack[indexPath.row]
        print(finalavailabelvaluesingeltwo)
        
        if finalavailabelvaluesingeltwo == "Out of Stock"
        {
            cell.btnAdd.setBackgroundImage(#imageLiteral(resourceName: "Notification"), for:.normal)
            cell.NewBrandlabel.isHidden = true
            cell.NewBrandlabel.text = self.favSecondAvailabelQuantity[indexPath.row]
            
            cell.cashback_text.isHidden = true
            cell.imgArrow.isHidden = true
            cell.cashbacklabel.isHidden = true
            cell.imgNew.isHidden = true
            cell.outofstocklabel.isHidden = false
            cell.imgProduct.alpha = 0.3
            cell.lblStock.text = finalavailabelvaluesingeltwo
        }
        else
        {
            if finalavailabelvaluesingeltwo >= "1"
            {
                cell.imgProduct.alpha = 1.0
                cell.btnAdd.setBackgroundImage(#imageLiteral(resourceName: "cart_edit"), for:.normal)
                cell.NewBrandlabel.isHidden = false
                cell.NewBrandlabel.text = self.favSecondAvailabelQuantity[indexPath.row]
                cell.outofstocklabel.isHidden = true
                cell.NewBrandlabel.text = self.favSecondAvailabelQuantity[indexPath.row]
                cell.cashbacklabel.isHidden = false
                let stockValueBelltwo = self.favSecondAvailabelQuantity[indexPath.row]
                if stockValueBelltwo == "0"
                {
                    cell.btnAdd.setBackgroundImage(#imageLiteral(resourceName: "add"), for:.normal)
                    cell.outofstocklabel.isHidden = true
                    cell.NewBrandlabel.isHidden = true
                }
                else
                {
                    cell.NewBrandlabel.text = stockValueBelltwo
                    cell.outofstocklabel.isHidden = true
                }
            }
            
            if finalavailabelvaluesingeltwo == "0"
            {
                cell.imgProduct.alpha = 1.0
                
                cell.btnAdd.setBackgroundImage(#imageLiteral(resourceName: "add"), for:.normal)
                cell.NewBrandlabel.isHidden = false
                
                cell.outofstocklabel.isHidden = true
                cell.NewBrandlabel.text = self.favSecondAvailabelQuantity[indexPath.row]
                cell.imgProduct.alpha = 1.0
                cell.cashback_text.isHidden = false
                cell.cashbacklabel.isHidden = false
            }
        }
        
        let favouritemore = self.favfavouritesecondvalue[indexPath.row]
        print(favouritemore)
        if favouritemore == "0" {
            cell.btnFavor.setBackgroundImage(#imageLiteral(resourceName: "Heart"), for:.normal)
        }
        if favouritemore == "1"
        {
            cell.btnFavor.setBackgroundImage(#imageLiteral(resourceName: "favourite"), for:.normal)
        }
        
        
        let valedStr = self.favSecondNewproductCODisplay[indexPath.row]
        
        if valedStr == "0" {
            cell.codView.isHidden = true
        }
        if valedStr == "1"{
            cell.codView.isHidden = false
        }
        
        
        
        cell.lblProduct.text = self.favSecondNEwproductItems[indexPath.item]
        print(self.favSecondNEwproductItems)
        
        
        let statusVa = self.favSecondExclusive[indexPath.row]
        
        if statusVa == "0" {
            cell.imgExclusive.isHidden = true
        }else{
            cell.imgExclusive.isHidden = false
        }
        
        
        
        let Newproductcollection = self.favSecondNEwproductIMage[indexPath.item]
        cell.imgProduct.sd_setImage(with: URL(string:Newproductcollection), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
        cell.Wightofproductlabel.text = self.favSecondNewproductlabelMrp[indexPath.item]
        
        if self.favSecondNewproductsMrpstack.count > 0
        {
            let valuefinal = self.favSecondNewproductsMrpstack[indexPath.item]
            print(valuefinal)
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string:valuefinal as String)
            attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            cell.lblStock.attributedText = attributeString
        }
        
        
        cell.cashbacklabel.text = self.favouritecashBackfinal[indexPath.row]
        cell.lblRate.text = self.favSecondNewproductoutlets[indexPath.row]
        cell.lblMRP.text = self.favSecondNewproductlabelMrp[indexPath.row]
        cell.nintyninestruckfinalvalue.text = self.favSecondNewproductsInstack[indexPath.row]
 
        cell.Newmarginlabel.text = self.favSecondproductofferMargin[indexPath.row]
        
        cell.btnFavor.tag = indexPath.row
        cell.btnFavor.addTarget(self, action: #selector(HomeViewController.connectedfinalvauefavouritetableview(sender:)), for: .touchUpInside)
     
        cell.btnAdd.addTarget(self, action: #selector(addFavAllAction), for: .touchUpInside)
        cell.btnAdd.tag = indexPath.row
        return cell
     }
    else
     {
            let cell : tableListCell = favouritetabelview.dequeueReusableCell(withIdentifier: "tableListCell", for: indexPath) as! tableListCell
  
        let Newprodcutoff_Takefinal = self.favSecondNewproductdays[indexPath.row]
        if Newprodcutoff_Takefinal.count == 0
        {
            cell.lblDays.isHidden = true
            cell.imgArrow.isHidden = true

            
        }
        if Newprodcutoff_Takefinal.count >= 1
        {
            cell.lblDays.isHidden = false
            cell.imgArrow.isHidden = false
            cell.lblDays.text = self.favSecondNewproductdays[indexPath.item]
        }
        
       
        let finalavailabelvaluesingeltwo = self.favSecondNewproductsInstack[indexPath.row]

        print(finalavailabelvaluesingeltwo)
       
        if finalavailabelvaluesingeltwo == "Out of Stock"
        {
            cell.btnAdd.setBackgroundImage(#imageLiteral(resourceName: "Notification"), for:.normal)
            cell.NewBrandlabel.isHidden = true
            cell.NewBrandlabel.text = self.favSecondAvailabelQuantity[indexPath.row]
   
            cell.cashback_text.isHidden = true
            cell.imgArrow.isHidden = true
            cell.cashbacklabel.isHidden = true

            cell.imgNew.isHidden = true
            cell.outofstocklabel.isHidden = false
            cell.imgProduct.alpha = 0.3
            cell.lblStock.text = finalavailabelvaluesingeltwo
        }
        
        else{
            if finalavailabelvaluesingeltwo >= "1"
            {
                cell.imgProduct.alpha = 1.0

                cell.btnAdd.setBackgroundImage(#imageLiteral(resourceName: "cart_edit"), for:.normal)
                cell.NewBrandlabel.isHidden = false
                cell.NewBrandlabel.text = self.favSecondAvailabelQuantity[indexPath.row]
                cell.outofstocklabel.isHidden = true
                cell.NewBrandlabel.text = self.favSecondAvailabelQuantity[indexPath.row]
//        cell.cashback_text.isHidden = false
                cell.cashbacklabel.isHidden = false
                let stockValueBelltwo = self.favSecondAvailabelQuantity[indexPath.row]
                if stockValueBelltwo == "0"
                {
                    cell.btnAdd.setBackgroundImage(#imageLiteral(resourceName: "add"), for:.normal)
                    cell.outofstocklabel.isHidden = true
                    cell.NewBrandlabel.isHidden = true
                }
                else
                {
                    cell.NewBrandlabel.text = stockValueBelltwo
                    cell.outofstocklabel.isHidden = true
                }

            }
            
            if finalavailabelvaluesingeltwo == "0"
            {
                cell.imgProduct.alpha = 1.0

                cell.btnAdd.setBackgroundImage(#imageLiteral(resourceName: "add"), for:.normal)
                cell.NewBrandlabel.isHidden = false
         
                cell.outofstocklabel.isHidden = true
                cell.NewBrandlabel.text = self.favSecondAvailabelQuantity[indexPath.row]
                cell.imgProduct.alpha = 1.0
                cell.cashback_text.isHidden = false
                cell.cashbacklabel.isHidden = false
                
                
            }
        }
       
        let favouritemore = self.favfavouritesecondvalue[indexPath.row]
        print(favouritemore)
        if favouritemore == "0" {
            cell.btnFavor.setBackgroundImage(#imageLiteral(resourceName: "Heart"), for:.normal)
        }
        if favouritemore == "1"
        {
            cell.btnFavor.setBackgroundImage(#imageLiteral(resourceName: "favourite"), for:.normal)
        }
        cell.lblProduct.text = self.favSecondNEwproductItems[indexPath.item]
        print(self.favSecondNEwproductItems)
        
        
        let statusVa = self.favSecondExclusive[indexPath.row]
        
        if statusVa == "0" {
            cell.imgExclusive.isHidden = true
        }else{
            cell.imgExclusive.isHidden = false
        }
        
        let valedStr = self.favSecondNewproductCODisplay[indexPath.row]
        
        if valedStr == "0" {
            cell.codView.isHidden = true
        }
        if valedStr == "1"{
            cell.codView.isHidden = false
        }
        
        
        
        
        let Newproductcollection = self.favSecondNEwproductIMage[indexPath.item]
        cell.imgProduct.sd_setImage(with: URL(string:Newproductcollection), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
        cell.Wightofproductlabel.text = self.favSecondNewproductlabelMrp[indexPath.item]
        
        if self.favSecondNewproductsMrpstack.count > 0
        {
            let valuefinal = self.favSecondNewproductsMrpstack[indexPath.item]
            print(valuefinal)
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string:valuefinal as String)
            attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            cell.lblStock.attributedText = attributeString
        }
        
        
        cell.cashbacklabel.text = self.favouritecashBackfinal[indexPath.row]
        cell.lblRate.text = self.favSecondNewproductoutlets[indexPath.row]
        cell.lblMRP.text = self.favSecondNewproductlabelMrp[indexPath.row]
        cell.nintyninestruckfinalvalue.text = self.favSecondNewproductsInstack[indexPath.row]

      // cell.Newmarginlabel.text = self.favSecondproductofferMargin[indexPath.row]
        
        
        if self.favSecondproductofferMargin.count > 0
        {
            let valuefinal = self.favSecondproductofferMargin[indexPath.row]
            cell.Newmarginlabel.text = valuefinal

        }

        cell.btnFavor.tag = indexPath.row
        cell.btnFavor.addTarget(self, action: #selector(HomeViewController.connectedfinalvauefavouritetableview(sender:)), for: .touchUpInside)
        
         cell.btnAdd.addTarget(self, action: #selector(addFavAllAction), for: .touchUpInside)
        cell.btnAdd.tag = indexPath.row
        cell.selectionStyle = .none
        return cell
    }
    }
    @objc func addMArketchatfinalAction(sender: UIButton)
    {
        let DemochatView = self.storyboard?.instantiateViewController(withIdentifier:"DemochatViewController")as!DemochatViewController
        print(self.popcornCustomerbname[sender.tag])
        let stringtotal = NSString(format:"%@",self.popcornCustomerbname[sender.tag] as! CVarArg)
            print(self.popcornCustomerbname[sender.tag])
        
        
        let stringtotaltwo = NSString(format:"%@",self.Marketshoutid[sender.tag] as! CVarArg)

        DemochatView.SingelMarketshoutidvalue1 = stringtotaltwo as String
        DemochatView.namevalue = stringtotal as String
        self.present(DemochatView, animated: true, completion:nil)
    }
    
    @objc func addshoutbuttonmarkettotal(sender: UIButton)
    {
//        let ShoutViewControllerView = self.storyboard?.instantiateViewController(withIdentifier:"ShoutViewController")as!ShoutViewController
//        let stringtotaltwo = NSString(format:"%@",self.Marketshoutid[sender.tag] as! CVarArg)
//        ShoutViewControllerView.SingelMarketshoutidvalue1 = stringtotaltwo as String
//        self.present(ShoutViewControllerView, animated: true, completion:nil)
        self.selectedIndexfinal = nil
        self.selectedIndexfinal = sender.tag

        DispatchQueue.main.async
            {
                self.Reshouttotal.isHidden = false
                self.Reshoutview.isHidden = false
                self.sahreview.isHidden = true

        }
    }
   
    @objc func addsharebuttonbuttonmarkettotal(sender: UIButton)
    {
        self.selectedIndexfinal = nil
        self.selectedIndexfinal = sender.tag
        DispatchQueue.main.async
            {
                self.Reshouttotal.isHidden = false
                self.Reshoutview.isHidden = true
                self.sahreview.isHidden = false
                
        }
    }
    
    @objc func addMArketDeleteAction(sender: UIButton)
    {
        
       let Totalvalueis =  self.Marketshoutid[sender.tag]
        
        self.Marketsingelidvalue = Totalvalueis as! String
       
        DispatchQueue.main.async
            {
            self.DeleteShout()
           }
    }
    
    @objc func addlikebuttonmarket(sender: UIButton)
    {
        let btntag = sender.tag
        var anytwo = [0]
        if self.likesvalue[btntag] == "0"
        {
              sender.setBackgroundImage(#imageLiteral(resourceName: "MyHand-1"), for:.normal)
            self.Likemarketselectedint = nil
            self.Likemarketselectedint = sender.tag
            for i in 0..<self.likesvalue.count
            {
                let add = self.likesvalue[i]
                if i == self.Likemarketselectedint
                {
                    var arrytwo = NSArray()
                    arrytwo = ["1"]
                    print(self.likesvalue[i])
                    self.likesvalue[i] = "1"
                }
            }
            DispatchQueue.main.async
                {
                    self.mymarkettabelview.reloadData()
            }
            let totalvalue = self.Marketshoutid[sender.tag]
            let stringtotal = String(format:"%@",totalvalue as! CVarArg)
            self.singelshoutidtotal = stringtotal
            MarketLikemethod()
        }
        else
        {
            sender.setBackgroundImage(#imageLiteral(resourceName: "Myhand"), for:.normal)
            self.Likemarketselectedint = nil
            self.Likemarketselectedint = sender.tag
            for i in 0..<self.likesvalue.count
            {
                let add = self.likesvalue[i]
                if i == self.Likemarketselectedint
                {
                    var arrytwo = NSArray()
                    arrytwo = ["1"]
                    print(self.likesvalue[i])
                    self.likesvalue[i] = "0"
                }
            }
            DispatchQueue.main.async
                {
                    self.mymarkettabelview.reloadData()
            }
            let totalvalue = self.Marketshoutid[sender.tag]
            let stringtotal = String(format:"%@",totalvalue as! CVarArg)
            self.singelshoutidtotal = stringtotal
            MarketLikemethod()
         
        }
       
    }
    
  @objc func likelabelvalue(_ sender: UITapGestureRecognizer)
  {
        let view = sender.view
        let index = view?.tag
        print(index)
    
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if tableView == chatingtabelview
        {
            return 75
        }
        if tableView == complianttabelview
        {
            return 75
        }
        if tableView == soldtabelview
        {
            return 30
        }
        if tableView == NoTifictaiontabelview
        {
            return 165
        }
        if tableView == mymarkettabelview
        {
            return 365
        }
        if tableView == mymarkettabelview
        {
            return 365
        }
        if tableView == myshemetabelview
        {
            return 105
        }
            
        else{
            return 110
            
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if tableView == favouritetabelview
        {
            return 70
        }
        if tableView == favouritetabelviewtwo
        {
            return 70
        }
        else{
            return 0
            
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
            if tableView == NewBrandtabelview
            {
            DispatchQueue.main.async
                {
                    let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"ProductDescriptionViewController")as!ProductDescriptionViewController
                    viewfinal.productdemoidfinalvalue = self.SecondProductidValue[indexPath.row]
                    self.present(viewfinal, animated: true, completion:nil)
                }
            }
            if tableView == soldtabelview
            {
                let titlestring = self.sold_filledbynamearray[indexPath.row]
                
                self.cellerid  = self.sold_filledbyseller_idarray[indexPath.row]
                self.soldview.isHidden = true
                self.soldtabelview.isHidden = true
                self.drop.tag  = 1
                
            }
            else if tableView == Newcattabelview
            {
                DispatchQueue.main.async {
                    let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"ProductDescriptionViewController")as!ProductDescriptionViewController
                    viewfinal.productdemoidfinalvalue = self.SecondProductidValue[indexPath.row]
                    
                    self.present(viewfinal, animated: true, completion:nil)
                }
            }
            else if tableView == favouritetabelview
            {
                DispatchQueue.main.async {
                    let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"ProductDescriptionViewController")as!ProductDescriptionViewController
                    viewfinal.productdemoidfinalvalue = self.favSecondProductidValue[indexPath.row]
                    self.present(viewfinal, animated: true, completion:nil)
                }
            }
            else if tableView == favouritetabelviewtwo
            {
                DispatchQueue.main.async {
                    let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"ProductDescriptionViewController")as!ProductDescriptionViewController
                    viewfinal.productdemoidfinalvalue = self.favtwoSecondProductidValue[indexPath.row]
                    self.present(viewfinal, animated: true, completion:nil)
                }
            }
                
            else if tableView == chatingtabelview
            {
                self.sokettidindividual = self.sokettidTotal[indexPath.row]
                self.selectedIndexfinal = indexPath.row
                self.Conservation()
            }
            else if tableView == complianttabelview
            {
                DispatchQueue.main.async
                    {
                        let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"OpenComplinatViewController")as!OpenComplinatViewController
                        viewfinal.Stocktitle1 = self.Stocktitle[indexPath.row]
                        viewfinal.Stockis1 = self.Stockis[indexPath.row]
                        viewfinal.DeliveryorderNumbaer1 = self.DeliveryorderNumbaer[indexPath.row]
                        viewfinal.DeliveryOpen1 = self.DeliveryOpen[indexPath.row]
                        viewfinal.DeliveryDate1 = self.DeliveryDate[indexPath.row]
                        self.present(viewfinal, animated: true, completion:nil)
                }
            }
            else if tableView == mymarkettabelview
            {
                DispatchQueue.main.async
                    {
                        let shout = self.storyboard?.instantiateViewController(withIdentifier:"ShoutViewController")as!ShoutViewController

                        shout.SingelMarketshoutidvalue1 = self.Marketshoutid[indexPath.row] as! String
                        self.present(shout, animated: true, completion:nil)
                }
            }
        }
    
    func Conservation()
    {
        socketthree = managerthree.defaultSocket
        let defaultsvalue = UserDefaults.standard
        
        if let Bulkarrayfinal:String = defaultsvalue.value(forKey:"MyLoginfinalvalue")as!String
        {
            self.finalarayvaluw = Bulkarrayfinal
            
            let defaultsuserid = defaultsvalue.value(forKey:"Myuseridfinal")as!String
            let defaultsMyagentid = defaultsvalue.value(forKey:"Myagentidfinalavleu")as!String

    let datafour = ["type":"chat","roomName":self.sokettidindividual,"user":defaultsuserid]
            
//            JSONObject emit = new JSONObject();
//            emit.put("roomName", chatUserId);
//            emit.put("type", "chat");
//            emit.put("user", userId);
            
            let jsonData = try? JSONSerialization.data(withJSONObject:datafour, options: [])
            let jsonString = String(data: jsonData!, encoding: .utf8)

        self.socketthree.emit("join_in_group", jsonString!)
            
                        DispatchQueue.main.async
                            {
                                let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"MessageschatViewController")as!MessageschatViewController
                                ///viewfinal.chatimage = (self.Productypeiconimage[indexPath.row] as? UIImage)!
                                viewfinal.Productypeicon = self.Productypeicon[self.selectedIndexfinal!]
                                self.present(viewfinal, animated: true, completion:nil)
                        }
            
            
        }
    }
    @objc func connected(sender: UIButton)
        {
        let button = sender.tag
        let buttonTag = sender
        if(buttonTag.isSelected == true)
        {
            sender.setBackgroundImage(#imageLiteral(resourceName: "favourite"), for:.normal)
            producidclikHOMEstring = self.SecondProductidValue[button]
            print(producidclikHOMEstring)
            producidclikHOMENAmestring = self.SecondNEwproductItems[button]
            print(producidclikHOMENAmestring)
            
            self.selectedint = nil
            
            self.selectedint  = button
            
                for i in 0..<self.favouritesecondvalue.count {
                    let add = self.favouritesecondvalue[i]
                    if i == self.selectedint {
                        self.favouritesecondvalue[i] =  "1"
                    }
                }
            self.NewBrandtabelview.reloadData()
            self.Newcattabelview.reloadData()
            DispatchQueue.main.async {
                self.HOMELikeProduct()
            }
            buttonTag.isSelected = false
        }
        else
        {
            self.selectedint = nil
            
            self.selectedint  = button
            
            for i in 0..<self.favouritesecondvalue.count {
                let add = self.favouritesecondvalue[i]
                if i == self.selectedint {
                    self.favouritesecondvalue[i] =  "0"
                }
            }
            
            
            sender.setBackgroundImage(#imageLiteral(resourceName: "Heart"), for:.normal)
            DispatchQueue.main.async {
                self.HOMEunLikeProduct()
            }
            buttonTag.isSelected = true
        }
        
    }
    @objc func connectedfinalvauefavouritetableview(sender: UIButton)
    {
        let buttonTag = sender.tag
        
        if self.favSecondProductidValue.count > 0
        {
            FavouriteproducidclikHOMEstring = (self.favSecondProductidValue[buttonTag] as? String)!
            
            self.favouriteHOMEunLikeProduct()
            if favSecondNEwproductItems.count > 0
            {
                self.HOMEunLikeProduct()
                self.favSecondNEwproductItems.remove(at:sender.tag)
                self.favSecondNEwproductIMage.remove(at:sender.tag)
                self.favSecondNewproductoutlets.remove(at:sender.tag)
                self.favSecondNewproductsoffTakeDisplay.remove(at:sender.tag)
                self.favSecondNewproductsInstack.remove(at:sender.tag)
                self.favSecondNewproductdays.remove(at:sender.tag)
                self.favSecondNewproductlabelMrp.remove(at:sender.tag)
                self.favSecondAvailabelQuantity.remove(at:sender.tag)
                self.favSecondProductidValue.remove(at:sender.tag)
                self.favSecondproductofferMargin.remove(at:sender.tag)
                self.favSecondNewproductsMrpstack.remove(at:sender.tag)
                self.favfavouritesecondvalue.remove(at:sender.tag)
                self.favouritecashBackfinal.remove(at:sender.tag)
                
                self.favouritetabelview.reloadData()
            }
            if self.FavouriteAllString.count == 0
            {
                self.Agentfavouritescrollview.isHidden = false
                self.Agentsfavouritietwo.isHidden = false
                self.favouritetabelview.isHidden = true
                self.viewfavouriteone.isHidden = false
            }
        }
      
    }
    @objc func connectedfinalvauefavouritetabelviewtwo(sender: UIButton)
    {
        let buttonTag = sender.tag
        print(buttonTag)
        print(self.favtwoSecondProductidValue)
        print(self.favtwoSecondProductidValue[buttonTag])
        FavouriteproducidclikHOMEstring = (self.favtwoSecondProductidValue[sender.tag] as? String)!
        print(self.favtwoSecondProductidValue[buttonTag])
        if FavouriteproducidclikHOMEstring.count > 0
        {
            self.favtwoSecondProductidValue.remove(at:sender.tag)
            self.favouriteHOMEunLikeProduct()
            self.favtwoSecondNEwproductIMage.remove(at:sender.tag)
            self.favtwoSecondNEwproductItems.remove(at:sender.tag)
            self.favtwoSecondNewproductoutlets.remove(at:sender.tag)
            self.favtwoSecondNewproductsInstack.remove(at:sender.tag)
            self.favtwoSecondNewproductsoffTakeDisplay.remove(at:sender.tag)
            self.favtwoSecondNewproductdays.remove(at:sender.tag)
            self.favtwoSecondNewproductlabelMrp.remove(at:sender.tag)
            self.favtwoSecondAvailabelQuantity.remove(at:sender.tag)
            self.favtwoSecondProductidValue.remove(at:sender.tag)
            self.favtwoSecondproductofferMargin.remove(at:sender.tag)
            self.favtwoSecondNewproductsMrpstack.remove(at:sender.tag)
            self.favtwofavouritesecondvalue.remove(at:sender.tag)
            self.favtwovouritecashBackfinal.remove(at:sender.tag)
            self.favouritetabelviewtwo.reloadData()
            self.myshemetabelview.reloadData()

        }
        if self.FavouriteTrendingString.count == 0
        {
            self.agnetfavouritefourvalue.isHidden = false
            self.Agentfavouritescrollview.isHidden = false
            self.Agentsfavouritietwo.isHidden = true
            self.favouritetabelviewtwo.isHidden = true
        }
    }
  
    func HOMELikeFavouriteProduct()
    {
        
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.useridbiling = Reviewfinaluseroid
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
        
        let postString =  String(format: "method=%@&idProductInfo=%@&userid=%@&select=%@","AddToFav",favtwoSecondProductidValue,self.useridbiling,"1")
        
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
                    
                    self.HomestatusLikeviewall = dict.value(forKey:"status")as!NSNumber
                    print(self.HomestatusLikeviewall)
                    
                    let sttussucessstring =  self.HomestatusLikeviewall.stringValue
                    
                    
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

    func HOMELikeProduct()
    {
        
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.useridbiling = Reviewfinaluseroid
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
  
        let postString =  String(format: "method=%@&idProductInfo=%@&userid=%@&select=%@","AddToFav",producidclikHOMEstring,self.useridbiling,"1")
        
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
                
                    self.HomestatusLikeviewall = dict.value(forKey:"status")as!NSNumber
                    print(self.HomestatusLikeviewall)

                    let sttussucessstring =  self.HomestatusLikeviewall.stringValue


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
    func HOMEunLikeProduct()
    {
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.useridbiling = Reviewfinaluseroid
        }
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }

        let postString =  String(format: "method=%@&idProductInfo=%@&userid=%@&select=%@","AddToFav",producidclikHOMEstring,useridbiling,"0")
        
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
               
                    
                    self.HomestatusLikeviewall = dict.value(forKey:"status")as!NSNumber
                    print(self.HomestatusLikeviewall)
                    
                    let sttussucessstring =  self.HomestatusLikeviewall.stringValue
                    
                    
                    print(sttussucessstring)
                    if sttussucessstring == "1"
                    {
                        self.Favouritecallfunction()
                    }
                    
                    
                }
                break
            case .failure(_):
                break
            }
            
            
            
        }
    }
    
    func favouriteHOMEunLikeProduct()
    {
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.useridbiling = Reviewfinaluseroid
        }
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        let postString =  String(format: "method=%@&idProductInfo=%@&userid=%@&select=%@","AddToFav",FavouriteproducidclikHOMEstring,useridbiling,"0")
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
               
                    self.HomestatusLikeviewall = dict.value(forKey:"status")as!NSNumber
                    print(self.HomestatusLikeviewall)
                    
                    let sttussucessstring =  self.HomestatusLikeviewall.stringValue
                    
                    
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
    
    @objc func pageChanged()
    {
        let pageNumber = pageControl.currentPage
        var frame = scrMain.frame
        frame.origin.x = frame.size.width * CGFloat(pageNumber)
        frame.origin.y = 0
        scrMain.scrollRectToVisible(frame, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == Homecollectionview
        {
            return TodayDealProductItems.count

        }
        else if collectionView == Recomendedcollectionview
        {
            return RecomendedProductItems.count

        }
        else if collectionView == Trendingproductcollectionview
        {
            return TrendingProductItems.count
        }
            else if collectionView == Newproductcollectionview
        {

            return self.Newproduct_dealsstruck.count
        }
        else if collectionView == Topproductcolectionview
        {
      
            return freNEwproductItems.count
        }
            else if collectionView == topcatageorycollectionview
        {
            return TopcatageoryItemsfinal.count

        }
        else if collectionView == NewBrandcollectionview
        {
            return  Brandsidbrand_namestring.count

        }
        else if collectionView == Newcatcollectionview
        {
            return  Brandsidbrand_namestring.count
            
        }
        else if collectionView == Newfavouritecollectionview
        {
            return favouritefinal.count
            
        }
        else if collectionView == abcdcollectionview
        {
            
            return ExploreLettersArray.count

        }
        else if collectionView == Explorebrandscollectionview
        {

            return exploreBrandsNamearry.count
        }
       
        else if collectionView == CatExplorebrandscollectionview
        {
            return ExplorecatgeoryName.count
        }
        else if collectionView == Catabcdcollectionview
        {
            return ExplorecatageoryLettersArray.count
        }
        
        else if collectionView == Topcombocolletcionview
        {
            return self.comboSarray.count
        }
       
        else if collectionView == Combocolelctionview
        {
            return self.comboSarray1.count
        }
        else
        {
            return self.TopBrandimage.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if collectionView == Homecollectionview
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"HomeCollectionViewCell", for: indexPath as IndexPath) as!HomeCollectionViewCell
            cell.Itemlabel.text = self.TodayDealProductItems[indexPath.item]
         cell.outletslabel.text = self.TodayDealProductItemsprice[indexPath.item]
     
         cell.myinstacklabel.text = self.TodayDealProductItemsprice[indexPath.item]
            
            let valuefinal = self.TodayDealinstock[indexPath.item]
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string:valuefinal as String)
            attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            cell.Todaystrucklabel.attributedText = attributeString

            if  self.Today_Dealspercentage.count > 0
            {
                let value = self.Today_Dealspercentage[indexPath.item]

                cell.Todaypercentalbel.text = value

            }
             cell.Todaypercentalbel.roundCorners([.bottomLeft, .bottomRight], radius:4)
        cell.Todaypercentalbel.layer.masksToBounds = true
            cell.Homeview.layer.cornerRadius = 4
            cell.Homeview.layer.borderWidth = 1.0
            cell.Homeview.layer.borderColor =   UIColor(red:217/255, green:218/255, blue:218/255, alpha: 1).cgColor
       
            
            cell.myinstacklabel.text = self.todaydealsstacklabel[indexPath.item]

            let TodayDealsProductoff_Takefinal =  self.TodayDealProductoffTakeDisplay[indexPath.row]
            if TodayDealsProductoff_Takefinal == "0"
            {
                cell.dayslabel.isHidden = true
                cell.daysimage.isHidden = true
                cell.myinstacklabel.frame = CGRect(x:cell.myinstacklabel.frame.origin.x, y:134, width:cell.myinstacklabel.frame.size.width, height: cell.myinstacklabel.frame.size.height)

            }
            if TodayDealsProductoff_Takefinal == "1"
            {
                cell.dayslabel.isHidden = false
                cell.daysimage.isHidden = false
               cell.myinstacklabel.frame = CGRect(x:cell.myinstacklabel.frame.origin.x, y:145, width:cell.myinstacklabel.frame.size.width, height: cell.myinstacklabel.frame.size.height)

                cell.dayslabel.text = self.TodayDealProductdays[indexPath.item]
                
            }
            
            
            let Todayproductcollection = self.TodayDealProductimage[indexPath.item]
            cell.Itemiamgeview.sd_setImage(with: URL(string:Todayproductcollection), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
       
            let todayDealUQty = self.TodaydealSellerID[indexPath.row]
            if todayDealUQty == "0" {
                cell.btnadd.setBackgroundImage(UIImage(named:"add.png"), for: .normal)
                cell.brandsquantylabel.isHidden  = true

            }else{
                cell.btnadd.setBackgroundImage(UIImage(named: "cart_edit.png"), for: .normal)
                cell.brandsquantylabel.isHidden  = false
                cell.brandsquantylabel.text = todayDealUQty
            }
            cell.btnadd.tag = indexPath.row

                cell.btnadd.addTarget(self, action: #selector(addTodaydealUserQnty), for: .touchUpInside)
            if self.Todayspecialoffer.count > 0
            {
                let Todayspecialoffervaleu = self.Todayspecialoffer[indexPath.item]
                if Todayspecialoffervaleu == "0"
                {
                cell.giftone.isHidden = true
                }
                if Todayspecialoffervaleu == "1"
                {
                    cell.giftone.isHidden = false
                }
            }
            
            
            self.clickedbuttontotalvalue = "Homecollectionview"
            
            
            return cell
        }
        else if collectionView == Recomendedcollectionview
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"HomeCollectionViewCell", for: indexPath as IndexPath) as!HomeCollectionViewCell
            cell.Itemlabel.text = self.RecomendedProductItems[indexPath.item]
           cell.outletslabel.text = self.RecomendedProductItemsprice[indexPath.item]
           
            cell.myinstacklabel.text = self.Recomendedinstock[indexPath.item]
            let Recomendedproductcollection = self.RecomendedProductimage[indexPath.item]
            cell.Itemiamgeview.sd_setImage(with: URL(string:Recomendedproductcollection), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
            cell.Homeview.layer.cornerRadius = 4
            cell.Homeview.layer.borderWidth = 1.0
            cell.Homeview.layer.borderColor =  UIColor(red:217/255, green:218/255, blue:218/255, alpha: 1).cgColor
         

            cell.Todaypercentalbel.roundCorners([.bottomLeft, .bottomRight], radius:4)
            cell.Todaypercentalbel.layer.masksToBounds = true
      
            let RecomendedProductoff_Takefinal =  self.RecomendedProductoffTakeDisplay[0]
            if RecomendedProductoff_Takefinal == "0"
            {
                cell.dayslabel.isHidden = true
                cell.daysimage.isHidden = true
               cell.myinstacklabel.frame = CGRect(x:cell.myinstacklabel.frame.origin.x, y:134, width:cell.myinstacklabel.frame.size.width, height: cell.myinstacklabel.frame.size.height)
    
            }
            if RecomendedProductoff_Takefinal == "1"
            {
                cell.dayslabel.isHidden = false
                cell.daysimage.isHidden = false
               cell.myinstacklabel.frame = CGRect(x:cell.myinstacklabel.frame.origin.x, y:145, width:cell.myinstacklabel.frame.size.width, height: cell.myinstacklabel.frame.size.height)
                cell.dayslabel.text = self.RecomendedProductdays[indexPath.item]
                
            }
            
            let valuefinal = self.Recomendedsstruck[indexPath.item]
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string:valuefinal as String)
            attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            cell.Todaystrucklabel.attributedText = attributeString
   
            cell.Todaypercentalbel.text = self.RecomendedinsPercentage[indexPath.item]

            scrMain.isScrollEnabled = true
            
            
            //// Recomended collectionview
            
             cell.btnadd.tag = indexPath.row
  cell.btnadd.addTarget(self, action: #selector(addRecomendedUserQnty), for: .touchUpInside)
            let todayDealUQty = self.RecomendedSellerID[indexPath.row]
            if todayDealUQty == "0" {
                cell.btnadd.setBackgroundImage(UIImage(named:"add.png"), for: .normal)
                
                cell.brandsquantylabel.isHidden  = true
                
            }else{
                cell.btnadd.setBackgroundImage(UIImage(named: "cart_edit.png"), for: .normal)
                cell.brandsquantylabel.text = todayDealUQty
                cell.brandsquantylabel.isHidden  = false
            }
            
            if self.Recomendedspecialoffer.count > 0
            {
                let Recomendedspecialvaleu = self.Recomendedspecialoffer[indexPath.item]
                if Recomendedspecialvaleu == "0"
                {
                    cell.giftone.isHidden = true
                }
                if Recomendedspecialvaleu == "1"
                {
                    cell.giftone.isHidden = false
                }
            }
                 self.clickedbuttontotalvalue = "Recomendedcollectionview"

            return cell
        }
        else if collectionView == Trendingproductcollectionview
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"HomeCollectionViewCell", for: indexPath as IndexPath) as!HomeCollectionViewCell
            cell.Itemlabel.text = self.TrendingProductItems[indexPath.item]
          cell.outletslabel.text = self.TrendingProductItemsprice[indexPath.item]
            cell.myinstacklabel.text = self.Trendinginstock[indexPath.item]
            
         
            let Trendingproductoff_Takefinal =  self.TrendingProductoffTakeDisplay[0]
            if Trendingproductoff_Takefinal == "0"
            {
                cell.dayslabel.isHidden = true
                cell.daysimage.isHidden = true
               cell.myinstacklabel.frame = CGRect(x:cell.myinstacklabel.frame.origin.x, y:134, width:cell.myinstacklabel.frame.size.width, height: cell.myinstacklabel.frame.size.height)
            }
            if Trendingproductoff_Takefinal == "1"
            {
                cell.dayslabel.isHidden = false
                cell.daysimage.isHidden = false
               cell.myinstacklabel.frame = CGRect(x:cell.myinstacklabel.frame.origin.x, y:145, width:cell.myinstacklabel.frame.size.width, height: cell.myinstacklabel.frame.size.height)
                cell.dayslabel.text = self.TrendingProductdays[indexPath.item]
            }
            let Trendingproductcollection = self.TrendingProductimage[indexPath.item]
            cell.Itemiamgeview.sd_setImage(with: URL(string:Trendingproductcollection), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
            
            cell.Homeview.layer.cornerRadius = 4
            cell.Homeview.layer.borderWidth = 1.0
            cell.Homeview.layer.borderColor = UIColor(red:217/255, green:218/255, blue:218/255, alpha: 1).cgColor
      
            if self.Trending_dealsstruck.count > 0
            {
                let valuefinal = self.Trending_dealsstruck[indexPath.item]
                let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string:valuefinal as String)
                attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
                cell.Todaystrucklabel.attributedText = attributeString
            }
            cell.Todaypercentalbel.text = self.Trending_Dealspercentage[indexPath.item]
            cell.Todaypercentalbel.roundCorners([.bottomLeft, .bottomRight], radius:4)
            cell.Todaypercentalbel.layer.masksToBounds = true
            scrMain.isScrollEnabled = true
         
            if self.Trendingspecialoffer.count > 0
            {
                let Trendingspecialoffervaleu = self.Trendingspecialoffer[indexPath.item]
                if Trendingspecialoffervaleu == "0"
                {
                    cell.giftone.isHidden = true
                }
                if Trendingspecialoffervaleu == "1"
                {
                    cell.giftone.isHidden = false
                }
            }
       
            cell.btnadd.tag = indexPath.row

          cell.btnadd.addTarget(self, action: #selector(addTrendingUserQnty), for: .touchUpInside)
       
                  self.clickedbuttontotalvalue = "Trendingproductcollectionview"

            let todayDealUQty = self.TrendingSellerID[indexPath.row]
            if todayDealUQty == "0" {
                cell.btnadd.setBackgroundImage(UIImage(named:"add.png"), for: .normal)
                cell.brandsquantylabel.isHidden  = true

            }else{
                cell.brandsquantylabel.isHidden  = false
                cell.btnadd.setBackgroundImage(UIImage(named: "cart_edit.png"), for: .normal)
                cell.brandsquantylabel.text = todayDealUQty
            }
            return cell
        }
        else if collectionView == Newproductcollectionview
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"HomeCollectionViewCell", for: indexPath as IndexPath) as!HomeCollectionViewCell
            cell.Itemlabel.text = self.NEwproductItems[indexPath.item]
            
            print(self.NEwproductItems)
            
            cell.outletslabel.text = self.Newproductoutlets[indexPath.item]
           
            let Newprodcutoff_Takefinal = self.NewproductsInstack[indexPath.row]
            
            if Newprodcutoff_Takefinal == "Out of Stock"
            {
                let quantityfinalvalue =  self.Newproductuserquantity[indexPath.item]
                cell.brandsquantylabel.isHidden = true
                cell.brandsquantylabel.text = quantityfinalvalue
                cell.dayslabel.isHidden = true
                cell.daysimage.isHidden = true
              cell.myinstacklabel.frame = CGRect(x:cell.myinstacklabel.frame.origin.x, y:134, width:cell.myinstacklabel.frame.size.width, height: cell.myinstacklabel.frame.size.height)

               cell.btnadd.setBackgroundImage(#imageLiteral(resourceName: "Notification"), for:.normal)

            }
            else{
                if Newprodcutoff_Takefinal >= "1"
                {
                    cell.dayslabel.isHidden = false
                    cell.daysimage.isHidden = false

                    cell.dayslabel.text = self.Newproductdays[indexPath.item]
                    
                   let quantityfinalvalue =  self.Newproductuserquantity[indexPath.item]
                    
                    if quantityfinalvalue.count > 0
                    {
                        cell.btnadd.setBackgroundImage(#imageLiteral(resourceName: "cart_edit"), for:.normal)
                        cell.brandsquantylabel.isHidden = false
                        cell.brandsquantylabel.text = quantityfinalvalue
                    }
                    else{
                        cell.brandsquantylabel.isHidden = true
                        cell.brandsquantylabel.text = quantityfinalvalue
                          cell.btnadd.setBackgroundImage(#imageLiteral(resourceName: "add"), for:.normal)
                    }
            
                   
                   
                }
                else{
                cell.btnadd.setBackgroundImage(#imageLiteral(resourceName: "add"), for:.normal)
                    let quantityfinalvalue =  self.Newproductuserquantity[indexPath.item]
                    cell.brandsquantylabel.isHidden = true
                    cell.brandsquantylabel.text = quantityfinalvalue
                    cell.dayslabel.isHidden = false
                    cell.daysimage.isHidden = false
                   cell.myinstacklabel.frame = CGRect(x:cell.myinstacklabel.frame.origin.x, y:145, width:cell.myinstacklabel.frame.size.width, height: cell.myinstacklabel.frame.size.height)

                    cell.dayslabel.text = self.Newproductdays[indexPath.item]
                }
            }
        
            cell.dayslabel.text = self.Newproductdays[indexPath.item]
            cell.myinstacklabel.text = self.NewproductsInstack[indexPath.item]
            let Newproductcollection = self.NEwproductIMage[indexPath.item]
            cell.Itemiamgeview.sd_setImage(with: URL(string:Newproductcollection), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
            cell.Homeview.layer.cornerRadius = 4
            cell.Homeview.layer.borderWidth = 1.0
            cell.Homeview.layer.borderColor = UIColor(red:217/255, green:218/255, blue:218/255, alpha: 1).cgColor
            print(self.Newproduct_dealsstruck)
            let valuefinal = self.Newproduct_dealsstruck[indexPath.item]
            
            print(valuefinal)
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string:valuefinal as String)
            attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            cell.Todaystrucklabel.attributedText = attributeString
     
            if self.Newproduct_Dealspercentage.count > 0
            {
                let dealstotal = self.Newproduct_Dealspercentage[indexPath.item]
                cell.Todaypercentalbel.text = dealstotal
            }
            cell.Todaypercentalbel.roundCorners([.bottomLeft, .bottomRight], radius:4)
            cell.Todaypercentalbel.layer.masksToBounds = true
         
            scrMain.isScrollEnabled = true
        
            if self.Newproductspecialoffer.count > 0
            {
                let Newproductspecialoffervaleu = self.Newproductspecialoffer[indexPath.item]
                if Newproductspecialoffervaleu == "0"
                {
                    cell.giftone.isHidden = true
                }
                if Newproductspecialoffervaleu == "1"
                {
                    cell.giftone.isHidden = false
                }
            }
            let todayDealUQty = self.NewproductSellerID[indexPath.row]
            if todayDealUQty == "0" {
                cell.btnadd.setBackgroundImage(UIImage(named:"add.png"), for: .normal)
                cell.brandsquantylabel.isHidden  = true

                
            }else{
                cell.btnadd.setBackgroundImage(UIImage(named: "cart_edit.png"), for: .normal)
                cell.brandsquantylabel.isHidden  = false

                cell.brandsquantylabel.text = todayDealUQty
            }

            cell.btnadd.tag = indexPath.row

        cell.btnadd.addTarget(self, action: #selector(addNewProductListUserQnty), for: .touchUpInside)

                 self.clickedbuttontotalvalue = "Newproductcollectionview"

            return cell
        }
        else if collectionView == Topproductcolectionview
        {
            let cell = Topproductcolectionview.dequeueReusableCell(withReuseIdentifier:"HomeCollectionViewCell", for: indexPath as IndexPath) as!HomeCollectionViewCell
            cell.Itemlabel.text = self.freNewproductoutlets[indexPath.item]
            cell.outletslabel.text = self.freNEwproductItems[indexPath.item]
            let Newprodcutoff_Takefinal = self.freNewproductsoffTakeDisplay[0]
            if Newprodcutoff_Takefinal == "0"
            {
                cell.dayslabel.isHidden = true
                cell.daysimage.isHidden = true
                cell.myinstacklabel.frame = CGRect(x:cell.myinstacklabel.frame.origin.x-1, y:134, width:cell.myinstacklabel.frame.size.width, height: cell.myinstacklabel.frame.size.height)
                cell.btnadd.frame = CGRect(x:cell.btnadd.frame.origin.x, y:116, width:cell.btnadd.frame.size.width, height: cell.btnadd.frame.size.height)
                cell.frame = CGRect(x:cell.frame.origin.x, y:cell.frame.origin.y, width: cell.frame.size.width, height:cell.frame.size.height-5)
                
            }
            if Newprodcutoff_Takefinal == "1"
            {
                cell.dayslabel.isHidden = false
                cell.daysimage.isHidden = false
                cell.myinstacklabel.frame = CGRect(x:cell.myinstacklabel.frame.origin.x, y:145, width:cell.myinstacklabel.frame.size.width, height: cell.myinstacklabel.frame.size.height)
                cell.btnadd.frame = CGRect(x:cell.btnadd.frame.origin.x, y:121, width:cell.btnadd.frame.size.width, height: cell.btnadd.frame.size.height)
                cell.frame = CGRect(x:cell.frame.origin.x, y:cell.frame.origin.y, width: cell.frame.size.width, height:cell.frame.size.height)
                
                cell.dayslabel.text = self.freNewproductdays[indexPath.item]
                
            }
            cell.myinstacklabel.text = self.freNewproductsInstack[indexPath.item]
            let Newproductcollection = self.freNEwproductIMage[indexPath.item]
            cell.Itemiamgeview.sd_setImage(with: URL(string:Newproductcollection), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
            cell.Homeview.layer.cornerRadius = 4
            cell.Homeview.layer.borderWidth = 1.0
            cell.Homeview.layer.borderColor = UIColor(red:217/255, green:218/255, blue:218/255, alpha: 1).cgColor
            
            let valuefinal = self.freNewproduct_dealsstruck[indexPath.item]
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string:valuefinal as String)
            attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
            cell.Todaystrucklabel.attributedText = attributeString
            cell.Todaypercentalbel.text = self.freNewproduct_Dealspercentage[indexPath.item]
            cell.Todaypercentalbel.roundCorners([.bottomLeft, .bottomRight], radius:4)
            cell.Todaypercentalbel.layer.masksToBounds = true
            
            scrMain.isScrollEnabled = true
         
            if self.Frequentlyboughtproductsspecialoffer.count > 0
            {
                let Frequentlyboughtproductsspecialoffervaleu = self.Frequentlyboughtproductsspecialoffer[indexPath.item]
                if Frequentlyboughtproductsspecialoffervaleu == "0"
                {
                    cell.giftone.isHidden = true
                }
                if Frequentlyboughtproductsspecialoffervaleu == "1"
                {
                    cell.giftone.isHidden = false
                }
            }
            
            let todayDealUQty = self.freNewproductSellerID[indexPath.row]
            if todayDealUQty == "0" {
                cell.btnadd.setBackgroundImage(UIImage(named:"add.png"), for: .normal)
                cell.brandsquantylabel.isHidden  = true
            }
            else
            {
                cell.btnadd.setBackgroundImage(UIImage(named: "cart_edit.png"), for: .normal)
                cell.brandsquantylabel.isHidden  = false

                cell.brandsquantylabel.text = todayDealUQty
            }
            cell.btnadd.tag = indexPath.row

        cell.btnadd.addTarget(self, action: #selector(addFrequentUserQnty), for: .touchUpInside)
    
                self.clickedbuttontotalvalue = "Topproductcolectionview"

            return cell
        }
            
        else if collectionView == topcatageorycollectionview
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"TopcatgeoryCollectionViewCell", for: indexPath as IndexPath) as!TopcatgeoryCollectionViewCell
            cell.catageorylabel.text = self.TopcatageoryItemsfinal[indexPath.item]
            let topcatageory = self.Itemimagefinal[indexPath.item]
            
            cell.catageoryimageview.sd_setImage(with: URL(string:topcatageory), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
            
            
            cell.vi.layer.cornerRadius = 4
            cell.vi.layer.borderWidth = 1.0

            cell.catageorysview.layer.borderWidth = 1.0
            cell.catageorysview.layer.borderColor = UIColor(red:217/255, green:218/255, blue:218/255, alpha: 1).cgColor
            cell.vi.layer.borderColor = UIColor(red:217/255, green:218/255, blue:218/255, alpha: 1).cgColor
            scrMain.isScrollEnabled = true
            cell.catageorysview.roundCorners([.topLeft, .topRight], radius: 5)

            return cell
        }
        else if collectionView == NewBrandcollectionview
        {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"NewBrandCollectionViewCell", for: indexPath as IndexPath) as!NewBrandCollectionViewCell
                cell.NewBrandlabel.text = self.Brandsidbrand_namestring[indexPath.item]
             cell.NewBrandlabel.textColor = UIColor.lightGray
             cell.NewBrandlabel.frame = CGRect(x:cell.NewBrandlabel.frame.origin.x, y:cell.NewBrandlabel.frame.origin.y, width:95, height:cell.NewBrandlabel.frame.size.height)

                if selectedIndex == nil
                {
                    if indexPath.row == 0
                    {
                        cell.NewBrandlabel.textColor = UIColor.red
                    }
                }
                else
                {
                    if indexPath.row == selectedIndex
                    {
                        cell.NewBrandlabel.textColor = UIColor.red
                    }
                    else{
                        cell.NewBrandlabel.textColor = UIColor.lightGray
                    }
                }
                return cell
            
        }
        else if collectionView == Newcatcollectionview
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"NewBrandCollectionViewCell", for: indexPath as IndexPath) as!NewBrandCollectionViewCell
            cell.NewBrandlabel.text =  self.Brandsidbrand_namestring[indexPath.item]
            cell.NewBrandlabel.textColor = UIColor.lightGray

              cell.NewBrandlabel.frame = CGRect(x:cell.NewBrandlabel.frame.origin.x, y:cell.NewBrandlabel.frame.origin.y, width:95, height:cell.NewBrandlabel.frame.size.height)
            if selectedIndex == nil
            {
                if indexPath.row == 0
                {
                    cell.NewBrandlabel.textColor = UIColor.red
                }
            }
            else
            {
                if indexPath.row == selectedIndex
                {
                    cell.NewBrandlabel.textColor = UIColor.red
                }
                else{
                    cell.NewBrandlabel.textColor = UIColor.lightGray
                }
            }
            return cell
        }
            
        else if collectionView == Newfavouritecollectionview
        {
   
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"NewBrandCollectionViewCell", for: indexPath as IndexPath) as!NewBrandCollectionViewCell
            cell.NewBrandlabel.text = self.favouritefinal[indexPath.item]
            if selectedIndex == nil
            {
                if indexPath.row == 0
                {
                    cell.NewBrandlabel.textColor = UIColor.red
                }
            }
            else
            {
                if indexPath.row == selectedIndex
                {
                    cell.NewBrandlabel.textColor = UIColor.red
                }
                else{
                    cell.NewBrandlabel.textColor = UIColor.lightGray
                }
            }
            return cell
            
        }
        else if collectionView == Catabcdcollectionview
        {
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"AbcdCollectionViewCell", for: indexPath as IndexPath) as!AbcdCollectionViewCell
            var letterR: Character = "B"
            if let letter = (self.ExplorecatageoryLettersArray[indexPath.item] ).first {
                print(letter)
                letterR = letter
            }
            cell.Abcdlabel.text = self.ExplorecatageoryLettersArray[indexPath.item]
            if FirstLeterManipulationtwo == letterR{
                
                cell.Abcdlabel.textColor = UIColor.red
                
            }
            else{
                cell.Abcdlabel.textColor = UIColor.black
                
            }
            
//
//
//
//            cell.Abcdlabel.text = self.Abcdelements[indexPath.item]
            return cell
        }
        else if collectionView == Explorebrandscollectionview
        {
       
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"NewBrandTwoCollectionViewCell", for: indexPath as IndexPath) as!NewBrandTwoCollectionViewCell

            cell.catageorylabel.text = self.exploreBrandsNamearry[indexPath.item]

            let RecomendedExplorebrands = self.exploreBrandsImagepatharry[indexPath.item]
            cell.catageoryimageview.sd_setImage(with: URL(string:RecomendedExplorebrands), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
            
            
            cell.vi.layer.cornerRadius = 4
            cell.vi.layer.borderWidth = 1.0
            
            cell.catageorysview.layer.borderWidth = 1.0
          
            
           cell.catageorysview.roundCorners([.topLeft, .topRight], radius: 5)
            cell.catageoryimageview.roundCorners([.topLeft, .topRight], radius: 5)

            cell.catageorysview.layer.borderColor = UIColor(red:217/255, green:218/255, blue:218/255, alpha: 1).cgColor
            cell.vi.layer.borderColor = UIColor(red:217/255, green:218/255, blue:218/255, alpha: 1).cgColor
            cell.catageorysview.roundCorners([.topLeft, .topRight], radius: 5)
            var letterR: Character = "A"
            print(self.self.exploreBrandsNamearry)
            
            if let letter = (self.self.exploreBrandsNamearry[indexPath.item] ).first
            {
                print(letter)
                letterR = letter
            }
            if FirstLeterManipulation == letterR
            {
                cell.catageorylabel.textColor = UIColor.blue

//                cell.catageorylabel.setDifferentColor(string: cell.catageorylabel.text!, location: 0, length: 1)
            }
            else
            {
                cell.catageorylabel.textColor = UIColor.black
            }
       
            return cell
        }
        else if collectionView == abcdcollectionview
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"AbcdCollectionViewCell", for: indexPath as IndexPath) as!AbcdCollectionViewCell
            
            var letterR: Character = "A"
            
            // same like previous cell bgetting first letter , comparing changing color
            if let letter = (self.ExploreLettersArray[indexPath.item] ).first {
                print(letter)
                letterR = letter
            }
            cell.Abcdlabel.text = self.ExploreLettersArray[indexPath.item]
            if FirstLeterManipulation == letterR{
                
                cell.Abcdlabel.textColor = UIColor.red
                
            }
            else{
                cell.Abcdlabel.textColor = UIColor.black
                
            }
        
            //cell.Abcdlabel.text = self.Abcdelements[indexPath.item]
            return cell
        }
        else if collectionView == CatExplorebrandscollectionview
        {
            
       
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"NewBrandTwoCollectionViewCell", for: indexPath as IndexPath) as!NewBrandTwoCollectionViewCell
            cell.catageorylabel.text = self.ExplorecatgeoryName[indexPath.item]
            
            let RecomendedExplorebrands = self.Explorecatageoryiamge[indexPath.item]
            cell.catageoryimageview.sd_setImage(with: URL(string:RecomendedExplorebrands), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
         
            
            
          //  cell.catageoryimageview.image = self.ExploreBrand_image[indexPath.item]
            cell.vi.layer.cornerRadius = 4
            cell.vi.layer.borderWidth = 1.0
            
            cell.catageorysview.layer.borderWidth = 1.0
            
            
            cell.catageorysview.roundCorners([.topLeft, .topRight], radius: 5)
            cell.catageoryimageview.roundCorners([.topLeft, .topRight], radius: 5)
            
            cell.catageorysview.layer.borderColor = UIColor(red:217/255, green:218/255, blue:218/255, alpha: 1).cgColor
            cell.vi.layer.borderColor = UIColor(red:217/255, green:218/255, blue:218/255, alpha: 1).cgColor
            cell.catageorysview.roundCorners([.topLeft, .topRight], radius: 5)
            var letterR: Character = "B"
            
            if let letter = (self.self.ExplorecatgeoryName[indexPath.item] ).first
            {
                print(letter)
                letterR = letter
            }
            if FirstLeterManipulationtwo == letterR
            {
                cell.catageorylabel.textColor = UIColor.blue

//                cell.catageorylabel.setDifferentColor(string: cell.catageorylabel.text!, location: 0, length: 1)
            }
            else
            {
                cell.catageorylabel.textColor = UIColor.black
            }
            
            return cell
        }

        else if collectionView == Topcombocolletcionview
            
        {
            let cell = Topcombocolletcionview.dequeueReusableCell(withReuseIdentifier:"ComboCollectionViewCell", for: indexPath as IndexPath) as!ComboCollectionViewCell
            cell.combolabel.text = self.comboSarray[indexPath.item]
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
            
        else if collectionView == Combocolelctionview
            
        {
            let cell = Combocolelctionview.dequeueReusableCell(withReuseIdentifier:"CombotwoCollectionViewCell", for: indexPath as IndexPath) as!CombotwoCollectionViewCell
            // cell.offerPlusimage.image = self.comboooferimagetwo[indexPath.item]
            
            
            
            if let Comboimages:String = self.comboSarray1[indexPath.item] as? String
            {
                
                let Myproduct = Comboimages
                
                cell.offerimage.sd_setImage(with: URL(string:Myproduct), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
            }
//            let Myproduct = self.comboSarray1[indexPath.item]
            
            
            
            
//            cell.offerimage.sd_setImage(with: URL(string:Myproduct as! String), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
            
            if self.comboSarray1.count-1 == indexPath.row {
                cell.offerPlusimage.isHidden = true
                
            }
            else{
                cell.offerPlusimage.isHidden = false
                
            }
            
            
            return cell
        }
            
            
            
        else{
           
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"TopBrandCollectionViewCell", for: indexPath as IndexPath) as!TopBrandCollectionViewCell
            cell.TopBrandlabel.text = self.TopBrandName[indexPath.item]
            let topbrandimagefinal = self.TopBrandimage[indexPath.item]
           cell.TopBrandimage.sd_setImage(with: URL(string:topbrandimagefinal), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
            
            cell.TopBrandview.layer.cornerRadius = cell.TopBrandview.frame.size.height/2
             cell.TopBrandview.layer.masksToBounds = true
            cell.TopBrandimage.layer.borderWidth = 1.0
           cell.TopBrandimage.layer.borderColor = UIColor.white.cgColor
     cell.contentView.backgroundColor = UIColor.NEWBRANDCOLOR()
            scrMain.isScrollEnabled = true
            return cell
        }

    }

    @objc func addTodaydealUserQnty(sender: UIButton)
    {
     
                self.Todayvalue = ""
                self.Todayvalue = "Todayvalue"
                let btntag = sender.tag
                self.todayInstock  = ""
                self.selectedint = nil
                
                self.selectedint  = btntag
                
                self.todayInstock = self.TodaydealavailableQnty[btntag]
                self.minimuminstacklabel.text = "\(self.todayInstock) Instock"
                self.myinstacklabeltwo.text = "\(self.todayInstock) Instock"
                
                
                self.Today_quantity = ""
                self.Today_quantity = self.TodaydealSellerID[btntag]
                let Todayproductcalculation  = self.TodaydealMoQCal[btntag]
                self.singquantitylabel.text = "\(Todayproductcalculation) X"
                self.anotherquntitylabel.text = Today_quantity
                
                let valuefinal = "\(self.todayInstock) Instock"
                
                if valuefinal.count > 0
                {
                    self.minimuminstacklabel.text = valuefinal
                    let defaultsfinalavlue = UserDefaults.standard
                    defaultsfinalavlue.set(valuefinal, forKey:"Myvaluefinal")
                    defaultsfinalavlue.synchronize()
                }
                
                
                
                
                if self.Today_quantity.count > 9
                {
                    self.topviewfinal.isHidden = false
                    self.finalchangecolor.isHidden = true
                    self.mytextfiledcolor.text = self.Today_quantity
                    
                }
                else
                {
                    self.topviewfinal.isHidden = true
                    self.finalchangecolor.isHidden = false
                    self.pickerView.selectRow(Int(self.Today_quantity)!, inComponent: 0, animated: true)
                    self.pickerView.reloadAllComponents()
                }
                
                
                self.particularadd = ""
                self.particularadd = self.TodayProductsid[btntag]
                print(self.particularadd)
                
                
                self.index = 0
                
                self.index = Int(self.Today_quantity)!
                
                
                let defaults = UserDefaults.standard
                defaults.set(self.particularadd, forKey:"Myparticularadd")
                defaults.set("addToday", forKey:"addTodayone")
                defaults.set(self.selectedint, forKey:"index")
                defaults.set(self.selectedint, forKey:"index")
                
                
                defaults.set(Todayproductcalculation, forKey:"Mymoq_calc")
                
                
                defaults.synchronize()
                
                self.Postmethodaddfinalvalue()
           
       
     
    }
    
    @objc func addRecomendedUserQnty(sender: UIButton)
    {

                self.Todayvalue = ""
                
                self.Todayvalue = "Recomendedvalue"
                self.selectedint = nil
                
                let btntag = sender.tag
                self.selectedint  = btntag
                self.recomInstock = self.RecomendedavailableQnty[btntag]
                self.minimuminstacklabel.text = "\(self.recomInstock) Instock"
                self.myinstacklabeltwo.text = "\(self.recomInstock) Instock"
                
                let valuefinal = "\(self.recomInstock) Instock"
                
                if valuefinal.count > 0
                {
                    self.minimuminstacklabel.text = valuefinal
                    
                    self.myinstacklabeltwo.text = valuefinal
                    
                    
                    let defaultsfinalavlue = UserDefaults.standard
                    defaultsfinalavlue.set(valuefinal, forKey:"Myvaluefinal")
                    defaultsfinalavlue.synchronize()
                }
                
                
                
                
                let final =  self.RecomendedMoQCal[btntag]
                
                self.singquantitylabel.text = "\(final) X"
                
                self.Today_quantity = ""
                self.Today_quantity = self.RecomendedSellerID[btntag]
                
                
                let Todayproductcalculation  = self.TodaydealMoQCal[btntag]
                
                
                
                
                self.anotherquntitylabel.text = Today_quantity
                
                
                if self.Today_quantity.count > 9
                {
                    self.topviewfinal.isHidden = false
                    self.finalchangecolor.isHidden = true
                    self.mytextfiledcolor.text = self.Today_quantity
                    
                }
                else
                {
                    self.pickerView.selectRow(Int(self.Today_quantity)!, inComponent: 0, animated: true)
                    self.pickerView.reloadAllComponents()
                    
                }
                self.particularadd = ""
                self.particularadd = self.RecomendedProductId[btntag]
                let defaults = UserDefaults.standard
                self.index = 0
                self.index = Int(self.Today_quantity)!
                
                defaults.set(self.particularadd, forKey:"Myparticularadd")
                defaults.set("addRecomended", forKey:"addRecomendedtwo")
                defaults.set( self.selectedint , forKey:"index")
                
                defaults.set(final, forKey:"Mymoq_calc")
                
                defaults.synchronize()
                self.Postmethodaddfinalvalue()
        
    }
    @objc func addTrendingUserQnty(sender: UIButton)
    {
               self.Todayvalue = ""
                self.Todayvalue = "Trendingvalue"
                self.selectedint = nil
                let btntag = sender.tag
                self.selectedint  = btntag
                self.trendInStock = self.TrendingavailableQnty[btntag]
                let valuefinal = "\(self.trendInStock) Instock"
                if valuefinal.count > 0
                {
                    self.minimuminstacklabel.text = valuefinal
                    self.myinstacklabeltwo.text = valuefinal
                    let defaultsfinalavlue = UserDefaults.standard
                    defaultsfinalavlue.set(valuefinal, forKey:"Myvaluefinal")
                    defaultsfinalavlue.synchronize()
                }
                let value = self.TrendingMoQCal[btntag]
                self.singquantitylabel.text = "\(value) X"
                self.Today_quantity = ""
                self.Today_quantity = self.TrendingSellerID[btntag]
                self.anotherquntitylabel.text = Today_quantity
                
                if self.Today_quantity.count > 9
                {
                    self.topviewfinal.isHidden = false
                    self.finalchangecolor.isHidden = true
                    self.mytextfiledcolor.text = self.Today_quantity
                }
                else
                {
                    self.pickerView.selectRow(Int(self.Today_quantity)!, inComponent: 0, animated: true)
                    self.pickerView.reloadAllComponents()
                }
                self.particularadd = ""
                self.particularadd = self.Trendingproductidvalue[btntag]
                self.index = 0
                self.index = Int(self.Today_quantity)!
                let defaults = UserDefaults.standard
                defaults.set("addTrendingUser", forKey:"addTrendingUsertwo")
                defaults.set( self.selectedint , forKey:"index")
                defaults.set(value, forKey:"Mymoq_calc")
                defaults.synchronize()
                self.Postmethodaddfinalvalue()
            }
    @objc func addNewProductListUserQnty(sender: UIButton)
    {
    
                self.Todayvalue = ""
                self.Todayvalue = "NewproductListvalue"
                self.selectedint = nil
                let btntag = sender.tag
                self.selectedint  = btntag
                self.newProductInstock = self.NewproductavailQnty[btntag]
                self.minimuminstacklabel.text = "\(self.newProductInstock) Instock"
                self.myinstacklabeltwo.text = "\(self.newProductInstock) Instock"
                
                
                
                let valuefinal = "\(self.newProductInstock) Instock"
                
                if valuefinal.count > 0
                {
                    self.minimuminstacklabel.text = valuefinal
                    
                    self.myinstacklabeltwo.text = valuefinal
                    
                    let defaultsfinalavlue = UserDefaults.standard
                    defaultsfinalavlue.set(valuefinal, forKey:"Myvaluefinal")
                    defaultsfinalavlue.synchronize()
                }
                
                let NewproductMoQCalfinalavlue = self.NewproductMoQCal[btntag]
                
                self.singquantitylabel.text = "\(NewproductMoQCalfinalavlue) X"
                
                self.Today_quantity = ""
                self.Today_quantity = self.NewproductSellerID[btntag]
                
                self.anotherquntitylabel.text = Today_quantity
                
                if self.Today_quantity.count > 9
                {
                    self.topviewfinal.isHidden = false
                    self.finalchangecolor.isHidden = true
                    self.mytextfiledcolor.text = self.Today_quantity
                    
                }
                else
                {
                    self.pickerView.selectRow(Int(self.Today_quantity)!, inComponent: 0, animated: true)
                    self.pickerView.reloadAllComponents()
                    
                }
                
                
                self.particularadd = ""
                self.particularadd = self.Newproductidvalue[btntag]
                print(self.particularadd)
                
                
                let defaults = UserDefaults.standard
                defaults.set(self.particularadd, forKey:"Myparticularadd")
                defaults.synchronize()
                
                self.index = 0
                self.index = Int(self.Today_quantity)!
                defaults.set("addNewProductListUser", forKey:"addNewProductListUsertwo")
                //        defaults.set(self.index, forKey:"index")
                defaults.set( self.selectedint , forKey:"index")
                
                defaults.set(NewproductMoQCalfinalavlue, forKey:"Mymoq_calc")
                defaults.synchronize()
                
                
                self.Postmethodaddfinalvalue()
        
    }
    @objc func addFrequentUserQnty(sender: UIButton)
    {
   
                self.Todayvalue = ""
                self.Todayvalue = "FrequentlyproductListvalue"
                self.selectedint = nil
                let btntag = sender.tag
                self.selectedint  = btntag
                self.frequentInstock = self.freNewproductavailQnty[btntag]
                self.minimuminstacklabel.text = "\(self.frequentInstock) Instock"
                self.myinstacklabeltwo.text = "\(self.frequentInstock) Instock"
                
                
                
                let valuefinal = "\(self.frequentInstock) Instock"
                
                if valuefinal.count > 0
                {
                    self.minimuminstacklabel.text = valuefinal
                    self.myinstacklabeltwo.text = valuefinal
                    
                    let defaultsfinalavlue = UserDefaults.standard
                    defaultsfinalavlue.set(valuefinal, forKey:"Myvaluefinal")
                    defaultsfinalavlue.synchronize()
                }
                
                
                let frequentlymoq  = self.freNewproductMoQCal[btntag]
                
                self.singquantitylabel.text = "\(frequentlymoq) X"
                
                self.Today_quantity = ""
                self.Today_quantity = self.freNewproductavailQnty[btntag]
                self.anotherquntitylabel.text = self.Today_quantity
                
                if self.Today_quantity.count > 9
                {
                    self.topviewfinal.isHidden = false
                    self.finalchangecolor.isHidden = true
                    self.mytextfiledcolor.text = self.Today_quantity
                    
                }
                else
                {
                    self.pickerView.selectRow(Int(self.Today_quantity)!, inComponent: 0, animated: true)
                    self.pickerView.reloadAllComponents()
                    
                }
                self.particularadd = ""
                self.particularadd = self.freNewproductidvalue[btntag]
                print(self.particularadd)
                self.index = 0
                self.index = Int(self.Today_quantity)!
                let defaults = UserDefaults.standard
                defaults.set(self.particularadd, forKey:"Myparticularadd")
                
                defaults.set("addFrequentUserQnty", forKey:"MyaddFrequentUserQnty")
                defaults.set( self.selectedint , forKey:"index")
                defaults.synchronize()
                
                defaults.set(frequentlymoq, forKey:"Mymoq_calc")
                self.Postmethodaddfinalvalue()
    }
    
    @objc func addBrandFavAction(sender: UIButton)
    {
  
                self.Todayvalue = ""
                self.Todayvalue = "BrandproductListvalue"
                let btntag = sender.tag
                self.selectedint = nil
                self.selectedint  = btntag
                
                self.frequentInstock = self.SecondNewavailable_qtybrand[btntag]
                self.minimuminstacklabel.text = "\(self.frequentInstock) Instock"
                
                self.myinstacklabeltwo.text =  "\(self.frequentInstock) Instock"
                
                let valuefinal = "\(self.frequentInstock) Instock"
                
                if valuefinal.count > 0
                {
                    self.minimuminstacklabel.text = valuefinal
                    self.myinstacklabeltwo.text = valuefinal
                    
                    let defaultsfinalavlue = UserDefaults.standard
                    defaultsfinalavlue.set(valuefinal, forKey:"Myvaluefinal")
                    defaultsfinalavlue.synchronize()
                }
                
                
                
                let frequentlymoq = self.BrandMOquantity[btntag]
                self.singquantitylabel.text = "\(frequentlymoq)X"
                if self.SecondAvailabelQuantity[btntag] == "0" {
                    anotherquntitylabel.text = "\(self.modelData[1])"
                    self.pickerView.selectRow(1, inComponent: 0, animated: true)
                    
                }else{
                    anotherquntitylabel.text = self.SecondAvailabelQuantity[btntag]
                    let invalue = Int(self.SecondAvailabelQuantity[btntag])
                    self.pickerView.selectRow(invalue!, inComponent: 0, animated: true)
                    self.pickerView.reloadAllComponents()
                    
                }
                
                if self.SecondNewproductsInstack[btntag] == "Out of Stock"
                {
                    self.Maindescrptionpoupview.isHidden = true
                    self.stockOutTitel = self.SecondNEwproductItems[btntag]
                    producidclikHOMEstring = self.SecondProductidValue[btntag]
                    sender.setBackgroundImage(#imageLiteral(resourceName: "notificationfinalvalue"), for:.normal)
                    self.stockOutOrderValue()
                }
                self.adpopupscroolview.isHidden = false
                self.topviewfinal.isHidden = true
                self.finalchangecolor.isHidden = false
                let bottomSheet = JXBottomSheetView(contentView:self.adpopupscroolview as! UIScrollView)
                bottomSheet.defaultMaxinumDisplayHeight = self.view.frame.size.height
                //bottomSheet.defaultMininumDisplayHeight = 240
                bottomSheet.displayState = .maxDisplay
                bottomSheet.frame = self.view.bounds
                self.view.addSubview(bottomSheet)
                
                self.particularadd = ""
                self.particularadd = self.SecondProductidValue[btntag]
                let defaults = UserDefaults.standard
                defaults.set(self.particularadd, forKey:"Myparticularadd")
                defaults.set("addBrand", forKey:"addBrandthree")
                defaults.set( self.selectedint , forKey:"index")
                defaults.set(frequentlymoq, forKey:"Mymoq_calc")
                defaults.synchronize()
                print(self.particularadd)
                self.Postmethodaddfinalvalue()
    }
    @objc func addCategFavAction(sender: UIButton)
    {
                self.Todayvalue = ""
                self.Todayvalue = "catageoryproductListvalue"
                let btntag = sender.tag
                self.selectedint = nil
                self.selectedint  = btntag
                self.frequentInstock = self.SecondNewavailable_qtybrand[btntag]
                self.minimuminstacklabel.text = "\(self.frequentInstock) Instock"
                self.myinstacklabeltwo.text =  "\(self.frequentInstock) Instock"
                let valuefinal = "\(self.frequentInstock) Instock"
                if valuefinal.count > 0
                {
                    self.minimuminstacklabel.text = valuefinal
                    self.myinstacklabeltwo.text = valuefinal
                    let defaultsfinalavlue = UserDefaults.standard
                    defaultsfinalavlue.set(valuefinal, forKey:"Myvaluefinal")
                    defaultsfinalavlue.synchronize()
                }
                let frequentlymoq = self.BrandMOquantity[btntag]
                self.singquantitylabel.text = "\(frequentlymoq)X"
                if self.SecondAvailabelQuantity[btntag] == "0"
                {
                    anotherquntitylabel.text = "\(self.modelData[1])"
                    self.pickerView.selectRow(1, inComponent: 0, animated: true)
                }
                else
                {
                    anotherquntitylabel.text = self.SecondAvailabelQuantity[btntag]
                    let invalue = Int(self.SecondAvailabelQuantity[btntag])
                    self.pickerView.selectRow(invalue!, inComponent: 0, animated: true)
                    self.pickerView.reloadAllComponents()
                    
                }
                if self.SecondNewproductsInstack[btntag] == "Out of Stock" {
                    self.Maindescrptionpoupview.isHidden = true
                    self.stockOutTitel = self.SecondNEwproductItems[btntag]
                    producidclikHOMEstring = self.SecondProductidValue[btntag]
                    sender.setBackgroundImage(#imageLiteral(resourceName: "notificationfinalvalue"), for:.normal)
                    
                    self.stockOutOrderValue()
                }
                self.adpopupscroolview.isHidden = false
                self.topviewfinal.isHidden = true
                self.finalchangecolor.isHidden = false
                
                let bottomSheet = JXBottomSheetView(contentView:self.adpopupscroolview as! UIScrollView)
                bottomSheet.defaultMaxinumDisplayHeight = self.view.frame.size.height
                bottomSheet.displayState = .maxDisplay
                bottomSheet.frame = self.view.bounds
                self.view.addSubview(bottomSheet)
        
                self.particularadd = ""
                self.particularadd = self.SecondProductidValue[btntag]
                print(self.particularadd)
                let defaults = UserDefaults.standard
                defaults.set(self.particularadd, forKey:"Myparticularadd")
                defaults.set("addCategFav", forKey:"addCategFavfinal")
                defaults.set(self.selectedint , forKey:"index")
                
                defaults.set(frequentlymoq, forKey:"Mymoq_calc")
                
                defaults.synchronize()
                
                if self.Today_quantity.count > 9
                {
                    self.topviewfinal.isHidden = false
                    self.finalchangecolor.isHidden = true
                    self.mytextfiledcolor.text = self.Today_quantity
                    
                }
                else
                {
                    self.pickerView.selectRow(Int(self.Today_quantity)!, inComponent: 0, animated: true)
                }
                self.Postmethodaddfinalvalue()
    }
    @objc func addFavAllAction(sender: UIButton)
    {
                self.Todayvalue = ""
                
                self.Todayvalue = "addfavouriteListvalue"
                
                let btntag = sender.tag
                
                self.selectedint = nil
                self.selectedint  = btntag
                
                print(self.favSecondavalQnty)
                print(btntag)
                print(self.favSecondavalQnty[btntag])
                
                self.frequentInstock = self.favSecondavalQnty[btntag]
                self.minimuminstacklabel.text = "\(self.frequentInstock) Instock"
                self.myinstacklabeltwo.text = "\(self.frequentInstock) Instock"
                
                
                let valuefinal = "\(self.frequentInstock) Instock"
                
                if valuefinal.count > 0
                {
                    self.minimuminstacklabel.text = valuefinal
                    self.myinstacklabeltwo.text = valuefinal
                    
                    let defaultsfinalavlue = UserDefaults.standard
                    defaultsfinalavlue.set(valuefinal, forKey:"Myvaluefinal")
                    defaultsfinalavlue.synchronize()
                }
                
                
                let frequentlymoq = self.favSecondMoqCal[btntag]
                self.singquantitylabel.text = "\(frequentlymoq)X"
                if self.favSecondAvailabelQuantity[btntag] == "0" {
                    anotherquntitylabel.text = "\(self.modelData[1])"
                    self.pickerView.selectRow(1, inComponent: 0, animated: true)
                    self.pickerView.reloadAllComponents()
                    
                    
                }else{
                    anotherquntitylabel.text = self.favSecondAvailabelQuantity[btntag]
                    let invalue = Int(self.favSecondAvailabelQuantity[btntag])
                    self.pickerView.selectRow(invalue!, inComponent: 0, animated: true)
                }
                
                if self.favSecondNewproductsInstack[btntag] == "Out of Stock" {
                    self.Maindescrptionpoupview.isHidden = true
                    self.stockOutTitel = self.favSecondNEwproductItems[btntag]
                    producidclikHOMEstring = self.favSecondProductidValue[btntag]
                    sender.setBackgroundImage(#imageLiteral(resourceName: "notificationfinalvalue"), for:.normal)
                    
                    self.stockOutOrderValue()
                }
                
                self.adpopupscroolview.isHidden = false
                self.topviewfinal.isHidden = true
                self.finalchangecolor.isHidden = false
                
                self.particularadd = ""
                self.particularadd = self.favSecondProductidValue[btntag]
                print(self.particularadd)
                let defaults = UserDefaults.standard
                defaults.set(self.particularadd, forKey:"Myparticularadd")
                defaults.set(self.selectedint , forKey:"index")
                defaults.set(frequentlymoq, forKey:"Mymoq_calc")
                
                defaults.synchronize()
                
                if self.Today_quantity.count > 9
                {
                    self.topviewfinal.isHidden = false
                    self.finalchangecolor.isHidden = true
                    self.mytextfiledcolor.text = self.Today_quantity
                    
                }
                else
                {
                    self.pickerView.selectRow(Int(self.Today_quantity)!, inComponent: 0, animated: true)
                    self.pickerView.reloadAllComponents()
                    
                }
                self.Postmethodaddfinalvalue()

    }
    @objc func addFavTrendingAction(sender: UIButton)
    {
                self.Todayvalue = ""
                self.Todayvalue = "addTrendingListvalue"
                let btntag = sender.tag
                self.selectedint = nil
                self.selectedint  = btntag
                
                self.frequentInstock = self.favtwoSecondavalQnty[btntag]
                self.minimuminstacklabel.text = "\(self.frequentInstock) Instock"
                
                self.myinstacklabeltwo.text = "\(self.frequentInstock) Instock"
                
                
                let valuefinal = "\(self.frequentInstock) Instock"
                
                if valuefinal.count > 0
                {
                    self.minimuminstacklabel.text = valuefinal
                    
                    self.myinstacklabeltwo.text = valuefinal
                    
                    let defaultsfinalavlue = UserDefaults.standard
                    defaultsfinalavlue.set(valuefinal, forKey:"Myvaluefinal")
                    defaultsfinalavlue.synchronize()
                }
                
                
                
                let frequentlymoq = self.favSecondMoqCal[btntag]
                self.singquantitylabel.text = "\(frequentlymoq)X"
                if self.favSecondAvailabelQuantity[btntag] == "0"
                {
                    anotherquntitylabel.text = "\(self.modelData[1])"
                    self.pickerView.selectRow(1, inComponent: 0, animated: true)
                    self.pickerView.reloadAllComponents()
                    
                }
                else
                {
                    anotherquntitylabel.text = self.favSecondAvailabelQuantity[btntag]
                    let invalue = Int(self.favSecondAvailabelQuantity[btntag])
                    self.pickerView.selectRow(invalue!, inComponent: 0, animated: true)
                    self.pickerView.reloadAllComponents()
                    
                }
                if self.favtwoSecondNewproductsInstack[btntag] == "Out of Stock" {
                    self.Maindescrptionpoupview.isHidden = true
                    self.stockOutTitel = self.favtwoSecondNEwproductItems[btntag]
                    producidclikHOMEstring = self.favtwoSecondProductidValue[btntag]
                    sender.setBackgroundImage(#imageLiteral(resourceName: "notificationfinalvalue"), for:.normal)
                    
                    self.stockOutOrderValue()
                }
                
                
                self.adpopupscroolview.isHidden = false
                self.topviewfinal.isHidden = true
                self.finalchangecolor.isHidden = false
                
                self.particularadd = ""
                
                print(self.favtwoSecondProductidValue)
                self.particularadd = self.favtwoSecondProductidValue[btntag]
                print(self.particularadd)
                let defaults = UserDefaults.standard
                defaults.set(self.particularadd, forKey:"Myparticularadd")
                defaults.set( self.selectedint , forKey:"index")
                defaults.set(frequentlymoq, forKey:"Mymoq_calc")
                
                defaults.synchronize()
                
                if self.Today_quantity.count > 9
                {
                    self.topviewfinal.isHidden = false
                    self.finalchangecolor.isHidden = true
                    self.mytextfiledcolor.text = self.Today_quantity
                }
                else
                {
                    self.pickerView.selectRow(Int(self.Today_quantity)!, inComponent: 0, animated: true)
                    self.pickerView.reloadAllComponents()
                }
                self.Postmethodaddfinalvalue()
    }
    
    func stockOutOrderValue()
    {
        
        let defaulst = UserDefaults.standard
        
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "myuseridvaluefinal")as?String
        {
            self.useridbiling = Reviewfinaluseroid
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
        let postString = String(format: "method=%@&ActorId=%@&prodId=%@&flag=%@","RestockAlertMe",self.useridbiling,self.producidclikHOMEstring,"1")
        
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
                    
                    let bottomSheettwo = JXBottomSheetView(contentView:(self.adpopupscroolview)!)
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
    @IBAction func addtoanotherQuantityfinalvalue(_ sender: UIButton)
    {

        self.adpopupscroolview.isHidden  = true
        let bottomSheet = JXBottomSheetView(contentView:self.adpopupscroolview as! UIScrollView)
        bottomSheet.defaultMaxinumDisplayHeight  =  0
        bottomSheet.defaultMininumDisplayHeight = 0
        bottomSheet.displayState = .maxDisplay
        bottomSheet.frame = self.view.bounds
        self.view.addSubview(bottomSheet)
        
        if self.Todayvalue == "Todayvalue"
        {
            DispatchQueue.main.async
                {
                self.addtoanotherquantitylabel()
              }
        }
        
        if self.Todayvalue == "Recomendedvalue"
        {
            DispatchQueue.main.async
                {
                    self.addtoanotherquantitylabel()
            }
        }
        if self.Todayvalue == "Trendingvalue"
        {
            DispatchQueue.main.async
                {
                    self.addtoanotherquantitylabel()
            }
        }
        if self.Todayvalue == "NewproductListvalue"
        {
            DispatchQueue.main.async
                {
                    self.addtoanotherquantitylabel()
            }
        }
        if self.Todayvalue == "FrequentlyproductListvalue"
        {
            DispatchQueue.main.async
                {
                    self.addtoanotherquantitylabel()
            }
        }
      
        if self.Todayvalue == "BrandproductListvalue"
        {
            DispatchQueue.main.async
                {
                    self.addtoanotherquantitylabel()
            }
        }
     
        if self.Todayvalue == "catageoryproductListvalue"
        {
            DispatchQueue.main.async
                {
                    self.addtoanotherquantitylabel()
            }
        }
     
        if self.Todayvalue == "addfavouriteListvalue"
        {
            DispatchQueue.main.async
                {
                    self.addtoanotherquantitylabel()
            }
        }
 
        if self.Todayvalue == "addTrendingListvalue"
        {
            DispatchQueue.main.async
                {
                    self.addtoanotherquantitylabel()
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
        let defaulst = UserDefaults.standard

        if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
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
            else
            {
                let arrayvalue = NSString(format:"%@%@-%@-%@","[",particularadd,self.Today_quantity,"]")
                print(arrayvalue)
                postStringfinalvalue =  String(format: "method=%@&idProductInfo=%@&userid=%@&sellerId=%@&schemeId=%@&bulkId=%@","AddToCartDynamic",arrayvalue,Homeuseridstringvalue,"1","","")
                print(postStringfinalvalue)
            }
            
        }
        else{
            let arrayvalue = NSString(format:"%@%@-%@-%@","[",particularadd,self.Today_quantity,"]")
            print(arrayvalue)
            print(Homeuseridstringvalue)
            print(self.sold_filledbyseller_idarray)
            if self.sold_filledbyseller_idarray.count > 0
            {
                postStringfinalvalue =  String(format: "method=%@&idProductInfo=%@&userid=%@&sellerId=%@&schemeId=%@&bulkId=%@","AddToCartDynamic",arrayvalue,Homeuseridstringvalue,self.sold_filledbyseller_idarray[0],"","")
                print(postStringfinalvalue)
            }
            else{
                postStringfinalvalue =  String(format: "method=%@&idProductInfo=%@&userid=%@&sellerId=%@&schemeId=%@&bulkId=%@","AddToCartDynamic",arrayvalue,Homeuseridstringvalue,"1","","")
                print(postStringfinalvalue)
            }
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
                        self.cart_Countvalue = cart_Countvaluefinal
                        self.Mycart.isHidden = false
                        self.Mycart.layer.cornerRadius = self.Mycart.layer.frame.size.width/2
                        self.Mycart.layer.masksToBounds = true
                        self.Mycart.text =   self.cart_Countvalue.stringValue
                    }
                    if let user_updatevaluefinal:String = dict.value(forKey: "user_qty") as? String
                    {
                        self.user_updatevalue = user_updatevaluefinal
                        print(self.selectedint)
//                let cell = Homecollectionview.cellForRowAtIndexPath(NSIndexPath(forRow: self.selectedint, inSection: 0)) as! HomeCollectionViewCell
//                        print(self.index)
//
//                        var visibleRect = CGRect()
//
//                        visibleRect.origin = self.Homecollectionview.contentOffset
//                        visibleRect.size = self.Homecollectionview.bounds.size
//                        let visiblePoint = CGPoint(x: visibleRect.midX,   y: visibleRect.midY)
//                        guard let indexPath = self.Homecollectionview.indexPathForItem(at:visiblePoint) else { return }
////                        print(indexPath)
//             self.VisibleIndexquntity = indexPath
                        
               
                 self.VisibleIndexquntity = IndexPath(row: self.selectedint!, section: 0)

                       print(self.VisibleIndexquntity)

                        if self.Todayvalue == "Todayvalue"
                        {
                            for i in 0..<self.TodaydealSellerID.count {
                                let add = self.TodaydealSellerID[i]
                                if i == self.selectedint {
                                    self.TodaydealSellerID[i] =  self.user_updatevalue
                                }
                            }
                            
                            self.Homecollectionview.reloadData()

                        }
                        if self.Todayvalue == "Recomendedvalue"
                        {
                            for i in 0..<self.RecomendedSellerID.count {
                                let add = self.RecomendedSellerID[i]
                                if i == self.selectedint {
                                    self.RecomendedSellerID[i] =  self.user_updatevalue
                                }
                            }
                            
                            self.Recomendedcollectionview.reloadData()
                            
                        }
                        if self.Todayvalue == "Trendingvalue"
                        {
                            for i in 0..<self.TrendingSellerID.count {
                                let add = self.TrendingSellerID[i]
                                if i == self.selectedint {
                                   self.TrendingSellerID[i] =  self.user_updatevalue
                                }
                            }
                         
                            self.Trendingproductcollectionview.reloadData()
                            
                        }
                        if self.Todayvalue == "NewproductListvalue"
                        {
                            for i in 0..<self.NewproductSellerID.count {
                                let add = self.NewproductSellerID[i]
                                if i == self.selectedint {
                                    self.NewproductSellerID[i] =  self.user_updatevalue
                                }
                            }
                            
                            self.Newproductcollectionview.reloadData()
                            
                        }
                        if self.Todayvalue == "FrequentlyproductListvalue"
                        {
                            for i in 0..<self.freNewproductSellerID.count {
                                let add = self.freNewproductSellerID[i]
                                if i == self.selectedint {
                                    self.freNewproductSellerID[i] =  self.user_updatevalue
                                }
                            }
                            self.Topproductcolectionview.reloadData()
                        }
                        
                        if self.Todayvalue == "BrandproductListvalue"
                        {
                            print(self.SecondAvailabelQuantity)
                            
                            for i in 0..<self.SecondAvailabelQuantity.count {
                                let add = self.SecondAvailabelQuantity[i]
                                if i == self.selectedint {
                                    self.SecondAvailabelQuantity[i] =  self.user_updatevalue
                                }
                            }
                            self.NewBrandtabelview.reloadData()
                            
                        }
                        if self.Todayvalue == "catageoryproductListvalue"
                        {
                            for i in 0..<self.SecondAvailabelQuantity.count {
                                let add = self.SecondAvailabelQuantity[i]
                                if i == self.selectedint {
                                    self.SecondAvailabelQuantity[i] =  self.user_updatevalue
                                }
                            }
                            self.Newcattabelview.reloadData()
                        }
                        if self.Todayvalue == "addfavouriteListvalue"
                        {
                            for i in 0..<self.favSecondavalQnty.count {
                                let add = self.favSecondavalQnty[i]
                                if i == self.selectedint {
                                    self.favSecondavalQnty[i] =  self.user_updatevalue
                                }
                            }
                            self.favouritetabelview.reloadData()
                        }
                        if self.Todayvalue == "addTrendingListvalue"
                        {
                            for i in 0..<self.favtwoSecondAvailabelQuantity.count {
                                let add = self.favtwoSecondAvailabelQuantity[i]
                                if i == self.selectedint {
                                    self.favtwoSecondAvailabelQuantity[i] =  self.user_updatevalue
                                }
                            }
                            self.favouritetabelviewtwo.reloadData()
                        }
                    DispatchQueue.main.async
                        {
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

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {

        let defaults = UserDefaults.standard
        if let MyKycpendingfinalavlue:String = defaults.value(forKey:"isverystring")as?String
        {
            if MyKycpendingfinalavlue == "1"
            {
                self.singelbutton.isHidden = true
                if collectionView == Homecollectionview
                {
                    let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"ProductDescriptionViewController")as!ProductDescriptionViewController
                    viewfinal.productdemoidfinalvalue = self.TodayProductsid[indexPath.item]
                    
                    self.present(viewfinal, animated: true, completion:nil)
                }
                else if collectionView == Recomendedcollectionview
                {
                    let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"ProductDescriptionViewController")as!ProductDescriptionViewController
                    viewfinal.productdemoidfinalvalue = self.RecomendedProductId[indexPath.item]
                    self.present(viewfinal, animated: true, completion:nil)
                }
                else if collectionView == Trendingproductcollectionview
                {
                    let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"ProductDescriptionViewController")as!ProductDescriptionViewController
                    //viewfinal.demoimagefinalvalue = self.Brandtaeblviewiamgeview
                    viewfinal.productdemoidfinalvalue = self.Trendingproductidvalue[indexPath.item]
                    
                    self.present(viewfinal, animated: true, completion:nil)
                }
                else if collectionView == Newproductcollectionview
                {
                    let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"ProductDescriptionViewController")as!ProductDescriptionViewController
                    viewfinal.productdemoidfinalvalue = self.Newproductidvalue[indexPath.item]
                    self.present(viewfinal, animated: true, completion:nil)
                }
                else if collectionView == Topproductcolectionview
                {
                    let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"ProductDescriptionViewController")as!ProductDescriptionViewController
                    viewfinal.productdemoidfinalvalue = self.freNewproductidvalue[indexPath.item]
                    
                    self.present(viewfinal, animated: true, completion:nil)
                }
                else if collectionView == CatExplorebrandscollectionview
                {
                    self.deafultsBrandvalueStringfinalnewcat = ""
                
                    deafultscatageoryvalueStringfinalnewcat  = ""
                    
                    selectedIndex = nil
                    if clickedCatageorystring == "clickedcaatgeoryvalue"
                    {
                        self.clickedbrandstring = ""
                        self.Bydefaultsvalueis = ""
                        self.clickedCatageorystring = ""
                        self.Bydefaultsvalueis = ""
                        self.catageorybuttonvalue = ""
                        self.deafultscatvalueString = ""
                        self.brandbuttonvalue = ""
                        self.deafultsBrandvalueString = ""
                        explorecatageorcliked = "explorecatageorcliked"
                        DefaultBrandexplorebuttonclick = ""
                        DefaultCatageorybuttonclick = ""
                    }
                    if catageorybuttonvalue == "catageorybuttonvalue"
                    {
                        self.clickedbrandstring = ""
                        self.Bydefaultsvalueis = ""
                        self.clickedCatageorystring = ""
                        self.Bydefaultsvalueis = ""
                        self.catageorybuttonvalue = ""
                        self.deafultscatvalueString = ""
                        self.brandbuttonvalue = ""
                        self.deafultsBrandvalueString = ""
                        explorecatageorcliked = "explorecatageorcliked"
                        DefaultBrandexplorebuttonclick = ""
                        DefaultCatageorybuttonclick = ""
                        
                    }
       
                    exploreBrandsidsingelstring = self.Explorecatageoryidstring[indexPath.row]
                    
                    BrandexploreclkedTotal = self.Explorecatageoryidstring[indexPath.row]
                    
                    print(BrandexploreclkedTotal)
                    
                    print(exploreBrandsidsingelstring)
                    self.TopBasedonBrandidvalue()
                    
                    
                    let RecomendedExplorebrandsvalueis = self.Explorecatageoryiamge[indexPath.item]
                    cartimage.sd_setImage(with: URL(string:RecomendedExplorebrandsvalueis), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
                    
                    cartlabelfinalvalue.text = self.ExplorecatgeoryName[indexPath.row]
                    
                    if Brnadsingel == "Brnadsingel"
                    {
                        Toplabelvaluechanged.text = self.ExplorecatgeoryName[indexPath.row]
                    }
                }
                else if collectionView == Explorebrandscollectionview
                {
                    
                    
                    self.deafultsBrandvalueStringfinalnewcat = ""
                    
                    /// today addingmethod
                    deafultscatageoryvalueStringfinalnewcat  = ""
                    selectedIndex = nil
                    if clickedbrandstring == "samplebrandcollectionview"
                    {
                        self.clickedbrandstring = ""
                        self.Bydefaultsvalueis = ""
                        self.clickedCatageorystring = ""
                        self.Bydefaultsvalueis = ""
                        self.catageorybuttonvalue = ""
                        self.deafultscatvalueString = ""
                        self.brandbuttonvalue = ""
                        self.deafultsBrandvalueString = ""
                        exploreBrnadscliked = "exploreBrnadscliked"
                    }
                    
                    if brandbuttonvalue == "brandbuttonvalue"
                    {
                        self.clickedbrandstring = ""
                        self.Bydefaultsvalueis = ""
                        self.clickedCatageorystring = ""
                        self.Bydefaultsvalueis = ""
                        self.catageorybuttonvalue = ""
                        self.deafultscatvalueString = ""
                        self.brandbuttonvalue = ""
                        self.deafultsBrandvalueString = ""
                        exploreBrnadscliked = "exploreBrnadscliked"
                        
                    }
              
                    self.explorecatageoryidsingelstring = self.exploreBrandsidpatharry[indexPath.item]
                   
                    let RecomendedExplorebrandsfinalvalue = self.exploreBrandsImagepatharry[indexPath.item]
                    snackdemo.sd_setImage(with: URL(string:RecomendedExplorebrandsfinalvalue), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
                    self.TopBasedonBrandidvalue()
                    brandlabelfinalvalue.text = self.exploreBrandsNamearry[indexPath.item]
                    
                    if catsingel == "catsingel"
                    {
                        Toplabelvaluechanged.text = self.exploreBrandsNamearry[indexPath.row]
                        
                    }

                }
                else if collectionView == TopBrandcollectionview
                {
                    Brandsscrollview.contentOffset = .zero
                    
                    deafultscatageoryvalueStringfinalnewcat  = ""
                    
                    self.deafultsBrandvalueStringfinalnewcat = ""
                    
                    selectedIndex = nil
                    TotalTopBrandsValue = "24"
                    brandbuttonvalue = ""
                    catageorybuttonvalue = ""
                    clickedCatageorystring = ""
                    explorecatageorcliked = ""
                    exploreBrnadscliked = ""
                    
                    print(self.TopBrandimage)
                    clickedbrandstring = "samplebrandcollectionview"
                    let TopProductcollectiontwo = self.TopBrandimage[indexPath.item]
                    snackdemo.sd_setImage(with: URL(string:TopProductcollectiontwo), placeholderImage: UIImage(named:"AppIcon"))
                    TopBrandidSingelvalue = self.TopBrandidvalue[indexPath.row]
                    print(TopBrandidSingelvalue)
                    //             self.TopBrandidvalue
                    self.Explorebrandscollectionview.reloadData()
                    self.NewBrandtabelview.reloadData()
                    DispatchQueue.main.async {
                        self.TopBasedonBrandidvalue()
                    }
                    self.ExploreBrands.text = "Explore Brands"
               
                    catageorytwo.tag = 0
                    catageoryone.tag = 0
                    popupscrollview.slideInFromLeft()
                    popupscrollview.dropShadow1()
                    Brnads.setBackgroundImage(#imageLiteral(resourceName: "Brandselectedred"), for: .normal)
                    Brandstwo.setTitleColor(UIColor.red, for: .normal)
                    Hometwo.setBackgroundImage(#imageLiteral(resourceName: "home_grey"), for: .normal)
                    Homeone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                    catageorytwo.setBackgroundImage(#imageLiteral(resourceName: "catageory"), for: .normal)
                    catageoryone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                    favourite.setBackgroundImage(#imageLiteral(resourceName: "favourite"), for: .normal)
                    fsvouritetwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                    self.cadburry.text = "Cadburry"
                    thiredview.isHidden =  false
                    secondview.isHidden = false
                    ANIMATIONVIEW.slideInFromLefttwo()
                    ANIMATIONVIEW.dropShadow1()
                    
                    if Brnads.tag == 0
                    {
                        let bottomSheet = JXBottomSheetView(contentView:popupscrollview as! UIScrollView)
                        bottomSheet.defaultMininumDisplayHeight = 120
                        bottomSheet.defaultMaxinumDisplayHeight = 240
                        bottomSheet.displayState = .maxDisplay
                        bottomSheet.frame = self.view.bounds
                        demoview.addSubview(bottomSheet)
                        
                        Brnads.tag = 1
                        
                    }
                        
                    else if Brnads.tag == 1{
                        let bottomSheet = JXBottomSheetView(contentView:popupscrollview as! UIScrollView)
                        bottomSheet.defaultMininumDisplayHeight = 120
                        bottomSheet.defaultMaxinumDisplayHeight = 240
                        bottomSheet.displayState = .minDisplay
                        bottomSheet.frame = self.view.bounds
                        demoview.addSubview(bottomSheet)
                        Brnads.tag = 0
                    }
                    scrollPager.setSelectedIndex(index:2, animated: true)
                    self.TopBasedonBrandidvalue()
                    
                    print(self.TopcatageoryItemsfinal)
                    brandlabelfinalvalue.text = self.TopBrandName[indexPath.item]
                    
                    
                }
                else if collectionView == topcatageorycollectionview
                {
                    self.catscroollview.contentOffset = .zero
                    // Today addingmethod
                    deafultscatageoryvalueStringfinalnewcat  = ""
                    self.deafultsBrandvalueStringfinalnewcat = ""
                    selectedIndex = nil
                    clickedCatageorystring = "clickedcaatgeoryvalue"
                    self.Bydefaultsvalueis = ""
                    brandbuttonvalue = ""
                    catageorybuttonvalue = ""
                    clickedbrandstring = ""
                    TotalTopcatageoryValue = "25"
                    clickedbrandstring = ""
                    explorecatageorcliked = ""
                    exploreBrnadscliked = ""
                    self.CatExplorebrandscollectionview.reloadData()
                    let topcatageorysingelvalue = self.Itemimagefinal[indexPath.item]
                    self.cadburry.text = "Snacks"
                    cartimage.sd_setImage(with: URL(string:topcatageorysingelvalue), placeholderImage: UIImage(named:"AppIcon"))
                    if self.view.frame.size.height < 800 {
                        Brandsscrollview.contentInset = UIEdgeInsetsMake(0, 0, self.Brandsscrollview.frame.size.height+115, 0)
                        Brandsscrollview.isScrollEnabled = true
                        Brandsscrollview.showsVerticalScrollIndicator = false
                    }
                    popupscrollview.slideInFromLeft()
                    popupscrollview.dropShadow1()
                    ANIMATIONVIEW.slideInFromLefttwo()
                    ANIMATIONVIEW.dropShadow1()
                    Brnads.tag = 1
                    Brandstwo.tag = 1
                    
                    catageorytwo.setBackgroundImage(#imageLiteral(resourceName: "categories_red"), for: .normal)
                    catageoryone.setTitleColor(UIColor.red, for: .normal)
                    Brnads.setBackgroundImage(#imageLiteral(resourceName: "Barnds"), for: .normal)
                    Brandstwo.setTitleColor(UIColor.bottomnavigationtitile(), for: .normal)
                    Hometwo.setBackgroundImage(#imageLiteral(resourceName: "home_grey"), for: .normal)
                    Homeone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                    favourite.setBackgroundImage(#imageLiteral(resourceName: "catageory"), for: .normal)
                    fsvouritetwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                    favourite.setBackgroundImage(#imageLiteral(resourceName: "favourite"), for: .normal)
                    fsvouritetwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                    self.cadburry.text = "snacks"
                 
                    Moreview.isHidden =  false
                    
                    self.cadburry.text = "snacks"
                    
                    self.ExploreBrands.text = "Explore Categories"
                    if catageorytwo.tag == 0
                    {
                        let bottomSheet = JXBottomSheetView(contentView:popupscrollview as! UIScrollView)
                        bottomSheet.defaultMininumDisplayHeight = 130
                        bottomSheet.defaultMaxinumDisplayHeight = 260
                        bottomSheet.displayState = .maxDisplay
                        bottomSheet.frame = self.view.bounds
                        demoview.addSubview(bottomSheet)
                        catageorytwo.tag = 1
                        
                    }
                        
                    else if catageorytwo.tag == 1{
                        let bottomSheet = JXBottomSheetView(contentView:popupscrollview as! UIScrollView)
                        bottomSheet.defaultMininumDisplayHeight = 130
                        bottomSheet.defaultMaxinumDisplayHeight = 260
                        bottomSheet.displayState = .minDisplay
                        bottomSheet.frame = self.view.bounds
                        demoview.addSubview(bottomSheet)
                        catageorytwo.tag = 0
                    }
                    scrollPager.setSelectedIndex(index:1, animated: true)
                    
                    Topcatageorysingelvalue = self.Topcatageorysingleidvalueis[indexPath.row]
                    
                    
                    print(Topcatageorysingelvalue)
                    
                    
                    self.TopBasedonBrandidvalue()
                    cartlabelfinalvalue.text = self.TopcatageoryItemsfinal[indexPath.item]
                    
                }
                    
                else if collectionView == abcdcollectionview
                {
                    let email = ExploreLettersArray[indexPath.item]
                    print(email)
                    if let letter = email.first {
                        print(letter)
                        FirstLeterManipulation = letter
                    }
                    abcdcollectionview.reloadData()
                    Explorebrandscollectionview.reloadData()
                
                    for index in 0..<self.exploreBrandsNamearry.count{
                        
                        if let letter = (self.exploreBrandsNamearry[index] as! String).first {
                            print(letter)
                            if FirstLeterManipulation == letter{
                                VisibleIndex = IndexPath(row: index, section: 0)
                                Explorebrandscollectionview.scrollToItem(at:VisibleIndex, at: .left, animated: true)
                                return
                            }
                        }
                        
                    }
                    Explorebrandscollectionview.reloadData()
                }
                else if collectionView  == Catabcdcollectionview
                {
                    let email = ExplorecatageoryLettersArray[indexPath.item]
                    print(email)
                    if let letter = email.first {
                        print(letter)
                        FirstLeterManipulationtwo = letter
                    }
                    Catabcdcollectionview.reloadData()
                    CatExplorebrandscollectionview.reloadData()
                    for index in 0..<self.Explorecatageoryarray.count{
                        if let letter = (self.ExplorecatgeoryName[index] as! String).first {
                            print(letter)
                            if FirstLeterManipulationtwo == letter{
                                VisibleIndex = IndexPath(row: index, section: 0)
                                CatExplorebrandscollectionview.scrollToItem(at:VisibleIndex, at: .left, animated: true)
                                return
                            }
                        }
                    }
                    
                    CatExplorebrandscollectionview.reloadData()
                }
                else if collectionView == NewBrandcollectionview
                {
                    deafultscatageoryvalueStringfinalnewcat  = ""
                    
                    
                    if clickedbrandstring == "samplebrandcollectionview"
                    {
                        deafultsBrandvalueString = "deafultsBrand123"
                        deafultscatvalueString = ""
                        clickedCatageorystring = ""
                        self.Bydefaultsvalueis = ""
                        brandbuttonvalue = ""
                        catageorybuttonvalue = ""
                        clickedbrandstring = "samplebrandcollectionview"
                    }
                    if brandbuttonvalue == "brandbuttonvalue"
                    {
                        deafultsBrandvalueString = "brandbuttonvalues"
                        deafultscatvalueString = ""
                        clickedCatageorystring = ""
                        self.Bydefaultsvalueis = ""
                        catageorybuttonvalue = ""
                        clickedbrandstring = ""
                        self.deafultsBrandvalueStringfinalnewcat = "brandbuttonvalues"
                        print(self.deafultsBrandvalueStringfinalnewcat)
                    }
                    else{
                        
                    }
                    selectedIndex = indexPath.item
                    self.NewBrnsidindividual =  self.BrandsidbrandIdstring[indexPath.row]
                    print(self.NewBrnsidindividual)
                    NewBrandcollectionview.reloadData()
                    
                    print(self.deafultsBrandvalueStringfinalnewcat)
                    DispatchQueue.main.async {
                        self.TopBasedonidTotal()
                    }
                    print(self.deafultsBrandvalueStringfinalnewcat)
                    print(self.deafultsBrandvalueString)
                    print(deafultsBrandvalueString)
                }
                else if collectionView == Newcatcollectionview
                {
                    self.deafultsBrandvalueStringfinalnewcat = ""
                    
                    
                    selectedIndex = indexPath.item
                    
                    if clickedCatageorystring == "clickedcaatgeoryvalue"
                    {
                        
                        deafultscatvalueString = "defaults123"
                        
                        deafultsBrandvalueString = ""
                        
                        clickedCatageorystring = "clickedcaatgeoryvalue"
                        
                        
                        brandbuttonvalue = ""
                        catageorybuttonvalue = ""
                        clickedbrandstring = ""
                        self.Bydefaultsvalueis = ""
                    }
                    if catageorybuttonvalue == "catageorybuttonvalue"
                        
                    {
                        deafultscatvalueString = "defaults123"
                        deafultsBrandvalueString = ""
                        clickedCatageorystring = ""
                        brandbuttonvalue = ""
                        clickedbrandstring = ""
                        
                        self.Bydefaultsvalueis = ""
                  
                        deafultscatageoryvalueStringfinalnewcat  = "deafultscatageoryvalueStringfinalnewcat"
                    }
                        
                    else{
                        
                    }
                    
                    self.Newcatidstringvalueone = self.BrandsidbrandIdstring[indexPath.row]
                    
                    
                    DispatchQueue.main.async
                        {
                            self.TopBasedonidTotal()
                    }
                    Newcatcollectionview.reloadData()
                }
                else if collectionView == Newfavouritecollectionview
                {
                    selectedIndex = indexPath.item
                    Newfavouritecollectionview.reloadData()
                }
                else if collectionView == Newfavouritecollectionview
                {
                    selectedIndex = indexPath.item
                    Newfavouritecollectionview.reloadData()
                }
                else if collectionView == Topcombocolletcionview
                {
                    selectedIndex = indexPath.item
                    Topcombocolletcionview.reloadData()
                }
            }
            if MyKycpendingfinalavlue == "2"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
            if MyKycpendingfinalavlue == "4"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
                
            }
            if MyKycpendingfinalavlue == "3"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
            if MyKycpendingfinalavlue == "5"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
        }
        else
        {
        if collectionView == Homecollectionview
        {
            let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"ProductDescriptionViewController")as!ProductDescriptionViewController
            viewfinal.productdemoidfinalvalue = self.TodayProductsid[indexPath.item]
            
            self.present(viewfinal, animated: true, completion:nil)
        }
        else if collectionView == Recomendedcollectionview
        {
            let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"ProductDescriptionViewController")as!ProductDescriptionViewController
             viewfinal.productdemoidfinalvalue = self.RecomendedProductId[indexPath.item]
            self.present(viewfinal, animated: true, completion:nil)
        }
        else if collectionView == Trendingproductcollectionview
        {
            let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"ProductDescriptionViewController")as!ProductDescriptionViewController
            viewfinal.productdemoidfinalvalue = self.Trendingproductidvalue[indexPath.item]

            self.present(viewfinal, animated: true, completion:nil)
        }
        else if collectionView == Newproductcollectionview
        {
            let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"ProductDescriptionViewController")as!ProductDescriptionViewController
              viewfinal.productdemoidfinalvalue = self.Newproductidvalue[indexPath.item]
            self.present(viewfinal, animated: true, completion:nil)
        }
        else if collectionView == Topproductcolectionview
        {
            let viewfinal = self.storyboard?.instantiateViewController(withIdentifier:"ProductDescriptionViewController")as!ProductDescriptionViewController
            viewfinal.productdemoidfinalvalue = self.freNewproductidvalue[indexPath.item]

            self.present(viewfinal, animated: true, completion:nil)
        }
        else if collectionView == CatExplorebrandscollectionview
        {
            self.deafultsBrandvalueStringfinalnewcat = ""
            
            deafultscatageoryvalueStringfinalnewcat  = ""

            selectedIndex = nil
            if clickedCatageorystring == "clickedcaatgeoryvalue"
            {
                self.clickedbrandstring = ""
                self.Bydefaultsvalueis = ""
                self.clickedCatageorystring = ""
                self.Bydefaultsvalueis = ""
                self.catageorybuttonvalue = ""
                self.deafultscatvalueString = ""
                self.brandbuttonvalue = ""
                self.deafultsBrandvalueString = ""
                explorecatageorcliked = "explorecatageorcliked"
                DefaultBrandexplorebuttonclick = ""
                DefaultCatageorybuttonclick = ""
            }
            if catageorybuttonvalue == "catageorybuttonvalue"
            {
                self.clickedbrandstring = ""
                self.Bydefaultsvalueis = ""
                self.clickedCatageorystring = ""
                self.Bydefaultsvalueis = ""
                self.catageorybuttonvalue = ""
                self.deafultscatvalueString = ""
                self.brandbuttonvalue = ""
                self.deafultsBrandvalueString = ""
                explorecatageorcliked = "explorecatageorcliked"
                DefaultBrandexplorebuttonclick = ""
                DefaultCatageorybuttonclick = ""
                
            }

    exploreBrandsidsingelstring = self.Explorecatageoryidstring[indexPath.row]
            
            BrandexploreclkedTotal = self.Explorecatageoryidstring[indexPath.row]
            
            print(BrandexploreclkedTotal)

            print(exploreBrandsidsingelstring)
            self.TopBasedonBrandidvalue()
      
            
            let RecomendedExplorebrandsvalueis = self.Explorecatageoryiamge[indexPath.item]
            cartimage.sd_setImage(with: URL(string:RecomendedExplorebrandsvalueis), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
            
            cartlabelfinalvalue.text = self.ExplorecatgeoryName[indexPath.row]

            if Brnadsingel == "Brnadsingel"
            {
                Toplabelvaluechanged.text = self.ExplorecatgeoryName[indexPath.row]
            }
        }
        else if collectionView == Explorebrandscollectionview
        {

            self.deafultsBrandvalueStringfinalnewcat = ""
        
            deafultscatageoryvalueStringfinalnewcat  = ""
            selectedIndex = nil
            if clickedbrandstring == "samplebrandcollectionview"
            {
                self.clickedbrandstring = ""
                self.Bydefaultsvalueis = ""
                self.clickedCatageorystring = ""
                self.Bydefaultsvalueis = ""
                self.catageorybuttonvalue = ""
                self.deafultscatvalueString = ""
                self.brandbuttonvalue = ""
                self.deafultsBrandvalueString = ""
                exploreBrnadscliked = "exploreBrnadscliked"
            }
            
            if brandbuttonvalue == "brandbuttonvalue"
            {
                self.clickedbrandstring = ""
                self.Bydefaultsvalueis = ""
                self.clickedCatageorystring = ""
                self.Bydefaultsvalueis = ""
                self.catageorybuttonvalue = ""
                self.deafultscatvalueString = ""
                self.brandbuttonvalue = ""
                self.deafultsBrandvalueString = ""
                exploreBrnadscliked = "exploreBrnadscliked"
                
            }

              self.explorecatageoryidsingelstring = self.exploreBrandsidpatharry[indexPath.item]
                  print(self.exploreBrandsidpatharry)
            print(self.explorecatageoryidsingelstring)
          
            let RecomendedExplorebrandsfinalvalue = self.exploreBrandsImagepatharry[indexPath.item]
            snackdemo.sd_setImage(with: URL(string:RecomendedExplorebrandsfinalvalue), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
            self.TopBasedonBrandidvalue()
            brandlabelfinalvalue.text = self.exploreBrandsNamearry[indexPath.item]
       
            if catsingel == "catsingel"
            {
                Toplabelvaluechanged.text = self.exploreBrandsNamearry[indexPath.row]
                
            }
         
            let email = ExploreLettersArray[indexPath.item]
            print(email)
            if let letter = email.first {
                FirstLeterManipulation = letter
            }
            abcdcollectionview.reloadData()
            
            for index in 0..<self.exploreBrandsNamearry.count{
                
                if let letter = (self.exploreBrandsNamearry[index] as! String).first {
                    print(letter)
                    if FirstLeterManipulation == letter{
                        VisibleIndex = IndexPath(row: index, section: 0)
                        Explorebrandscollectionview.scrollToItem(at:VisibleIndex, at: .left, animated: true)
                        return
                    }
                }
                
            }
            Explorebrandscollectionview.reloadData()

        }
        else if collectionView == TopBrandcollectionview
        {
            Brandsscrollview.contentOffset = .zero

            deafultscatageoryvalueStringfinalnewcat  = ""

            self.deafultsBrandvalueStringfinalnewcat = ""

            selectedIndex = nil
            TotalTopBrandsValue = "24"
            brandbuttonvalue = ""
            catageorybuttonvalue = ""
            clickedCatageorystring = ""
             explorecatageorcliked = ""
            exploreBrnadscliked = ""

            print(self.TopBrandimage)
            clickedbrandstring = "samplebrandcollectionview"
            let TopProductcollectiontwo = self.TopBrandimage[indexPath.item]
            snackdemo.sd_setImage(with: URL(string:TopProductcollectiontwo), placeholderImage: UIImage(named:"AppIcon"))
            TopBrandidSingelvalue = self.TopBrandidvalue[indexPath.row]
                        self.Explorebrandscollectionview.reloadData()
              self.NewBrandtabelview.reloadData()
            DispatchQueue.main.async {
                self.TopBasedonBrandidvalue()
            }
            self.ExploreBrands.text = "Explore Brands"

            catageorytwo.tag = 0
            catageoryone.tag = 0
            popupscrollview.slideInFromLeft()
            popupscrollview.dropShadow1()
            Brnads.setBackgroundImage(#imageLiteral(resourceName: "Brandselectedred"), for: .normal)
            Brandstwo.setTitleColor(UIColor.red, for: .normal)
            Hometwo.setBackgroundImage(#imageLiteral(resourceName: "home_grey"), for: .normal)
            Homeone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
            catageorytwo.setBackgroundImage(#imageLiteral(resourceName: "catageory"), for: .normal)
            catageoryone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
            favourite.setBackgroundImage(#imageLiteral(resourceName: "favourite"), for: .normal)
            fsvouritetwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
            self.cadburry.text = "Cadburry"
            thiredview.isHidden =  false
            secondview.isHidden = false
            ANIMATIONVIEW.slideInFromLefttwo()
            ANIMATIONVIEW.dropShadow1()
            
            if Brnads.tag == 0
            {
                let bottomSheet = JXBottomSheetView(contentView:popupscrollview as! UIScrollView)
                bottomSheet.defaultMininumDisplayHeight = 120
                bottomSheet.defaultMaxinumDisplayHeight = 240
                bottomSheet.displayState = .maxDisplay
                bottomSheet.frame = self.view.bounds
                demoview.addSubview(bottomSheet)
                
                Brnads.tag = 1
                
            }
                
            else if Brnads.tag == 1{
                let bottomSheet = JXBottomSheetView(contentView:popupscrollview as! UIScrollView)
                bottomSheet.defaultMininumDisplayHeight = 120
                bottomSheet.defaultMaxinumDisplayHeight = 240
                bottomSheet.displayState = .minDisplay
                bottomSheet.frame = self.view.bounds
                demoview.addSubview(bottomSheet)
                Brnads.tag = 0
            }
            scrollPager.setSelectedIndex(index:2, animated: true)
            self.TopBasedonBrandidvalue()
            
            print(self.TopcatageoryItemsfinal)
    brandlabelfinalvalue.text = self.TopBrandName[indexPath.item]
          
            
        }
        else if collectionView == topcatageorycollectionview
        {
            self.catscroollview.contentOffset = .zero
            deafultscatageoryvalueStringfinalnewcat  = ""
            self.deafultsBrandvalueStringfinalnewcat = ""
            selectedIndex = nil
            clickedCatageorystring = "clickedcaatgeoryvalue"
            self.Bydefaultsvalueis = ""
            brandbuttonvalue = ""
            catageorybuttonvalue = ""
            clickedbrandstring = ""
            TotalTopcatageoryValue = "25"
            clickedbrandstring = ""
            explorecatageorcliked = ""
            exploreBrnadscliked = ""
            self.CatExplorebrandscollectionview.reloadData()
             let topcatageorysingelvalue = self.Itemimagefinal[indexPath.item]
            self.cadburry.text = "Snacks"
              cartimage.sd_setImage(with: URL(string:topcatageorysingelvalue), placeholderImage: UIImage(named:"AppIcon"))
            if self.view.frame.size.height < 800 {
                Brandsscrollview.contentInset = UIEdgeInsetsMake(0, 0, self.Brandsscrollview.frame.size.height+115, 0)
                Brandsscrollview.isScrollEnabled = true
                Brandsscrollview.showsVerticalScrollIndicator = false
            }
            popupscrollview.slideInFromLeft()
            popupscrollview.dropShadow1()
            ANIMATIONVIEW.slideInFromLefttwo()
            ANIMATIONVIEW.dropShadow1()
            Brnads.tag = 1
            Brandstwo.tag = 1
         
            catageorytwo.setBackgroundImage(#imageLiteral(resourceName: "categories_red"), for: .normal)
            catageoryone.setTitleColor(UIColor.red, for: .normal)
            Brnads.setBackgroundImage(#imageLiteral(resourceName: "Barnds"), for: .normal)
            Brandstwo.setTitleColor(UIColor.bottomnavigationtitile(), for: .normal)
            Hometwo.setBackgroundImage(#imageLiteral(resourceName: "home_grey"), for: .normal)
            Homeone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
            favourite.setBackgroundImage(#imageLiteral(resourceName: "catageory"), for: .normal)
            fsvouritetwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
            favourite.setBackgroundImage(#imageLiteral(resourceName: "favourite"), for: .normal)
            fsvouritetwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
            self.cadburry.text = "snacks"
//            self.Homescrollview.isHidden = true
//            self.secondview.isHidden = false
             Moreview.isHidden =  false
            
            self.cadburry.text = "snacks"
         
             self.ExploreBrands.text = "Explore Categories"
            if catageorytwo.tag == 0
            {
                let bottomSheet = JXBottomSheetView(contentView:popupscrollview as! UIScrollView)
                bottomSheet.defaultMininumDisplayHeight = 130
                bottomSheet.defaultMaxinumDisplayHeight = 260
                bottomSheet.displayState = .maxDisplay
                bottomSheet.frame = self.view.bounds
                demoview.addSubview(bottomSheet)
                catageorytwo.tag = 1
                
            }
                
            else if catageorytwo.tag == 1{
                let bottomSheet = JXBottomSheetView(contentView:popupscrollview as! UIScrollView)
                bottomSheet.defaultMininumDisplayHeight = 130
                bottomSheet.defaultMaxinumDisplayHeight = 260
                bottomSheet.displayState = .minDisplay
                bottomSheet.frame = self.view.bounds
                demoview.addSubview(bottomSheet)
                catageorytwo.tag = 0
            }
            scrollPager.setSelectedIndex(index:1, animated: true)

            Topcatageorysingelvalue = self.Topcatageorysingleidvalueis[indexPath.row]
            
            
            print(Topcatageorysingelvalue)
            
            
             self.TopBasedonBrandidvalue()
            cartlabelfinalvalue.text = self.TopcatageoryItemsfinal[indexPath.item]

        }
        
        else if collectionView == abcdcollectionview
        {
            let email = ExploreLettersArray[indexPath.item]
            print(email)
            if let letter = email.first {
                print(letter)
                FirstLeterManipulation = letter
            }
            abcdcollectionview.reloadData()
            Explorebrandscollectionview.reloadData()
            
            for index in 0..<self.exploreBrandsNamearry.count{
                
                if let letter = (self.exploreBrandsNamearry[index] as! String).first {
                    print(letter)
                    if FirstLeterManipulation == letter{
                        VisibleIndex = IndexPath(row: index, section: 0)
                        Explorebrandscollectionview.scrollToItem(at:VisibleIndex, at: .left, animated: true)
                        return
                    }
                }
                
            }
            Explorebrandscollectionview.reloadData()
        }
            
            
            
            
    else if collectionView  == Catabcdcollectionview
        {
            let email = ExplorecatageoryLettersArray[indexPath.item]
            print(email)
            if let letter = email.first {
                print(letter)
                FirstLeterManipulationtwo = letter
            }
            Catabcdcollectionview.reloadData()
            CatExplorebrandscollectionview.reloadData()
            for index in 0..<self.Explorecatageoryarray.count{
                if let letter = (self.ExplorecatgeoryName[index] as! String).first {
                    print(letter)
                    if FirstLeterManipulationtwo == letter{
                        VisibleIndex = IndexPath(row: index, section: 0)
                        CatExplorebrandscollectionview.scrollToItem(at:VisibleIndex, at: .left, animated: true)
                        return
                    }
                }
            }

            CatExplorebrandscollectionview.reloadData()
        }
        else if collectionView == NewBrandcollectionview
        {
            deafultscatageoryvalueStringfinalnewcat  = ""
            
            
            if clickedbrandstring == "samplebrandcollectionview"
            {
                deafultsBrandvalueString = "deafultsBrand123"
                deafultscatvalueString = ""
                clickedCatageorystring = ""
                self.Bydefaultsvalueis = ""
                brandbuttonvalue = ""
                catageorybuttonvalue = ""
                clickedbrandstring = "samplebrandcollectionview"
            }
            if brandbuttonvalue == "brandbuttonvalue"
            {
                deafultsBrandvalueString = "brandbuttonvalues"
                deafultscatvalueString = ""
                clickedCatageorystring = ""
                self.Bydefaultsvalueis = ""
                catageorybuttonvalue = ""
                clickedbrandstring = ""
                self.deafultsBrandvalueStringfinalnewcat = "brandbuttonvalues"
                print(self.deafultsBrandvalueStringfinalnewcat)
            }
            else{
                
            }
            selectedIndex = indexPath.item
            self.NewBrnsidindividual =  self.BrandsidbrandIdstring[indexPath.row]
            print(self.NewBrnsidindividual)
            NewBrandcollectionview.reloadData()
            
            print(self.deafultsBrandvalueStringfinalnewcat)
            DispatchQueue.main.async {
                self.TopBasedonidTotal()
            }
            print(self.deafultsBrandvalueStringfinalnewcat)
            print(self.deafultsBrandvalueString)
            print(deafultsBrandvalueString)
        }
        else if collectionView == Newcatcollectionview
        {
            self.deafultsBrandvalueStringfinalnewcat = ""

            
            selectedIndex = indexPath.item
           
            if clickedCatageorystring == "clickedcaatgeoryvalue"
            {
                
                            deafultscatvalueString = "defaults123"
                
                            deafultsBrandvalueString = ""
                
                            clickedCatageorystring = "clickedcaatgeoryvalue"
                
                
                            brandbuttonvalue = ""
                            catageorybuttonvalue = ""
                            clickedbrandstring = ""
                 self.Bydefaultsvalueis = ""
            }
             if catageorybuttonvalue == "catageorybuttonvalue"
            
             {
                
                deafultscatvalueString = "defaults123"
                deafultsBrandvalueString = ""
                clickedCatageorystring = ""
                brandbuttonvalue = ""
                clickedbrandstring = ""
                
                self.Bydefaultsvalueis = ""
                
                deafultscatageoryvalueStringfinalnewcat  = "deafultscatageoryvalueStringfinalnewcat"
            }
            
            else{
              
            }

            self.Newcatidstringvalueone = self.BrandsidbrandIdstring[indexPath.row]
            
            
            DispatchQueue.main.async
                {
                self.TopBasedonidTotal()
               }
            Newcatcollectionview.reloadData()
        }
        else if collectionView == Newfavouritecollectionview
        {
            selectedIndex = indexPath.item
            Newfavouritecollectionview.reloadData()
        }
        else if collectionView == Newfavouritecollectionview
        {
            selectedIndex = indexPath.item
            Newfavouritecollectionview.reloadData()
        }
        else if collectionView == Topcombocolletcionview
        {
            selectedIndex = indexPath.item
            Topcombocolletcionview.reloadData()
        }
    }
    }
    @IBAction func Menubutton(_ sender: UIButton)
    {
        if AppDelegate.menu_bool
        {
            Showmenu()
        }
        else{
            Closemenu()
            
        }
    }
    
    func Showmenu()
    {
        self.Homescrollview.isScrollEnabled = true
        
        UIView.animate(withDuration:0.3) { ()-> Void in
            
            self.Menu_vc.view.frame = CGRect(x: 0, y:0, width:UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height)
           self.Menu_vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
            self.addChildViewController(self.Menu_vc)

            self.view.addSubview(self.Menu_vc.view)
            
       
            AppDelegate.menu_bool = false
        }
        
        
    }
    func Closemenu()
    {
            UIView.animate(withDuration: 0.3, animations: { ()-> Void in
                if UIScreen.main.bounds.size.height == 480
                {
                    self.Menu_vc.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y:0, width:UIScreen.main.bounds.size.width-150, height:UIScreen.main.bounds.size.height)
                }
                if UIScreen.main.bounds.size.height == 568
                {
                    
                    self.Menu_vc.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y:0, width:UIScreen.main.bounds.size.width-150, height:UIScreen.main.bounds.size.height)
                }
                
                if  UIScreen.main.bounds.size.height == 736
                {
                    
                    self.Menu_vc.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y:0, width:UIScreen.main.bounds.size.width-100, height:UIScreen.main.bounds.size.height)
                    
                }
                if UIScreen.main.bounds.size.height == 667
                {
                    
                    self.Menu_vc.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y:0, width:UIScreen.main.bounds.size.width-100, height:UIScreen.main.bounds.size.height)
                }
                
                
            }) { (finished) in
                self.Menu_vc.view.removeFromSuperview()
            }
        
        let finalmenuvalue = MenuViewController()
            AppDelegate.menu_bool = true
        }

    @IBAction func Home(_ sender: UIButton)
    {
        self.combototalviewfinal.isHidden = true

     topview.isHidden = false

        firstView.isHidden = false

      timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerAction), userInfo: nil, repeats: false)

        Homescrollview.contentOffset = .zero
        
        Newcattabelview.frame = CGRect(x: 0, y: self.Newcattabelview.frame.origin.y, width: self.Newcattabelview.frame.size.width, height: self.Newcattabelview.frame.size.height)
        NewBrandtabelview.frame = CGRect(x: 0, y: self.NewBrandtabelview.frame.origin.y, width: self.NewBrandtabelview.frame.size.width, height: self.NewBrandtabelview.frame.size.height)
        
    }
    @objc func timerAction()
    {
        let defaults = UserDefaults.standard
        if let MyKycpendingfinalavlue:String = defaults.value(forKey:"isverystring")as?String
        {
            if MyKycpendingfinalavlue == "1"
            {
                self.singelbutton.isHidden = true
                self.Toplabel.text = "NumberMall"
                Brnads.tag = 0
                catageorytwo.tag = 0
                Brandstwo.tag = 0
                catageorytwo.tag = 0
                scrollPager.setSelectedIndex(index:0, animated: true)
                Numbermallfavouriteview.isHidden =  false
                
                Brnads.setBackgroundImage(#imageLiteral(resourceName: "Barnds"), for: .normal)
                Brandstwo.setTitleColor(UIColor.bottomnavigationtitile(), for: .normal)
                Hometwo.setBackgroundImage(#imageLiteral(resourceName: "Home"), for: .normal)
                Homeone.setTitleColor(UIColor.red, for:.normal)
                catageorytwo.setBackgroundImage(#imageLiteral(resourceName: "catageory"), for: .normal)
                catageoryone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                favourite.setBackgroundImage(#imageLiteral(resourceName: "favourite"), for: .normal)
                fsvouritetwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                cahtone.setBackgroundImage(#imageLiteral(resourceName: "chat"), for: .normal)
                cahttwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
            }
            if MyKycpendingfinalavlue == "2"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
            if MyKycpendingfinalavlue == "4"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
                
            }
            if MyKycpendingfinalavlue == "3"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
            if MyKycpendingfinalavlue == "5"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
        }
    }
    
    @IBAction func catageory(_ sender: UIButton)
    {
        let defaults = UserDefaults.standard
        if let MyKycpendingfinalavlue:String = defaults.value(forKey:"isverystring")as?String
        {
            if MyKycpendingfinalavlue == "1"
            {
                self.singelbutton.isHidden = true
                self.combototalviewfinal.isHidden = true
                
                Brandstwo.tag = 0
                Brnads.tag = 0
                
                self.myviewonefinal.isHidden = true
                
                self.catscroollview.contentOffset = .zero
                
                cartlabelfinalvalue.text = deafultscatageorynamestring
                
                cartimage.sd_setImage(with: URL(string:defaultscaatgeorypathstring), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
                self.deafultsBrandvalueStringfinalnewcat = ""
                favouritetotoalvalue = ""
                catageorybuttonvalue  = "catageorybuttonvalue"
                clickedCatageorystring = ""
                brandbuttonvalue = ""
                clickedbrandstring = ""
                self.deafultscatvalueString = ""
                self.selectedIndex = nil
                self.explorecatageorcliked = ""
                self.exploreBrnadscliked = ""
                self.TopBasedonBrandidvalue()
                catscroollview.contentOffset = .zero
                self.Toplabel.text = "Snacks"
                Catpopupscrollview.slideInFromLeft()
               
                Newcattabelview.frame = CGRect(x: 0, y: self.Newcattabelview.frame.origin.y, width: self.Newcattabelview.frame.size.width, height: self.Newcattabelview.frame.size.height)
                NewBrandtabelview.frame = CGRect(x: 0, y: self.NewBrandtabelview.frame.origin.y, width: self.NewBrandtabelview.frame.size.width, height: self.NewBrandtabelview.frame.size.height)
                
                
                Catpopupscrollview.dropShadow1()
                CatANIMATIONVIEW.slideInFromLefttwo()
                CatANIMATIONVIEW.dropShadow1()
                if self.view.frame.size.height < 800 {
                    catscroollview.contentInset = UIEdgeInsetsMake(0, 0, self.catscroollview.frame.size.height+115, 0)
                    catscroollview.isScrollEnabled = true
                    catscroollview.showsVerticalScrollIndicator = false
                }
                Moreview.isHidden =  false
                scrollPager.setSelectedIndex(index:1, animated: true)
                catageorytwo.setBackgroundImage(#imageLiteral(resourceName: "categories_red"), for: .normal)
                catageoryone.setTitleColor(UIColor.red, for: .normal)
                Brnads.setBackgroundImage(#imageLiteral(resourceName: "Barnds"), for: .normal)
                Brandstwo.setTitleColor(UIColor.bottomnavigationtitile(), for: .normal)
                Hometwo.setBackgroundImage(#imageLiteral(resourceName: "home_grey"), for: .normal)
                Homeone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                favourite.setBackgroundImage(#imageLiteral(resourceName: "catageory"), for: .normal)
                fsvouritetwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                favourite.setBackgroundImage(#imageLiteral(resourceName: "favourite"), for: .normal)
                fsvouritetwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                cahtone.setBackgroundImage(#imageLiteral(resourceName: "chat"), for: .normal)
                cahttwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                self.cadburry.text = "snacks"
                if catageorytwo.tag == 0
                {
                    let bottomSheettwo = JXBottomSheetView(contentView:(Catpopupscrollview)!)
                    bottomSheettwo.defaultMininumDisplayHeight = 120
                    bottomSheettwo.defaultMaxinumDisplayHeight = 240
                    bottomSheettwo.displayState = .maxDisplay
                    bottomSheettwo.frame = self.view.bounds
                    singpopoupcatgeory.addSubview(bottomSheettwo)
                    catageorytwo.tag = 1
                }
                    
                else if catageorytwo.tag == 1
                {
                    let bottomSheettwo = JXBottomSheetView(contentView:(Catpopupscrollview)!)
                    bottomSheettwo.defaultMininumDisplayHeight = 120
                    bottomSheettwo.defaultMaxinumDisplayHeight = 240
                    bottomSheettwo.displayState = .minDisplay
                    bottomSheettwo.frame = self.view.bounds
                    singpopoupcatgeory.addSubview(bottomSheettwo)
                    catageorytwo.tag = 0
                }
            }
            if MyKycpendingfinalavlue == "2"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
            if MyKycpendingfinalavlue == "4"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
                
            }
            if MyKycpendingfinalavlue == "3"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
            if MyKycpendingfinalavlue == "5"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
        }
    }
    
    @IBAction func Brands(_ sender: UIButton)
    {
    
        let defaults = UserDefaults.standard
        if let MyKycpendingfinalavlue:String = defaults.value(forKey:"isverystring")as?String
        {
            if MyKycpendingfinalavlue == "1"
            {
                self.singelbutton.isHidden = true
                self.combototalviewfinal.isHidden = true
                
                self.myviewonefinal.isHidden = true
                Brandsscrollview.contentOffset = .zero
                
                catageorytwo.tag = 0
                catageoryone.tag = 0
                
                brandlabelfinalvalue.text = self.defaultsbarndsnamestring
                
                
                
                snackdemo.sd_setImage(with: URL(string:deafultsbrandspathstring), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
                
                
                
                self.deafultsBrandvalueStringfinalnewcat = ""
                
                favouritetotoalvalue = ""
                
                brandbuttonvalue = "brandbuttonvalue"
                catageorybuttonvalue = ""
                clickedCatageorystring = ""
                clickedbrandstring = ""
                self.deafultscatvalueString = ""
                self.selectedIndex = nil
                self.explorecatageorcliked = ""
                self.exploreBrnadscliked = ""
          
                Newcattabelview.frame = CGRect(x: 0, y: self.Newcattabelview.frame.origin.y, width: self.Newcattabelview.frame.size.width, height: self.Newcattabelview.frame.size.height)
                NewBrandtabelview.frame = CGRect(x: 0, y: self.NewBrandtabelview.frame.origin.y, width: self.NewBrandtabelview.frame.size.width, height: self.NewBrandtabelview.frame.size.height)
                self.TopBasedonBrandidvalue()
                self.ExploreBrands.text = "Explore Brands"
                self.Explorebrandscollectionview.reloadData()
                self.Toplabel.text = "Cadbury"
                Brandsscrollview.contentOffset = .zero
                if self.view.frame.size.height < 800
                {
                    Brandsscrollview.contentInset = UIEdgeInsetsMake(0, 0, self.Brandsscrollview.frame.size.height+115, 0)
                    Brandsscrollview.isScrollEnabled = true
                    Brandsscrollview.showsVerticalScrollIndicator = false
                }
                popupscrollview.slideInFromLeft()
                popupscrollview.dropShadow1()
                Brnads.setBackgroundImage(#imageLiteral(resourceName: "Brandselectedred"), for: .normal)
                Brandstwo.setTitleColor(UIColor.red, for: .normal)
                Hometwo.setBackgroundImage(#imageLiteral(resourceName: "home_grey"), for: .normal)
                Homeone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                catageorytwo.setBackgroundImage(#imageLiteral(resourceName: "catageory"), for: .normal)
                catageoryone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                favourite.setBackgroundImage(#imageLiteral(resourceName: "favourite"), for: .normal)
                fsvouritetwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                cahtone.setBackgroundImage(#imageLiteral(resourceName: "chat"), for: .normal)
                cahttwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                
                
                self.cadburry.text = "Cadburry"
                thiredview.isHidden =  false
                secondview.isHidden = false
                scrollPager.setSelectedIndex(index:2, animated: true)
                ANIMATIONVIEW.slideInFromLefttwo()
                ANIMATIONVIEW.dropShadow1()
                if Brnads.tag == 0
                {
                    let bottomSheet = JXBottomSheetView(contentView:popupscrollview as! UIScrollView)
                    bottomSheet.defaultMininumDisplayHeight = 120
                    bottomSheet.defaultMaxinumDisplayHeight = 240
                    bottomSheet.displayState = .maxDisplay
                    bottomSheet.frame = self.view.bounds
                    demoview.addSubview(bottomSheet)
                    
                    Brnads.tag = 1
                    
                }
                    
                else if Brnads.tag == 1{
                    let bottomSheet = JXBottomSheetView(contentView:popupscrollview as! UIScrollView)
                    bottomSheet.defaultMininumDisplayHeight = 120
                    bottomSheet.defaultMaxinumDisplayHeight = 240
                    bottomSheet.displayState = .minDisplay
                    bottomSheet.frame = self.view.bounds
                    demoview.addSubview(bottomSheet)
                    Brnads.tag = 0
                }
                
                print(brandbuttonvalue)
                
                self.deafultsBrandvalueString = ""
            }
            if MyKycpendingfinalavlue == "2"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
            if MyKycpendingfinalavlue == "4"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
                
            }
            if MyKycpendingfinalavlue == "3"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
            if MyKycpendingfinalavlue == "5"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
        }
    
    }
    @objc  func timerActiontwo()
    {
      //  popupscrollview.slideInFromLeft()
       // popupscrollview.dropShadow1()
        
        
    }
    @IBAction func Favourite(_ sender: UIButton)
    {
        let defaults = UserDefaults.standard
        
        if let MyKycpendingfinalavlue:String = defaults.value(forKey:"isverystring")as?String
        {
            if MyKycpendingfinalavlue == "1"
            {
                self.singelbutton.isHidden = true
                self.combototalviewfinal.isHidden = true
                self.viewallclickvalue = ""
                self.myviewonefinal.isHidden = true
                Agentfavouritescrollview.contentOffset = .zero
                Toplabel.text = "Favorites"
                self.favouritetabelviewtwo.isHidden = false
                Numbermallfavouriteview.isHidden =  false
                scrollPager.setSelectedIndex(index:3, animated: true)
                Brnads.setBackgroundImage(#imageLiteral(resourceName: "Barnds"), for: .normal)
                Brandstwo.setTitleColor(UIColor.bottomnavigationtitile(), for: .normal)
                Hometwo.setBackgroundImage(#imageLiteral(resourceName: "home_grey"), for: .normal)
                Homeone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                catageorytwo.setBackgroundImage(#imageLiteral(resourceName: "catageory"), for: .normal)
                catageoryone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                favourite.setBackgroundImage(#imageLiteral(resourceName: "favoutires_red"), for: .normal)
                fsvouritetwo.setTitleColor(UIColor.red, for:.normal)
                cahtone.setBackgroundImage(#imageLiteral(resourceName: "chat"), for: .normal)
                cahttwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                Agentfavouritescrollview.isHidden = false
                Agentsfavouritietwo.isHidden = true
                self.favouritetabelview.isHidden = false
                Numbermallfavouriteview.isHidden =  false
                favouritetotoalvalue = "1"
                Newcattabelview.frame = CGRect(x: 0, y: self.Newcattabelview.frame.origin.y, width: self.Newcattabelview.frame.size.width, height: self.Newcattabelview.frame.size.height)
                NewBrandtabelview.frame = CGRect(x: 0, y: self.NewBrandtabelview.frame.origin.y, width: self.NewBrandtabelview.frame.size.width, height: self.NewBrandtabelview.frame.size.height)
                favouritesineglvalue = "1"
                self.Favouritecallfunction()
                self.favoiuriteimagetwo.isHidden = false
            
                favouritesineglvalue = "1"
                
                Numbermallfavouriteview.isHidden =  false
                self.Agentfavouritescrollview.isHidden = false
                
                
                Favorites.setTitleColor(UIColor.red, for:.normal)
                Recents.setTitleColor(UIColor.BackgroundTotalfinalavlue(), for:.normal)
                Schemes.setTitleColor(UIColor.BackgroundTotalfinalavlue(), for:.normal)
                
                self.viewfavourithree.isHidden = true
                self.viewfavouritwtwo.isHidden = true
                self.viewfavone.isHidden = false
                
                //        self.Agentsfavouritietwo.isHidden = false
                
                
                favouritescrollviewfinalvalue.setSelectedIndex(index:0, animated: true)
                
            }
            if MyKycpendingfinalavlue == "2"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
            if MyKycpendingfinalavlue == "4"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
                
            }
            if MyKycpendingfinalavlue == "3"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
            if MyKycpendingfinalavlue == "5"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
        }

    }
    @IBAction func Cart(_ sender: UIButton)
    
    {
        let viewall = self.storyboard?.instantiateViewController(withIdentifier:"BrandsViewController")as!ViewallBrandsViewController
        self.present(viewall, animated: true, completion:nil)
    }

    @IBAction func Todayviewall(_ sender: UIButton)
    {
      
        let defaults = UserDefaults.standard

        if let MyKycpendingfinalavlue:String = defaults.value(forKey:"isverystring")as?String
        {
            if MyKycpendingfinalavlue == "1"
            {
                self.singelbutton.isHidden = true
                self.viewallclickvalue = "Today"
                self.combototalviewfinal.isHidden = false
                let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewallBrandsViewController") as! ViewallBrandsViewController
                popOverVC.Recomendedname1 = self.TodayProducts
                popOverVC.ViewallTotalfinal = self.combototalviewfinal
                popOverVC.dealEndtime1 = self.dealEndtime

                self.addChildViewController(popOverVC)
                popOverVC.view.frame =  CGRect(x: 0, y:0, width: self.view.frame.size.width, height: self.view.frame.size.height)
                self.combototalviewfinal.addSubview(popOverVC.view)
                popOverVC.didMove(toParentViewController: self)
                
            }
            if MyKycpendingfinalavlue == "2"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
            if MyKycpendingfinalavlue == "4"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
                
            }
            if MyKycpendingfinalavlue == "3"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
            if MyKycpendingfinalavlue == "5"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
        }

    }
    @IBAction func Recomendedviewall(_ sender: UIButton)
    {
        let defaults = UserDefaults.standard

        if let MyKycpendingfinalavlue:String = defaults.value(forKey:"isverystring")as?String
        {
            if MyKycpendingfinalavlue == "1"
            {
                self.singelbutton.isHidden = true

                self.combototalviewfinal.isHidden = false
                self.viewallclickvalue = ""
                self.viewallclickvalue = "Recomended"
                let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewallBrandsViewController") as! ViewallBrandsViewController
                popOverVC.Recomendedname1 = self.Recomendedname
                popOverVC.ViewallTotalfinal = self.combototalviewfinal
                self.addChildViewController(popOverVC)
                popOverVC.view.frame =  CGRect(x: 0, y:0, width: self.view.frame.size.width, height: self.view.frame.size.height)
                self.combototalviewfinal.addSubview(popOverVC.view)
                popOverVC.didMove(toParentViewController: self)
                let defaults = UserDefaults.standard
                
            }
            if MyKycpendingfinalavlue == "2"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
            if MyKycpendingfinalavlue == "4"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
                
            }
            if MyKycpendingfinalavlue == "3"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
            if MyKycpendingfinalavlue == "5"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
        }
      }
    @IBAction func Trendingbutton(_ sender: UIButton)
    {
    
        let defaults = UserDefaults.standard
        if let MyKycpendingfinalavlue:String = defaults.value(forKey:"isverystring")as?String
        {
            if MyKycpendingfinalavlue == "1"
            {
                self.singelbutton.isHidden = true

                self.combototalviewfinal.isHidden = false
                self.viewallclickvalue = ""
                self.viewallclickvalue = "Trending"
                let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewallBrandsViewController") as! ViewallBrandsViewController
                popOverVC.Recomendedname1 = self.TrendingproductName
                popOverVC.ViewallTotalfinal = self.combototalviewfinal
                self.addChildViewController(popOverVC)
                popOverVC.view.frame =  CGRect(x: 0, y:0, width: self.view.frame.size.width, height: self.view.frame.size.height)
                self.combototalviewfinal.addSubview(popOverVC.view)
                popOverVC.didMove(toParentViewController: self)
                
            }
            if MyKycpendingfinalavlue == "2"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
            if MyKycpendingfinalavlue == "4"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
                
            }
            if MyKycpendingfinalavlue == "3"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
            if MyKycpendingfinalavlue == "5"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
            }
        }
    }
    
    @IBAction func Newproductall(_ sender: UIButton)
    {
       
        let defaults = UserDefaults.standard
        if let MyKycpendingfinalavlue:String = defaults.value(forKey:"isverystring")as?String
        {
            if MyKycpendingfinalavlue == "1"
            {
                self.combototalviewfinal.isHidden = false
                self.singelbutton.isHidden = true

                self.viewallclickvalue = ""
                self.viewallclickvalue = "Newproductcall"
                self.myviewonefinal.isHidden = false
                
                let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewallBrandsViewController") as! ViewallBrandsViewController
                popOverVC.Recomendedname1 = self.NewproductName12
                popOverVC.ViewallTotalfinal = self.combototalviewfinal
                self.addChildViewController(popOverVC)
                popOverVC.view.frame =  CGRect(x: 0, y:0, width: self.view.frame.size.width, height: self.view.frame.size.height)
                self.combototalviewfinal.addSubview(popOverVC.view)
                popOverVC.didMove(toParentViewController: self)
                
            }
            if MyKycpendingfinalavlue == "2"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
            if MyKycpendingfinalavlue == "4"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
                
            }
            if MyKycpendingfinalavlue == "3"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
            if MyKycpendingfinalavlue == "5"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
            }
        }
    }
    @IBAction func singelbrand(_ sender: Any)
    {
        
        let defaults = UserDefaults.standard
        if let MyKycpendingfinalavlue:String = defaults.value(forKey:"isverystring")as?String
        {
            if MyKycpendingfinalavlue == "1"
            {
                self.singelbutton.isHidden = true
                
                self.combototalviewfinal.isHidden = false
                
                self.viewallclickvalue = ""
                self.viewallclickvalue = "freproductcall"
                
                
                let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewallBrandsViewController") as! ViewallBrandsViewController
                popOverVC.Recomendedname1 = self.freNewproductName12
                popOverVC.ViewallTotalfinal = self.combototalviewfinal
                self.addChildViewController(popOverVC)
                popOverVC.view.frame =  CGRect(x: 0, y:0, width: self.view.frame.size.width, height: self.view.frame.size.height)
                self.combototalviewfinal.addSubview(popOverVC.view)
                popOverVC.didMove(toParentViewController: self)
                
            }
            if MyKycpendingfinalavlue == "2"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
            if MyKycpendingfinalavlue == "4"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
                
            }
            if MyKycpendingfinalavlue == "3"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
            if MyKycpendingfinalavlue == "5"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
        }
    }
    @IBAction func Topbrands(_ sender: UIButton)
    {
        self.viewallclickvalue = ""
        self.viewallclickvalue = "Topproductcall"
        self.myviewonefinal.isHidden = false
        self.updateViewfive()
    }
   
    @IBAction func topcatageorybutton(_ sender: UIButton)
    {
        let defaults = UserDefaults.standard

        if let MyKycpendingfinalavlue:String = defaults.value(forKey:"isverystring")as?String
        {
            if MyKycpendingfinalavlue == "1"
            {
                self.singelbutton.isHidden = true
                self.combototalviewfinal.isHidden = true
                
                Brandstwo.tag = 0
                Brnads.tag = 0
                
                self.myviewonefinal.isHidden = true
                
                self.catscroollview.contentOffset = .zero
                
                cartlabelfinalvalue.text = deafultscatageorynamestring
                
                cartimage.sd_setImage(with: URL(string:defaultscaatgeorypathstring), placeholderImage:(UIImage(named:"default_img")), options: .refreshCached, completed: nil)
                self.deafultsBrandvalueStringfinalnewcat = ""
                favouritetotoalvalue = ""
                catageorybuttonvalue  = "catageorybuttonvalue"
                clickedCatageorystring = ""
                brandbuttonvalue = ""
                clickedbrandstring = ""
                self.deafultscatvalueString = ""
                self.selectedIndex = nil
                self.explorecatageorcliked = ""
                self.exploreBrnadscliked = ""
                self.TopBasedonBrandidvalue()
                catscroollview.contentOffset = .zero
                self.Toplabel.text = "Snacks"
                //self.bottomstaticview.isHidden = true
                Catpopupscrollview.slideInFromLeft()
                
                //// adding method
                
                
                Newcattabelview.frame = CGRect(x: 0, y: self.Newcattabelview.frame.origin.y, width: self.Newcattabelview.frame.size.width, height: self.Newcattabelview.frame.size.height)
                NewBrandtabelview.frame = CGRect(x: 0, y: self.NewBrandtabelview.frame.origin.y, width: self.NewBrandtabelview.frame.size.width, height: self.NewBrandtabelview.frame.size.height)
                
                
                Catpopupscrollview.dropShadow1()
                CatANIMATIONVIEW.slideInFromLefttwo()
                CatANIMATIONVIEW.dropShadow1()
                if self.view.frame.size.height < 800
                {
                    catscroollview.contentInset = UIEdgeInsetsMake(0, 0, self.catscroollview.frame.size.height+115, 0)
                    catscroollview.isScrollEnabled = true
                    catscroollview.showsVerticalScrollIndicator = false
                }
                Moreview.isHidden =  false
                scrollPager.setSelectedIndex(index:1, animated: true)
                catageorytwo.setBackgroundImage(#imageLiteral(resourceName: "categories_red"), for: .normal)
                catageoryone.setTitleColor(UIColor.red, for: .normal)
                Brnads.setBackgroundImage(#imageLiteral(resourceName: "Barnds"), for: .normal)
                Brandstwo.setTitleColor(UIColor.bottomnavigationtitile(), for: .normal)
                Hometwo.setBackgroundImage(#imageLiteral(resourceName: "home_grey"), for: .normal)
                Homeone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                favourite.setBackgroundImage(#imageLiteral(resourceName: "catageory"), for: .normal)
                fsvouritetwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                favourite.setBackgroundImage(#imageLiteral(resourceName: "favourite"), for: .normal)
                fsvouritetwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                cahtone.setBackgroundImage(#imageLiteral(resourceName: "chat"), for: .normal)
                cahttwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
                self.cadburry.text = "snacks"
                if catageorytwo.tag == 0
                {
                    let bottomSheettwo = JXBottomSheetView(contentView:(Catpopupscrollview)!)
                    bottomSheettwo.defaultMininumDisplayHeight = 120
                    bottomSheettwo.defaultMaxinumDisplayHeight = 240
                    bottomSheettwo.displayState = .maxDisplay
                    bottomSheettwo.frame = self.view.bounds
                    singpopoupcatgeory.addSubview(bottomSheettwo)
                    catageorytwo.tag = 1
                }
                    
                else if catageorytwo.tag == 1
                {
                    let bottomSheettwo = JXBottomSheetView(contentView:(Catpopupscrollview)!)
                    bottomSheettwo.defaultMininumDisplayHeight = 120
                    bottomSheettwo.defaultMaxinumDisplayHeight = 240
                    bottomSheettwo.displayState = .minDisplay
                    bottomSheettwo.frame = self.view.bounds
                    singpopoupcatgeory.addSubview(bottomSheettwo)
                    catageorytwo.tag = 0
                }
            }
            if MyKycpendingfinalavlue == "2"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
            if MyKycpendingfinalavlue == "4"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
                
            }
            if MyKycpendingfinalavlue == "3"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
            if MyKycpendingfinalavlue == "5"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
        }
        

    }

//    func Homecalltwo()
//    {
//        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
//        request.httpMethod = "POST"
//        let postString = "method=landingPage&userid=511111117"
//        request.httpBody = postString.data(using: .utf8)
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else {                                                 // check for fundamental networking error
//                print("error=\(error)")
//                return
//            }
//
//            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
//                print("statusCode should be 200, but is \(httpStatus.statusCode)")
//                print("response = \(response)")
//
//            }
//
//            let responseString = String(data: data, encoding: .utf8)
//            print("responseString = \(responseString)")
//        }
//        task.resume()
//    }

     func TopBasedonBrandidvalue()
     {
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let defaults = UserDefaults.standard
        if let Myagentidfinal:String = defaults.value(forKey:"MyLoginfinalvalue")as?String
        {
            self.Homeuseridstringvalue = Myagentidfinal
        }
        if clickedbrandstring != ""
        {
            postStringfinalvalue =  String(format: "method=%@&userid=%@&brandId=%@","getBrandsForCategories",Homeuseridstringvalue,TopBrandidSingelvalue)
        }
        if clickedCatageorystring == "clickedcaatgeoryvalue"
        {
            postStringfinalvalue =  String(format: "method=%@&userid=%@&categoryId=%@","getBrandsForCategories",Homeuseridstringvalue,Topcatageorysingelvalue)
        }
         if catageorybuttonvalue == "catageorybuttonvalue"
        {
             postStringfinalvalue =  String(format: "method=%@&userid=%@&categoryId=%@","getBrandsForCategories",Homeuseridstringvalue,deafultscatageoryidstring)
        }
        if brandbuttonvalue == "brandbuttonvalue"
        {
            postStringfinalvalue =  String(format: "method=%@&userid=%@&brandId=%@","getBrandsForCategories",Homeuseridstringvalue,defaultsBrandidstring)
        }
        if explorecatageorcliked == "explorecatageorcliked"
        {
            postStringfinalvalue =  String(format: "method=%@&userid=%@&categoryId=%@","getBrandsForCategories",Homeuseridstringvalue,self.exploreBrandsidsingelstring)
        }
        if exploreBrnadscliked == "exploreBrnadscliked"
        {
     
                postStringfinalvalue =  String(format: "method=%@&userid=%@&brandId=%@","getBrandsForCategories",Homeuseridstringvalue,self.explorecatageoryidsingelstring)
            print(postStringfinalvalue)

        }
        
        ///// addingmethods
        
        if DefaultCatageorybuttonclick == "DefaultCatageorybuttonclick"
        {
           postStringfinalvalue =  String(format: "method=%@&userid=%@&categoryId=%@","getBrandsForCategories",Homeuseridstringvalue,self.exploreBrandsidsingelstring)
        }
        
        if DefaultBrandexplorebuttonclick == "DefaultBrandexplorebuttonclick"
        {
            postStringfinalvalue =  String(format: "method=%@&userid=%@&brandId=%@","getBrandsForCategories",Homeuseridstringvalue,self.explorecatageoryidsingelstring)
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
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    print(dict)
                    
                 self.BrandsidclcickHomearray = dict.value(forKey:"Brands")as!NSArray
                 //   self.BrandsidbrandIdstring = self.BrandsidclcickHomearray.value(forKey:"brandId") as![String]
                    
                    if let BrandsidclcickHomearrayfinal:[String] = self.BrandsidclcickHomearray.value(forKey:"brandId") as? [String]
                    {
                        self.BrandsidbrandIdstring = BrandsidclcickHomearrayfinal
                    }
                    
                    
                    
                    self.Brandsidimage_pathstring = self.BrandsidclcickHomearray.value(forKey:"image_path") as! [String]
                    
                    
                    if let Brandsidbrand_namestringarrayfinal:[String] = self.BrandsidclcickHomearray.value(forKey:"brand_name") as? [String]
                    {
                        self.Brandsidbrand_namestring = Brandsidbrand_namestringarrayfinal
                    }


                    DispatchQueue.main.async {

                        if self.clickedbrandstring != ""
                        {
                            self.NewBrandcollectionview.reloadData()
                            self.Bydefaultsvalueis =  self.BrandsidbrandIdstring[0]
                            self.TopBasedonidTotal()
                        }
                        if self.brandbuttonvalue == "brandbuttonvalue"
                        {
                            self.NewBrandcollectionview.reloadData()
                            self.Bydefaultsvalueis =  self.BrandsidbrandIdstring[0]
                            self.TopBasedonidTotal()
                        }
                        if  self.catageorybuttonvalue == "catageorybuttonvalue"
                        {
                            self.Newcatcollectionview.reloadData()
                            
                            if let sold_filledbyarrayfinal:String = self.BrandsidbrandIdstring[0] as?String
                            {
                                self.Bydefaultsvalueis =  sold_filledbyarrayfinal

                                
                            }
                             
                            self.TopBasedonidTotal()
                        }
                            
                        if self.explorecatageorcliked == "explorecatageorcliked"
                        {
                            self.Newcatcollectionview.reloadData()
                            self.Bydefaultsvalueis =  self.BrandsidbrandIdstring[0]
                            self.TopBasedonidTotal()
                        }
                        if self.exploreBrnadscliked == "exploreBrnadscliked"
                        {
                            self.NewBrandcollectionview.reloadData()
                            self.Bydefaultsvalueis =  self.BrandsidbrandIdstring[0]
                            self.TopBasedonidTotal()
                        }
                        if self.DefaultCatageorybuttonclick == "DefaultCatageorybuttonclick"
                        {
                            self.Newcatcollectionview.reloadData()
                            self.Bydefaultsvalueis =  self.BrandsidbrandIdstring[0]
                        }
                        if self.DefaultBrandexplorebuttonclick == "DefaultBrandexplorebuttonclick"
                        {
                            self.NewBrandcollectionview.reloadData()
                            self.Bydefaultsvalueis =  self.BrandsidbrandIdstring[0]
                        }
                        else
                        {
                            self.Newcatcollectionview.reloadData()
                            self.Bydefaultsvalueis =  self.BrandsidbrandIdstring[0]
                            self.TopBasedonidTotal()
                        }
                       
                    }
                }
                break
            case .failure(_):
                break
            }
     
        }
    }
    func TopBasedonidTotal()
    {
        
        print(self.deafultscatvalueString)
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let defaults = UserDefaults.standard
        if let Myagentidfinal:String = defaults.value(forKey:"MyLoginfinalvalue")as?String
        {
            self.Homeuseridstringvalue = Myagentidfinal
        }
        if let Reviewfinaluseroid:String = defaults.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
 
        if clickedbrandstring == "samplebrandcollectionview"
        {
            var myString = String(currentPage)

            clikedstringfinalvalue = "samplebrandis"
            if self.Bydefaultsvalueis.count > 0
            {
            postStringfinalvalue =  String(format: "method=%@&userid=%@&categoryid=%@&brandid=%@&pagesize=%@&pageno=%@searchString=%@&barcode=%@","getProductsList", self.Homeuseridstringvalue,self.Bydefaultsvalueis,self.TopBrandidSingelvalue,"8",myString,"h","0")
            }
            else{
                postStringfinalvalue =  String(format: "method=%@&userid=%@&categoryid=%@&brandid=%@&pagesize=%@&pageno=%@searchString=%@&barcode=%@","getProductsList", self.Homeuseridstringvalue,self.NewBrnsidindividual,self.TopBrandidSingelvalue,"8",myString,"h","0")
            }
            
        }
      
        else{
            if clickedCatageorystring == "clickedcaatgeoryvalue"
            {
                var myString = String(currentPage)
                if self.Bydefaultsvalueis.count > 0
                {
                    print(self.BrandsidbrandIdstring[0])
                    postStringfinalvalue =  String(format: "method=%@&userid=%@&categoryid=%@&brandid=%@&pagesize=%@&pageno=%@searchString=%@&barcode=%@","getProductsList", self.Homeuseridstringvalue,Topcatageorysingelvalue,self.BrandsidbrandIdstring[0],"8",myString,"h","0")
                    print(postStringfinalvalue)
                }
                else{
                    
                    print(self.Newcatidstringvalueone)
                    
                    postStringfinalvalue =  String(format: "method=%@&userid=%@&categoryid=%@&brandid=%@&pagesize=%@&pageno=%@searchString=%@&barcode=%@","getProductsList", self.Homeuseridstringvalue,Topcatageorysingelvalue,Newcatidstringvalueone,"8",myString,"h","0")
                }
                
            }
            if catageorybuttonvalue == "catageorybuttonvalue"
            {
                
                
                if self.deafultscatvalueString == "defaults123"
                {
                    var myString = String(currentPage)
                    postStringfinalvalue =  String(format: "method=%@&userid=%@&categoryid=%@&brandid=%@&pagesize=%@&pageno=%@searchString=%@&barcode=%@","getProductsList", self.Homeuseridstringvalue,self.deafultscatageoryidstring,self.Newcatidstringvalueone,"8",myString,"h","0")
                }
                else
                {
                    var myString = String(currentPage)
              postStringfinalvalue =  String(format: "method=%@&userid=%@&categoryid=%@&brandid=%@&pagesize=%@&pageno=%@searchString=%@&barcode=%@","getProductsList", self.Homeuseridstringvalue,self.deafultscatageoryidstring,self.BrandsidbrandIdstring[0],"8",myString,"h","0")
                }
            }
            if brandbuttonvalue == "brandbuttonvalue"
            {
            if self.deafultsBrandvalueString == "brandbuttonvalues"
                {
                var myString = String(currentPage)
        postStringfinalvalue =  String(format: "method=%@&userid=%@&categoryid=%@&brandid=%@&pagesize=%@&pageno=%@searchString=%@&barcode=%@","getProductsList", self.Homeuseridstringvalue,self.NewBrnsidindividual,self.defaultsBrandidstring,"8",myString,"h","0")
            }
            else
                {
                var myString = String(currentPage)
            postStringfinalvalue =  String(format: "method=%@&userid=%@&categoryid=%@&brandid=%@&pagesize=%@&pageno=%@searchString=%@&barcode=%@","getProductsList", self.Homeuseridstringvalue, self.BrandsidbrandIdstring[0],self.defaultsBrandidstring,"8",myString,"h","0")
                }
            }

            if exploreBrnadscliked == "exploreBrnadscliked"
            {
                
                if self.deafultsBrandvalueString.count > 0
                {
                  
                    var myString = String(currentPage)
            postStringfinalvalue =  String(format: "method=%@&userid=%@&categoryid=%@&brandid=%@&pagesize=%@&pageno=%@searchString=%@&barcode=%@","getProductsList", self.Homeuseridstringvalue,  self.Bydefaultsvalueis,explorecatageoryidsingelstring,"8",myString,"h","0")
                    print(postStringfinalvalue)
                    demobarnd = "demobarnd"
                    print(demobarnd)
                }
                else
                {
                    demobarnd = "demobarndtwo"
                    print(demobarnd)
                    var myString = String(currentPage)
            postStringfinalvalue =  String(format: "method=%@&userid=%@&categoryid=%@&brandid=%@&pagesize=%@&pageno=%@searchString=%@&barcode=%@","getProductsList", self.Homeuseridstringvalue,self.NewBrnsidindividual,  self.explorecatageoryidsingelstring,"8",myString,"h","0")
                }
                
            }
          
        if explorecatageorcliked == "explorecatageorcliked"
        {
            if self.deafultscatvalueString.count > 0
            {
                var myString = String(currentPage)
                print(explorecatageoryidsingelstring)
            postStringfinalvalue =  String(format: "method=%@&userid=%@&categoryid=%@&brandid=%@&pagesize=%@&pageno=%@searchString=%@&barcode=%@","getProductsList",self.Homeuseridstringvalue,self.Newcatidstringvalueone,self.exploreBrandsidsingelstring,"8",myString,"h","0")
                print(postStringfinalvalue)
                
//                  self.Newcatidstringvalueone
            }
            else{
                var myString = String(currentPage)
                print(self.Newcatidstringvalueone)
        postStringfinalvalue =  String(format: "method=%@&userid=%@&categoryid=%@&brandid=%@&pagesize=%@&pageno=%@searchString=%@&barcode=%@","getProductsList",self.Homeuseridstringvalue, self.exploreBrandsidsingelstring,self.Newcatidstringvalueone,"8",myString,"h","0")
                
               
            }
        }
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
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    
                    print(dict)

                    if let dictfinal:NSArray = dict.value(forKey:"prd_list") as? NSArray
                    {
                        self.secondNewproductLauncharray = dictfinal
                    }
                    
                    
                    if self.secondNewproductLauncharray.count > 0
                    {
                        self.brandsviewtwofinalvalue.isHidden = true
                        self.catviewtwofinalvalue.isHidden = true

                        self.NewBrandtabelview.isHidden = false
                        self.Newcattabelview.isHidden = false
                        print(self.secondNewproductLauncharray)
                    self.SecondNEwproductIMage = self.secondNewproductLauncharray.value(forKey:"image")as![String]

                        if let Reviewid:String = self.secondNewproductLauncharray.value(forKey: "margin")as?String
                        {
                            self.SecondproductofferMargin.append(Reviewid)
                        }
                        else
                        {
                            self.SecondproductofferMargin.append("20")
                        }
                        
                        print(self.SecondproductofferMargin)
                        
                        print(self.SecondproductofferMargin)
                        
                        
                        self.SecondNEwproductItems  = self.secondNewproductLauncharray.value(forKey:"name")as![String]
                        
                        print(self.SecondNEwproductItems.count)
                        
                        self.SecondNewproductoutlets = self.secondNewproductLauncharray.value(forKey:"price")as![String]
                        self.SecondNewproductsMrpstack = self.secondNewproductLauncharray.value(forKey:"MRP")as![String]
self.SecondNewproductsInstack = self.secondNewproductLauncharray.value(forKey:"available_qty_disp")as![String]
   
                        if let SecondNewavailable_qtybrandfinalvalue:[String] = self.secondNewproductLauncharray.value(forKey: "available_qty") as? [String] {
                            self.SecondNewavailable_qtybrand = SecondNewavailable_qtybrandfinalvalue
                        }
                        
                        
                self.BrandMOquantity = self.secondNewproductLauncharray.value(forKey:"moq_calc")as![String]
                        
                        self.SecondNewproductsoffTakeDisplay = self.secondNewproductLauncharray.value(forKey:"off_take_display")as![String]
                        
                        
                        
                    self.SecondNewproductdays = self.secondNewproductLauncharray.value(forKey:"off_take")as![String]
                        
                      self.SecondNewproductCODDisplay = self.secondNewproductLauncharray.value(forKey:"cod_display")as![String]
                        
                        
                        self.cashBackfinal = self.secondNewproductLauncharray.value(forKey:"cash_back")as![String]
                        self.SecondNewproductlabelMrp = self.secondNewproductLauncharray.value(forKey:"weight_mrp")as![String]
                self.SecondAvailabelQuantity = self.secondNewproductLauncharray.value(forKey:"user_qty")as![String]
                        self.SecondProductidValue = self.secondNewproductLauncharray.value(forKey:"prodId")as![String]
                        self.favouritesecondvalue = self.secondNewproductLauncharray.value(forKey:"fav")as![String]
          
                        print(self.demobarnd)
                        
                        if let NewproductexlImage:[String] = self.secondNewproductLauncharray.value(forKey:"exclusive")as?[String]
                        {
                            self.SecondProductExculise = NewproductexlImage
                        }
        self.Branduserquantity = self.secondNewproductLauncharray.value(forKey:"user_qty")as![String]
                           self.Branduserweight_mrp = self.secondNewproductLauncharray.value(forKey:"weight_mrp")as![String]

                        if let secondNewmarginlabelvaluefinalTotal:[String] = self.secondNewproductLauncharray.value(forKey:"margin")as?[String]
                        {
                            self.secondNewmarginlabelvaluefinal = secondNewmarginlabelvaluefinalTotal
                        }
                        
                    
                            if self.clickedbrandstring == "samplebrandcollectionview"
                            {
                                self.NewBrandtabelview.reloadData()
                            }
                        
                            if self.brandbuttonvalue == "brandbuttonvalue"
                            {
                                self.NewBrandtabelview.reloadData()
                            }
                            if  self.catageorybuttonvalue == "catageorybuttonvalue"
                            {
                                self.Newcattabelview.reloadData()
                                
                            }
                            if self.clickedCatageorystring == "clickedcaatgeoryvalue"
                            {
                                self.Newcattabelview.reloadData()
                            }
                        
                        if self.explorecatageorcliked == "explorecatageorcliked"
                                {
                                    self.Newcattabelview.reloadData()
                            }
                        if self.exploreBrnadscliked == "exploreBrnadscliked"
                        {
                            self.NewBrandtabelview.reloadData()
                            
                        }

                    }
                    else{
                        if self.secondNewproductLauncharray.count == 0
                        {
                        self.NewBrandtabelview.isHidden = true
                       self.Newcattabelview.isHidden = true
                       self.brandsviewtwofinalvalue.isHidden = false
                       self.catviewtwofinalvalue.isHidden = false
                    }
                }
                }
                break
            case .failure(_):
                break
            }
        }
    }

    func Homecall()
    {
        let defaultsTotal = UserDefaults.standard
        if let Bulkarrayfinal:String = defaultsTotal.value(forKey: "Combopage1") as? String
        {
            DispatchQueue.main.async {
                self.removeSpinner()
            }
        }
        else
        {
            DispatchQueue.main.async {
                self.Loadingaimegfinalvalue.isHidden = false
            }
        }
        var request = URLRequest(url: URL(string:AgentConstants.baseUrltwo)!)
        request.httpMethod = "POST"
        let defaulst = UserDefaults.standard
    if let Reviewfinaluseroid:String = defaulst.value(forKey:"MyLoginfinalvalue")as?String
        {
            self.useridbiling = Reviewfinaluseroid
        }
    if let Reviewfinaluseroid:String = defaulst.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaulst.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        let postString =  String(format: "method=%@&userid=%@&app=%@","landingPage",self.useridbiling,"IOS")
        print(postString)
        request.httpBody = postString.data(using: .utf8)
        request.addValue(AcessTokenfinalstring, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
//        request.addValue("application/form-data", forHTTPHeaderField: "Content-Type")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                if let dict:NSDictionary = response.result.value as? NSDictionary
                {
                    DispatchQueue.main.async {
                        self.removeSpinner()
                        DispatchQueue.main.async
                            {
                            self.Loadingaimegfinalvalue.isHidden = true
                         }
                        self.veryalertview.isHidden = true
                    }
                    print("dictvalue is",dict)
                    
                    
            if let cart_Countvaluefinal:NSArray = dict.value(forKey: "AllBrands") as? NSArray
                    {
                        self.allBrandsarray = cart_Countvaluefinal
                        if self.allBrandsarray.count > 0
                        {
                              if let Explorecatageory_itemfinal:[String] = self.allBrandsarray.value(forKey: "name") as? [String]
                            
                              {
                                 self.Explorecatageory_item = Explorecatageory_itemfinal
                            }
                            
                            if let ExploreBrand_imagefinal:[String] = self.allBrandsarray.value(forKey: "image_path") as? [String]
                                
                            {
                                self.ExploreBrand_image = ExploreBrand_imagefinal
                            }
                            
                            if let ExploreBrandsidstringfinal:[String] = self.allBrandsarray.value(forKey: "id") as? [String]
                                
                            {
                                self.ExploreBrandsidstring = ExploreBrandsidstringfinal
                            }
                        }
                     
                    }
                    if let Descriptionfinal: NSArray = dict.value(forKey:"AllCategories") as? NSArray
                    {
                        self.Explorecatageoryarray = Descriptionfinal
                    }

                    self.ExplorecatgeoryName = self.Explorecatageoryarray.value(forKey:"name") as! [String]
                    self.Explorecatageoryiamge = self.Explorecatageoryarray.value(forKey:"image_path") as! [String]
                    self.Explorecatageoryidstring  = self.Explorecatageoryarray.value(forKey:"id") as! [String]
                    
                    self.ExplorecatageoryNewstring  = self.Explorecatageoryarray.value(forKey:"isNew") as! [String]

                    for string in  self.ExplorecatgeoryName {
                        if let letter = (string ).first {
                            self.ExplorecatageoryLettersArray.append(String(letter))
                        }
                    }
                    self.ExplorecatageoryLettersArray = Array(Set(self.ExplorecatageoryLettersArray))
                    self.ExplorecatageoryLettersArray = self.ExplorecatageoryLettersArray.sorted { ($0 as AnyObject).localizedCaseInsensitiveCompare($1 ) == ComparisonResult.orderedAscending }
               self.ExplorecatageoryLettersArray = [""]
                self.ExplorecatageoryLettersArray = ["1","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
                    
                    if let Bannerarryfinal:NSArray = dict.value(forKey:"BannersArray") as? NSArray
                    {
                        self.Bannerarry = Bannerarryfinal
                        self.Bannerarryimagestring = self.Bannerarry.value(forKey:"offerbanner") as! [String]
                        
                        print(self.Bannerarryidstring)
                        
                        if let Bannerarryidstringfinal:[String] = self.Bannerarry.value(forKey:"ProductId") as? [String]
                        {
                            self.Bannerarryidstring = Bannerarryidstringfinal
                        }
                    }
                    
//                    self.Bannerarry = dict.value(forKey:"BannersArray")as!NSArray
                    
                if let arrayBranded: NSArray = dict.value(forKey:"TopBrands") as? NSArray{
                        self.TopBrandarray = arrayBranded
                    }
                    self.TopBrandidvalue = self.TopBrandarray.value(forKey:"id") as! [String]
                    print(self.TopBrandidvalue)
                    
                    self.TopBrandimage = self.TopBrandarray.value(forKey:"image_path") as! [String]
                    self.TopBrandName = self.TopBrandarray.value(forKey:"name") as! [String]
                    
                    if let arrayTopCat: NSArray = dict.value(forKey:"TopCategories") as? NSArray{
                        self.Topcatageoryfinal = arrayTopCat
                    }
                    
                    self.Itemimagefinal = self.Topcatageoryfinal.value(forKey:"image_path") as! [String]
                    self.TopcatageoryItemsfinal = self.Topcatageoryfinal.value(forKey:"name") as! [String]
                    
                    
                    self.Topcatageorysingleidvalueis = self.Topcatageoryfinal.value(forKey:"id") as! [String]
                    
                    if let arrayTTBrands: NSArray = dict.value(forKey:"AllBrands")as? NSArray{
                        self.allBrandsarray = arrayTTBrands
                    }
                    
                    print(self.allBrandsarray)
                    
                    self.exploreBrandsNamearry = self.allBrandsarray.value(forKey: "name") as! [String]
                    self.exploreBrandsImagepatharry = self.allBrandsarray.value(forKey: "image_path") as! [String]
                    
                    self.exploreBrandsidpatharry =  self.allBrandsarray.value(forKey: "id") as! [String]
                    
                    
                    print(self.exploreBrandsidpatharry)
                    self.exploreBrandsNewpatharry =  self.allBrandsarray.value(forKey: "isNew") as! [String]
                    
                    for string in  self.exploreBrandsNamearry {
                        if let letter = (string as! String).first {
                            self.ExploreLettersArray.append(String(letter))
                        }
                    }
              
                    self.ExploreLettersArray = Array(Set(self.ExploreLettersArray))
                    
                    
                    self.ExploreLettersArray = self.ExploreLettersArray.sorted { ($0 as AnyObject).localizedCaseInsensitiveCompare($1 as! String) == ComparisonResult.orderedAscending }
                    
                    
                    self.ExploreLettersArray = [""]
                    
                        self.ExploreLettersArray = ["1","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
                    
                    self.Topproduct_dealsstruck = self.FrequentlyProductsonly.value(forKey:"MRP")as![String]
                    self.Topproduct_Dealspercentage =       self.FrequentlyProductsonly.value(forKey:"margin")as![String]
                    self.instock = self.FrequentlyProductsonly.value(forKey:"available_qty_disp")as![String]
                    
                    self.offTakeDisplay = self.FrequentlyProductsonly.value(forKey:"offtake_display")as![String]
                    
                    self.days = self.FrequentlyProductsonly.value(forKey:"off_take")as![String]
                    
                    if let sold_filledbydiscriptionarrayfinalvalue: NSArray  =  dict.value(forKey: "top") as? NSArray
                    {
                       self.FrequentlyProducts = sold_filledbydiscriptionarrayfinalvalue
                        
                        
                        let TodayDealsProductssingel = self.FrequentlyProducts[0]as!NSDictionary
                        
                        self.TodayProducts  = TodayDealsProductssingel.value(forKey:"name")as!String
                        
                        print(self.TodayProducts)
                        self.TodayProductsimageHome  = TodayDealsProductssingel.value(forKey:"imagePath")as!String
                        self.TodayDealsProducts = TodayDealsProductssingel.value(forKey:"data") as! NSArray
                        self.TodayDealProductimage = self.TodayDealsProducts.value(forKey:"image_path")as![String]
                        self.TodayDealProductItems  = self.TodayDealsProducts.value(forKey:"prod_name")as![String]
                        
                        self.TodayProductsid  = self.TodayDealsProducts.value(forKey:"prodId")as![String]
                        print(self.TodayProductsid)
                        self.TodayDealProductItemsprice = self.TodayDealsProducts.value(forKey:"price")as![String]
                        
                        print(self.RecomendedProductItemsprice)
                        
                        self.TodayDealinstock = self.TodayDealsProducts.value(forKey:"MRP")as![String]
                        
                        print(self.Recomendedsstruck)
                        
                        if let Today_Dealspercentageidvalue:[String] = self.TodayDealsProducts.value(forKey:"margin") as? [String]
                        {
                            self.Today_Dealspercentage = Today_Dealspercentageidvalue
                        }

                        self.TodayDealProductoffTakeDisplay = self.TodayDealsProducts.value(forKey:"offtake_display")as![String]
                        print(self.RecomendedProductoffTakeDisplay)
                        
                        self.TodayDealProductdays = self.TodayDealsProducts.value(forKey:"off_take")as![String]
                        print(self.RecomendedProductdays)
                        self.todaydealsstacklabel = self.TodayDealsProducts.value(forKey:"available_qty_disp")as![String]
                        
                        self.TodaydealavailableQnty = self.TodayDealsProducts.value(forKey:"avail_qty")as![String]
                        self.TodaydealSellerID = self.TodayDealsProducts.value(forKey:"user_qty")as![String]
                        self.TodaydealMoQCal = self.TodayDealsProducts.value(forKey:"moq_calc")as![String]
                        
                        
                        if let TodayspecialofferNamefinal:[String] = self.TodayDealsProducts.value(forKey: "specialOffers") as? [String]
                        {
                            self.Todayspecialoffer = TodayspecialofferNamefinal
                        }
                       
                        if let ComboNamefinal:String = dict.value(forKey: "combo") as? String
                        {
                            self.ComboName = ComboNamefinal
                        }
                        
                        if self.TodayProducts == "TodayDeals"
                        {
                            if let dealEndtimefinalvalue:Int = TodayDealsProductssingel.value(forKey: "expire") as? Int {
                                self.dealEndtime = dealEndtimefinalvalue
                            }
                        }
                        if self.dealEndtime > 0
                        {
                            self.NewTimerlabel.text = self.stringFromTimeInterval(interval: TimeInterval(self.dealEndtime)) as String
                        }
                        else
                        {
                            self.todaydelasfinalvalueis.isHidden = true
                        }
                 
                        let RecomendedProductssingel = self.FrequentlyProducts[1]as!NSDictionary
                        self.Recomendedname  = RecomendedProductssingel.value(forKey:"name")as!String
                        print(self.Recomendedname)
                        self.RecomendediamgeHome = RecomendedProductssingel.value(forKey:"imagePath")as!String
                        self.RecomendedProducts = RecomendedProductssingel.value(forKey:"data") as! NSArray
                        self.RecomendedProductimage = self.RecomendedProducts.value(forKey:"image_path")as![String]
                        self.RecomendedProductItems  = self.RecomendedProducts.value(forKey:"prod_name")as![String]
                        self.RecomendedProductId  = self.RecomendedProducts.value(forKey:"prodId")as![String]
                        self.RecomendedProductItemsprice = self.RecomendedProducts.value(forKey:"price")as![String]
                        print(self.RecomendedProductItemsprice)
                        self.Recomendedsstruck = self.RecomendedProducts.value(forKey:"MRP")as![String]
                        self.Recomendedinstock = self.RecomendedProducts.value(forKey:"available_qty_disp")as![String]
                        self.RecomendedinsPercentage = self.RecomendedProducts.value(forKey:"margin")as![String]
                        self.RecomendedProductoffTakeDisplay = self.RecomendedProducts.value(forKey:"offtake_display")as![String]
                        self.RecomendedProductdays = self.RecomendedProducts.value(forKey:"off_take")as![String]
                        self.RecomendedavailableQnty = self.RecomendedProducts.value(forKey: "avail_qty")as![String]
                        self.RecomendedMoQCal = self.RecomendedProducts.value(forKey: "moq_calc") as! [String]
                        self.RecomendedSellerID = self.RecomendedProducts.value(forKey:"user_qty")as![String]
                        
                        if let RecomendedspecialofferNamefinal:[String] = self.RecomendedProducts.value(forKey: "specialOffers") as? [String]
                        {
                            self.Recomendedspecialoffer = RecomendedspecialofferNamefinal
                        }
                        
                        
                    }
               
                    if self.FrequentlyProducts.count > 2
                    {
                        let TrendingProductssingel = self.FrequentlyProducts[2]as!NSDictionary
                        self.TrendingproductName  = TrendingProductssingel.value(forKey:"name")as!String
                        print(self.TrendingproductName)
                        self.TrendingProducts = TrendingProductssingel.value(forKey:"data") as! NSArray
                        print(self.TrendingProducts)
                        
                        self.TrendingProductimage = self.TrendingProducts.value(forKey:"image_path")as![String]
                        
                        self.TrendingProductItems  = self.TrendingProducts.value(forKey:"prod_name")as![String]
                        
                        self.TrendingProductItemsprice = self.TrendingProducts.value(forKey:"price")as![String]
                        print(self.TrendingProductItemsprice)
                        self.Trendingproductidvalue = self.TrendingProducts.value(forKey:"prodId")as![String]
                        self.Trendinginstock = self.TrendingProducts.value(forKey:"available_qty_disp")as![String]
                        
                        if let Trending_dealsstruckfianlvalue:[String] = self.TrendingProducts.value(forKey:"MRP")as![String]
                        {
                             self.Trending_dealsstruck = Trending_dealsstruckfianlvalue
                        }
                        self.Trending_Dealspercentage = self.TrendingProducts.value(forKey:"margin")as![String]
                        
                        self.TrendingProductoffTakeDisplay = self.TrendingProducts.value(forKey:"available_qty_disp")as![String]
                        
                        self.TrendingProductoffTakeDisplay = self.TrendingProducts.value(forKey:"offtake_display")as![String]
                        
                        print(self.TrendingProductoffTakeDisplay)
                        self.TrendingProductdays = self.TrendingProducts.value(forKey:"off_take")as![String]

                        if let TrendingspecialofferNamefinal:[String] = self.TrendingProducts.value(forKey: "specialOffers") as? [String]
                        {
                            self.Trendingspecialoffer = TrendingspecialofferNamefinal
                        }
                        
                        self.TrendingavailableQnty = self.TrendingProducts.value(forKey: "avail_qty")as![String]
                        self.TrendingMoQCal = self.TrendingProducts.value(forKey: "moq_calc") as! [String]
                        self.TrendingSellerID = self.TrendingProducts.value(forKey:"user_qty") as! [String]
                        
                    }
              
                    if self.FrequentlyProducts.count > 3
                    {
                        let Newproductcolletcion = self.FrequentlyProducts[3]as!NSDictionary
                        self.NewproductName12 = Newproductcolletcion.value(forKey:"name") as! String
                        self.NewproductLauncharray = Newproductcolletcion.value(forKey:"data") as! NSArray
                        print( self.NewproductLauncharray)
                        self.NEwproductItems  = self.NewproductLauncharray.value(forKey:"prod_name")as![String]
                        self.NEwproductIMage  = self.NewproductLauncharray.value(forKey:"image_path")as![String]
                        self.Newproductoutlets = self.NewproductLauncharray.value(forKey:"price")as![String]
                        self.Newproduct_dealsstruck = self.NewproductLauncharray.value(forKey:"MRP")as![String]
                    self.NewproductsInstack = self.NewproductLauncharray.value(forKey:"available_qty_disp")as![String]

                        if let Newproduct_Dealspercentagevalue:[String] = self.NewproductLauncharray.value(forKey:"margin") as? [String]
                        {
                            self.Newproduct_Dealspercentage = Newproduct_Dealspercentagevalue
                        }
                        
                        
                        
                self.NewproductsoffTakeDisplay = self.NewproductLauncharray.value(forKey:"offtake_display")as![String]
                        self.Newproductdays = self.NewproductLauncharray.value(forKey:"off_take")as![String]
                        
                        self.Newproductidvalue = self.NewproductLauncharray.value(forKey:"prodId")as![String]
                        
                        self.Newproductuserquantity = self.NewproductLauncharray.value(forKey:"user_qty")as![String]
                        
                        
                        self.NewproductavailQnty = self.NewproductLauncharray.value(forKey:"avail_qty")as![String]
                        self.NewproductSellerID = self.NewproductLauncharray.value(forKey:"user_qty")as![String]
                        self.NewproductMoQCal = self.NewproductLauncharray.value(forKey: "moq_calc") as! [String]

                        if let NewproductspecialofferNamefinal:[String] = self.NewproductLauncharray.value(forKey: "specialOffers") as? [String]
                        {
                            self.Newproductspecialoffer = NewproductspecialofferNamefinal
                        }
                        
                     
                    }
                    
                    
                    if self.FrequentlyProducts.count > 4
                    {
                        let Newproductcolletcion1 = self.FrequentlyProducts[4]as!NSDictionary
                        self.freNewproductName12 = Newproductcolletcion1.value(forKey:"name") as! String
                        print(self.freNewproductName12)
                        self.freNewproductLauncharray = Newproductcolletcion1.value(forKey:"data") as! NSArray
                        self.freNEwproductItems  = self.freNewproductLauncharray.value(forKey:"prod_name")as![String]
                        print(self.freNEwproductItems)

                        self.freNEwproductIMage  = self.freNewproductLauncharray.value(forKey:"image_path")as![String]
                        print(self.freNEwproductIMage)

                        self.freNewproductoutlets = self.freNewproductLauncharray.value(forKey:"price")as![String]
                        self.freNewproduct_dealsstruck = self.freNewproductLauncharray.value(forKey:"MRP")as![String]
                        self.freNewproductsInstack = self.freNewproductLauncharray.value(forKey:"available_qty_disp")as![String]
                        self.freNewproduct_Dealspercentage = self.freNewproductLauncharray.value(forKey:"margin")as![String]
                        self.freNewproductsoffTakeDisplay = self.freNewproductLauncharray.value(forKey:"offtake_display")as![String]
                        self.freNewproductdays = self.freNewproductLauncharray.value(forKey:"off_take")as![String]
                         self.freNewproductidvalue = self.freNewproductLauncharray.value(forKey:"prodId")as![String]
                        
                        
                        self.freNewproductavailQnty = self.freNewproductLauncharray.value(forKey: "avail_qty")as![String]
                        self.freNewproductMoQCal = self.freNewproductLauncharray.value(forKey: "moq_calc")as![String]
                        self.freNewproductSellerID = self.freNewproductLauncharray.value(forKey:"user_qty")as![String]
                
                        if let FrequentlyboughtproductsspecialofferNamefinal:[String] = self.freNewproductLauncharray.value(forKey: "specialOffers") as? [String]
                        {
                            self.Frequentlyboughtproductsspecialoffer = FrequentlyboughtproductsspecialofferNamefinal
                        }
                    
                    }
             
                    if self.expireTimetodayvalue.intValue > 0
                    {
                        let millisecondsTwo : double_t =  self.ratingDouble;
                        print(millisecondsTwo)
                        let ti = NSInteger(millisecondsTwo)
                        let ms = ti * 1000
                        
                        let seconds = ti % 60
                        let minutes = (ti / 60) % 60
                        let hours = (ti / 3600000)
                        
                        
                       
                        let valuetwo = String(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds,ms)
                        print(valuetwo)
                        let string = valuetwo
                        self.NewTimerlabel.text = valuetwo as String
                        let myString1 = valuetwo
                        print(myString1)
                        self.demotwovalue  = valuetwo
                 
                        
                        self.timertwo = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
                        
                        
                    }
                    if let Descriptionfinal: NSArray = dict.value(forKey:"AllCategories") as? NSArray
                    {
                        self.allcatageoryarray = Descriptionfinal
                    }
                    DispatchQueue.main.async
                        {
                        if self.FrequentlyProducts.count == 2
                        {
                                self.todaydelasfinalvalueis.isHidden = true
                                self.viewhomefour.isHidden = true
                                 self.viewHomefive.isHidden = true
                                 self.viewHomethree.isHidden = true
                                self.viewsix.frame = CGRect(x:self.viewsix.frame.origin.x, y:self.viewHomethree.frame.origin.y, width:self.viewsix.frame.size.width, height:self.viewsix.frame.size.height)
                                self.viewseven.frame = CGRect(x:self.viewseven.frame.origin.x, y:self.viewhomefour.frame.origin.y+50, width:self.viewseven.frame.size.width, height:self.viewseven.frame.size.height)
                                self.Homescrollview.contentSize = CGSize(width: self.view.frame.size.width, height:2530)
                                self.MyTodaydeals.text = "Recommended Products"
                            let url1 = URL(string: self.TodayProductsimageHome)
                            let urltwo = URL(string: self.RecomendediamgeHome)
                        }

                        if self.FrequentlyProducts.count == 3
                        {
                         
                                self.todaydelasfinalvalueis.isHidden = true
                                self.viewhomefour.isHidden = false
                                self.viewsix.frame = CGRect(x:self.viewsix.frame.origin.x, y:self.viewhomefour.frame.origin.y, width:self.viewsix.frame.size.width, height:self.viewsix.frame.size.height)
                                self.viewseven.frame = CGRect(x:self.viewseven.frame.origin.x, y:self.viewHomefive.frame.origin.y+50, width:self.viewseven.frame.size.width, height:self.viewseven.frame.size.height)
                                self.Homescrollview.contentSize = CGSize(width: self.view.frame.size.width, height:2735)
                                self.MyTodaydeals.text = "Recommended Products"
                        }
                        
                        if self.FrequentlyProducts.count == 4
                        {
                       
                                self.viewhomefour.isHidden = false
                                self.viewsix.frame = CGRect(x:self.viewsix.frame.origin.x, y:self.viewHomefive.frame.origin.y, width:self.viewsix.frame.size.width, height:self.viewsix.frame.size.height)
                                self.viewseven.frame = CGRect(x:self.viewseven.frame.origin.x, y:self.viewsix.frame.origin.y+260, width:self.viewseven.frame.size.width, height:self.viewseven.frame.size.height)
                                self.Homescrollview.contentSize = CGSize(width: self.view.frame.size.width, height:2975)
                                self.Newproductcollectionview.reloadData()
                                
                            
                        }
                        
                        if self.FrequentlyProducts.count == 5
                        {
                            self.Homescrollview.contentSize = CGSize(width: self.view.frame.size.width, height:3225)
                            self.Topproductcolectionview.reloadData()
                        }
                      
                        self.loadScrollView()
                        self.TopBrandcollectionview.reloadData()
                        self.topcatageorycollectionview.reloadData()
                        self.Topproductcolectionview.reloadData()
                        self.Homecollectionview.reloadData()
                        self.Recomendedcollectionview.reloadData()
                        self.Trendingproductcollectionview.reloadData()
                        self.Newproductcollectionview.reloadData()
                        self.CatExplorebrandscollectionview.reloadData()
                        self.abcdcollectionview.reloadData()
                        self.Explorebrandscollectionview.reloadData()
                        self.Catabcdcollectionview.reloadData()
                        
                        self.MyTodaydeals.text = self.TodayProducts
                        self.recomendeHomeall.text = self.Recomendedname
                        self.Newproductall.text = self.NewproductName12
                        self.TrendingproductHomeall.text = self.TrendingproductName
                        print(self.Newproduct_dealsstruck)
                    }
                }
                break
            case .failure(_):
                
                DispatchQueue.main.async {
                    self.removeSpinner()
                    self.veryalertview.isHidden = true
                }
                break
            }
        }
    }
    @objc func updateTimer()
    {
        self.NewTimerlabel.text = String(self.demotwovalue)
        ratingDouble = self.expireTimetodayvalue as! Double
        let millisecondsTwo : double_t =  ratingDouble;
        let ti = NSInteger(millisecondsTwo)
        var ms = ti * 1000
        var seconds = ms % 60
        if seconds != 0
        {
           seconds -= 1
            let minutes = (ti / 1000)  / 60
            let hours = (minutes/60)
            let valuetwo = String(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds,ms)
            self.NewTimerlabel.text = valuetwo as String
        }
        else
        {
            if let timer = self.timersineglvalue
            {
                timer.invalidate()
                self.timersineglvalue = nil
            }
        }
        self.timertwo = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
    }
 
    func Favouritecallfunction()
    {
        DispatchQueue.main.async
            {
                self.favoiuriteimagetwo.isHidden = false
        }
        let defaulst = UserDefaults.standard
        if let Reviewfinaluseroid:String = defaulst.value(forKey: "MyLoginfinalvalue")as?String
        {
            self.useridbiling = Reviewfinaluseroid
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
        
        let postString12 = String(format: "method=%@&userid=%@&fav=%@","getProductsList",self.useridbiling,"1")
        print(postString12)
        
        request.httpBody = postString12.data(using: .utf8)
        request.addValue(self.AcessTokenfinalstring, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                
                if let dict:NSDictionary = response.result.value as? NSDictionary {
                    print(dict)
                    DispatchQueue.main.async
                        {
                            self.favoiuriteimagetwo.isHidden = true
                    }
                    self.favouritelaunchDict11 = dict.value(forKey:"prd_list") as! NSDictionary
                    
                    let RecomendedProductssingel = self.favouritelaunchDict11
                    
                    self.FavouriteBrandsString = RecomendedProductssingel.value(forKey:"Brands") as! NSArray
                    print(self.FavouriteBrandsString)

                    self.FavouriteTrendingString = RecomendedProductssingel.value(forKey:"Brands") as! NSArray
                    print(self.FavouriteTrendingString)

                    self.FavouriteAllString = RecomendedProductssingel.value(forKey:"Favorites") as! NSArray
                    print(self.FavouriteAllString)

                    self.cartListmuetabelarrayone.addObjects(from:self.FavouriteAllString as! [Any])
                    self.cartListmuetabelarraytwo.addObjects(from:self.FavouriteTrendingString as! [Any])
                    
                    print(self.cartListmuetabelarrayone)
                    print(self.cartListmuetabelarraytwo)
                    
                    self.FavouriteBrandsString1 = self.FavouriteBrandsString.value(forKey:"brand_name") as! [String]
                    if self.FavouriteAllString.count == 0
                    {
                        self.Agentfavouritescrollview.isHidden = false
                        self.Agentsfavouritietwo.isHidden = false
                        self.favouritetabelview.isHidden = true
                        self.viewfavouriteone.isHidden = false
                    }
                    if self.favouritelaunchDict11.count > 0
                    {
                        if self.FavouriteAllString.count > 0
                        {
                            self.Agentsfavouritietwo.isHidden = true
                            
                            self.favSecondNEwproductIMage = self.FavouriteAllString.value(forKey:"image")as![String]
                            
                    //  self.favSecondproductofferMargin = self.FavouriteAllString.value(forKey:"margin")as![String]
                            
                            
                            if let favSecondNewproductsmarginstackfinalvalue:[String] = self.FavouriteAllString.value(forKey:"margin")as?[String]
                            {
                                self.favSecondproductofferMargin = favSecondNewproductsmarginstackfinalvalue
                            }
                       
                            self.favSecondNEwproductItems = self.FavouriteAllString.value(forKey:"name")as![String]
                            
                            self.favSecondNewproductoutlets = self.FavouriteAllString.value(forKey:"price")as![String]
                            
                            
                            if let favSecondNewproductsMrpstackfinalvalue:[String] = self.FavouriteAllString.value(forKey:"MRP")as?[String]
                            {
                                self.favSecondNewproductsMrpstack = favSecondNewproductsMrpstackfinalvalue
                            }
                            
                            self.favSecondNewproductsInstack = self.FavouriteAllString.value(forKey:"available_qty_disp")as![String]
                            
                            self.favSecondNewproductsoffTakeDisplay = self.FavouriteAllString.value(forKey:"off_take_display")as![String]
                            self.favSecondNewproductdays = self.FavouriteAllString.value(forKey:"off_take")as![String]
                            self.favouritecashBackfinal = self.FavouriteAllString.value(forKey:"cash_back")as![String]
                            self.favSecondNewproductCODisplay = self.FavouriteAllString.value(forKey:"cod_display")as![String]
                            
                            self.favSecondNewproductlabelMrp = self.FavouriteAllString.value(forKey:"weight_mrp")as![String]
                            self.favSecondAvailabelQuantity = self.FavouriteAllString.value(forKey:"user_qty")as![String]
                            
                            self.favSecondProductidValue = self.FavouriteAllString.value(forKey:"prodId")as![String]
                            
                            self.favfavouritesecondvalue = self.FavouriteAllString.value(forKey:"fav")as![String]
                            self.favSecondavalQnty = self.FavouriteAllString.value(forKey:"available_qty")as![String]
                            
                            self.favSecondMoqCal = self.FavouriteAllString.value(forKey:"moq_calc")as![String]
                            
                            
                            if let NewproductexlImage:[String] = self.FavouriteAllString.value(forKey:"exclusive")as?[String]
                            {
                                self.favSecondExclusive = NewproductexlImage
                            }
                            
                            
                            DispatchQueue.main.async {
                                self.favouritetabelview.reloadData()
                            }
                            
                            DispatchQueue.main.async
                                {
                                    self.myshemetabelview.reloadData()
                            }
                        }
                        
                        if self.FavouriteTrendingString.count > 0
                        {
                            self.agnetfavouritefourvalue.isHidden = true
                            
                            if let favtwoSecondNEwproductIMagefianl:[String] = self.FavouriteTrendingString.value(forKey: "image") as? [String]
                            {
                               self.favtwoSecondNEwproductIMage = favtwoSecondNEwproductIMagefianl
                            }
                            
                            if let favtwoSecondproductofferMarginfianl:[String] = self.FavouriteTrendingString.value(forKey: "margin") as? [String]
                            {
                                self.favtwoSecondproductofferMargin = favtwoSecondproductofferMarginfianl
                            }
                          
                            if let favtwoSecondNEwproductItemsfianl:[String] = self.FavouriteTrendingString.value(forKey: "name") as? [String]
                            {
                            self.favtwoSecondNEwproductItems = favtwoSecondNEwproductItemsfianl
                            }
                            if let favtwoSecondNewproductoutletsfianl:[String] = self.FavouriteTrendingString.value(forKey: "price") as? [String]
                            {
                                self.favtwoSecondNewproductoutlets = favtwoSecondNewproductoutletsfianl
                            }
             
                            if let favtwoSecondNewproductsMrpstackfianl:[String] = self.FavouriteTrendingString.value(forKey: "MRP") as? [String]
                            {
                                self.favtwoSecondNewproductsMrpstack = favtwoSecondNewproductsMrpstackfianl
                            }
        
                            if let favtwoSecondNewproductsInstackfianl:[String] = self.FavouriteTrendingString.value(forKey: "available_qty_disp") as? [String]
                            {
                                self.favtwoSecondNewproductsInstack = favtwoSecondNewproductsInstackfianl
                            }
                            if let favtwoSecondNewproductsoffTakeDisplayfianl:[String] = self.FavouriteTrendingString.value(forKey: "off_take_display") as? [String]
                            {
                                self.favtwoSecondNewproductsoffTakeDisplay = favtwoSecondNewproductsoffTakeDisplayfianl
                            }

                            if let favtwoSecondNewproductdaysfianl:[String] = self.FavouriteTrendingString.value(forKey:"off_take") as? [String]
                            {
                                self.favtwoSecondNewproductdays = favtwoSecondNewproductdaysfianl
                            }

                            if let favtwoSecondproductdaysfianl:[String] = self.FavouriteTrendingString.value(forKey:"cod_display") as? [String]
                            {
                                self.favtwoSecondNewproductCODisplay = favtwoSecondproductdaysfianl
                            }
                            
                            
                            if let favtwovouritecashBackfinalfianlvalue:[String] = self.FavouriteTrendingString.value(forKey:"cash_back") as? [String]
                            {
                                self.favtwovouritecashBackfinal = favtwovouritecashBackfinalfianlvalue
                            }

                            if let favtwoSecondNewproductlabelMrpfianlvalue:[String] = self.FavouriteTrendingString.value(forKey:"weight_mrp") as? [String]
                            {
                                self.favtwoSecondNewproductlabelMrp = favtwoSecondNewproductlabelMrpfianlvalue
                            }
     
                            if let favtwoSecondAvailabelQuantityfianlvalue:[String] = self.FavouriteTrendingString.value(forKey:"user_qty") as? [String]
                            {
                                self.favtwoSecondAvailabelQuantity = favtwoSecondAvailabelQuantityfianlvalue
                            }
                            
                            
                            
                            if let favtwoSecondProductidValuefianlvalue:[String] = self.FavouriteTrendingString.value(forKey:"prodId") as? [String]
                            {
                                self.favtwoSecondProductidValue = favtwoSecondProductidValuefianlvalue
                            }

                            if let favtwofavouritesecondvaluefianlvalue:[String] = self.FavouriteTrendingString.value(forKey:"fav") as? [String]
                            {
                                self.favtwofavouritesecondvalue = favtwofavouritesecondvaluefianlvalue
                            }

                            if let NewproductexlImage:[String] = self.FavouriteTrendingString.value(forKey:"exclusive")as?[String]
                            {
                                self.favtwoSecondExclusive = NewproductexlImage
                            }
                            
                        if let favtwoSecondavalQntyFinal:[String] = self.FavouriteTrendingString.value(forKey:"available_qty")as?[String]
                            {
                                self.favtwoSecondavalQnty = favtwoSecondavalQntyFinal
                            }

                            if let favtwoSecondMoqCalFinal:[String] = self.FavouriteTrendingString.value(forKey:"moq_calc")as?[String]
                            {
                                self.favtwoSecondMoqCal = favtwoSecondMoqCalFinal
                            }

                            DispatchQueue.main.async
                                {
                                    self.favouritetabelviewtwo.reloadData()
                                    // self.favouritetabelviewtwo.isHidden = false
                            }
                        }
                        
                        if self.FavouriteTrendingString.count == 0
                        {
                            self.agnetfavouritefourvalue.isHidden = false
                            self.Agentfavouritescrollview.isHidden = false
                            self.Agentsfavouritietwo.isHidden = false
                            self.favouritetabelviewtwo.isHidden = true
                        }
                    }
                    
                }
                
                break
            case .failure(_):
                DispatchQueue.main.async
                    {
                        self.favoiuriteimagetwo.isHidden = true
                }
                break
            }
        }
        
    }
   

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    {
        if tableView == favouritetabelview
        {
            HomefooterView = UIView(frame: CGRect(x: 0, y:0, width: favouritetabelview.frame.size.width, height:90))
         HomefooterView.backgroundColor = UIColor.textfiledbottomcolorside()
        buttonsingelfinal = UIButton(frame: CGRect(x:145, y:35, width:100, height:30))
            buttonsingelfinal.titleLabel?.textAlignment = .center
            buttonsingelfinal.contentHorizontalAlignment = .center
            buttonsingelfinal.setTitle("add now?", for: .normal)
            buttonsingelfinal.setTitleColor(UIColor.Readallreviewsfinalvalue(), for:.normal)
          buttonsingelfinal.addTarget(self, action: #selector(buttonActiontwo), for: .touchUpInside)
            favouritetwo = UIButton(frame: CGRect(x:170, y:0, width:35, height:35))

            favouritetwo.setBackgroundImage(#imageLiteral(resourceName: "favouriteone"), for:.normal)
             favouritetwo.isEnabled = true
            favouritetwo.addTarget(self, action: #selector(buttonActiontwo), for: .touchUpInside)

            HomefooterView.addSubview(buttonsingelfinal)
            HomefooterView.addSubview(favouritetwo)
            return HomefooterView
        }
        if tableView == favouritetabelviewtwo
        {

              HomefooterViewtwo = UIView(frame: CGRect(x: 0, y:0, width: favouritetabelview.frame.size.width, height:90))
            HomefooterViewtwo.backgroundColor = UIColor.textfiledbottomcolorside()
            buttonsingelfinal = UIButton(frame: CGRect(x:145, y:35, width:100, height:30))
            buttonsingelfinal.titleLabel?.textAlignment = .center
            buttonsingelfinal.contentHorizontalAlignment = .center
            buttonsingelfinal.setTitle("add now?", for: .normal)
            buttonsingelfinal.setTitleColor(UIColor.Readallreviewsfinalvalue(), for:.normal)
            buttonsingelfinal.addTarget(self, action: #selector(buttonActiontwo), for: .touchUpInside)
            favouritetwo = UIButton(frame: CGRect(x:170, y:0, width:35, height:35))
            
            favouritetwo.setBackgroundImage(#imageLiteral(resourceName: "favouriteone"), for:.normal)
            favouritetwo.isEnabled = true
            favouritetwo.addTarget(self, action: #selector(buttonActiontwo), for: .touchUpInside)
            
            HomefooterViewtwo.addSubview(buttonsingelfinal)
            HomefooterViewtwo.addSubview(favouritetwo)
            return HomefooterViewtwo
        }
        else
        {
            HomefooterView = UIView(frame: CGRect(x: 0, y: 0, width: favouritetabelview.frame.size.width, height:0))
            HomefooterView.backgroundColor = UIColor.textfiledbottomcolorside()
            buttonsingelfinal = UIButton(frame: CGRect(x:145, y:35, width:100, height:30))
            buttonsingelfinal.titleLabel?.textAlignment = .center
            buttonsingelfinal.contentHorizontalAlignment = .center
            buttonsingelfinal.setTitle("add now", for: .normal)
            buttonsingelfinal.setTitleColor(UIColor.Readallreviewsfinalvalue(), for:.normal)
            buttonsingelfinal.addTarget(self, action: #selector(buttonActiontwo), for: .touchUpInside)
            favouritetwo = UIButton(frame: CGRect(x:170, y:0, width:35, height:35))

            favouritetwo.setBackgroundImage(#imageLiteral(resourceName: "favouriteone"), for:.normal)
            favouritetwo.isEnabled = true
            HomefooterView.addSubview(buttonsingelfinal)
            HomefooterView.addSubview(favouritetwo)
            return HomefooterView

        }

    }
    
    @objc func buttonActiontwo(_ sender: UIButton!)
    {
        Homescrollview.contentOffset = .zero
        Toplabel.text = "NumberMall"
        Homescrollview.isHidden = false
        secondview.isHidden = true
        Brnads.tag = 0
        catageorytwo.tag = 0
        Brandstwo.tag = 0
        catageorytwo.tag = 0
        firstView.isHidden = false
        Moreview.isHidden = true
        thiredview.isHidden = true
        Brnads.setBackgroundImage(#imageLiteral(resourceName: "Barnds"), for: .normal)
        Brandstwo.setTitleColor(UIColor.bottomnavigationtitile(), for: .normal)
        Hometwo.setBackgroundImage(#imageLiteral(resourceName: "Home"), for: .normal)
        Homeone.setTitleColor(UIColor.red, for:.normal)
        catageorytwo.setBackgroundImage(#imageLiteral(resourceName: "catageory"), for: .normal)
        catageoryone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
        favourite.setBackgroundImage(#imageLiteral(resourceName: "favourite"), for: .normal)
        fsvouritetwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
        cahtone.setBackgroundImage(#imageLiteral(resourceName: "chat"), for: .normal)
        cahttwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
        scrollPager.setSelectedIndex(index:0, animated: true)
        scrollpagerfourvalue.delegate = self
    }

    @IBAction func favouriteaddnow(_ sender: Any)
    {
        
    }
    
    @IBAction func whataddnofavouriteNow(_ sender: UIButton)
    {
        
        
    }
    
    func showSpinner()
    {
        let screenSize = UIScreen.main.bounds
        self.coverView.frame = screenSize
        self.coverView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.veryalertview.addSubview(self.coverView)
        self.showProgressBar()
        self.coverView.addSubview(imageView)
    }
    func removeSpinner()
    {
        self.imageView.removeFromSuperview()
        self.coverView.removeFromSuperview()
        self.hideProgressBar()
        
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
        
        //        let topLabel = UILabel(frame: CGRect(x: 0, y: 10, width: customWidth, height: 20))
        //        topLabel.text = modelData[row]
        //        topLabel.textColor = .black
        //        topLabel.textAlignment = .center
        //        topLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.thin)
        //        view.addSubview(topLabel)
        
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
        
        //        let bottomLabel = UILabel(frame: CGRect(x: 0, y: 78, width: customWidth, height: 20))
        //        bottomLabel.text = modelData[row].date
        //        bottomLabel.textColor = .black
        //        bottomLabel.textAlignment = .center
        //        bottomLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.thin)
        //        view.addSubview(bottomLabel)
        
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
            finalchangecolor.isHidden = true
            topviewfinal.isHidden = false
        }
        else
        {
            self.Today_quantity = modelData[row]
            self.index = Int(self.Today_quantity)!
        }

        pickerView.selectRow(row, inComponent:0, animated: true)
        anotherquntitylabel.text = modelData[row]
        mytextfiledcolor.text = modelData[row]
        di_count = row
        pickerView.reloadAllComponents()

    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadAllComponents()
    }
    
    @IBAction func addTocartFinalVlaue(_ sender: UIButton)
    {
        DispatchQueue.main.async {
            let cartviewfinalvalue = self.storyboard?.instantiateViewController(withIdentifier:"CartViewController")as!CartViewController
            self.present(cartviewfinalvalue, animated:true, completion:nil)
        
        }
    }
    func scratchBegan(_ view: ScratchUIView)
    {

    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        if let commentidvalue:String =  defaults.value(forKey:"Myvaluecart") as? String
        {
            if commentidvalue.count > 0
            {
                let kuserdefaukts = defaults.value(forKey:"MycartCount")as!String
                self.Mycart.text = kuserdefaukts
                self.Mycart.isHidden = false
                self.Mycart.layer.cornerRadius = 6.0
                self.Mycart.layer.masksToBounds = true
              self.Homecall()
            }
        }
        if let commentidvalue:String =  defaults.value(forKey:"Mydelete") as? String
        {
            
        }
        print(defaults.value(forKey:"Combopage1"))
        if let Combopagefinalavlue:String =  defaults.value(forKey:"Combopage1") as? String
        {
            self.Homecall()

            
            if Combopagefinalavlue.count > 0
            {
                let userauntity = defaults.value(forKey:"MycartCount")as!String
                
                if let Bulkarrayfinal:NSNumber = defaults.value(forKey: "cartcountfinal") as? NSNumber
                {
                    let stringfinalvalueis = Bulkarrayfinal
                    self.Mycart.text = stringfinalvalueis.stringValue
                    self.Mycart.isHidden = false
                    self.Mycart.layer.cornerRadius = 6.0
                    self.Mycart.layer.masksToBounds = true
                }
                
               
                if let addTodayonefinal:String = defaults.value(forKey: "addTodayone") as? String
                {
                    self.Mysecondfinal = addTodayonefinal
                }
                if let addTodayonefinal:Int = defaults.value(forKey: "index") as? Int
                {
                    self.MysecondIntvalue = addTodayonefinal
                }
                for i in 0..<self.TodaydealSellerID.count
                {
                    let add = self.TodaydealSellerID[i]
                    if i ==  self.MysecondIntvalue
                    {
                        self.TodaydealSellerID[i] =  self.user_updatevalue
                    }
                }
                self.Homecollectionview.reloadData()
            }
        }
        if let Mycommentstotalsingelvalueis:String =  defaults.value(forKey:"Mycommentstotal") as? String
        {
            if Mycommentstotalsingelvalueis.count > 0
            {
                self.mymarketscrollview.contentOffset.y = 0
                self.cahtscrollview.contentOffset.y = 0
                DispatchQueue.main.async
                {
                    self.Marketmethodtotal()
                }
            }
        }
        self.mymarketscrollview.contentOffset.y = 0
        self.cahtscrollview.contentOffset.y = 0
    }
    
    
    func Methodcombo()
    {
        let defaults  = UserDefaults.standard

        if let Combopagefinalavlue:String =  defaults.value(forKey:"Combopage1") as? String
        {
            if Combopagefinalavlue.count > 0
            {
                let defaultsTotalvalue = UserDefaults.standard
                let userauntity = defaults.value(forKey:"MycartCount")as!String
               
                
                if let Mycartpage:NSNumber =  defaultsTotalvalue.value(forKey:"Mycart") as? NSNumber
                 {
                    print(Mycartpage)
                    let str : String = Mycartpage.stringValue

                    self.Mycart.text = str
                    self.Mycart.isHidden = false
                    self.Mycart.layer.cornerRadius = 6.0
                    self.Mycart.layer.masksToBounds = true
                }
              
                if let addTodayonefinal:String = defaults.value(forKey: "addTodayone") as? String
                {
                    self.Mysecondfinal = addTodayonefinal
                }
                if let addTodayonefinal:Int = defaults.value(forKey: "index") as? Int
                {
                    self.MysecondIntvalue = addTodayonefinal
                }
                
                print(self.MysecondIntvalue)
                
                print(self.MysecondIntvalue)

                
                for i in 0..<self.TodaydealSellerID.count
                {
                    let add = self.TodaydealSellerID[i]
                    if i ==  self.MysecondIntvalue
                    {
                        self.TodaydealSellerID[i] =  self.user_updatevalue
                    }
                }
              self.Homecollectionview.reloadData()
            }

        }
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        self.Homecall()
    }
    
    func scratchMoved(_ view: ScratchUIView) {
        let scratchPercent: Double = self.scratchCard.getScratchPercent()
        
        let value = String(format: "%f", scratchPercent * 100) + "%"
     

        if value > "100"
        {
            scatchtimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(scatchtimertimerAction), userInfo: nil, repeats: false)
            self.scratchcardviewfinal.layer.cornerRadius = 20.0
            self.scratchCard.layer.cornerRadius = 20.0
        }
        else{
            
        }
        self.view.gestureRecognizers?.removeAll()
    }
    @objc func scatchtimertimerAction()
    {
        scratchCard  = ScratchUIView(frame: CGRect(x:0, y:0, width:255, height:255),Coupon: "iamgeonetwo.png", MaskImage: "iamgeonetwo.png", ScratchWidth: CGFloat(40))
        scratchCard.addSubview(viewtwo)
        scratchCard.delegate = self
        self.scratchcardviewfinal.addSubview(scratchCard)
        self.viewtwo.isHidden = false
        SwipeRight = UISwipeGestureRecognizer(target:self, action: #selector(self.respondToGesture))
        SwipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(SwipeRight)
        SwipeLeft = UISwipeGestureRecognizer(target:self, action: #selector(self.respondToGesture))
        SwipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(SwipeLeft)

    }
    
    
    func scratchEnded(_ view: ScratchUIView) {
        self.viewtwo.isHidden = false
        
    }
    @IBAction func close(_ sender: UIButton)
    {
        self.demoscatch.isHidden = true
    }
  
    @IBAction func chatone(_ sender: UIButton)
    {
        self.Marketmethodtotal()

        self.myviewonefinal.isHidden = true
        favouritetotoalvalue = ""
        Agentfavouritescrollview.contentOffset = .zero
        if self.view.frame.size.height < 800 {
            Agentfavouritescrollview.contentInset = UIEdgeInsetsMake(0, 0,self.Brandsscrollview.frame.size.height-115, 0)
            Agentfavouritescrollview.isScrollEnabled = true
            Agentfavouritescrollview.showsVerticalScrollIndicator = false
        }
        numnbermallchatview.isHidden =  false
        scrollPager.setSelectedIndex(index:4, animated: true)
        Brnads.setBackgroundImage(#imageLiteral(resourceName: "Barnds"), for: .normal)
        Brandstwo.setTitleColor(UIColor.bottomnavigationtitile(), for: .normal)
        Hometwo.setBackgroundImage(#imageLiteral(resourceName: "home_grey"), for: .normal)
        Homeone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
        catageorytwo.setBackgroundImage(#imageLiteral(resourceName: "catageory"), for: .normal)
        catageoryone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
        favourite.setBackgroundImage(#imageLiteral(resourceName: "favourite"), for: .normal)
        fsvouritetwo.setTitleColor(UIColor.black, for:.normal)
        cahtone.setBackgroundImage(#imageLiteral(resourceName: "chats-red"), for: .normal)
        cahttwo.setTitleColor(UIColor.red, for:.normal)
        if cahtone.tag == 0
        {
            numnbermallchatview.isHidden =  false
            Agentfavouritescrollview.isHidden = false
            cahtone.tag = 1
        }
        else if cahtone.tag == 1
        {
            Numbermallfavouriteview.isHidden =  false
            Agentfavouritescrollview.isHidden = true
            cahtone.tag = 0
        }
        self.combototalviewfinal.isHidden = true
        
        
        
        DispatchQueue.main.async
            {
            self.socketCompiantconnection()
        }
        
        
        self.mymarketscrollview.contentOffset.y = 0
        self.cahtscrollview.contentOffset.y = 0

    }

    @IBAction func Mysingelbuttonfinalvalue(_ sender: UIButton)
    {

    }
  
    func catageroyDemobuttons()
    {
        catageoryone.tag = 0
        catageorytwo.tag = 0
    }
    func stringFromTimeInterval(interval: TimeInterval) -> NSString {
        
        let ti = NSInteger(interval)
        let value = (ti / 1000)
        let seconds = value  % 60
        let minutes = (value / 60) % 60
        let hours = (value / 3600)
        return NSString(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
    }
    @IBAction func whataddNow(_ sender: UIButton)
    {
        Homescrollview.contentOffset = .zero
        Toplabel.text = "NumberMall"
        Homescrollview.isHidden = false
        secondview.isHidden = true
        Brnads.tag = 0
        catageorytwo.tag = 0
        Brandstwo.tag = 0
        catageorytwo.tag = 0
        firstView.isHidden = false
        Moreview.isHidden = true
        thiredview.isHidden = true
        Brnads.setBackgroundImage(#imageLiteral(resourceName: "Barnds"), for: .normal)
        Brandstwo.setTitleColor(UIColor.bottomnavigationtitile(), for: .normal)
        Hometwo.setBackgroundImage(#imageLiteral(resourceName: "Home"), for: .normal)
        Homeone.setTitleColor(UIColor.red, for:.normal)
        catageorytwo.setBackgroundImage(#imageLiteral(resourceName: "catageory"), for: .normal)
        catageoryone.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
        favourite.setBackgroundImage(#imageLiteral(resourceName: "favourite"), for: .normal)
        fsvouritetwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
        cahtone.setBackgroundImage(#imageLiteral(resourceName: "chat"), for: .normal)
        cahttwo.setTitleColor(UIColor.bottomnavigationtitile(), for:.normal)
        scrollPager.setSelectedIndex(index:0, animated: true)
        scrollpagerfourvalue.delegate = self
    }

    
    @IBAction func quantity(_ sender: UIButton) {
    }
    
    
    @IBAction func Damagedproducts(_ sender: UIButton) {
    }
    
    
    
    @IBAction func submit(_ sender: UIButton) {
    }
    
    @IBAction func Timedeliver(_ sender: UIButton) {
    }
    
    @IBAction func ProductKnowldge(_ sender: UIButton)
    {
    }
    
    @IBAction func GoodHandling(_ sender: UIButton)
    {
    }
    
    @IBAction func unprofessional(_ sender: UIButton)
    {
    }
    
    @IBAction func Packingquality(_ sender: UIButton)
    {
        
    }
    @IBAction func others(_ sender: UIButton)
    {
        
    }
    @IBAction func Chats(_ sender: UIButton)
    {
        scrollpagerfourvalue.setSelectedIndex(index:0, animated: true)
        chatsviewone.isHidden =  false
        chatssingelview.isHidden = false
        mynotificationsingellineview.isHidden = false
        compliantssingelview.isHidden = true
        marketingsingellineview.isHidden = true
        Notificationbutton.setTitleColor(UIColor.lightGray, for:.normal)
        cahtsbuttonone.setTitleColor(UIColor.black, for:.normal)
        Complaintsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
        marketingbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
      self.Marketmethodtotal()
    
    }
    
    @IBAction func Compiantsbutton(_ sender: UIButton)
    {
        if Complaintsbuttonone.tag == 0
        {
            self.complianttabelview.isHidden = false
            self.compliantfinalview.isHidden = true
            
            cahtsviewone.isHidden = true
            ComplaintsView1.isHidden =  false
            compliantssingelview.isHidden = false
            chatssingelview.isHidden = true
            marketingsingellineview.isHidden = true
            
            
            scrollpagerfourvalue.setSelectedIndex(index:1, animated: true)
            cahtsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
            Complaintsbuttonone.setTitleColor(UIColor.black, for:.normal)
            marketingbuttonone.setTitleColor(UIColor.lightGray, for:.normal)

            let actionButton = DTZFloatingActionButton(frame:CGRect(x:view.frame.size.width - 56 - 14,
                                                                    y:view.frame.size.height - 120,
                                                                    width: 50,
                                                                    height: 50
            ))
            actionButton.isHidden = true
            
            self.view.makeToast("Your complaint no. 22334 has been logged successfully")
            
            self.CompliantPlusbutton.isHidden = false
             Complaintsbuttonone.tag = 1
        }
        else if Complaintsbuttonone.tag == 1
        {
            scrollpagerfourvalue.setSelectedIndex(index:1, animated: true)
            cahtsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
            Complaintsbuttonone.setTitleColor(UIColor.black, for:.normal)
            marketingbuttonone.setTitleColor(UIColor.lightGray, for:.normal)

            cahtsviewone.isHidden = true
            ComplaintsView1.isHidden =  false
            compliantssingelview.isHidden = false
            chatssingelview.isHidden = true
            marketingsingellineview.isHidden = true
            let actionButton = DTZFloatingActionButton(frame:CGRect(x:view.frame.size.width - 56 - 14,
                                                                    y:view.frame.size.height - 120,
                                                                    width: 50,
                                                                    height: 50
            ))
            actionButton.isHidden = true
            self.complianttabelview.isHidden = true
            self.compliantfinalview.isHidden = false
              self.CompliantPlusbutton.isHidden = true
            Complaintsbuttonone.tag = 0
        }
  
    }
    
    @IBAction func Marketingbuttonone(_ sender: UIButton)
    {
        scrollpagerfourvalue.setSelectedIndex(index:2, animated: true)
        MarketView1.isHidden =  false
        mymarkettabelview.isHidden =  false

        cahtsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
        Complaintsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
        marketingbuttonone.setTitleColor(UIColor.black, for:.normal)
        marketingsingellineview.isHidden = false
        compliantssingelview.isHidden = true
        chatssingelview.isHidden = true
        marketingsingellineview.isHidden = false
        
        let actionButton = DTZFloatingActionButton(frame:CGRect(x:view.frame.size.width - 56 - 14,
                                                                y:view.frame.size.height - 120,
                                                                width: 50,
                                                                height: 50
        ))
        actionButton.isHidden = true

    }
    
    @IBAction func MyNotificationbutton(_ sender: UIButton)
    {
        cahtsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
        marketingbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
        Complaintsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
        
        Notificationbutton.setTitleColor(UIColor.black, for:.normal)
        Notificationsviewfinal.isHidden =  false
        mynotificationsingellineview.isHidden = false
        
        chatssingelview.isHidden = true
        marketingsingellineview.isHidden = true
        compliantssingelview.isHidden = true
        scrollpagerfourvalue.setSelectedIndex(index:3, animated: true)

    }
    
    @IBAction func MyLogyourticket(_ sender: UIButton)
    {
        
    }
    
    @IBAction func Mycallbutton(_ sender: UIButton)
    {
        self.closepopview.isHidden = false
    }
    
    @IBAction func closexbuttonfinal(_ sender: UIButton)
    {
        self.closepopview.isHidden = true
    }
    @IBAction func pickerview(_ sender:UIButton)
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
                myviewonefinal.isHidden = false

                self.mytextfiledcolor.isHidden = false
                self.Today_quantity = "10"
                self.mytextfiledcolor.text = self.Today_quantity
                self.anotherquntitylabel.text = self.Today_quantity
            }
            if self.index == 10
            {
                finalchangecolor.isHidden = true
                pickerView.isHidden = true
                myviewonefinal.isHidden = false
                self.mytextfiledcolor.isHidden = false
                self.Today_quantity = "10"
                self.mytextfiledcolor.text = self.Today_quantity
                self.anotherquntitylabel.text = self.Today_quantity
            }
        }
   
    @IBAction func Contactbutton(_ sender: UIButton)
    {
        DispatchQueue.main.async
            {
            let contactviewfinalvalue = self.storyboard?.instantiateViewController(withIdentifier:"contactsViewController")as!contactsViewController
            self.present(contactviewfinalvalue, animated:true, completion:nil)
        }
    }
    @IBAction func Compliantsbuttonplus(_ sender: UIButton)
    {
    DispatchQueue.main.async
        {
                let ComplaintVCfinalvalue = self.storyboard?.instantiateViewController(withIdentifier:"ComplaintVC")as!ComplaintVC
                self.present(ComplaintVCfinalvalue, animated:true, completion:nil)
        }
    }
    
    /// merket
    func Marketmethodtotal()
    {
//        self.showSpinner()
        var request = URLRequest(url: URL(string:AgentConstants.MarketFinalvalue)!)
        request.httpMethod = "POST"
        let dafaults = UserDefaults.standard
        if let Reviewfinaluseroid:String = dafaults.value(forKey:"MyLoginfinalvalue")as?String
        {
            self.useridbiling1 = Reviewfinaluseroid
        }
        if let Myauthorisationfinlavalue:String = dafaults.value(forKey: "Myauthorisation")as?String
        {
            self.Myauthorisationstringfinalvalue = Myauthorisationfinlavalue
        }
        if let Myagentidfinlavalue:String = dafaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        let postStringfinlavalue =  String(format: "Authorization=%@&AgentID=%@",self.Myauthorisationstringfinalvalue, self.myagentTotalvalue)
        print(postStringfinlavalue)
        let postStringone =  String(format: "method=%@&agentid=%@&page=%@&type=%@", "marketplace",self.useridbiling1,"0","market")
        print(postStringone)
        request.httpBody = postStringone.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        request.addValue(self.Myauthorisationstringfinalvalue, forHTTPHeaderField: "Authorization")
        request.addValue(self.useridbiling, forHTTPHeaderField:"AgentID")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                print(response.result)
                
                
                let value = response.response
                
                let valuetwo = response.data
                
                
                if let response = response as? HTTPURLResponse {
                    if response.statusCode == 200 {
                        print("Success")
                    }
                }
                if let httpResponse1 = value {
                    if let xDemAuth = httpResponse1.allHeaderFields["Authorization"] as? String {
                        print(xDemAuth)
                        
                        print(httpResponse1)
                        
                        let defaults = UserDefaults.standard
                        defaults.set(xDemAuth, forKey:"Myauthorisation")
                        defaults.synchronize()
                    }
                }
              
                
                self.removeSpinner()
                if let dict:NSArray = response.result.value as? NSArray
                {
                    self.marketarray = dict
                    
                    print(dict)
        if let popcornCustomerbnamelabelfinal:NSArray =  self.marketarray.value(forKey: "name") as?NSArray
                    {
                        self.popcornCustomerbname = popcornCustomerbnamelabelfinal
                    }
                    if let MArketproductIMagetwolabelfinal:NSArray =  self.marketarray.value(forKey:"profileImage")as?NSArray
                    {
                        self.MArketproductIMagetwo = MArketproductIMagetwolabelfinal
                    }

                    if let popcornDatelabelfinal:NSArray =  self.marketarray.value(forKey: "time") as?NSArray
                    {
                        self.popcornDatelabel = popcornDatelabelfinal
                    }
                 
                    if let favpopcornsubjectlabelfinal:NSArray =  self.marketarray.value(forKey: "subject") as?NSArray
                    {
                        self.favpopcornsubject = favpopcornsubjectlabelfinal
                    }
                    
                    if let favpopcornsubjectlabelfinal:NSArray =  self.marketarray.value(forKey: "subject") as?NSArray
                    {
                        self.favpopcornsubject = favpopcornsubjectlabelfinal
                    }
                    
    if let MArketcommentsfinal:[Any] =  self.marketarray.value(forKey:"comments") as?[Any]
                    {
                        self.MArketcomments = MArketcommentsfinal as! [String]
                    }
    if let likesvaluefinal:[Any] =  self.marketarray.value(forKey:"likes") as?[Any]
                    {
                        self.likesvalue = likesvaluefinal as! [String]
                    }
                    
                    
                    if let shoutsvaluefinal:[Any] =  self.marketarray.value(forKey:"likes") as?[Any]
                    {
                        self.shoutsvalue = shoutsvaluefinal as! [String]
                    }
           
                    
      
                    if let Marketshoutidlabelfinal:NSArray = self.marketarray.value(forKey: "id") as?NSArray
                        
                    {
                        self.Marketshoutid = Marketshoutidlabelfinal
                    }
    
                    
                    if let popcornDictionarylabelfinal:NSArray =  self.marketarray.value(forKey: "shout") as!NSArray
                    {
                        self.popcornDictionary = popcornDictionarylabelfinal
                    }
 
                    if let Totalpopcornnamelabelfinal:NSArray = self.popcornDictionary.value(forKey: "name") as? NSArray
                    {
                        
                        self.Totalpopcornnamelabel = Totalpopcornnamelabelfinal
                    }
                    if let Moqstringvaluelabelfinal:NSArray = self.popcornDictionary.value(forKey: "moq") as? NSArray
                    {
                        
                        self.Moqstringvalue = Moqstringvaluelabelfinal
                    }

                    if let Totalpopcornrupeeslabelfinal:NSArray = dict.value(forKey: "price") as? NSArray
                    {
                        self.Totalpopcornrupeeslabel = Totalpopcornrupeeslabelfinal
                    }
                    
                    if let TotalpopcorniamgefinalvalueToatal:NSArray = self.popcornDictionary.value(forKey: "image") as? NSArray
                    {
                       self.Totalpopcorniamgefinalvalue = TotalpopcorniamgefinalvalueToatal
                    }
                    
                    if let TotalpopcornCutoffratefinal:NSArray = self.popcornDictionary.value(forKey: "off_price") as? NSArray
                    {
                        
                        self.TotalpopcornCutoffrate = TotalpopcornCutoffratefinal
                    }
                    
                    if let TotalpopcornCutoffratefinal:NSArray = self.popcornDictionary.value(forKey: "mrp") as? NSArray
                    {
                        self.mrparrayyTotal = TotalpopcornCutoffratefinal
                    }
                    
                    if let TotalpopcornMarginlabelfinal:NSArray = self.popcornDictionary.value(forKey: "margin") as? NSArray
                    {
                        self.TotalpopcornMarginlabel = TotalpopcornMarginlabelfinal
                    }
                    
                    if let TotalpopcornRestokeoffTakelabelfinalvalue: [NSNumber]  =  self.popcornDictionary.value(forKey: "Offtake") as? [NSNumber]
                    {
                        self.TotalpopcornRestokeoffTakelabel = TotalpopcornRestokeoffTakelabelfinalvalue
                    }
                    if let TotalpopcornRestokeoffTakelabelfinalvalue:NSArray  =  self.popcornDictionary.value(forKey: "inStock") as? NSArray
                    {
                        self.Instackarray = TotalpopcornRestokeoffTakelabelfinalvalue
                    }
             
                    
                    if let TotalpopcornRestokeoffTakelabelfinalvalue:NSArray  =  self.popcornDictionary.value(forKey: "iscombo") as? NSArray
                    {
                        self.ComboarrayvalueTotal = TotalpopcornRestokeoffTakelabelfinalvalue
                    }
                    
                    if let isExclusiveTotallabelfinalvalue:NSArray  =  self.popcornDictionary.value(forKey: "isExclusive") as? NSArray
                    {
                        self.isExclusiveTotal = isExclusiveTotallabelfinalvalue
                    }
                    
                    
                    if let isExclusiveTotallabelfinalvalue:NSArray  =  self.popcornDictionary.value(forKey: "isnew") as? NSArray
                    {
                        self.isNewTotal = isExclusiveTotallabelfinalvalue
                    }
                    
                    
                    DispatchQueue.main.async
                        {

                            let value = self.Totalpopcornnamelabel.count

                        
                            if self.view.frame.size.height < 800
                            {
                                if value == 0
                                {
                                    self.mymarketscrollview.delegate = self
                                    self.mymarketscrollview.contentInset = UIEdgeInsetsMake(0, 0,800, 0)
                         
                                     self.noshoutimageview.isHidden = false
                                    self.mymarkettabelview.isHidden = true
                                    self.noshoutviewfinal.isHidden = false

                                }
                                else
                                {
                                    self.mymarkettabelview.reloadData()
                                    if value == 1
                                    {
                                        self.mymarketscrollview.delegate = self
                                        self.mymarketscrollview.contentInset = UIEdgeInsetsMake(0, 0,1400, 0)
                                    }
                                    if value == 2
                                    {
                                        self.mymarketscrollview.delegate = self
                                        self.mymarketscrollview.contentInset = UIEdgeInsetsMake(0, 0,1800, 0)
                                    }
                                    if value == 3
                                    {
                                        self.mymarketscrollview.delegate = self
                                        self.mymarketscrollview.contentInset = UIEdgeInsetsMake(0, 0,2100, 0)
                                    }
                                    if value == 4
                                    {
                                        self.mymarketscrollview.delegate = self
                                        self.mymarketscrollview.contentInset = UIEdgeInsetsMake(0, 0,2400, 0)
                                    }
                                    if value == 5
                                    {
                                        self.mymarketscrollview.delegate = self
                                        self.mymarketscrollview.contentInset = UIEdgeInsetsMake(0, 0,2700, 0)
                                    }
                                    if value == 6
                                    {
                                        self.mymarketscrollview.delegate = self
                                        self.mymarketscrollview.contentInset = UIEdgeInsetsMake(0, 0,3100, 0)
                                    }
                                    if value == 7
                                    {
                                        self.mymarketscrollview.delegate = self
                                        self.mymarketscrollview.contentInset = UIEdgeInsetsMake(0, 0,3400, 0)
                                    }
                                    if value == 8
                                    {
                                        self.mymarketscrollview.delegate = self
                                        self.mymarketscrollview.contentInset = UIEdgeInsetsMake(0, 0,3700, 0)
                                    }
                                    if value == 9
                                    {
                                        self.mymarketscrollview.delegate = self
                                        self.mymarketscrollview.contentInset = UIEdgeInsetsMake(0, 0,4000, 0)
                                    }
                                    if value == 10
                                    {
                                        self.mymarketscrollview.delegate = self
                                        self.mymarketscrollview.contentInset = UIEdgeInsetsMake(0, 0,4300, 0)
                                    }
                                    if value == 11
                                    {
                                        self.mymarketscrollview.delegate = self
                                        self.mymarketscrollview.contentInset = UIEdgeInsetsMake(0, 0,4600, 0)
                                    }
                                    if value == 12
                                    {
                                        self.mymarketscrollview.delegate = self
                                        self.mymarketscrollview.contentInset = UIEdgeInsetsMake(0, 0,4900, 0)
                                    }
                                    if value == 13
                                    {
                                        self.mymarketscrollview.delegate = self
                                        self.mymarketscrollview.contentInset = UIEdgeInsetsMake(0, 0,5200, 0)
                                    }
                                    if value == 14
                                    {
                                        self.mymarketscrollview.delegate = self
                                        self.mymarketscrollview.contentInset = UIEdgeInsetsMake(0, 0,5500, 0)
                                    }
                                    if value == 15
                                    {
                                        self.mymarketscrollview.delegate = self
                                        self.mymarketscrollview.contentInset = UIEdgeInsetsMake(0, 0,5800, 0)
                                    }
                                    if value == 16
                                    {
                                        self.mymarketscrollview.delegate = self
                                        self.mymarketscrollview.contentInset = UIEdgeInsetsMake(0, 0,6100, 0)
                                    }
                                    if value == 17
                                    {
                                        self.mymarketscrollview.delegate = self
                                        self.mymarketscrollview.contentInset = UIEdgeInsetsMake(0, 0,6400, 0)
                                    }
                                    if value == 18
                                    {
                                        self.mymarketscrollview.delegate = self
                                        self.mymarketscrollview.contentInset = UIEdgeInsetsMake(0, 0,6700, 0)
                                    }
                                    if value == 19
                                    {
                                        self.mymarketscrollview.delegate = self
                                        self.mymarketscrollview.contentInset = UIEdgeInsetsMake(0, 0,7000, 0)
                                    }
                                }
                               
                            }
                            
                    }
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
    func MarketLikemethod()
    {
        var request = URLRequest(url: URL(string:AgentConstants.MarketFinalvalue)!)
        request.httpMethod = "POST"
        let dafaults = UserDefaults.standard
        if let Reviewfinaluseroid:String = dafaults.value(forKey:"MyLoginfinalvalue")as?String
        {
            self.useridbiling1 = Reviewfinaluseroid
        }
        if let Myauthorisationfinlavalue:String = dafaults.value(forKey: "Myauthorisation")as?String
        {
            self.Myauthorisationstringfinalvalue = Myauthorisationfinlavalue
        }
        if let Myagentidfinlavalue:String = dafaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        if let Myagentidfinlavalue:String = dafaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }

//        let postStringfinlavalue =  String(format: "Authorization=%@&AgentID=%@",self.Myauthorisationstringfinalvalue, self.myagentTotalvalue)

        let postStringone =  String(format: "method=%@&agentid=%@&shoutId=%@&type=%@", "optionshout",self.useridbiling1,self.singelshoutidtotal,"like")
        print(postStringone)
        request.httpBody = postStringone.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        request.addValue(self.Myauthorisationstringfinalvalue, forHTTPHeaderField: "Authorization")
       // request.addValue(self.useridbiling, forHTTPHeaderField:"AgentID")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")

        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                print(response.result)
                
                
                let value = response.response
                
                let valuetwo = response.data
                
                
                if let response = response as? HTTPURLResponse {
                    if response.statusCode == 200 {
                        print("Success")
                    }
                }
                if let httpResponse1 = value {
                    if let xDemAuth = httpResponse1.allHeaderFields["Authorization"] as? String {
                        print(xDemAuth)
                        
                        print(httpResponse1)
                        
                        let defaults = UserDefaults.standard
                        defaults.set(xDemAuth, forKey:"Myauthorisation")
                        defaults.synchronize()
                    }
                }
                self.removeSpinner()
                if let dict:NSDictionary = response.result.value as? NSDictionary
                {
                    if let statusTotalvaluefinal:String = dict.value(forKey:"StatusMsg") as?String
                    {
                        self.statusTotalvalue = statusTotalvaluefinal
                        
                        if self.statusTotalvalue == "Success"
                        {
                            
                            self.view.makeToast(self.statusTotalvalue)
                        }
                    }
                }
                break
            case .failure(_):
                break
           
        }
        }
    }
    
    @IBAction func favourite(_ sender: UIButton)
    {
        favouritesineglvalue = "1"
        
        Numbermallfavouriteview.isHidden =  false
        self.Agentfavouritescrollview.isHidden = false

        
        Favorites.setTitleColor(UIColor.red, for:.normal)
        Recents.setTitleColor(UIColor.BackgroundTotalfinalavlue(), for:.normal)
        Schemes.setTitleColor(UIColor.BackgroundTotalfinalavlue(), for:.normal)
    
        self.viewfavourithree.isHidden = true
        self.viewfavouritwtwo.isHidden = true
        self.viewfavone.isHidden = false

        favouritescrollviewfinalvalue.setSelectedIndex(index:0, animated: true)
        DispatchQueue.main.async
            {
                self.Favouritecallfunction()
        }
    }
    @IBAction func Recentbutton(_ sender: UIButton)
    {
        favouritesineglvalue = "2"
        Numbermallfavouriteview.isHidden =  false
        self.Agentfavouritescrollview.isHidden = false

        Favorites.setTitleColor(UIColor.BackgroundTotalfinalavlue(), for:.normal)
        Recents.setTitleColor(UIColor.red, for:.normal)
        Schemes.setTitleColor(UIColor.BackgroundTotalfinalavlue(), for:.normal)
     favouritescrollviewfinalvalue.setSelectedIndex(index:1, animated: true)
        
        self.viewfavourithree.isHidden = true
        self.viewfavouritwtwo.isHidden = false
        self.viewfavone.isHidden = true
    }
    
    @IBAction func schemesbutton(_ sender: UIButton)
    {
        favouritesineglvalue = "3"
        Favorites.setTitleColor(UIColor.BackgroundTotalfinalavlue(), for:.normal)
        Recents.setTitleColor(UIColor.BackgroundTotalfinalavlue(), for:.normal)
        Schemes.setTitleColor(UIColor.red, for:.normal)
        self.Agentfavouritescrollview.isHidden = false

     favouritescrollviewfinalvalue.setSelectedIndex(index:2, animated: true)
        
        Numbermallfavouriteview.isHidden =  false
        self.viewfavouritwtwo.isHidden = true
        self.viewfavone.isHidden = true
        self.viewfavourithree.isHidden = false
    }
    func scrollPager(scrollPager: ScrollPager, changedIndex: Int)
    {
        if scrollPager == scrollPager
        {
            if changedIndex == 0
            {
                firstView.isHidden = false
            }
            if changedIndex == 1
            {
                Moreview.isHidden =  false
            }
            if changedIndex == 2
            {
                thiredview.isHidden =  false
                secondview.isHidden = false
            }
            if changedIndex == 3
            {
                Numbermallfavouriteview.isHidden =  false
                favouritescrollviewfinalvalue.setSelectedIndex(index:0, animated: true)
            }
        }
        
    }
    
    func scrollPagerfinal(scrollPager: ScrollPagerfour, changedIndex: Int)
    {
        
        if  scrollPager == scrollPager
        {
            if scrollPager == favouritescrollviewfinalvalue
            {
                if changedIndex == 0
                {
                    
                    self.Agentfavouritescrollview.isHidden = false
                    Favorites.setTitleColor(UIColor.red, for:.normal)
                    Recents.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
                    Schemes.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
                    
                    
                    if self.FavouriteAllString.count == 0
                    {
                        self.Agentfavouritescrollview.isHidden = false
                        self.Agentsfavouritietwo.isHidden = false
                        self.favouritetabelview.isHidden = true
                        self.viewfavouriteone.isHidden = false
                        self.HomefooterView.isHidden = true
                        self.viewfavourithree.isHidden = true
                        self.viewfavtwo.isHidden = true
                        
                    }
                    DispatchQueue.main.async
                        {
                            self.Favouritecallfunction()
                    }
                }
                
                if changedIndex == 1
                {
                    
                    Favorites.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
                    Recents.setTitleColor(UIColor.red, for:.normal)
                    Schemes.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
                    Numbermallfavouriteview.isHidden =  false
                    self.viewfavourithree.isHidden = true
                    self.viewfavouritwtwo.isHidden = false
                    self.viewfavone.isHidden = true
                    favouritescrollviewfinalvalue.setSelectedIndex(index:0, animated: true)
                    Favorites.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
                    Recents.setTitleColor(UIColor.red, for:.normal)
                    Schemes.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
                    favouritescrollviewfinalvalue.setSelectedIndex(index:1, animated: true)
                    DispatchQueue.main.async
                        {
                            self.Favouritecallfunction()
                    }
                }
                if changedIndex == 2
                {
                    self.Agentfavouritescrollview.isHidden = false
                    self.Agentsfavouritietwo.isHidden = true
                    self.favouritetabelview.isHidden = true
                    self.viewfavouriteone.isHidden = true
                    self.HomefooterView.isHidden = true
                    self.viewfavouriteone.isHidden = true
                    self.viewfavouritwtwo.isHidden = true
                    self.viewfavourithree.isHidden = false
                    self.myshemetabelview.isHidden = false
                    Favorites.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
                    Recents.setTitleColor(UIColor.textfiledbottomcolorside(), for:.normal)
                    Schemes.setTitleColor(UIColor.red, for:.normal)
                }
                
            }
           
        else
        {
            if changedIndex == 0
            {
                    cahtsbuttonone.setTitleColor(UIColor.black, for:.normal)
                    Complaintsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                    marketingbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                    Notificationbutton.setTitleColor(UIColor.lightGray, for:.normal)
                    cahtsviewone.isHidden = false
                    chatssingelview.isHidden = false
                    compliantssingelview.isHidden = true
                    marketingsingellineview.isHidden = true
                     notificationLineview.isHidden = true
                    DispatchQueue.main.async
                        {
                            self.Marketmethodtotal()
                    }
            }
            if changedIndex == 1
            {
                
                   ComplaintsView1.isHidden =  false
                compliantssingelview.isHidden = false

                
                notificationLineview.isHidden = true
                chatssingelview.isHidden = true
                marketingsingellineview.isHidden = true
             

              cahtsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
              Complaintsbuttonone.setTitleColor(UIColor.black, for:.normal)
               marketingbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                Notificationbutton.setTitleColor(UIColor.lightGray, for:.normal)
               Notificationbutton.setTitle("Chats", for:.normal)

                self.view.makeToast("Your complaint no. 22334 has been logged successfully")
            }
            if changedIndex == 2
            {
                marketingsingellineview.isHidden = false
                compliantssingelview.isHidden = true
                chatssingelview.isHidden = true
                MarketView1.isHidden =  false
                mymarkettabelview.isHidden =  false
                notificationLineview.isHidden = true
                
                
                cahtsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                Complaintsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                marketingbuttonone.setTitleColor(UIColor.black, for:.normal)
                Notificationbutton.setTitleColor(UIColor.lightGray, for:.normal)
                
            }
            if changedIndex == 3
            {
                    scrollpagerfourvalue.setSelectedIndex(index:3, animated: true)
                    cahtsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                    marketingbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                    Complaintsbuttonone.setTitleColor(UIColor.lightGray, for:.normal)
                    Notificationbutton.setTitleColor(UIColor.black, for:.normal)
                
                mynotificationsingellineview.isHidden = false
                notificationLineview.isHidden = false
                    chatssingelview.isHidden = true
                    marketingsingellineview.isHidden = true
                    compliantssingelview.isHidden = true
            }
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
        
        let defaultstwo = UserDefaults.standard
        defaultstwo.set(self.particularadd, forKey:"Myparticularadd")
        defaultstwo.synchronize()
        
        if let Reviewfinaluseroid:String = defaults.value(forKey: "Myauthorisation")as?String
        {
            self.AcessTokenfinalstring = Reviewfinaluseroid
        }
        if let Myagentidfinlavalue:String = defaults.value(forKey: "Myagentid")as?String
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
                    self.comboSarray = []
                    
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
                    
                    if let comboSfinalarrayfinal:NSDictionary = dict.value(forKey: "combo") as? NSDictionary
                    {
                        self.comboSfinalarray = comboSfinalarrayfinal
                        if self.comboSfinalarray.count > 0
                        {
                            
                            self.Combossingelvalue = self.comboSfinalarray
                            let defaultsfinalvalue = UserDefaults.standard


                            defaultsfinalvalue.synchronize()
                        }
                        
                        print(self.comboSfinalarray.value(forKey: "Images"))
                        if let comboSarrayfinal:NSArray = self.comboSfinalarray.value(forKey: "Images") as? NSArray
                        {
                            self.comboSarray1 = comboSarrayfinal
                            
                            print(self.comboSarray1)

                        }
                        
                        
                        
                        if let defaultsDictFinalvaluesingel:NSDictionary = self.comboSfinalarray.value(forKey: "default_data") as? NSDictionary
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
                    self.withoutcombomore.text =  self.defaultsMRP as String
                    let attributeStringtwo =  NSMutableAttributedString(string:self.defaultsmargin as String)

                attributeStringtwo.addAttribute(NSAttributedStringKey.strikethroughStyle,
                                                            value: NSUnderlineStyle.styleSingle.rawValue,
                                                            range: NSMakeRange(0, attributeStringtwo.length))
                    self.withoutcombomargin.attributedText = attributeStringtwo
                            
                        }
                        
                    }
           
                    if let BulkNAmefinal:String = dict.value(forKey: "bulk_display") as? String
                    {
                        self.BulkNAme = BulkNAmefinal
                        if self.BulkNAme == "1"
                        {
                            self.comboSarray.append("BULK")

                        }
                    }

                    if let LTsNamefinal:String = dict.value(forKey: "LTS_display") as? String
                    {
                        self.LTsName = LTsNamefinal
                        if self.LTsName == "1"
                        {
                            self.comboSarray.append("BULK")
                        }
                    }
                    
                    if let scheme_namefinal:String = dict.value(forKey: "scheme_display") as? String
                    {
                        self.scheme_name = scheme_namefinal
                        
                        if self.scheme_name == "1"
                        {
                            self.comboSarray.append("Scheme")
                            
                        }

                    }

                    if let ComboNamefinal:String = dict.value(forKey: "combo_display") as? String
                    {
                        
                        self.ComboName = ComboNamefinal
                       
                        
                        if self.ComboName == "1"
                        {
                            self.comboSarray.append("combo")
                            
                        }
                    }

                    if let sold_filledbyarrayfinal:NSArray = dict.value(forKey: "sold_filledby") as? NSArray
                    {
                        
                        self.ssold_filledbyNoramlarray = sold_filledbyarrayfinal
                     
                        if let sold_filledbyIdarrayfinalvalue: [String]  =  self.ssold_filledbyNoramlarray.value(forKey: "seller_id") as? [String]
                        {
                            self.sold_filledbyIdarray = sold_filledbyIdarrayfinalvalue
                        }
                        if let sold_filledbynamearrayfinalvalue: [String]  =  self.ssold_filledbyNoramlarray.value(forKey: "name") as? [String]
                        {
                            self.sold_filledbynamearray = sold_filledbynamearrayfinalvalue
                        }
                        if let sold_filledbyheroarrayfinalvalue: [String]  =  self.ssold_filledbyNoramlarray.value(forKey: "hero") as? [String]
                        {
                            self.sold_filledbyheroarray = sold_filledbyheroarrayfinalvalue
                        }
                        if let sold_filledbydefarrayfinalvalue: [String]  =  self.ssold_filledbyNoramlarray.value(forKey: "def") as? [String]
                        {
                            self.sold_filledbydefarray = sold_filledbydefarrayfinalvalue
                        }
                        if let sold_filledbydiscriptionarrayfinalvalue: [String]  =  self.ssold_filledbyNoramlarray.value(forKey: "discription") as? [String]
                        {
                            self.sold_filledbydiscriptionarray = sold_filledbydiscriptionarrayfinalvalue
                            if self.sold_filledbydiscriptionarray.count > 0
                            {
                                self.descriptionlabel.text = self.sold_filledbydiscriptionarray[0].htmlToString
                            }
                            else{
                                self.descriptionlabel.text = "Sold by"
                            }
                            
                        }
                        if let sold_filledbyseller_idarrayfinalvalue: [String]  =  self.ssold_filledbyNoramlarray.value(forKey: "Id") as? [String]
                        {
                            self.sold_filledbyseller_idarray = sold_filledbyseller_idarrayfinalvalue
                        }
                        
                    }
                    
                    
            DispatchQueue.main.async
                {
                //                print(self.ComboName)
                //                print(self.BulkNAme)
                //                print(self.LTsName)
                //                print(self.scheme_name)
                
//            if (self.Bulkarray.count > 0 || self.LTSarray.count > 0 || self.SchemeSarray.count > 0 || self.comboSarray.count > 0)
//            {
////                self.combototalfinaltwo.isHidden = true
////                 self.combototalviewfinal.isHidden = true
////            let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "comboViewController") as! comboViewController
////            popOverVC.Comboarray1 = self.comboSarray
////        popOverVC.SchemeSarray1 = self.SchemeSarray
////        popOverVC.Bulkarray1 = self.Bulkarray
////      popOverVC.Ltsarray1 = self.LTSarray
////        popOverVC.Combofinalview = self.combototalfinaltwo
////            self.addChildViewController(popOverVC)
////       popOverVC.view.frame = self.view.frame
////    self.view.addSubview(popOverVC.view)
////    popOverVC.didMove(toParentViewController: self)
//                self.mycomboscrollview.isHidden = false
//
//                self.adpopupscroolview.isHidden = true
//
//                print(self.comboSarray)
//
//                let CombobottomSheet = JXBottomSheetView(contentView:self.mycomboscrollview as! UIScrollView)
//                CombobottomSheet.defaultMaxinumDisplayHeight  = self.view.frame.size.height
//                CombobottomSheet.defaultMininumDisplayHeight = 0
//                CombobottomSheet.displayState = .maxDisplay
//                CombobottomSheet.frame = self.view.bounds
//                self.view.addSubview(CombobottomSheet)
//                self.mycomboviewfinal.slideInFromLeft()
//                print("methodone")
//
//
////                print(self.ComboName)
////                print(self.BulkNAme)
////                print(self.LTsName)
////                print(self.scheme_name)
//
//
//            }
                    DispatchQueue.main.async
                        {
                        self.Combocolelctionview.isHidden = false
                        self.Combocolelctionview.reloadData()
                      }
            
                if self.comboSarray.count > 0
                {
                     self.comboSarray.append("MoQ")
                    if (self.ComboName.count > 0 || self.BulkNAme.count > 0 || self.LTsName.count > 0 || self.scheme_name.count > 0)
                    {
                        //                self.combototalfinaltwo.isHidden = true
                        //                 self.combototalviewfinal.isHidden = true
                        //            let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "comboViewController") as! comboViewController
                        //            popOverVC.Comboarray1 = self.comboSarray
                        //        popOverVC.SchemeSarray1 = self.SchemeSarray
                        //        popOverVC.Bulkarray1 = self.Bulkarray
                        //      popOverVC.Ltsarray1 = self.LTSarray
                        //        popOverVC.Combofinalview = self.combototalfinaltwo
                        //            self.addChildViewController(popOverVC)
                        //       popOverVC.view.frame = self.view.frame
                        //    self.view.addSubview(popOverVC.view)
                        //    popOverVC.didMove(toParentViewController: self)
                        self.mycomboscrollview.isHidden = false
                        
                        self.adpopupscroolview.isHidden = true
                        
                        
                        let CombobottomSheet = JXBottomSheetView(contentView:self.mycomboscrollview as! UIScrollView)
                        CombobottomSheet.defaultMaxinumDisplayHeight  = self.view.frame.size.height
                        CombobottomSheet.defaultMininumDisplayHeight = 0
                        CombobottomSheet.displayState = .maxDisplay
                        CombobottomSheet.frame = self.view.bounds
                        self.view.addSubview(CombobottomSheet)
                        self.mycomboviewfinal.slideInFromLeft()
                        print("methodone")
                        DispatchQueue.main.async
                            {
                            self.Topcombocolletcionview.reloadData()
                         }
                    }
                }
                
               else
               {
                    print("methodtwo")
                    self.combototalfinaltwo.isHidden = true
                    self.combototalviewfinal.isHidden = true
                    self.adpopupscroolview.isHidden = false
                     self.mycomboscrollview.isHidden = true
  
                    self.topviewfinal.isHidden = true
                    self.finalchangecolor.isHidden = false
                    self.addpopview.slideInFromLeft()
                    let bottomSheet = JXBottomSheetView(contentView:self.adpopupscroolview as! UIScrollView)
                    bottomSheet.defaultMaxinumDisplayHeight  = self.view.frame.size.height
                    bottomSheet.defaultMininumDisplayHeight = 0
                    bottomSheet.displayState = .maxDisplay
                    bottomSheet.frame = self.view.bounds
                    self.view.addSubview(bottomSheet)
                  }
                   }
                }
                break
            case .failure(_):
                break
            }
            
        }
        
    }
    @IBAction func Mysoldrop(_ sender: UIButton)
    {
      
        
    }
    @IBAction func LightbuttonCombo(_ sender: UIButton)
    {
        
        
    }
    @IBAction func Handbutton(_ sender: UIButton)
    {
        
        
    }
    @IBAction func Homesearch(_ sender: UIButton)
    {
         let defaults = UserDefaults.standard
        if let MyKycpendingfinalavlue:String = defaults.value(forKey:"isverystring")as?String
        {
            if MyKycpendingfinalavlue == "1"
            {
                self.singelbutton.isHidden = true
                DispatchQueue.main.async {
                    let productscanview = self.storyboard?.instantiateViewController(withIdentifier:"productscanViewController")as!productscanViewController
                    self.present(productscanview, animated:true, completion:nil)
                }
            }
            if MyKycpendingfinalavlue == "2"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
            if MyKycpendingfinalavlue == "4"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
                
            }
            if MyKycpendingfinalavlue == "3"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
            if MyKycpendingfinalavlue == "5"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
        }
    }
    
    @IBAction func homecart(_ sender: UIButton)
    {
        let defaults = UserDefaults.standard
        if let MyKycpendingfinalavlue:String = defaults.value(forKey:"isverystring")as?String
        {
            if MyKycpendingfinalavlue == "1"
            {
                DispatchQueue.main.async {
                    let CartViewControllerView = self.storyboard?.instantiateViewController(withIdentifier:"CartViewController")as!CartViewController
                    self.present(CartViewControllerView, animated:true, completion:nil)
                }
            
            }
            if MyKycpendingfinalavlue == "2"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
            if MyKycpendingfinalavlue == "4"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
                
            }
            if MyKycpendingfinalavlue == "3"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
            if MyKycpendingfinalavlue == "5"
            {
                self.singelbutton.isHidden = false
                DispatchQueue.main.async {
                    let ActiveKYCView = self.storyboard?.instantiateViewController(withIdentifier:"ActiveKYCViewController")as!ActiveKYCViewController
                    self.present(ActiveKYCView, animated:true, completion:nil)
                }
                
            }
        }
    }
    @IBAction func combodrop(_ sender: UIButton)
    {
        
        
    }
    @IBAction func combobutton(_ sender: UIButton)
    {
        if combodrop.tag == 0
        {
            combodrop.setBackgroundImage(#imageLiteral(resourceName: "Radioon"), for:.normal)
            withoutcomboradiobutton.setBackgroundImage(#imageLiteral(resourceName: "Radiooff"), for:.normal)
            combodrop.tag = 1
        }
        else if combodrop.tag == 1
        {
            withoutcomboradiobutton.setBackgroundImage(#imageLiteral(resourceName: "Radioon"), for:.normal)
            combodrop.setBackgroundImage(#imageLiteral(resourceName: "Radiooff"), for:.normal)
            combodrop.tag = 0
        }
        
    }
    
    @IBAction func withoutcombobutton(_ sender: UIButton)
    {
        if withoutcomboradiobutton.tag == 0
        {
            withoutcomboradiobutton.setBackgroundImage(#imageLiteral(resourceName: "Radioon"), for:.normal)
            combodrop.setBackgroundImage(#imageLiteral(resourceName: "Radiooff"), for:.normal)
            withoutcomboradiobutton.tag = 1
        }
        else if withoutcomboradiobutton.tag == 1
        {
            withoutcomboradiobutton.setBackgroundImage(#imageLiteral(resourceName: "Radiooff"), for:.normal)
            combodrop.setBackgroundImage(#imageLiteral(resourceName: "Radioon"), for:.normal)
            withoutcomboradiobutton.tag = 0
        }

    }
    @IBAction func Lightbuttoncombo(_ sender: UIButton)
    {
        
        
    }
    @IBAction func Handbuttoncombo(_ sender: UIButton)
    {
        
        
    }
   func bottomSheet(bottomSheet: JXBottomSheetView, willDisplay state: JXBottomSheetState)
    {
    print("Reach Apppone Totalvalueoneis")
    }
    func bottomSheet(bottomSheet: JXBottomSheetView, didDisplayed state: JXBottomSheetState)
    {
        print("Reach Apptwo TotalvalueTwois")
    }
 
    func DeleteShout()
    {
        //        self.showSpinner()
        var request = URLRequest(url: URL(string:AgentConstants.MarketFinalvalue)!)
        request.httpMethod = "POST"
        let dafaults = UserDefaults.standard
        if let Reviewfinaluseroid:String = dafaults.value(forKey:"MyLoginfinalvalue")as?String
        {
            self.useridbiling1 = Reviewfinaluseroid
        }
        if let Myauthorisationfinlavalue:String = dafaults.value(forKey: "Myauthorisation")as?String
        {
            self.Myauthorisationstringfinalvalue = Myauthorisationfinlavalue
        }
        if let Myagentidfinlavalue:String = dafaults.value(forKey: "Myagentid")as?String
        {
            self.myagentTotalvalue = Myagentidfinlavalue
        }
        let postStringfinlavalue =  String(format: "Authorization=%@&AgentID=%@",self.Myauthorisationstringfinalvalue, self.myagentTotalvalue)
        print(postStringfinlavalue)
      
        let postStringone =  String(format: "method=%@&type=%@&id=%@&type=%@", "statuschange","delete", self.Marketsingelidvalue,self.myagentTotalvalue)
        print(postStringone)
        request.httpBody = postStringone.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        request.addValue(self.Myauthorisationstringfinalvalue, forHTTPHeaderField: "Authorization")
        request.addValue(self.myagentTotalvalue, forHTTPHeaderField:"AgentID")
        
        Alamofire.request(request).responseJSON { response in
            switch response.result
            {
            case .success(_):
                print(response.result)
                
                
                let value = response.response
                
                let valuetwo = response.data
                
                
                if let response = response as? HTTPURLResponse {
                    if response.statusCode == 200 {
                        print("Success")
                    }
                }
                if let httpResponse1 = value {
                    if let xDemAuth = httpResponse1.allHeaderFields["Authorization"] as? String {
                        print(xDemAuth)
                        
                        print(httpResponse1)
                        
                        let defaults = UserDefaults.standard
                        defaults.set(xDemAuth, forKey:"Myauthorisation")
                        defaults.synchronize()
                    }
                }
                print(response.result.value)
                if let dict:NSDictionary = response.result.value as? NSDictionary
                {
                    print(dict)
                    if let Descriptioncb_cash_back:String = dict.value(forKey: "Status") as? String
                    {
                        self.StatusTotal = Descriptioncb_cash_back
                        if  self.StatusTotal == "1"
                        {
                            self.mymarkettabelview.reloadData()
                        }
                    }
                }
                break
            case .failure(_):
                break
            }
        }
    }
    @IBAction func Reshoutbutton(_ sender: UIButton)
    {
//        self.selectedIndexfinal = sender.tag

        self.Reshouttotal.isHidden = true

        let ShoutViewControllerView = self.storyboard?.instantiateViewController(withIdentifier:"ShoutViewController")as!ShoutViewController
        let stringtotaltwo = NSString(format:"%@",self.Marketshoutid[self.selectedIndexfinal!] as! CVarArg)
        ShoutViewControllerView.SingelMarketshoutidvalue1 = stringtotaltwo as String
        self.present(ShoutViewControllerView, animated: true, completion:nil)
        
    }
    @IBAction func Reshoutwithcomment(_ sender: UIButton)
    {
        self.Reshouttotal.isHidden = true
        let ShoutViewControllerView = self.storyboard?.instantiateViewController(withIdentifier:"ShoutViewController")as!ShoutViewController
        let stringtotaltwo = NSString(format:"%@",self.Marketshoutid[self.selectedIndexfinal!] as! CVarArg)
        ShoutViewControllerView.SingelMarketshoutidvalue1 = stringtotaltwo as String
        self.present(ShoutViewControllerView, animated: true, completion:nil)
    }
    
    
    @IBAction func savethisshout(_ sender: UIButton)
    {

    self.Reshouttotal.isHidden = false
    self.Reshoutview.isHidden = true
    self.sahreview.isHidden = false
    }
    
    
    @IBAction func copylink(_ sender: UIButton)
    {
        self.Reshouttotal.isHidden = false
        self.Reshoutview.isHidden = true
        self.sahreview.isHidden = false
    }
    
  
    @IBAction func sahreviachat(_ sender: Any)
    {
        self.Reshouttotal.isHidden = false
        self.Reshoutview.isHidden = true
        self.sahreview.isHidden = false
    }
    
    @IBAction func sahrevia(_ sender: UIButton)
    {
        
        self.Reshouttotal.isHidden = false
        self.Reshoutview.isHidden = true
        self.sahreview.isHidden = false
    }
    
    
    lazy var refreshControl: UIRefreshControl =
        {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(HomeViewController.handleRefresh(_:)), for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
    }()
    @objc func handleRefresh(_ refreshControl: UIRefreshControl)
    {
        self.mymarkettabelview.reloadData()
        refreshControl.endRefreshing()
    }
}

extension CALayer
{
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat)
    {
        let border = CALayer()
        switch edge {
        case .top:
            border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
        case .bottom:
            border.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
        case .left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.height)
        case .right:
            border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        addSublayer(border)
    }
}
extension CALayer
{
    func addShadow() {
        self.shadowOffset = .zero
        self.shadowOpacity = 0.1
        self.shadowRadius = 10
        self.masksToBounds = false
    }
}
extension UIView
{
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
        func dropShadow1(scale: Bool = true) {
            layer.masksToBounds = false
            layer.shadowColor = UIColor.dropshadowcolor().cgColor
            layer.shadowOpacity = 0.05
            layer.shadowOffset = CGSize(width: 0, height: -3)
            layer.shadowRadius = 2
            
            layer.shadowPath = UIBezierPath(rect: bounds).cgPath
            layer.shouldRasterize = true
            layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        }
        
        // OUTPUT 2
        func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
            layer.masksToBounds = false
            layer.shadowColor = color.cgColor
            layer.shadowOpacity = opacity
            layer.shadowOffset = offSet
            layer.shadowRadius = radius
            
            layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
            layer.shouldRasterize = true
            layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        }
}

extension HomeViewController: UIGestureRecognizerDelegate
{
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool
    {
        return true
    }
}
extension UILabel
{
    func setDifferentColor(string: String, location: Int, length: Int){
        
        let attText = NSMutableAttributedString(string: string)
        attText.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.blue, range: NSRange(location:location ,length:length))
        attributedText = attText
        
    }
}
extension TimeInterval
{
    var minuteSecondMS: String
    {
        return String(format:"%d:%02d.%03d", minute, second, millisecond)
    }
    var minute: Int {
        return Int((self/60).truncatingRemainder(dividingBy: 60))
    }
    var second: Int {
        return Int(truncatingRemainder(dividingBy: 60))
    }
    var millisecond: Int {
        return Int((self*1000).truncatingRemainder(dividingBy: 1000))
    }
}

extension Int
{
    var msToSeconds: Double {
        return Double(self) / 1000
    }
}
extension Formatter
{
    static let number = NumberFormatter()
}

extension FloatingPoint
{
    func fractionDigits(min: Int = 2, max: Int = 2, roundingMode: NumberFormatter.RoundingMode = .halfEven) -> String {
        Formatter.number.minimumFractionDigits = min
        Formatter.number.maximumFractionDigits = max
        Formatter.number.roundingMode = roundingMode
        Formatter.number.numberStyle = .decimal
        return Formatter.number.string(for: self) ?? ""
    }
}
extension String
{
    var doubleValue: Double {
        return (self as NSString).doubleValue
    }
}
extension String
{
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}

extension UIViewController
{
    func add(_ child: UIViewController, containerView: UIView)
    {
        addChildViewController(child)
        containerView.addSubview(child.view)
        child.didMove(toParentViewController: self)
    }
    
    func remove(containerView: UIView)
    {
        guard parent != nil else { return }
        willMove(toParentViewController: nil)
        removeFromParentViewController()
        containerView.removeFromSuperview()
    }
}

extension HomeViewController: FloatRatingViewDelegate
{
    func floatRatingView(_ ratingView: FloatRatingView, isUpdating rating: Double)
    {
      
   }
}

